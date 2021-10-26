ESX            = nil
Patreons       = {}
NextPatreonUrl = Config.PatreonEndpoint

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function isInDB(source, cb, params)
    local data = MySQL.Sync.fetchAll('SELECT * FROM patreon WHERE email = @email', {
        ['@email'] = params
    })
    if #data > 0 then
        if cb then
            cb('ok')
        else
            return true
        end
    else
        if cb then
            cb('error')
        else
            return false
        end
    end
end

function cleanDB()
    local data = MySQL.Sync.fetchAll('SELECT * FROM patreon')

    for j = 1, #data, 1 do
        local found = false

        for email, tier in pairs(Patreons) do
            if data[j].email == email then
                found = true
                break
            end
        end

        if not found then
            MySQL.Async.execute('UPDATE patreon SET `cars_allowed` = 0 WHERE `email` = @email', {
                ['@email'] = data[j].email
            })
        end
    end
end

CreateThread(function()
    while true do
        PerformHttpRequest(NextPatreonUrl, function(errorCode, resultData, resultHeaders)
            if resultData ~= nil then
                local decoded_data = json.decode(resultData)
                local data         = decoded_data.data
                local user_data    = decoded_data.included
                local next_link    = decoded_data.links.next
                local patreons     = {}

                if #data > 0 then
                    for i = 1, #data, 1 do
                        if data[i].type == 'pledge' then
                            local tier          = data[i].attributes.pledge_cap_cents
                            local patreon_user  = data[i].relationships.patron.data.id
                            local patreon_email = nil
                            for j = 1, #user_data, 1 do
                                if user_data[j].type == 'user' and user_data[j].id == patreon_user then
                                    patreon_email = user_data[j].attributes.email
                                    break
                                end
                            end

                            if tier and patreon_email then
                                local max_cars          = 0
                                Patreons[patreon_email] = tier
                                for k = 1, #Config.PatreonTiers, 1 do
                                    if Config.PatreonTiers[k].amount == tier then
                                        max_cars = Config.PatreonTiers[k].cars
                                        break
                                    end
                                end

                                if not isInDB(nil, nil, patreon_email) then
                                    MySQL.Sync.execute('INSERT INTO patreon (`email`, `cars_allowed`, `identifier`) VALUES (@email, @max_cars, 0)',
                                                       {
                                                           ['@email']    = patreon_email,
                                                           ['@max_cars'] = max_cars
                                                       })
                                else
                                    MySQL.Sync.execute('UPDATE patreon SET `cars_allowed` = @max_cars WHERE email = @email',
                                                       {
                                                           ['@email']    = patreon_email,
                                                           ['@max_cars'] = max_cars
                                                       })
                                end
                            end
                        end
                    end
                end

                if next_link then
                    NextPatreonUrl = next_link
                else
                    NextPatreonUrl = Config.PatreonEndpoint
                    cleanDB()
                end
            end
        end, 'GET', '', { Authorization = 'Bearer ' .. Config.PatreonToken })
        Wait(Config.PatreonPullInterval * 1000)
    end
end)

ESX.RegisterServerCallback('esx_patreon:getVehicles', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local data    = {}

    MySQL.Async.fetchAll('SELECT * FROM patreon_cars', {}, function(data)
        cb(data)
    end)
end)

ESX.RegisterServerCallback('esx_patreon:tryValidatePatreon', isInDB)

ESX.RegisterServerCallback('esx_patreon:tryRetrieveVehicle', function(source, cb, params)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local data    = {}

    MySQL.Async.fetchAll('SELECT * FROM patreon WHERE email = @email', {
        ['@email'] = params
    }, function(data)

        if #data > 0 then
            if data[1].cars_allowed <= data[1].cars_out then
                cb('max_number')
            else
                cb('ok')
            end
        else
            cb('error')
        end
    end)

end)

ESX.RegisterServerCallback('esx_patreon:checkOwnedPatreon', function(source, cb, args)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local plate   = args.plate
    local data    = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate
    }, function(data)
        if #data > 0 then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterServerEvent('esx_patreon:setVehicleOwned')
AddEventHandler('esx_patreon:setVehicleOwned', function(vehicleProps, plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    print(vehicleProps.plate)

    print(xPlayer.identifier)

    local vehicleProps = {}
    print(plate)

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
                        {
                            ['@owner']   = xPlayer.identifier,
                            ['@plate']   = plate,
                            ['@vehicle'] = json.encode(vehicleProps)
                        }, function(rowsChanged)
            -- TriggerClientEvent('esx:showNotification', _source, 'Patreon car purchased!')
        end)
end)

RegisterNetEvent('esx_patreon:returnPatreon')
AddEventHandler('esx_patreon:returnPatreon', function(plate)
    RemoveOwnedVehicle(plate)
end)

RegisterNetEvent('esx_patreon:updatePatreonUsage')
AddEventHandler('esx_patreon:updatePatreonUsage', function(email, direction)
    if direction == 'increase' then
        MySQL.Sync.execute('UPDATE patreon SET cars_out = cars_out + 1 WHERE email = @email',
                           {
                               ['@email'] = email
                           })
    elseif direction == 'decrease' then
        MySQL.Sync.execute('UPDATE patreon SET cars_out = cars_out - 1 WHERE email = @email',
                           {
                               ['@email'] = email
                           })
    end
end)

function RemoveOwnedVehicle(plate)
    MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    })
end