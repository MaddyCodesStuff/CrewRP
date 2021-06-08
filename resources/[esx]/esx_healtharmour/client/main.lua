ESX        = nil
cur_health = nil
cur_armour = nil

RegisterNetEvent('esx_healtharmour:setHealth')
AddEventHandler('esx_healtharmour:setHealth', function(health)
    Citizen.Wait(5000)
    print("Restoring health to " .. health)
    local ped = PlayerPedId(-1)
    SetEntityHealth(ped, tonumber(health))
    cur_health = health
end)

RegisterNetEvent('esx_healtharmour:setArmour')
AddEventHandler('esx_healtharmour:setArmour', function(armour)
    Citizen.Wait(5000)
    print("Restoring armour to " .. armour)
    local ped = PlayerPedId(-1)
    SetPedArmour(ped, tonumber(armour))
    cur_armour = armour
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(2000)
        local playerPed = PlayerPedId()
        if playerPed ~= nil and cur_health ~= nil and cur_armour ~= nil then
            local health = GetEntityHealth(playerPed)
            local armour = GetPedArmour(playerPed)
            if health ~= cur_health or armour ~= cur_armour then
                TriggerServerEvent('esx_healtharmour:setLevels', health, armour)
                cur_health = health
                cur_armour = armour
            end
        end
    end
end)