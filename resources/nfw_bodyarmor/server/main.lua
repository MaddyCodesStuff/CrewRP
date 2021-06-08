ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bodyarmor_1', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bodyarmor_1', 1)
    TriggerClientEvent('nfw_wep:bodyarmor_1', source)
end)

ESX.RegisterUsableItem('bodyarmor_2', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bodyarmor_2', 1)
    TriggerClientEvent('nfw_wep:bodyarmor_2', source)
end)

ESX.RegisterUsableItem('bodyarmor_3', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bodyarmor_3', 1)
    TriggerClientEvent('nfw_wep:bodyarmor_3', source)
end)

RegisterNetEvent('returnItem')
AddEventHandler('returnItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 1)
end)