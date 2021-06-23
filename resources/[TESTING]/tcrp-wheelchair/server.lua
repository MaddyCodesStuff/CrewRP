ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('wheelchair', function(source)
	local _source = source
    xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('wheelchair:start', _source)
    xPlayer.removeInventoryItem('wheelchair', 1)
end)

RegisterNetEvent('wheelchair:item')
AddEventHandler('wheelchair:item', function()
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('wheelchair', 1)
end)

RegisterNetEvent('wheelchair:limit')
AddEventHandler('wheelchair:limit', function()
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem(wheelchair, 1) then
        return true
    else
        return false
    end
end)

