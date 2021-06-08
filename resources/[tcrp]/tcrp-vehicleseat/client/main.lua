local debug = false
local doorEnterDist = 0.9
local vehicle = 0
local disableShuffle = true
local pedInVehicle = false
local doors = {
    right = {
        bone = "handle_pside_r",
        index = 2,
    },
    left = {
        bone = "handle_dside_r",
        index = 1,
    },
}

Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(1, 49) or debug then
            local plyPed = PlayerPedId()
            local plyCoords = GetEntityCoords(plyPed)

            -- Ensure we can enter the vehicle
            if vehicle > 0 and not pedInVehicle and GetVehicleDoorLockStatus(vehicle) ~= 2 and (GetPedInVehicleSeat(vehicle, -1) == 0 or IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
                for _, doorInfo in pairs(doors) do
                    -- Ensure the door we're checking exists & isn't occupied
                    if DoesVehicleHaveDoor(vehicle, doorInfo.index) and GetPedInVehicleSeat(vehicle, doorInfo.index) == 0 then
                        local vehFwd = GetEntityForwardVector(vehicle)
                        local doorCoord = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, doorInfo.bone)) - (vehFwd * 0.3)
                        doorCoord = vector3(doorCoord.x, doorCoord.y, plyCoords.z)
                        local doorDist = #(plyCoords - doorCoord)

                        if debug then
                            print(string.format("%i - %0.2f", doorInfo.index, doorDist))
                            DrawMarker(1, doorCoord.x, doorCoord.y, doorCoord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 , doorEnterDist, doorEnterDist, 0.5, 255, 0, 0, 50, false, true, 2, nil, nil, true)
                        end

                        -- Enter the vehicle if we're close
                        if doorDist <= doorEnterDist and (not debug or (debug and IsControlJustPressed(1, 49))) then
                            TaskEnterVehicle(plyPed, vehicle, 1500, doorInfo.index, 1.0, 1, 0)
                            break
                        end
                    end
                end
            end
        end
        Wait(1)
    end
end)

-- Cast for vehicle
Citizen.CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed)
        pedInVehicle = IsPedInAnyVehicle(plyPed, false)
        vehicle = castForVehicle(plyPed, plyCoords)
        Wait(50)
    end
end)

-- Disable seat shuffle
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if pedInVehicle and disableShuffle then
            local inVehicle = GetVehiclePedIsIn(playerPed, false)
            if GetPedInVehicleSeat(inVehicle, 0) == playerPed then
                if not GetIsTaskActive(playerPed, 164) and GetIsTaskActive(playerPed, 165) then
                    SetPedIntoVehicle(playerPed, inVehicle, 0)
                end
            end
        end
    end
end)

-- Shuffle seats
RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
    local playerPed = GetPlayerPed(-1)
    if pedInVehicle then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        disableShuffle = false
        TaskShuffleToNextVehicleSeat(playerPed, vehicle)
        Citizen.Wait(2000)
        disableShuffle = true
    else
        CancelEvent()
    end
end)

-- Check for vehicle that we're looking at
function castForVehicle(plyPed, plyCoords)
    local castTo = GetOffsetFromEntityInWorldCoords(plyPed, 0, 2.0, 0)
    local cast = StartShapeTestLosProbe(plyCoords.x, plyCoords.y, plyCoords.z, castTo.x, castTo.y, castTo.z,
        10, plyPed, 0)
    local castDone, vehicle
    while castDone ~= 0 and castDone ~= 2 do
        castDone, _, _, _, vehicle = GetShapeTestResult(cast)
        Wait(1)
    end
    return vehicle
end

RegisterCommand("shuff", function(source, args, raw)
    TriggerEvent("SeatShuffle")
end, false)