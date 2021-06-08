--[[------------------------------------------------------------------------

    Wraith Radar System - v1.02
    Created by WolfKnight

------------------------------------------------------------------------]]--
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(5)

        TriggerEvent("esx:getSharedObject", function(library)
            ESX = library
        end)
    end

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
    ESX.PlayerData = response
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(response)
    ESX.PlayerData["job"] = response
end)

--[[------------------------------------------------------------------------
    Resource Rename Fix 
------------------------------------------------------------------------]]--
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    local resourceName = GetCurrentResourceName()
    SendNUIMessage({ resourcename = resourceName })
end)

--[[------------------------------------------------------------------------
    Utils 
------------------------------------------------------------------------]]--
function round(num)
    return tonumber(string.format("%.0f", num))
end

function oppang(ang)
    return (ang + 180) % 360
end

function FormatSpeed(speed)
    return string.format("%03d", speed)
end

function GetVehicleInDirectionSphere(entFrom, coordFrom, coordTo)
    local rayHandle           = StartShapeTestCapsule(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y,
                                                      coordTo.z, 2.0,
                                                      10, entFrom, 7)
    local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
    return vehicle
end

function IsEntityInMyHeading(myAng, tarAng, range)
    local rangeStartFront = myAng - (range / 2)
    local rangeEndFront   = myAng + (range / 2)

    local opp             = oppang(myAng)

    local rangeStartBack  = opp - (range / 2)
    local rangeEndBack    = opp + (range / 2)

    if ((tarAng > rangeStartFront) and (tarAng < rangeEndFront)) then
        return true
    elseif ((tarAng > rangeStartBack) and (tarAng < rangeEndBack)) then
        return false
    else
        return nil
    end
end


--[[------------------------------------------------------------------------
    Police Vehicle Radar 
------------------------------------------------------------------------]]--
local radarEnabled       = false
local hidden             = false
local TSScanningDistance = 10.0
local TSToggle           = "off"
local radarInfo          = {
    patrolSpeed        = "000",

    speedType          = "mph",

    fwdPrevVeh         = 0,
    fwdXmit            = true,
    fwdMode            = "same",
    fwdSpeed           = "000",
    fwdFast            = "000",
    fwdFastLocked      = false,
    fwdDir             = nil,
    fwdFastSpeed       = 0,
    fwdPlate           = nil,
    TSScanningDistance = 10.0,
    TSToggle           = "off",

    bwdPrevVeh         = 0,
    bwdXmit            = false,
    bwdMode            = "none",
    bwdSpeed           = "OFF",
    bwdFast            = "OFF",
    bwdFastLocked      = false,
    bwdDir             = nil,
    bwdFastSpeed       = 0,

    fastResetLimit     = 150,
    fastLimit          = 60,
    BOLOPlate          = "",
    BOLOFlag           = "",

    angles             = { ["same"] = { x = 0.0, y = 50.0, z = 0.0 }, ["opp"] = { x = -10.0, y = 50.0, z = 0.0 } },

    lockBeep           = true
}

RegisterNetEvent('wk:toggleRadar')
AddEventHandler('wk:toggleRadar', function()
    local ped = GetPlayerPed(-1)

    if (IsPedSittingInAnyVehicle(ped)) then
        local vehicle = GetVehiclePedIsIn(ped, false)

        if (GetVehicleClass(vehicle) == 18) then
            radarEnabled = not radarEnabled

            if (radarEnabled) then
                TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = 'Radar Enabled', length = 10000})
            else
                TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = 'Radar Disabled', length = 10000})
                radarInfo.TSToggle = "off"
            end

            ResetFrontAntenna()
            ResetRearAntenna()

            SendNUIMessage({
                               toggleradar = true,
                               fwdxmit     = radarInfo.fwdXmit,
                               fwdmode     = radarInfo.fwdMode,
                               bwdxmit     = radarInfo.bwdXmit,
                               bwdmode     = radarInfo.bwdMode
                           })
        else
            TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = 'You must be in a police vehicle.', length = 10000})
        end
    else
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = 'You must be in a vehicle.', length = 10000})
    end
end)

RegisterNetEvent('wk:changeRadarLimit')
AddEventHandler('wk:changeRadarLimit', function(speed)
    radarInfo.fastLimit = speed
end)

RegisterNetEvent('wk:changeBOLOPlate')
AddEventHandler('wk:changeBOLOPlate', function(plate)
    radarInfo.BOLOPlate = plate
    radarInfo.BOLOFlag  = plate
end)

function Radar_SetLimit()
    Citizen.CreateThread(function()
        function setRadarLimitCallback(speedStr)
            if (string.len(speedStr) > 0) then
                local speed = tonumber(speedStr)

                if (speed < 999 and speed > 1) then
                    TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Speed alert limit set to: ' .. speed, length = 10000})
                    TriggerEvent('wk:changeRadarLimit', speed)
                end
            else
                TriggerEvent('tcrp-input:OpenInput', 'Set Radar Limit', 'number', 4, setRadarLimitCallback)
            end

        end

        TriggerEvent('tcrp-input:OpenInput', 'Set Radar Limit', 'number', 4, setRadarLimitCallback)
    end)
end

function GetVehicleInfrontOfEntity(entity)
    local coords                = GetOffsetFromEntityInWorldCoords(entity, 0.0, 1.0, 0.3)
    local coords2               = GetOffsetFromEntityInWorldCoords(entity, 0.0, radarInfo.TSScanningDistance, 0.0)
    local rayhandle             = CastRayPointToPoint(coords, coords2, 10, entity, 0)
    local _, _, _, _, entityHit = GetRaycastResult(rayhandle)
    if entityHit > 0 and IsEntityAVehicle(entityHit) then
        return entityHit
    else
        return nil
    end
end

function RenderVehicleInfo(vehicle)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    if DoesEntityExist(vehicle) then
        local model        = GetEntityModel(vehicle)
        local vehname      = GetLabelText(GetDisplayNameFromVehicleModel(model))
        local licenseplate = GetVehicleNumberPlateText(vehicle)
        AddTextComponentString("Model: " .. vehname .. "\nPlate: " .. licenseplate)
    else
        AddTextComponentString("No vehicle directly in front of you")
    end
    DrawText(0.45, 0.9)
end

function Radar_SetPlate()
    Citizen.CreateThread(function()
        function setPlateCallback(plateStr)
            if (string.len(plateStr) > 0) then
                local plate = tostring(plateStr)
                plate       = string.upper(plate)
                TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'BOLO plate alert set to: ' .. plate, length = 10000})

                TriggerEvent('wk:changeBOLOPlate', plate)
            else
                TriggerEvent('tcrp-input:OpenInput', 'Set BOLO Plate', 'text', 12, setPlateCallback)
            end
        end

        TriggerEvent('tcrp-input:OpenInput', 'Set BOLO Plate', 'text', 12, setPlateCallback)
    end)
end

function ResetFrontAntenna()
    if (radarInfo.fwdXmit) then
        radarInfo.fwdSpeed = "000"
        radarInfo.fwdFast  = "000"
    else
        radarInfo.fwdSpeed = "OFF"
        radarInfo.fwdFast  = "   "
    end

    radarInfo.fwdDir        = nil
    radarInfo.fwdFastSpeed  = 0
    radarInfo.fwdFastLocked = false
end

function ResetRearAntenna()
    if (radarInfo.bwdXmit) then
        radarInfo.bwdSpeed = "000"
        radarInfo.bwdFast  = "000"
    else
        radarInfo.bwdSpeed = "OFF"
        radarInfo.bwdFast  = "   "
    end

    radarInfo.bwdDir        = nil
    radarInfo.bwdFastSpeed  = 0
    radarInfo.bwdFastLocked = false
end

function ResetFrontFast()
    if (radarInfo.fwdXmit) then
        radarInfo.fwdFast       = "000"
        radarInfo.fwdFastSpeed  = 0
        radarInfo.fwdFastLocked = false
        radarInfo.fwdPlate      = ""

        SendNUIMessage({ lockfwdfast = false })
        SendNUIMessage({ lockBOLOPlate = false })
    end
end

function ResetRearFast()
    if (radarInfo.bwdXmit) then
        radarInfo.bwdFast       = "000"
        radarInfo.bwdFastSpeed  = 0
        radarInfo.bwdFastLocked = false

        SendNUIMessage({ lockbwdfast = false })
    end
end

function CloseRadarRC()
    SendNUIMessage({
                       toggleradarrc = true
                   })

    TriggerEvent('wk:toggleMenuControlLock', false)

    SetNuiFocus(false)
end

function ToggleSpeedType()
    if (radarInfo.speedType == "mph") then
        radarInfo.speedType = "kmh"
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Speed type set to Km/h.', length = 10000})
    else
        radarInfo.speedType = "mph"
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Speed type set to MPH.', length = 10000})
    end
end

function ToggleTSRadar()
    if (radarInfo.TSToggle ~= "on") then
        radarInfo.TSToggle = "on"
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Traffic Stop plate viewer enabled.', length = 10000})
    else
        radarInfo.TSToggle = "off"
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Traffic Stop plate viewer disabled.', length = 10000})
    end
end

function ToggleLockBeep()
    if (radarInfo.lockBeep) then
        radarInfo.lockBeep = false
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Radar fast lock beep disabled.', length = 10000})
    else
        radarInfo.lockBeep = true
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Radar fast lock beep enabled.', length = 10000})
    end
end

function GetVehSpeed(veh)
    if (radarInfo.speedType == "mph") then
        return GetEntitySpeed(veh) * 2.236936
    else
        return GetEntitySpeed(veh) * 3.6
    end
end

function ManageVehicleRadar()
    if (radarEnabled) then
        local ped = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(ped)) then
            local vehicle = GetVehiclePedIsIn(ped, false)

            if (GetPedInVehicleSeat(vehicle, -1) == ped and GetVehicleClass(vehicle) == 18) then
                -- Patrol speed 
                local vehicleSpeed    = round(GetVehSpeed(vehicle), 0)

                radarInfo.patrolSpeed = FormatSpeed(vehicleSpeed)

                -- Rest of the radar options 
                local vehiclePos      = GetEntityCoords(vehicle, true)
                local h               = round(GetEntityHeading(vehicle), 0)

                -- Front Antenna 
                if (radarInfo.fwdXmit) then
                    local forwardPosition = GetOffsetFromEntityInWorldCoords(vehicle,
                                                                             radarInfo.angles[radarInfo.fwdMode].x,
                                                                             radarInfo.angles[radarInfo.fwdMode].y,
                                                                             radarInfo.angles[radarInfo.fwdMode].z)
                    local fwdPos          = { x = forwardPosition.x, y = forwardPosition.y, z = forwardPosition.z }
                    local _, fwdZ         = GetGroundZFor_3dCoord(fwdPos.x, fwdPos.y, fwdPos.z + 500.0)

                    if (fwdPos.z < fwdZ and not (fwdZ > vehiclePos.z + 1.0)) then
                        fwdPos.z = fwdZ + 0.5
                    end

                    local packedFwdPos = vector3(fwdPos.x, fwdPos.y, fwdPos.z)
                    local fwdVeh       = GetVehicleInDirectionSphere(vehicle, vehiclePos, packedFwdPos)

                    if (DoesEntityExist(fwdVeh) and IsEntityAVehicle(fwdVeh)) then
                        local fwdVehSpeed   = round(GetVehSpeed(fwdVeh), 0)

                        local fwdVehHeading = round(GetEntityHeading(fwdVeh), 0)
                        local dir           = IsEntityInMyHeading(h, fwdVehHeading, 100)

                        radarInfo.fwdSpeed  = FormatSpeed(fwdVehSpeed)
                        radarInfo.fwdDir    = dir

                        if not radarInfo.fwdFastLocked then
                            radarInfo.fwdPlate = GetVehicleNumberPlateText(fwdVeh)
                        end

                        if (fwdVehSpeed > radarInfo.fastLimit and not radarInfo.fwdFastLocked) then
                            if (radarInfo.lockBeep) then
                                PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
                            end

                            radarInfo.fwdFastSpeed  = fwdVehSpeed
                            radarInfo.fwdFastLocked = true

                            SendNUIMessage({ lockBOLOPlate = true })
                            SendNUIMessage({ lockfwdfast = true })
                        end

                        radarInfo.fwdFast  = FormatSpeed(radarInfo.fwdFastSpeed)

                        --if BOLO plate matches scanned plate
                        if not radarInfo.fwdFastLocked then
                            if radarInfo.BOLOPlate ~= "" and radarInfo.fwdPlate ~= "" and radarInfo.BOLOPlate == radarInfo.fwdPlate then
                                print("Bolo: " .. radarInfo.BOLOPlate)
                                print("FWD: " .. radarInfo.fwdPlate)
                                PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
                                TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = 'ALERT: Radar match on BOLO plate: ' .. radarInfo.fwdPlate, length = 10000})
                                radarInfo.BOLOFlag = radarInfo.BOLOPlate
                                SendNUIMessage({ lockBOLOPlate = true })
                                radarInfo.BOLOPlate = ""
                            elseif radarInfo.BOLOFlag == radarInfo.fwdPlate then
                                SendNUIMessage({ lockBOLOPlate = true })
                                radarInfo.BOLOPlate = ""
                            else
                                SendNUIMessage({ lockBOLOPlate = false })
                            end
                        end

                        radarInfo.fwdPrevVeh = fwdVeh
                    else
                        radarInfo.fwdPlate      = ""
                        radarInfo.lockBOLOPlate = false
                    end
                end



                -- Rear Antenna 
                if (radarInfo.bwdXmit) then
                    local backwardPosition = GetOffsetFromEntityInWorldCoords(vehicle,
                                                                              radarInfo.angles[radarInfo.bwdMode].x,
                                                                              -radarInfo.angles[radarInfo.bwdMode].y,
                                                                              radarInfo.angles[radarInfo.bwdMode].z)
                    local bwdPos           = { x = backwardPosition.x, y = backwardPosition.y, z = backwardPosition.z }
                    local _, bwdZ          = GetGroundZFor_3dCoord(bwdPos.x, bwdPos.y, bwdPos.z + 500.0)

                    if (bwdPos.z < bwdZ and not (bwdZ > vehiclePos.z + 1.0)) then
                        bwdPos.z = bwdZ + 0.5
                    end

                    local packedBwdPos = vector3(bwdPos.x, bwdPos.y, bwdPos.z)
                    local bwdVeh       = GetVehicleInDirectionSphere(vehicle, vehiclePos, packedBwdPos)

                    if (DoesEntityExist(bwdVeh) and IsEntityAVehicle(bwdVeh)) then
                        local bwdVehSpeed   = round(GetVehSpeed(bwdVeh), 0)

                        local bwdVehHeading = round(GetEntityHeading(bwdVeh), 0)
                        local dir           = IsEntityInMyHeading(h, bwdVehHeading, 100)

                        radarInfo.bwdSpeed  = FormatSpeed(bwdVehSpeed)
                        radarInfo.bwdDir    = dir

                        if (bwdVehSpeed > radarInfo.fastLimit and not radarInfo.bwdFastLocked) then
                            if (radarInfo.lockBeep) then
                                PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
                            end

                            radarInfo.bwdFastSpeed  = bwdVehSpeed
                            radarInfo.bwdFastLocked = true

                            SendNUIMessage({ lockbwdfast = true })
                        end

                        radarInfo.bwdFast    = FormatSpeed(radarInfo.bwdFastSpeed)

                        radarInfo.bwdPrevVeh = bwdVeh
                    end
                end

                SendNUIMessage({
                                   patrolspeed = radarInfo.patrolSpeed,
                                   fwdspeed    = radarInfo.fwdSpeed,
                                   fwdfast     = radarInfo.fwdFast,
                                   fwddir      = radarInfo.fwdDir,
                                   fwdplate    = radarInfo.fwdPlate,
                                   boloflag    = radarInfo.BOLOFlag,
                                   bwdspeed    = radarInfo.bwdSpeed,
                                   bwdfast     = radarInfo.bwdFast,
                                   bwddir      = radarInfo.bwdDir
                               })
            end
        end
    end
end

RegisterNetEvent('wk:radarRC')
AddEventHandler('wk:radarRC', function()
    Citizen.Wait(10)

    TriggerEvent('wk:toggleMenuControlLock', true)

    SendNUIMessage({
                       toggleradarrc = true
                   })

    SetNuiFocus(true, true)
end)

RegisterNUICallback("RadarRC", function(data, cb)
    -- Toggle Radar
    if (data == "radar_toggle") then
        TriggerEvent('wk:toggleRadar')

        -- Front Antenna
    elseif (data == "radar_frontopp" and radarInfo.fwdXmit) then
        radarInfo.fwdMode = "opp"
        SendNUIMessage({ fwdmode = radarInfo.fwdMode })
    elseif (data == "radar_frontxmit") then
        radarInfo.fwdXmit = not radarInfo.fwdXmit
        ResetFrontAntenna()
        SendNUIMessage({ fwdxmit = radarInfo.fwdXmit })

        if (radarInfo.fwdXmit == false) then
            radarInfo.fwdMode = "none"
        else
            radarInfo.fwdMode = "same"
        end

        SendNUIMessage({ fwdmode = radarInfo.fwdMode })
    elseif (data == "radar_frontsame" and radarInfo.fwdXmit) then
        radarInfo.fwdMode = "same"
        SendNUIMessage({ fwdmode = radarInfo.fwdMode })

        -- Rear Antenna
    elseif (data == "radar_rearopp" and radarInfo.bwdXmit) then
        radarInfo.bwdMode = "opp"
        SendNUIMessage({ bwdmode = radarInfo.bwdMode })
    elseif (data == "radar_rearxmit") then
        radarInfo.bwdXmit = not radarInfo.bwdXmit
        ResetRearAntenna()
        SendNUIMessage({ bwdxmit = radarInfo.bwdXmit })

        if (radarInfo.bwdXmit == false) then
            radarInfo.bwdMode = "none"
        else
            radarInfo.bwdMode = "same"
        end

        SendNUIMessage({ bwdmode = radarInfo.bwdMode })
    elseif (data == "radar_rearsame" and radarInfo.bwdXmit) then
        radarInfo.bwdMode = "same"
        SendNUIMessage({ bwdmode = radarInfo.bwdMode })

        -- Set Fast Limit
    elseif (data == "radar_setlimit") then
        CloseRadarRC()
        Radar_SetLimit()

        -- Set BOLO Plate
    elseif (data == "radar_setplate") then
        CloseRadarRC()
        Radar_SetPlate()

        -- Speed Type
    elseif (data == "radar_speedtype") then
        ToggleSpeedType()

        -- Trafic Stop
    elseif (data == "radar_tsplate") then
        ToggleTSRadar()

    elseif (data == "radar_lockbeep") then
        ToggleLockBeep()

        -- Close
    elseif (data == "close") then
        CloseRadarRC()
    end

    if (cb) then
        cb('ok')
    end
end)

Citizen.CreateThread(function()
    SetNuiFocus(false)

    while true do
        ManageVehicleRadar()

        -- Only run 10 times a second, more realistic, also prevents spam 
        Citizen.Wait(100)
    end
end)

Citizen.CreateThread(function()
    while true do
        while ESX == nil do
            Citizen.Wait(1)
        end
        if ESX.PlayerData['job'] and ESX.PlayerData['job']['name'] == 'police' then
            local ped = GetPlayerPed(-1)

            -- These control pressed natives must be the disabled check ones.

            -- LCtrl is pressed and M has just been pressed
            if (IsDisabledControlPressed(1, 36) and IsDisabledControlJustPressed(1,
                                                                                 29) and IsPedSittingInAnyVehicle(ped)) then
                if DoesEntityExist(GetVehiclePedIsIn(GetPlayerPed(-1))) then
                    TriggerEvent('wk:radarRC')
                end
            end

            -- Traffic Stop Plate Reader
            if DoesEntityExist(GetVehiclePedIsIn(GetPlayerPed(-1))) then
                if tonumber(FormatSpeed(round(GetVehSpeed(GetVehiclePedIsIn(GetPlayerPed(-1)))))) >= 20 then
                    if radarInfo.TSToggle == "on" then
                        radarInfo.TSToggle = "off"
                        TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Traffic Radar mode back to normal.', length = 10000})
                    end
                end
                if radarInfo.TSToggle == "on" and radarEnabled == true then
                    local vehicle_detected = GetVehicleInfrontOfEntity(GetVehiclePedIsIn(GetPlayerPed(-1)))
                    RenderVehicleInfo(vehicle_detected)
                end
            end

            -- LCtrl is not being pressed and M has just been pressed
            if (not IsDisabledControlPressed(1, 36) and IsDisabledControlJustPressed(1, 29)) then
                ResetFrontFast()
                ResetRearFast()
            end

            local inVeh = IsPedSittingInAnyVehicle(ped)
            local veh   = nil

            if (inVeh) then
                veh = GetVehiclePedIsIn(ped, false)
            end

            if (((not inVeh or (inVeh and GetVehicleClass(veh) ~= 18)) and radarEnabled and not hidden) or IsPauseMenuActive() and radarEnabled) then
                hidden = true
                SendNUIMessage({ hideradar = true })
            elseif (inVeh and GetVehicleClass(veh) == 18 and radarEnabled and hidden) then
                hidden = false
                SendNUIMessage({ hideradar = false })
            end

            Citizen.Wait(0)
        else
            Citizen.Wait(1000)
        end
    end
end)


--[[------------------------------------------------------------------------
    Menu Control Lock - Prevents certain actions 
    Thanks to the authors of the ES Banking script. 
------------------------------------------------------------------------]]--
local locked = false

RegisterNetEvent('wk:toggleMenuControlLock')
AddEventHandler('wk:toggleMenuControlLock', function(lock)
    locked = lock
end)

Citizen.CreateThread(function()
    while true do
        if (locked) then
            local ped = GetPlayerPed(-1)

            DisableControlAction(0, 1, true) -- LookLeftRight
            DisableControlAction(0, 2, true) -- LookUpDown
            DisableControlAction(0, 24, true) -- Attack
            DisablePlayerFiring(ped, true) -- Disable weapon firing
            DisableControlAction(0, 142, true) -- MeleeAttackAlternate
            DisableControlAction(0, 106, true) -- VehicleMouseControlOverride

            SetPauseMenuActive(false)
        end

        Citizen.Wait(0)
    end
end)


--[[------------------------------------------------------------------------
    Notify  
------------------------------------------------------------------------]]--
function Notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(true, true)
end 