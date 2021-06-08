ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

Citizen.CreateThread(function()
    Citizen.Wait(1)
    for ammo, weapons in pairs(Config.ammo_type) do
        ESX.RegisterUsableItem(ammo, function(source)
            TriggerClientEvent('tcrp-ammo:use_ammo', source, ammo)
        end)
    end
end)

RegisterServerEvent('tcrp-ammo:remove_ammo')
AddEventHandler('tcrp-ammo:remove_ammo', function(ammo)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(ammo, 1)
end)