ESX = nil
local IsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

local used = 0

RegisterNetEvent('nfw_wep:bodyarmor_1')
AddEventHandler('nfw_wep:bodyarmor_1', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'bodyarmor_1'

    if(armor >= 100) or (armor+25 > 100) then
        exports['mythic_notify']:DoHudText('inform', 'Your armor is already maxed!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = 'bodyarmor_1',
        duration = 5000,
        label = 'Applying Light Body Armor...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            model = "prop_bodyarmour_02",
        }
    }, function(status)
        if not status then
            AddArmourToPed(ped, 25)
            exports['mythic_notify']:DoHudText('inform', 'You have put on Light Body Armor.')
        end
    end)
end)

RegisterNetEvent('nfw_wep:bodyarmor_2')
AddEventHandler('nfw_wep:bodyarmor_2', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'bodyarmor_2'

    if(armor >= 100) or (armor+25 > 100) then
        exports['mythic_notify']:DoHudText('inform', 'Your armor is already maxed!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = 'bodyarmor_2',
        duration = 10000,
        label = 'Applying Medium Body Armor...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            model = "prop_bodyarmour_02",
        }
    }, function(status)
        if not status then
            AddArmourToPed(ped, 50)
            exports['mythic_notify']:DoHudText('inform', 'You have put on Medium Body Armor.')
        end
    end)
end)

RegisterNetEvent('nfw_wep:bodyarmor_3')
AddEventHandler('nfw_wep:bodyarmor_3', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'bodyarmor_3'

    if(armor >= 100) or (armor+25 > 100) then
        exports['mythic_notify']:DoHudText('inform', 'Your armor is already maxed!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = 'bodyarmor_3',
        duration = 15000,
        label = 'Applying Heavy Body Armor...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            model = "prop_bodyarmour_02",
        }
    }, function(status)
        if not status then
            AddArmourToPed(ped, 100)
            exports['mythic_notify']:DoHudText('inform', 'You have put on Heavy Body Armor.')
        end
    end)
end)

function table.includes(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end