ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fueling:gatherOil')
AddEventHandler('fueling:gatherOil', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('petrol').count
    if quantity >= 24 then
        TriggerClientEvent('esx:showNotification', source, 'You can not carry anymore petrol!')
    else
        xPlayer.addInventoryItem('petrol', 1)
    end
end)

RegisterServerEvent('fueling:refineOil')
AddEventHandler('fueling:refineOil', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('petrol').count
    local essence = xPlayer.getInventoryItem('essence').count
    if quantity >= 1 and essence < 24 then
        xPlayer.removeInventoryItem('petrol', quantity)
        xPlayer.addInventoryItem('essence', quantity / 2)
        TriggerClientEvent('esx:showNotification', source, 'You refined ' .. quantity .. ' barrels of oil.')
    elseif quantity == 0 then 
        TriggerClientEvent('esx:showNotification', source, 'You do not have any petrol!')
    else
        TriggerClientEvent('esx:showNotification', source, 'You can not hold more essence!')	
    end
end)

RegisterServerEvent('fueling:sellOil')
AddEventHandler('fueling:sellOil', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('essence').count
    if quantity >= 1 then
        local payment = Config.fuelPrice * quantity
		xPlayer.addMoney(payment)
        xPlayer.removeInventoryItem('essence', quantity)
        TriggerClientEvent('esx:showNotification', source, 'You sold ' .. quantity .. ' barrels of essence for $' .. payment)	
    else
        TriggerClientEvent('esx:showNotification', source, 'You do not have any essence!')
    end
end)