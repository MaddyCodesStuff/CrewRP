--[[
ORIGINAL CODE BY ESX-ORG / ESX_POLICEJOB
EDITS BY CHIP W
]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'gitrdone', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'gitrdone', _U('alert_gitrdone'), true, true)
TriggerEvent('esx_society:registerSociety', 'gitrdone', 'GrD Construction', 'society_gitrdone', 'society_gitrdone',
             'society_gitrdone', { type = 'public' })

ESX.RegisterServerCallback('esx_gitrdone:buyJobVehicle', function(source, cb, vehicleProps, type)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price   = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

    -- vehicle model not found
    if price == 0 then
        print(('esx_gitrdone: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
        cb(false)
    end

    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)

        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, stored) VALUES (@owner, @vehicle, @plate, @type, @job, @stored)',
                            {
                                ['@owner']   = xPlayer.identifier,
                                ['@vehicle'] = json.encode(vehicleProps),
                                ['@plate']   = vehicleProps.plate,
                                ['@type']    = type,
                                ['@job']     = xPlayer.job.name,
                                ['@stored']  = true
                            }, function(rowsChanged)
                cb(true)
            end)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('esx_gitrdone:storeNearbyVehicle', function(source, cb, nearbyVehicles)
    local xPlayer = ESX.GetPlayerFromId(source)
    local foundPlate, foundNum

    for k, v in ipairs(nearbyVehicles) do
        local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND job = @job',
                                           {
                                               ['@owner'] = xPlayer.identifier,
                                               ['@plate'] = v.plate,
                                               ['@job']   = xPlayer.job.name
                                           })

        if result[1] then
            foundPlate, foundNum = result[1].plate, k
            break
        end
    end

    if not foundPlate then
        cb(false)
    else
        MySQL.Async.execute('UPDATE owned_vehicles SET stored = true WHERE owner = @owner AND plate = @plate AND job = @job',
                            {
                                ['@owner'] = xPlayer.identifier,
                                ['@plate'] = foundPlate,
                                ['@job']   = xPlayer.job.name
                            }, function(rowsChanged)
                if rowsChanged == 0 then
                    print(('esx_gitrdone: %s has exploited the garage!'):format(xPlayer.identifier))
                    cb(false)
                else
                    cb(true, foundNum)
                end
            end)
    end

end)

function getPriceFromHash(hashKey, jobGrade, type)

    if type == 'car' then
        local vehicles = Config.AuthorizedVehicles[jobGrade]
        local shared   = Config.AuthorizedVehicles['Shared']

        for k, v in ipairs(vehicles) do
            if GetHashKey(v.model) == hashKey then
                return v.price
            end
        end

        for k, v in ipairs(shared) do
            if GetHashKey(v.model) == hashKey then
                return v.price
            end
        end
    end

    return 0
end

ESX.RegisterServerCallback('esx_gitrdone:getStockItems', function(source, cb)
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gitrdone', function(inventory)
        cb(inventory.items)
    end)
end)

ESX.RegisterServerCallback('esx_gitrdone:getPlayerInventory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items   = xPlayer.inventory

    cb({ items = items })
end)

AddEventHandler('playerDropped', function()
    -- Save the source in case we lose it (which happens a lot)
    local _source = source

    -- Did the player ever join?
    if _source ~= nil then
        local xPlayer = ESX.GetPlayerFromId(_source)

        -- Is it worth telling all clients to refresh?
        if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'gitrdone' then
            Citizen.Wait(5000)
            TriggerClientEvent('esx_gitrdone:updateBlip', -1)
        end
    end
end)

RegisterServerEvent('esx_gitrdone:spawned')
AddEventHandler('esx_gitrdone:spawned', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'gitrdone' then
        Citizen.Wait(5000)
        TriggerClientEvent('esx_gitrdone:updateBlip', -1)
    end
end)

RegisterServerEvent('esx_gitrdone:forceBlip')
AddEventHandler('esx_gitrdone:forceBlip', function()
    TriggerClientEvent('esx_gitrdone:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Citizen.Wait(5000)
        TriggerClientEvent('esx_gitrdone:updateBlip', -1)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        TriggerEvent('esx_phone:removeNumber', 'gitrdone')
    end
end)

RegisterServerEvent('esx_gitrdone:message')
AddEventHandler('esx_gitrdone:message', function(target, msg)
    TriggerClientEvent('esx:showNotification', target, msg)
end)