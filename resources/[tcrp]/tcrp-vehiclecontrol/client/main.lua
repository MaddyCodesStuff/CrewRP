-- Toggle door open/close
function openClose(vehicle, door)
    if GetVehicleDoorAngleRatio(vehicle, door) <= 0 then
        SetVehicleDoorOpen(vehicle, door, false, false)
    else
        SetVehicleDoorShut(vehicle, door, false)
    end
end

-- Starts a network action. This is used in case the local client isn't the network "owner"
RegisterNetEvent('tcrp-vehiclecontrol:startAction')
AddEventHandler('tcrp-vehiclecontrol:startAction', function(action)
    local plyPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(plyPed)
    local vehicle = GetVehiclePedIsIn(plyPed, false)
    if vehicle < 1 then
        vehicle = GetEntityAttachedTo(PlayerPedId())
        if vehicle < 1 or GetEntityType(vehicle) ~= 2 then
            local castTo = GetOffsetFromEntityInWorldCoords(plyPed, 0, 2.0, 0)
            local cast = StartShapeTestLosProbe(coords.x, coords.y, coords.z, castTo.x, castTo.y, castTo.z,
                10, plyPed, 0)
            local castDone
            while castDone ~= 0 and castDone ~= 2 do
                castDone, _, _, _, vehicle = GetShapeTestResult(cast)
                Wait(1)
            end
        end
    end
    if vehicle > 0 then
        -- This converts the local entity ID to a net ID in OneSync
        local owner = GetPlayerServerId(NetworkGetEntityOwner(vehicle))
        TriggerServerEvent('tcrp-vehiclecontrol:deployAction', owner, NetworkGetNetworkIdFromEntity(vehicle), action)
    end
end)

-- Toggle trunk
RegisterNetEvent('tcrp-vehiclecontrol:trunk')
AddEventHandler('tcrp-vehiclecontrol:trunk', function(vehicle)
    vehicle = NetworkGetEntityFromNetworkId(vehicle)
    openClose(vehicle, 5)
end)

-- Toggle rear doors
RegisterNetEvent('tcrp-vehiclecontrol:rdoors')
AddEventHandler('tcrp-vehiclecontrol:rdoors', function(vehicle)
    vehicle = NetworkGetEntityFromNetworkId(vehicle)
    openClose(vehicle, 2)
    openClose(vehicle, 3)
end)

-- Toggle hood
RegisterNetEvent('tcrp-vehiclecontrol:hood')
AddEventHandler('tcrp-vehiclecontrol:hood', function(vehicle)
    vehicle = NetworkGetEntityFromNetworkId(vehicle)
    openClose(vehicle, 4)
end)

-- Roll windows up / down
RegisterNetEvent('tcrp-vehiclecontrol:win')
AddEventHandler('tcrp-vehiclecontrol:win', function(window, direction)
    local plyPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(plyPed, false) then
        local vehicle = GetVehiclePedIsIn(plyPed, false)
        if direction == 'up' then
            RollUpWindow(vehicle, window)
        else
            RollDownWindow(vehicle, window)
        end
    end
end)

-- Toggle engine
RegisterNetEvent('tcrp-vehiclecontrol:engine')
AddEventHandler('tcrp-vehiclecontrol:engine', function()
    local plyPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(plyPed, false) then
        local vehicle = GetVehiclePedIsIn(plyPed, false)
        local wasEngineOn = GetIsVehicleEngineRunning(vehicle)
        SetVehicleEngineOn(vehicle, not wasEngineOn, false, wasEngineOn)
    end
end)