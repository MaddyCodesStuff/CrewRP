ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Make sure all Vehicles are Stored on restart
MySQL.ready(function()
    ParkVehicles()
end)

function ParkVehicles()
    MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE `stored` = @stored AND `impounded` = false', {
        ['@stored'] = false
    }, function(rowsChanged)
        if rowsChanged > 0 then
            print(('esx_advancedgarage: %s vehicle(s) have been stored!'):format(rowsChanged))
        end
    end)
end

-- Get Owned Properties
ESX.RegisterServerCallback('esx_advancedgarage:getOwnedProperties', function(source, cb)
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)

    if xPlayer then
        MySQL.Async.fetchAll('SELECT * FROM owned_properties WHERE owner = @owner', {
            ['@owner'] = xPlayer.getIdentifier()
        }, function(data)
            local properties = {}
            for _, v in pairs(data) do
                table.insert(properties, v.name)
            end
            cb(properties)
        end)
    else
        cb({})
    end
end)

-- Fetch Owned Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:getOwned', function(source, cb, vehType)
    local ownedVehicles = {}
    local xPlayer   = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `owner` = @owner AND `type` = @Type', {
        ['@owner'] = xPlayer.identifier,
        ['@Type']  = vehType,
    }, function(data)
        for _, v in pairs(data) do
            local vehicle = json.decode(v.vehicle)
            local health  = json.decode(v.health)
            if type(health) ~= "table" then
                health = { engine = 1000.0, body = 1000.0, petrol = 1000.0 }
            end
            table.insert(ownedVehicles,
                         { vehicle = vehicle, stored = v.stored, plate = v.plate, health = health, impounded = v.impounded })
        end
        cb(ownedVehicles)
    end)
end)

-- Store lost vehicles (broken state after crash)
RegisterServerEvent('esx_advancedgarage:storeLostVehicles')
AddEventHandler('esx_advancedgarage:storeLostVehicles', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE `owned_vehicles` SET `stored` = @newstored WHERE `owner` = @owner AND `stored` = @stored AND `impounded` = @impounded',
                        {
                            ['@newstored'] = true,
                            ['@owner']     = xPlayer.identifier,
                            ['@stored']    = false,
                            ['@impounded'] = false
                        })

    print(('esx_advancedgarage: %s had lost vehicles. Restoring.'):format(GetPlayerIdentifiers(source)[1]))
end)

-- Store Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:storeVehicle', function(source, cb, vehicleProps)
    local ownedCars    = {}
    local vehplate     = vehicleProps.plate:match("^%s*(.-)%s*$")
    local vehiclemodel = vehicleProps.model
    local xPlayer      = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM `owned_vehicles` WHERE `owner` = @owner AND `plate` = @plate', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = vehicleProps.plate
    }, function(result)
        if result[1] ~= nil then
            local originalvehprops = json.decode(result[1].vehicle)
            if originalvehprops.model == vehiclemodel then
                MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE owner = @owner AND plate = @plate',
                                    {
                                        ['@owner']   = GetPlayerIdentifiers(source)[1],
                                        ['@vehicle'] = json.encode(vehicleProps),
                                        ['@plate']   = vehicleProps.plate
                                    }, function(rowsChanged)
                        if rowsChanged == 0 then
                            print(('esx_advancedgarage: %s attempted to store an vehicle they don\'t own!'):format(GetPlayerIdentifiers(source)[1]))
                        end
                        cb(true)
                    end)
            else
                if Config.KickPossibleCheaters == true then
                    if Config.UseCustomKickMessage == true then
                        print(('esx_advancedgarage: %s attempted to Cheat! Tried Storing: ' .. vehiclemodel .. '. Original Vehicle: ' .. originalvehprops.model):format(GetPlayerIdentifiers(source)[1]))
                        DropPlayer(source, _U('custom_kick'))
                        cb(false)
                    else
                        print(('esx_advancedgarage: %s attempted to Cheat! Tried Storing: ' .. vehiclemodel .. '. Original Vehicle: ' .. originalvehprops.model):format(GetPlayerIdentifiers(source)[1]))
                        DropPlayer(source, 'You have been Kicked from the Server for Possible Garage Cheating!!!')
                        cb(false)
                    end
                else
                    print(('esx_advancedgarage: %s attempted to Cheat! Tried Storing: ' .. vehiclemodel .. '. Original Vehicle: ' .. originalvehprops.model):format(GetPlayerIdentifiers(source)[1]))
                    cb(false)
                end
            end
        else
            print(('esx_advancedgarage: %s attempted to store an vehicle they don\'t own!'):format(GetPlayerIdentifiers(source)[1]))
            cb(false)
        end
    end)
end)

-- Fetch Pounded Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:getOutOwned', function(source, cb, vehType)
    local ownedCars = {}
    local xPlayer   = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `owner` = @owner AND `type` = @Type AND `stored` = @stored AND `impounded` = @impounded',
                         {
                             ['@owner']     = xPlayer.identifier,
                             ['@Type']      = vehType,
                             ['@stored']    = 0,
                             ['@impounded'] = 1
                         }, function(data)
            for _, v in pairs(data) do
                local vehicle = json.decode(v.vehicle)
                local health = json.decode(v.health)
                if type(health) ~= "table" then
                    health = { engine = 1000.0, body = 1000.0, petrol = 1000.0 }
                end
                table.insert(ownedCars, { 
                             vehicle = vehicle, stored = v.stored, plate = v.plate, health = health, impounded = v.impounded })
            end
            cb(ownedCars)
        end)
end)

-- Check Money for Pounded Aircrafts
ESX.RegisterServerCallback('esx_advancedgarage:checkMoney', function(source, cb, vehType)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.get('money') >= Config.PoundPrice[vehType] then
        cb(true)
    else
        cb(false)
    end
end)

-- Pay for Pounded Aircrafts
RegisterServerEvent('esx_advancedgarage:pay')
AddEventHandler('esx_advancedgarage:pay', function(vehType)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(Config.PoundPrice[vehType])
    TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source, { text = _U('you_paid') .. Config.PoundPrice[vehType] })
end)

-- Modify State of Vehicles
RegisterServerEvent('esx_advancedgarage:setVehicleState')
AddEventHandler('esx_advancedgarage:setVehicleState', function(plate, state, health)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored, `health` = @health WHERE plate = @plate', {
        ['@stored'] = state,
        ['@plate']  = plate,
        ['@health'] = json.encode(health)
    }, function(rowsChanged)
        if rowsChanged == 0 then
            print(('esx_advancedgarage: %s exploited the garage!'):format(xPlayer.identifier))
        end
    end)
end)

-- Set impound state on vehicle
RegisterServerEvent('esx_advancedgarage:setVehicleImpoundState')
AddEventHandler('esx_advancedgarage:setVehicleImpoundState', function(plate, state, health)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE owned_vehicles SET `impounded` = @impounded, `health` = @health WHERE plate = @plate', {
        ['@impounded'] = state,
        ['@plate']     = plate,
        ['@health'] = json.encode(health)
    }, function(rowsChanged)
        if rowsChanged == 0 then
            print(('esx_advancedgarage: %s exploited the garage with an impound!'):format(xPlayer.identifier))
        end
    end)
end)