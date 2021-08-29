-- Create a random local vehicle
function createLocalVehicle()
    -- Try to add more randomness
    local vehK = randomizer(1, #Config.LocalVehicles)
    local model = Config.LocalVehicles[vehK]

    ESX.Game.SpawnVehicle(model, Config.ImpoundLot.car_spawn.coords, Config.ImpoundLot.car_spawn.heading, function(vehicle)
        local plate = exports.esx_vehicleshop:GeneratePlate()
        SetVehicleNumberPlateText(vehicle, plate)
        local vehicleData = {
            plate = plate,
            vehicle = ESX.Game.GetVehicleProperties(vehicle),
        }
        TriggerEvent('tcrp-policeimpound:deleteVehicle', vehicle)
        while DoesEntityExist(vehicle) do
            Wait(50)
        end
        TriggerServerEvent('tcrp-policeimpound:retreiveLocalVehicle', vehicleData, not isPolice)
    end)
end

-- Start break in
RegisterNetEvent('tcrp-policeimpound:breakIn')
AddEventHandler('tcrp-policeimpound:breakIn', function()
    TriggerEvent("mythic_progbar:client:progress", Config.MythicActions.break_in, function(wasCancelled)
        if not wasCancelled then
            TriggerServerEvent('tcrp-policeimpound:brokeIn')
        else
            TriggerEvent('tcrp:displayGeneral', "Lockpicking failed.")
        end
    end)
end)

-- Start hack
RegisterNetEvent('tcrp-policeimpound:startHack')
AddEventHandler('tcrp-policeimpound:startHack', function()
    TriggerEvent('mhacking:show')
    TriggerEvent('mhacking:start', 3, 18, function(success, _) -- this is where you change how hard the hack is 
        TriggerServerEvent('tcrp-policeimpound:hacked', success)
        TriggerEvent('mhacking:hide')
    end)
end)

-- Access computer
RegisterNetEvent('tcrp-policeimpound:accessComputer')
AddEventHandler('tcrp-policeimpound:accessComputer', function(vehicles)
    local displayData = {}
    for _, vehicleData in ipairs(vehicles) do
        table.insert(displayData, {
            plate = vehicleData.plate,
            previous_owner = string.format(
                "%s, %s", vehicleData.previous_owner.last, vehicleData.previous_owner.first),
            model = GetLabelText(GetDisplayNameFromVehicleModel(vehicleData.vehicle.model))
        })
    end
    SendNUIMessage({
        action = "displayComputer",
        vehicles = displayData,
        isPolice = isPolice
    })
    SetNuiFocus(true, true)
    inComputer = true
    Citizen.CreateThread(function()
        while inComputer do
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 47, true) -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            Wait(1)
        end
    end)
end)

-- Tracks vehicle lock status & key location
RegisterNetEvent('tcrp-policeimpound:trackLocks')
AddEventHandler('tcrp-policeimpound:trackLocks', function(vehicle)
    SetVehicleDoorsLocked(vehicle, 2)

    TriggerEvent('tcrp:displayGeneral', "Go find the vehicle keys!")
    keylocation = randomizer(1, #Config.KeyLocations)
    keysFound = false

    while not keysFound do
        Wait(1000)
    end

    SetVehicleDoorsLocked(vehicle, 1)
    keylocation = 0
end)

-- Search for keys
RegisterNetEvent('tcrp-policeimpound:searchKeys')
AddEventHandler('tcrp-policeimpound:searchKeys', function(location)
    if keysFound then
        TriggerEvent('tcrp:displayGeneral', "You've already found the keys. Time to get out of here!")
    elseif keylocation > 0 then
        TriggerEvent("mythic_progbar:client:progress", Config.MythicActions.search_keys, function(wasCancelled)
            if not wasCancelled then
                if location == keylocation then
                    TriggerEvent('tcrp:displayGeneral', "Found the keys! Time to get out of here.")
                    keysFound = true
                else
                    TriggerEvent('tcrp:displayGeneral', "No keys here. Keep searching.")
                end
            end
        end)
    else
        TriggerEvent('tcrp:displayGeneral', "You can't search for keys yet!")
    end
end)

-- Send alert to cops
RegisterNetEvent('tcrp-policeimpound:alertPolice')
AddEventHandler('tcrp-policeimpound:alertPolice', function(message)
    if isPolice then
        local blip = {["x"] = Config.ImpoundLot.doorway.outside.x, ["y"] = Config.ImpoundLot.doorway.outside.y, ["z"] = Config.ImpoundLot.doorway.outside.z, ["longrange"] = true, ["text"] = "[PD] Impound Robbery", ["sprite"] = 161, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 300}
        PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
        TriggerEvent('mythic_notify:client:SendCopAlert', { text = message })
        TriggerEvent("tcrp-blips:addblip", blip)
    end
end)

-- Plays alarm sound after picking lock
RegisterNetEvent('tcrp-policeimpound:playAlarm')
AddEventHandler('tcrp-policeimpound:playAlarm', function()
    local alarmTimer = GetGameTimer() + (Config.DoorUnlockTimer * 60 * 1000)
    while GetGameTimer() < alarmTimer do
        for _, coords in ipairs(Config.ImpoundLot.alarms) do
            PlaySoundFromCoord(-1, "scanner_alarm_os", coords, "dlc_xm_iaa_player_facility_sounds", 1, 100, 0)
        end
		Citizen.Wait(1000)
	end
end)

-- Close computer
RegisterNUICallback("hideComputer", function(data, cb)
    SetNuiFocus(false, false)
    inComputer = false
    cb('ok')
end)

--  Take a car out
RegisterNUICallback("spawnCar", function(data, cb)
    local mythic_action = {}

    for k, v in pairs(Config.MythicActions.hack_registration) do
        mythic_action[k] = v
    end

    if isPolice then
        mythic_action.label = "Updating vehicle registration..."
        mythic_action.duration = math.floor(mythic_action.duration / 2)
    end

    TriggerEvent("mythic_progbar:client:progress", mythic_action, function(wasCancelled)
        if not wasCancelled then
            if data.plate == "UNKNOWN" then
                createLocalVehicle()
            else
                TriggerServerEvent('tcrp-policeimpound:retreiveVehicle', data.plate, not isPolice)
            end
        else
            TriggerEvent('tcrp:displayGeneral', "Failed to register vehicle.")
        end
    end)
    cb('ok')
end)