ESX                       = nil

local Keys                = {
    ["ESC"]       = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"]         = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"]       = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"]      = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"]  = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"]      = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"]    = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local isRunningWorkaround = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

function ToggleVehicleLock()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local vehicle

    if IsPedInAnyVehicle(playerPed, false) then
        vehicle = GetVehiclePedIsIn(playerPed, false)
    else
        vehicle = ESX.Game.GetClosestVehicle(coords)
    end

    if not DoesEntityExist(vehicle) then
        return
    end

    ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

        if isOwnedVehicle then
            ESX.TriggerServerCallback('esx_vehiclelock:getLockStatus', function(lockStatus)
                if lockStatus == false then
                    -- unlocked
                    ESX.Streaming.RequestAnimDict('anim@mp_player_intmenu@key_fob@', function()
                        TaskPlayAnim(PlayerPedId(), 'anim@mp_player_intmenu@key_fob@', 'fob_click_fp', 8.0, -8.0, -1, 48,
                                     0, false, false, false)
                        TriggerServerEvent('esx_vehiclelock:toggleLock', GetVehicleNumberPlateText(vehicle), 1)
                        Citizen.Wait(300)
                        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'car_lock', 0.05)
                    end)
                    TriggerEvent('mythic_notify:client:SendSuccessAlert',
                                 { text = 'Locked your <em>' .. GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) .. '</em>' })
                elseif lockStatus == true then
                    -- locked
                    ESX.Streaming.RequestAnimDict('anim@mp_player_intmenu@key_fob@', function()
                        TaskPlayAnim(PlayerPedId(), 'anim@mp_player_intmenu@key_fob@', 'fob_click_fp', 8.0, -8.0, -1, 48,
                                     0, false, false, false)
                        TriggerServerEvent('esx_vehiclelock:toggleLock', GetVehicleNumberPlateText(vehicle), 0)
                        Citizen.Wait(300)
                        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'car_lock', 0.05)
                    end)
                    TriggerEvent('mythic_notify:client:SendSuccessAlert',
                                 { text = 'Unlocked your <em>' .. GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) .. '</em>' })
                else
                    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'car_lock', 0.25)
                    TriggerServerEvent('esx_vehiclelock:toggleLock', GetVehicleNumberPlateText(vehicle), 1)
                    TriggerEvent('mythic_notify:client:SendSuccessAlert',
                                 { text = 'Locked your <em>' .. GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) .. '</em>' })
                end
            end, GetVehicleNumberPlateText(vehicle))
        end

    end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
end

function GetVehicleInFront()

  local plyCoords           = GetEntityCoords(GetPlayerPed(PlayerId()), false)
  local plyOffset           = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 5.0, 0.0)
  local rayHandle           = StartShapeTestCapsule(plyCoords.x, plyCoords.y, plyCoords.z, plyOffset.x, plyOffset.y,
                                                    plyOffset.z,
                                                    1.0, 2, GetPlayerPed(-1), 4)
  local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
  return vehicle

end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local playerPed = GetPlayerPed(-1)

        if not IsPedInAnyVehicle(playerPed) then
            local vehicle = GetVehicleInFront()

            if DoesEntityExist(vehicle) then
                ESX.TriggerServerCallback('esx_vehiclelock:getLockStatus', function(lockStatus)
                    if lockStatus == true then
                        SetVehicleDoorsLocked(vehicle, 2)
                    elseif lockStatus == false then
                        SetVehicleDoorsLocked(vehicle, 1)
                    end
                end, GetVehicleNumberPlateText(vehicle))
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if IsControlJustReleased(0, Keys['F10']) and IsInputDisabled(0) then
            ToggleVehicleLock()
            Citizen.Wait(300)

            -- D-pad down on controllers works, too!
        elseif IsControlJustReleased(0, Keys['F10']) and not IsInputDisabled(0) then
            ToggleVehicleLock()
            Citizen.Wait(300)
        end
    end
end)