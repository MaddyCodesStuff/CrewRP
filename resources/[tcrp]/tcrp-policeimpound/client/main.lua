-- VARS
-- local

local nearbyLot = false -- Nearby impound lot (bool)
local insideLot = false -- Inside impound lot (bool)
local inPrompt = false -- At a prompt (bool)
local displayingPrompt = false -- Displaying prompt (bool)
local inVehicle = false -- Inside of any vehicle (bool)
local atComputer = false -- At the impound computer (bool)

-- global

isPolice = false -- Police check (bool)
doorLocked = false -- Impound lot exterior door lock state (bool)
computerHacked = false -- Computer hacked state (bool)
atKeyLocation = 0 -- Track key location that player is at (int)
inComputer = false -- Tracks if user is in the impound computer (bool)
keysFound = false -- Tracks if user has found car keys (bool)
keylocation = 0 -- Tracks the location of the keys (int)

-- END VARS

-- ESX junk
ESX  = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end
end)

-- Handle teleport
function teleport(coords)
    local entity = GetPlayerPed(-1)
    if inVehicle then
        entity = GetVehiclePedIsIn(entity, false)
    end
    SetEntityCoordsNoOffset(entity, coords, false, false, false)
    SetEntityHeading(entity, Config.ImpoundLot.heading)
    local fwdVec = GetEntityForwardVector(entity)
    SetEntityCoordsNoOffset(entity, coords + (fwdVec * Config.PromptDistance), false, false, false)
end

-- Distance check shortcut
function distCheck(c1, c2, dist)
    return (#(c1 - c2) < dist and math.abs(c1.z - c2.z) < 5.0)
end

-- Random-er
function randomizer(min, max)
    local lwr = math.random(min, math.floor(max / 2))
    local upr = math.random(math.ceil(max / 2), max)

    return math.random(lwr, upr)
end

function getAction()
    if atComputer then
        return (isPolice or computerHacked) and "access_computer" or "hack_computer"
    elseif atKeyLocation > 0 and not isPolice then
        return "search_keys"
    elseif insideLot then
        return "exit"
    elseif nearbyLot then
        return (isPolice or not doorLocked) and "enter" or "break_in"
    end
    return
end

-- Display prompt
function displayPrompt()
    -- Display
    local action = getAction()

    Citizen.CreateThread(function()
        displayingPrompt = true
        while inPrompt do
            SetTextComponentFormat('STRING')
            AddTextComponentString("Press ~INPUT_CONTEXT~ to "..Config.ActionLabels[action])
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            action = getAction()
            Wait(0)
        end
        displayingPrompt = false
    end)

    -- Handle input
    Citizen.CreateThread(function()
        while inPrompt do
            if IsControlJustReleased(0, 38) then
                if action == "enter" then
                    teleport(Config.ImpoundLot.doorway.inside)
                elseif action == "exit" then
                    local coords = Config.ImpoundLot.doorway.outside
                    if inVehicle then
                        coords = Config.ImpoundLot.garage.outside
                    end
                    teleport(coords)
                elseif action == "break_in" then
                    TriggerServerEvent('tcrp-policeimpound:breakIn')
                elseif action == "hack_computer" then
                    TriggerServerEvent('tcrp-policeimpound:startHack')
                elseif action == "access_computer" then
                    TriggerServerEvent('tcrp-policeimpound:accessComputer')
                elseif action == "search_keys" then
                    TriggerEvent('tcrp-policeimpound:searchKeys', atKeyLocation)
                end
            end
            Wait(10)
        end
    end)
end

-- Impound vehicle
RegisterNetEvent('tcrp-policeimpound:impoundVehicle')
AddEventHandler('tcrp-policeimpound:impoundVehicle', function(vehicle)
    if not nearbyLot then
        TriggerEvent('tcrp:displayGeneral', "Must be at the lot to impound.")
    elseif vehicle == nil or vehicle <= 0 then
        TriggerEvent('tcrp:displayGeneral', "Not near vehicle.")
    else
        TriggerEvent("mythic_progbar:client:progress", Config.MythicActions.impound_vehicle, function(wasCancelled)
            if not wasCancelled then
                Wait(500)
                TriggerEvent("mythic_progbar:client:progress", Config.MythicActions.update_registration, function(_wasCancelled)
                    if not _wasCancelled then
                        TriggerServerEvent('tcrp-policeimpound:impoundVehicle', vehicle, GetVehicleNumberPlateText(vehicle))
                    end
                end)
            end
        end)
    end
end)

-- Handle impounded vehicle
RegisterNetEvent('tcrp-policeimpound:deleteVehicle')
AddEventHandler('tcrp-policeimpound:deleteVehicle', function(vehicle)
    SetEntityAsMissionEntity(vehicle, false, true)
	DeleteVehicle(vehicle)
    if isPolice then
        TriggerEvent('tcrp:displayGeneral', "Vehicle sent to impound.")
    end
end)

-- Handle lock status
RegisterNetEvent('tcrp-policeimpound:setStatus')
AddEventHandler('tcrp-policeimpound:setStatus', function(lockStatus, hackStatus)
    computerHacked = hackStatus
    doorLocked = lockStatus
end)

-- Spawn a vehicle
RegisterNetEvent('tcrp-policeimpound:spawnVehicle')
AddEventHandler('tcrp-policeimpound:spawnVehicle', function(vehicleData)
    ESX.Game.SpawnVehicle(vehicleData.vehicle.model, Config.ImpoundLot.car_spawn.coords, Config.ImpoundLot.car_spawn.heading, function(vehicle) -- ESX
        ESX.Game.SetVehicleProperties(vehicle, vehicleData.vehicle)
        local policeText = string.format([[
            Detected vehicle removed from impound -- 
            Plate: %s -- 
            Model: %s
        ]], vehicleData.plate, GetLabelText(GetDisplayNameFromVehicleModel(vehicleData.vehicle.model)))
        TriggerServerEvent('esx_addons_gcphone:startCall', 'police', policeText, Config.ImpoundLot.doorway.outside, true)

        -- Force vehicle doors locked if stealing
        if not isPolice then
            TriggerEvent('tcrp-policeimpound:trackLocks', vehicle)
        end
    end)
end)

-- Draw blip

-- Nearby / inside lot detection
Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(ped)
        local _inPrompt = false
        insideLot = false
        nearbyLot = false
        atKeyLocation = 0

        -- Track if near / inside lot
        for _, coord in ipairs(Config.LotCoords) do
            if distCheck(coord[1], coords, coord[4]) then
                insideLot = (coord[2] == "inside")
                nearbyLot = (coord[2] == "outside")
                local distMultiplier = inVehicle and 2.0 or 1.0

                if distCheck(coord[1], coords, Config.PromptDistance * distMultiplier) and coord[3] == inVehicle then
                    _inPrompt = true
                end
            end
        end

        if insideLot then
            -- Track if at computer
            atComputer = distCheck(Config.ImpoundLot.computer, coords, Config.PromptDistance)

            -- Track if at a key search
            for location, keyCoord in ipairs(Config.KeyLocations) do
                if distCheck(keyCoord, coords, Config.PromptDistance) then
                    atKeyLocation = location
                    break
                end
            end
        end

        inPrompt = (atComputer or atKeyLocation > 0) and true or _inPrompt
        if not displayingPrompt then
            displayPrompt()
        end

        Wait(1000)
    end
end)

-- Get player in-vehicle status
Citizen.CreateThread(function()
    -- Seed randomness
    math.randomseed(GetGameTimer())

    while true do
        if nearbyLot or insideLot then
            inVehicle = IsPedInAnyVehicle(GetPlayerPed(-1), false) and true or false
            Wait(500)
        else
            Wait(2000)
        end
    end
end)

-- Disable lock / unlock button while in garage
Citizen.CreateThread(function()
    while true do
        if insideLot then
            DisableControlAction(0, Config.DoorLockKey)
            Wait(1)
        else
            Wait(500)
        end
    end
end)

-- Check if player is PD
Citizen.CreateThread(function()
    while true do
        Wait(10000)
        isPolice = ESX ~= nil and ESX.GetPlayerData().job ~= nil and ESX.GetPlayerData().job.name == 'police' -- ESX
    end
end)