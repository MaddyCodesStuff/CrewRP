ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("rentals:RentVehicle")
AddEventHandler("rentals:RentVehicle", function(price, model, xyz, h)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		TriggerClientEvent('rentals:RentVehicle', _source, model, xyz, h)
	else
		TriggerClientEvent('esx:showNotification', source, 'You do not have enough money.')
	end
end)
