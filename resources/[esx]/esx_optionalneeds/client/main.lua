ESX                  = nil
local IsAlreadyDrunk = false
local DrunkLevel     = -1

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

function Drunk(level, start)

    Citizen.CreateThread(function()

        local playerPed = GetPlayerPed(-1)

        if start then
            DoScreenFadeOut(800)
            Wait(1000)
        end
        if level == 0 then
            RequestAnimSet("move_m@drunk@slightlydrunk")
            while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
                Citizen.Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
        elseif level == 1 then
            RequestAnimSet("move_m@drunk@moderatedrunk")
            while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
                Citizen.Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
        elseif level == 2 then
            RequestAnimSet("move_m@drunk@verydrunk")
            while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
                Citizen.Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
        end
        SetTimecycleModifier("spectator5")
        SetPedMotionBlur(playerPed, true)
        SetPedIsDrunk(playerPed, true)
        if start then
            DoScreenFadeIn(800)
        end
    end)
end

function Reality()
    Citizen.CreateThread(function()

        local playerPed = GetPlayerPed(-1)

        DoScreenFadeOut(800)
        Wait(1000)

        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        ResetPedMovementClipset(playerPed, 0)
        SetPedIsDrunk(playerPed, false)
        SetPedMotionBlur(playerPed, false)

        DoScreenFadeIn(800)
    end)
end

AddEventHandler('esx_status:loaded', function(status)

    TriggerEvent('esx_status:registerStatus', 'drunk', 0, '#8F15A5',
                 function(status)
                     if status.val > 0 then
                         return false
                     else
                         return false
                     end
                 end,
                 function(status)
                     status.remove(1500)
                 end)

    Citizen.CreateThread(function()

        while true do

            Wait(1000)

            TriggerEvent('esx_status:getStatus', 'drunk', function(status)

                if status.val > 0 then

                    local start = true

                    if IsAlreadyDrunk then
                        start = false
                    end

                    local level = 0

                    if status.val <= 250000 then
                        level = 0
                    elseif status.val <= 500000 then
                        level = 1
                    elseif status.val <= 1000000 then
                        level = 2
                    end

                    if level ~= DrunkLevel then
                        Drunk(level, start)
                    end

                    IsAlreadyDrunk = true
                    DrunkLevel     = level
                end

                if status.val == 0 then

                    if IsAlreadyDrunk then
                        Reality()
                    end

                    IsAlreadyDrunk = false
                    DrunkLevel     = -1
                end
            end)
        end
    end)
end)

RegisterNetEvent('esx_optionalneeds:onDrink')
AddEventHandler('esx_optionalneeds:onDrink', function(prop_name)
    if not IsAnimated then
        local props = Config.drinkcoords
        local prop_name = prop_name or 'p_cs_bottle_01'
        IsAnimated      = true
        local playerPed = GetPlayerPed(-1)
        Citizen.CreateThread(function()
            if props[prop_name] ~= nil then
                local x, y, z = table.unpack(GetEntityCoords(playerPed))
                prop          = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
                AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), Config.drinkcoords[prop_name].x, Config.drinkcoords[prop_name].y, Config.drinkcoords[prop_name].z, Config.drinkcoords[prop_name].xr, Config.drinkcoords[prop_name].yr, Config.drinkcoords[prop_name].zr,
                                    true, true, false, true, 1, true)
                RequestAnimDict('mp_player_intdrink')
                while not HasAnimDictLoaded('mp_player_intdrink') do
                    Wait(0)
                end
            else   
                local x, y, z = table.unpack(GetEntityCoords(playerPed))
                prop          = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
                AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.005, 0.020, -60.0, 85.0,
                                    -15.0, true, true, false, true, 1, true)
                RequestAnimDict('mp_player_intdrink')
                while not HasAnimDictLoaded('mp_player_intdrink') do
                    Wait(0)
                end
            end
            TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 48, 1, false, false, false)
            Wait(3000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
        end)
    end
end)