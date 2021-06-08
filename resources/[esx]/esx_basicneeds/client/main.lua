ESX              = nil
local IsDead     = false
local IsAnimated = false
local starvingNotify = false
local dehydratingNotify = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
    TriggerEvent('esx_status:set', 'hunger', 500000)
    TriggerEvent('esx_status:set', 'thirst', 500000)

end)

AddEventHandler('playerSpawned', function()

    if IsDead then
        TriggerEvent('esx_basicneeds:resetStatus')
    end

    IsDead = false
end)

-- Hunger and Thirst values created, they tick down every second by the remove value, Thirst lasts just over 3 hours, Hunger just over 4
AddEventHandler('esx_status:loaded', function(status)

    TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F',
                 function(status)
                     return false
                 end,
                 function(status)
                     status.remove(60)
                 end
    )
    
    TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1',
                 function(status)
                     return false
                 end,
                 function(status)
                     status.remove(75)
                 end
    )

    Citizen.CreateThread(function()

        while true do

            Wait(1000)

            local playerPed  = GetPlayerPed(-1)
            local prevHealth = GetEntityHealth(playerPed)
            local health     = prevHealth

            TriggerEvent('esx_status:getStatus', 'hunger', function(status)
                if status.val == 0 then
                    print(starvingNotify)
                    if starvingNotify == false then
                        TriggerEvent('tcrp:displayGeneral', "You are starving.")
                        starvingNotify = true
                    end
                    if prevHealth <= 150 then
                        health = health - 5
                    else
                        health = health - 1
                    end
                else
                    starvingNotify = false
                end

            end)

            TriggerEvent('esx_status:getStatus', 'thirst', function(status)

                if status.val == 0 then
                    if dehydratingNotify == false then
                        TriggerEvent('tcrp:displayGeneral', "You are dehydrating.")
                        dehydratingNotify = true
                        print('HI')
                    end
                    if prevHealth <= 150 then
                        health = health - 5
                    else
                        health = health - 1
                    end
                else
                    dehydratingNotify = false
                end

            end)

            if health ~= prevHealth then
                SetEntityHealth(playerPed, health)
            end

        end

    end)

    Citizen.CreateThread(function()

        while true do

            Wait(0)

            local playerPed = GetPlayerPed(-1)

            if IsEntityDead(playerPed) and not IsDead then
                IsDead = true
            end

        end

    end)

end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
    cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
    if not IsAnimated then
        local props = Config.foodcoords
        local prop_name = prop_name or 'prop_cs_burger_01'
        IsAnimated      = true
        local playerPed = GetPlayerPed(-1)
        Citizen.CreateThread(function()
            if props[prop_name] ~= nil then
                local x, y, z = table.unpack(GetEntityCoords(playerPed))
                prop          = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
                AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), Config.foodcoords[prop_name].x, Config.foodcoords[prop_name].y, Config.foodcoords[prop_name].z, Config.foodcoords[prop_name].xr, Config.foodcoords[prop_name].yr, Config.foodcoords[prop_name].zr,
                                    true, true, false, true, 1, true)
                RequestAnimDict('mp_player_inteat@burger')
                while not HasAnimDictLoaded('mp_player_inteat@burger') do
                    Wait(0)
                end
            else
                local x, y, z = table.unpack(GetEntityCoords(playerPed))
                prop          = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
                AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0,
                                    0.0, true, true, false, true, 1, true)
                RequestAnimDict('mp_player_inteat@burger')
                while not HasAnimDictLoaded('mp_player_inteat@burger') do
                    Wait(0)
                end
            end
            TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0,
                         0)
            Wait(3000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
        end)
    end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
    if not IsAnimated then
        local props = Config.drinkcoords
        local prop_name = prop_name or 'prop_ld_flow_bottle'
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