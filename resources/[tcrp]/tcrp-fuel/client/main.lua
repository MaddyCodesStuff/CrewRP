local isNearPump
local isNearVehicle = 0
local isFueling = false
local vehicle = 0
local holdingJerry = false
local fuelMode = 0

-- Handle fuel consumption
Citizen.CreateThread(function()
    DecorRegister(Config.FuelDecor, 1)
    while true do
        if not DecorExistOn(vehicle, Config.FuelDecor) and  vehicle ~= 0 then
            TriggerEvent('tcrp-fuel:setFuel', NetworkGetNetworkIdFromEntity(vehicle), math.random(200, 800) / 10)
            print(DecorExistOn(vehicle, Config.FuelDecor))
        end
        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and IsVehicleEngineOn(vehicle) then
            local rpm = GetVehicleCurrentRpm(vehicle)
            local vehicleClass = GetVehicleClass(vehicle)
            local consumption = (Config.FuelUsage[round(rpm, 1)] * (Config.Classes[vehicleClass] or 0.1))
            local newFuel = GetVehicleFuelLevel(vehicle) - consumption
            TriggerServerEvent('tcrp-fuel:setFuel', NetworkGetNetworkIdFromEntity(vehicle), newFuel)
        end
        Wait(1000)
    end
end)

--Fix Local Boats Have Less Than 10 Fuel
--Citizen.CreateThread(function()
  --  while true do
    --    Citizen.Wait(0)
      --  local playerPed = PlayerPedId(-1)
        --local vehicleType, vehicle 
        --if IsPedGettingIntoAVehicle(playerPed) == 1 then 
          --  vehicle = GetVehiclePedIsTryingToEnter(playerPed)
            --vehicleType = GetVehicleClass(GetVehiclePedIsTryingToEnter(playerPed))
            --if vehicleType == 14 then
              --  SetVehicleFuelLevel(vehicle, 40.0)
            --end
        --end
    --end
--end)

-- Get ped vehicle
Citizen.CreateThread(function()
    while true do
        vehicle = GetVehiclePedIsIn(PlayerPedId())
        Wait(2000)
    end
end)

-- Gas station blips
Citizen.CreateThread(function()
    for _, coords in ipairs(Config.GasStations) do
        local blip = AddBlipForCoord(coords)

        SetBlipSprite(blip, 361)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAsShortRange(blip, true)
        SetBlipPriority(blip, 1)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Gas Station")
        EndTextCommandSetBlipName(blip)
    end
end)

-- Detect if near pump & vehicle
Citizen.CreateThread(function()
    while true do
        if not isFueling and vehicle == 0 then
            local obj = rayCast(16, vector3(0, 0.5, 0))
            local _, curWeapon = GetCurrentPedWeapon(PlayerPedId(), 1)
            holdingJerry = (curWeapon == GetHashKey('WEAPON_PETROLCAN'))
            isNearVehicle = rayCast(10, vector3(0, -1.0, -0.5))

            -- Don't refuel moving vehicles
            if isNearVehicle == 0 or not GetEntityVelocity(isNearVehicle) == vector3(0, 0, 0) then
                isNearVehicle = nil
            end

            isNearPump = nil
            if obj ~= 0 then
                local model = GetEntityModel(obj)
                for _, hash in ipairs(Config.PumpModels) do
                    if hash == model then
                        isNearPump = obj
                        break
                    end
                end
            end
        end

        Wait(1000)
    end
end)

-- Decide what we're in a position to do. Basically a glorified switch statement
Citizen.CreateThread(function()
    while true do
        fuelMode = 0

        if vehicle == 0 then
            -- Handle pump modes
            if isNearPump then
                fuelMode = 1 -- Fill our jerry can
                if isNearVehicle then
                    fuelMode = 2 -- Fill our vehicle
                end
            elseif holdingJerry and isNearVehicle then
                fuelMode = 3 -- Fill our vehicle from a jerry can
            end
        end
        Wait(1000)
    end
end)

-- Display fueling prompt
Citizen.CreateThread(function()
    while true do
        if fuelMode > 0 and not isFueling then
            local text = "Refuel vehicle"
            local coords = GetEntityCoords(isNearPump)

            if fuelMode == 3 then
                coords = GetEntityCoords(isNearVehicle)
            elseif fuelMode == 1 then
                text = "Fill jerry can"
            end

            coords = coords + vector3(0, 0, 2.0)
            DrawText3D(coords, "[E] " .. text)
        else
            Wait(500)
        end
        Wait(1)
    end
end)

-- Detect key press for refuel & jerry can
Citizen.CreateThread(function()
    while true do
        if fuelMode > 0 and not isFueling and IsControlJustPressed(0, 51) then
            isFueling = true
            local totalFuel, vehCoords, maxFuel, emote, fullText
            local lastEmote = exports["krz_personalmenu"]:getCurrentEmote()
            local addedFuel = 0
            local curCost = 0
            local playerPed = PlayerPedId()
            local jerryEmpty = false
            local fuelingVehicle = fuelMode > 1

            if fuelingVehicle then
                totalFuel = GetVehicleFuelLevel(isNearVehicle)
                vehCoords = GetEntityCoords(isNearVehicle)
                maxFuel = 100.0
                emote = 'fuel'
                fullText = "Vehicle is full."
            else
                TriggerServerEvent('tcrp-fuel:buyJerryCan')
                Wait(100)
                SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_PETROLCAN'), true)
                totalFuel = GetAmmoInPedWeapon(playerPed, GetHashKey('WEAPON_PETROLCAN'))
                vehCoords = GetEntityCoords(playerPed)
                maxFuel = 4500.0
                emote = 'kneel2'
                fullText = "Jerry can is full."
            end

            local fuelPercent = (totalFuel + 0.0) / maxFuel * 100
            local startPercent = fuelPercent

            if totalFuel < maxFuel then
                TriggerEvent('emote:cancel')
                Wait(200)
                if fuelingVehicle then
                    TaskTurnPedToFaceEntity(playerPed, isNearVehicle, 1000)
                    Wait(1000)
                end
                TriggerEvent('emote:do', emote)
                FreezeEntityPosition(playerPed, true)

                Citizen.CreateThread(function()
                    while isFueling do
                        local text = string.format("%.0f%% filled", fuelPercent)
                        if fuelMode ~= 3 then
                            text = string.format("%s ($%.2f)", text, curCost)
                        end
                        DrawText3D(vehCoords + vector3(0, 0, 1),  string.format("%s. \n[X] Cancel", text))
                        DisableControlAction(0, 73)
                        if IsDisabledControlJustPressed(0, 73) or fuelPercent >= 100 or jerryEmpty then
                            local entity = fuelingVehicle and isNearVehicle or playerPed
                            TriggerServerEvent('tcrp-fuel:finishedFueling', NetworkGetNetworkIdFromEntity(entity), (fuelPercent / 100.0) * maxFuel, curCost)
                            if fuelMode == 3 then --Reduce Fuel in Jerry Can if that is the Fuel Source
                                local ammo = GetAmmoInPedWeapon(PlayerPedId(-1), GetHashKey('WEAPON_PETROLCAN'))
                                local fuelUse = ammo - ((fuelPercent / 10.0) * maxFuel) 
                                local newJerry = round(fuelUse, 0)
                                SetPedAmmo(PlayerPedId(-1), GetHashKey('WEAPON_PETROLCAN'), newJerry)
                            end
                            isFueling = false
                        end
                        Wait(1)
                    end
                end)

                while isFueling do
                    addedFuel = addedFuel + Config.FuelSpeed
                    if fuelMode ~= 3 then
                        curCost = addedFuel * Config.Prices.fuel
                    end
                    fuelPercent = startPercent + addedFuel
                    if fuelPercent > 100 then
                        fuelPercent = 100
                    end
                    if fuelingVehicle and fuelMode == 3 then
                        jerryEmpty = removeFromJerry()
                    end
                    Wait(1000)
                end

                TriggerEvent('emote:cancel')
                FreezeEntityPosition(playerPed, false)
                TriggerEvent('emote:do', lastEmote)
            else
                TriggerEvent('tcrp:displayGeneral', fullText)
                isFueling = false
            end
        end
        Wait(1)
    end
end)

-- Set vehicle fuel level
RegisterNetEvent('tcrp-fuel:setFuel')
AddEventHandler('tcrp-fuel:setFuel', function(vehicle, fuel)
    vehicle = NetworkGetEntityFromNetworkId(vehicle)
    if vehicle == PlayerPedId() then
        SetPedAmmo(vehicle, GetHashKey('WEAPON_PETROLCAN'), math.floor(fuel))
    elseif DoesEntityExist(vehicle)  then
        if fuel < 0 then
            fuel = 0.0
        elseif fuel > 100 then
            fuel = 100.0
        end
        SetVehicleFuelLevel(vehicle, fuel + 0.0)
        DecorSetFloat(vehicle, Config.FuelDecor, GetVehicleFuelLevel(vehicle))
    end
end)

-- Remove fuel from jerry
function removeFromJerry()
    local ammo = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN'))
    local newAmmo = ammo - ((4500 / 100) * Config.FuelSpeed)
    TriggerEvent('tcrp-fuel:setFuel', PlayerPedId(), newAmmo)
    Wait(100)
    return (GetAmmoInPedWeapon(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN')) <= 0)
end

-- Raycast
function rayCast(flag, offset)
    local plyPed = PlayerPedId()
    local coords = GetEntityCoords(plyPed)
    local castTo = GetOffsetFromEntityInWorldCoords(plyPed, offset)
    local cast = StartShapeTestCapsule(coords, castTo, 0.8, flag, plyPed, 0)
    local castDone, obj

    while castDone ~= 0 and castDone ~= 2 do
        castDone, _, _, _, obj = GetShapeTestResult(cast)
        Wait(1)
    end
    return obj
end

-- Text
function DrawText3D(coords, text)
    local _, _x, _y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z)

    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()

    AddTextComponentString(text)
    DrawText(_x, _y)
end

-- Round a number
function round(number, places)
    local numFormat = "%." .. places .. "f"
    return tonumber(string.format(numFormat, number))
end