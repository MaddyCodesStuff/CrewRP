ESX                      = nil
local lastGunAlertInArea = {}

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords, streetName, vehicleLabel, playerGender)
    if playerGender == 0 then
        playerGender = _U('male')
    else
        playerGender = _U('female')
    end

    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('carjack', playerGender, vehicleLabel, streetName),
                       'Carjacking Reported')
    TriggerClientEvent('esx_outlawalert:carJackInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords, streetName, playerGender)
    if playerGender == 0 then
        playerGender = _U('male')
    else
        playerGender = _U('female')
    end

    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('combat', playerGender, streetName), 'Combat Reported')
    TriggerClientEvent('esx_outlawalert:combatInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords, streetName, playerGender, playerInVehicle, interiorhash)
    local pedinterior = nil
    for k,v in pairs(Config.InteriorLocations) do
        for i = 1, #v, 1 do
            if v[i] == interiorhash then
                pedinterior = k
            end
        end
    end
    if playerGender == 0 then
        playerGender = _U('male')
    else
        playerGender = _U('female')
    end

    local sendAlert = true
    local time      = os.time()
    for i = 1, #lastGunAlertInArea, 1 do
        math.randomseed(time)
        local alert_luck = math.random(1000)
        local dist       = #(vector3(targetCoords.x, targetCoords.y, targetCoords.z) - vector3(lastGunAlertInArea[i].x,
                                                                                               lastGunAlertInArea[i].y,
                                                                                               lastGunAlertInArea[i].z))
        if (dist < 25 and time - lastGunAlertInArea[i].time < Config.GunshotAlertDelay) or alert_luck < 500 then
            sendAlert = false
            Wait(100)
            break
        end
    end

    if sendAlert then
        Wait(100)
        table.insert(lastGunAlertInArea, {
            x    = targetCoords.x,
            y    = targetCoords.y,
            z    = targetCoords.z,
            time = time
        })
        math.randomseed(time)
        local coord_modifier = math.random(-Config.BlipGunRadius, Config.BlipGunRadius)
        local alert_coords   = vector3(targetCoords.x + coord_modifier, targetCoords.y + coord_modifier, targetCoords.z)
        if pedinterior == nil then
            TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('gunshot', playerGender, streetName),'Gunshots Reported')
        else
            TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('interiorshot', playerGender, pedinterior or "Unknown"),'Gunshots Reported')
        end
        TriggerClientEvent('esx_outlawalert:gunshotInProgress', -1, alert_coords, playerInVehicle, pedinterior, interiorhash)
    end
end)

RegisterServerEvent('esx_outlawalert:explosionInProgress')
AddEventHandler('esx_outlawalert:explosionInProgress', function(targetCoords, streetName, sendCopNotify, interiorhash)
    local throwawayvariable = true
    if sendCopNotify then
        local pedinterior = nil
        for k,v in pairs(Config.InteriorLocations) do
            print(k,v)
            for i = 1, #v, 1 do
                if v[i] == interiorhash then
                    pedinterior = k
                end
            end
        end
        if pedinterior == nil then
            TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('explosion', streetName), 'Explosion Reported')
        else
            TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('interiorexplosion', pedinterior), 'Explosion Reported')
        end
        TriggerClientEvent('esx_outlawalert:explosionInProgress', -1, targetCoords, pedinterior, interiorhash, throwawayvariable)
    end
end)

RegisterServerEvent('esx_outlawalert:shopliftingInProgress')
AddEventHandler('esx_outlawalert:shopliftingInProgress', function()
    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('shoplifting'), 'Shoplifting Reported')
end)

RegisterServerEvent('esx_outlawalert:policeDistress')
AddEventHandler('esx_outlawalert:policeDistress', function(targetCoords, streetName, playerGender)
    if playerGender == 0 then
        playerGender = _U('male')
    else
        playerGender = _U('female')
    end

    TriggerClientEvent('esx_outlawalert:policeDistress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:citizenDistress')
AddEventHandler('esx_outlawalert:citizenDistress', function(targetCoords, streetName, interiorhash)
    local throwawayvariable = true
    local test = nil
    local pedinterior = nil
    for k,v in pairs(Config.InteriorLocations) do
        for i = 1, #v, 1 do
            if v[i] == interiorhash then
                pedinterior = k
            end
        end
    end
    if pedinterior == nil then
        TriggerClientEvent('esx_outlawalert:emsDistressNotify', -1, _U('revive', streetName))
    else
        TriggerClientEvent('esx_outlawalert:emsDistressNotify', -1, _U('interiorrevive', pedinterior))
    end
    print(targetCoords, interiorhash, pedinterior)
    TriggerClientEvent('esx_outlawalert:citizenDistress', -1, targetCoords, pedinterior, interiorhash, throwawayvariable)
end)

ESX.RegisterServerCallback('esx_outlawalert:isVehicleOwner', function(source, cb, plate)
    local identifier = GetPlayerIdentifier(source, 0)

    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = identifier,
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            cb(result[1].owner == identifier)
        else
            cb(false)
        end
    end)
end)

-- Cleanup gunshot tracker
Citizen.CreateThread(function()
    Citizen.Wait(120000)

    local currentTime = os.time()
    local newTable    = {}

    for i = 1, #lastGunAlertInArea, 1 do
        if currentTime - lastGunAlertInArea.time < (Config.GunshotAlertDelay * 60) then
            table.append(newTable, lastGunAlertInArea.i)
        end
    end

    lastGunAlertInArea = newTable
end)

AddEventHandler('playerDropped', function(reason)
    TriggerClientEvent('esx_outlawalert:checkDispatch', source)
end)