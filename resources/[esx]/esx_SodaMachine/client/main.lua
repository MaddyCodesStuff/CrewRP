ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    Citizen.Wait(5000)

    function requestDBItems(ShopItems)
        for k, v in pairs(ShopItems) do
            Config.Zones[k].Items = v
        end
    end
end)

function OpenShopMenu(zone, item)
    print(item)
    local elements = {}
    TriggerServerEvent('esx_SodaMachine:buyItem', item, 1)
end

AddEventHandler('esx_SodaMachine:hasEnteredMarker', function(zone, item)

    CurrentAction     = 'machine_menu'
    CurrentActionMsg  = _U('press_context')
    CurrentActionData = { zone = zone, item = item }
end)

AddEventHandler('esx_SodaMachine:hasExitedMarker', function(zone)

    CurrentAction = nil
    ESX.UI.Menu.CloseAll()

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300)
        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil

        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Pos, 1 do
                if (#(coords - vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)) < Config.Size.x) then
                    isInMarker  = true
                    ShopItems   = v.Items[1]
                    currentZone = k
                    LastZone    = k
                end
            end
        end
        if isInMarker and not HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = true
            TriggerEvent('esx_SodaMachine:hasEnteredMarker', currentZone, ShopItems)
        end
        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_SodaMachine:hasExitedMarker', LastZone)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CurrentAction ~= nil then

            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0, 38) then

                if CurrentAction == 'machine_menu' then
                    OpenShopMenu(CurrentActionData.zone, CurrentActionData.item)
                end

                CurrentAction = nil
            end
        end
    end
end)

RegisterNetEvent('esx_SodaMachine:Random')
AddEventHandler('esx_SodaMachine:Random', function(prop_name)
    local lottery = math.random(1, 9)
    local ped     = GetPlayerPed(-1)
    if lottery <= 6 then
        if not IsAnimated then
            local prop_name = prop_name or 'prop_ecola_can'
            IsAnimated      = true
            local playerPed = GetPlayerPed(-1)
            Citizen.CreateThread(function()
                FreezeEntityPosition(ped, true)
                ClearPedTasksImmediately(ped)
                ESX.ShowNotification('Vending. Please wait...')
                TriggerServerEvent('esx_SodaMachine:TakeMoney', 1)
                Citizen.Wait(3000)
                TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
                Citizen.Wait(2000)
                local x, y, z = table.unpack(GetEntityCoords(playerPed))
                RequestAnimDict('amb@medic@standing@kneel@base')
                while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(playerPed, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
                Citizen.Wait(700)
                ESX.ShowNotification('You bought a can of ~r~ecola~s~ for ~g~$1~s~. Thank you for your purchase!')
                prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
                AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 300.00,
                                     180.0, 20.0, true, true, false, true, 1, true)
                Citizen.Wait(1500)
                IsAnimated = false
                ClearPedSecondaryTask(playerPed)
                Citizen.Wait(1000)

                RequestAnimDict('mp_player_intdrink')
                while not HasAnimDictLoaded('mp_player_intdrink') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
                Citizen.Wait(3000)
                IsAnimated = false
                ClearPedSecondaryTask(playerPed)
                DeleteObject(prop)
                FreezeEntityPosition(ped, false)
                TriggerServerEvent('esx_SodaMachine:DrankProduct', 0)
            end)
        end
    end
    if lottery == 7 then
        Citizen.CreateThread(function()
            ESX.ShowNotification('This machine is temporarily out of order')
        end)
    end
    if lottery == 8 then
        Citizen.CreateThread(function()
            ESX.ShowNotification('The machine is out of that product')
        end)
    end
    if lottery == 9 then
        Citizen.CreateThread(function()
            FreezeEntityPosition(ped, true)
            ClearPedTasksImmediately(ped)
            ESX.ShowNotification('Vending. Please wait...')
            Citizen.Wait(3000)
            TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
            Citizen.Wait(5000)
            ESX.ShowNotification('There was a problem with the machine and it took your money')
            FreezeEntityPosition(ped, false)
        end)
    end
end)

RegisterNetEvent('esx_SodaMachine:Water')
AddEventHandler('esx_SodaMachine:Water', function(prop_name)
    --local lottery =  math.random(1,9)
    local lottery = 6
    local ped     = GetPlayerPed(-1)
    if lottery <= 6 then
        if not IsAnimated then
            local prop_name = prop_name or 'prop_ld_flow_bottle'
            IsAnimated      = true
            local playerPed = GetPlayerPed(-1)
            Citizen.CreateThread(function()
                FreezeEntityPosition(ped, true)
                ClearPedTasksImmediately(ped)
                ESX.ShowNotification('Getting water. Please wait...')
                TriggerServerEvent('esx_SodaMachine:TakeMoney', 0)
                Citizen.Wait(3000)
                TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
                Citizen.Wait(2000)
                local x, y, z = table.unpack(GetEntityCoords(playerPed))
                RequestAnimDict('amb@medic@standing@kneel@base')
                while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(playerPed, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
                Citizen.Wait(700)
                ESX.ShowNotification('You got a cup of ~r~water~s~.')
                prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
                AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 300.00,
                                     180.0, 20.0, true, true, false, true, 1, true)
                Citizen.Wait(1500)
                IsAnimated = false
                ClearPedSecondaryTask(playerPed)
                Citizen.Wait(1000)

                RequestAnimDict('mp_player_intdrink')
                while not HasAnimDictLoaded('mp_player_intdrink') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
                Citizen.Wait(3000)
                IsAnimated = false
                ClearPedSecondaryTask(playerPed)
                DeleteObject(prop)
                FreezeEntityPosition(ped, false)
                TriggerServerEvent('esx_SodaMachine:DrankProduct', 0)
            end)
        end
    end
    -- if lottery == 7 then
    -- 		Citizen.CreateThread(function()
    -- 		ESX.ShowNotification('This machine is temporarily out of order')
    -- 		end)
    -- 	end
    if lottery == 7 then
        Citizen.CreateThread(function()
            ESX.ShowNotification('The machine is out of that product')
        end)
    end
    -- if lottery == 9 then
    -- 		Citizen.CreateThread(function()
    -- 		FreezeEntityPosition(ped, true)
    -- 		ClearPedTasksImmediately(ped)
    -- 		ESX.ShowNotification('Vending. Please wait...')
    -- 		Citizen.Wait(3000)
    -- 		TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
    -- 		Citizen.Wait(5000)
    -- 		ESX.ShowNotification('There was a problem with the machine and it took your money')
    -- 		FreezeEntityPosition(ped, false)
    -- 		end)
    -- 	end
end)

RegisterNetEvent('esx_SodaMachine:Coffee')
AddEventHandler('esx_SodaMachine:Coffee', function(prop_name)
    local lottery = math.random(1, 9)
    local ped     = GetPlayerPed(-1)
    if lottery <= 6 then
        if not IsAnimated then
            local prop_name = prop_name or 'p_amb_coffeecup_01'
            IsAnimated      = true
            local playerPed = GetPlayerPed(-1)
            Citizen.CreateThread(function()
                FreezeEntityPosition(ped, true)
                ClearPedTasksImmediately(ped)
                ESX.ShowNotification('Vending. Please wait...')
                TriggerServerEvent('esx_SodaMachine:TakeMoney', 1)
                Citizen.Wait(3000)
                TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
                Citizen.Wait(2000)
                local x, y, z = table.unpack(GetEntityCoords(playerPed))
                RequestAnimDict('amb@medic@standing@kneel@base')
                while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(playerPed, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
                Citizen.Wait(700)
                ESX.ShowNotification('You bought a cup of ~r~coffee~s~ for ~g~$1~s~. Thank you for your purchase!')
                prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
                AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 300.00,
                                     180.0, 20.0, true, true, false, true, 1, true)
                Citizen.Wait(1500)
                IsAnimated = false
                ClearPedSecondaryTask(playerPed)
                Citizen.Wait(1000)

                RequestAnimDict('mp_player_intdrink')
                while not HasAnimDictLoaded('mp_player_intdrink') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
                Citizen.Wait(3000)
                IsAnimated = false
                ClearPedSecondaryTask(playerPed)
                DeleteObject(prop)
                FreezeEntityPosition(ped, false)
                TriggerServerEvent('esx_SodaMachine:DrankProduct', 0)
            end)
        end
    end
    if lottery == 7 then
        Citizen.CreateThread(function()
            ESX.ShowNotification('This machine is temporarily out of order')
        end)
    end
    if lottery == 8 then
        Citizen.CreateThread(function()
            ESX.ShowNotification('The machine is out of that product')
        end)
    end
    if lottery == 9 then
        Citizen.CreateThread(function()
            FreezeEntityPosition(ped, true)
            ClearPedTasksImmediately(ped)
            ESX.ShowNotification('Vending. Please wait...')
            Citizen.Wait(3000)
            TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
            Citizen.Wait(5000)
            ESX.ShowNotification('There was a problem with the machine and it took your money')
            FreezeEntityPosition(ped, false)
        end)
    end
end)