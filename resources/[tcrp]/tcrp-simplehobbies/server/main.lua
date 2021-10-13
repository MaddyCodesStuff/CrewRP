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

RegisterServerEvent('tailor:wool')
AddEventHandler('tailor:wool', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('wool').count
    if quantity >= 40 then
        TriggerClientEvent('esx:showNotification', source, 'You can not carry anymore wool!')
    else
        xPlayer.addInventoryItem('wool', 2)
    end
end)

RegisterServerEvent('tailor:fabric')
AddEventHandler('tailor:fabric', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('wool').count
    local fabric = xPlayer.getInventoryItem('fabric').count
    if quantity >= 1 and fabric < 80 then
        xPlayer.removeInventoryItem('wool', quantity)
        xPlayer.addInventoryItem('fabric', quantity)
        TriggerClientEvent('esx:showNotification', source, 'You spun the wool into ' .. quantity .. ' patches of fabric.')
    elseif quantity == 0 then 
        TriggerClientEvent('esx:showNotification', source, 'You do not have any wool!')
    else
        TriggerClientEvent('esx:showNotification', source, 'You can not hold more fabric!')	
    end
end)

RegisterServerEvent('tailor:clothes')
AddEventHandler('tailor:clothes', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('fabric').count
    local clothes = xPlayer.getInventoryItem('clothe').count
    if quantity >= 1 and clothes < 40 then
        xPlayer.removeInventoryItem('fabric', quantity)
        xPlayer.addInventoryItem('clothe', quantity / 2)
        TriggerClientEvent('esx:showNotification', source, 'You stitched the fabric into ' .. quantity / 2 .. ' clothes.')
    elseif quantity == 0 then 
        TriggerClientEvent('esx:showNotification', source, 'You do not have any fabric!')
    else
        TriggerClientEvent('esx:showNotification', source, 'You can not hold more clothes!')	
    end
end)

RegisterServerEvent('tailor:sell')
AddEventHandler('tailor:sell', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('clothe').count
    if quantity >= 1 then
        local payment = Config.clothesPrice * quantity
		xPlayer.addMoney(payment)
        xPlayer.removeInventoryItem('clothe', quantity)
        TriggerClientEvent('esx:showNotification', source, 'You sold ' .. quantity .. ' clothes for $' .. payment)	
    else
        TriggerClientEvent('esx:showNotification', source, 'You do not have any clothes!')
    end
end)

RegisterServerEvent('pearl:gather')
AddEventHandler('pearl:gather', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('pearl').count
    if quantity >= 50 then
        TriggerClientEvent('esx:showNotification', source, 'You can not carry any more pearls!')
    else
        xPlayer.addInventoryItem('pearl', 1)
    end
end)

RegisterServerEvent('pearl:sell')
AddEventHandler('pearl:sell', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem('pearl').count
    if quantity >= 1 then
        local payment = Config.pearlPrice * quantity
		xPlayer.addMoney(payment)
        xPlayer.removeInventoryItem('pearl', quantity)
        TriggerClientEvent('esx:showNotification', source, 'You sold ' .. quantity .. ' pearls for $' .. payment)	
    else
        TriggerClientEvent('esx:showNotification', source, 'You do not have any pearls!')
    end
end)

RegisterServerEvent('weed:gather')
AddEventHandler('weed:gather', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('marijuana_eighth')
    local quantity = item.count
    local limit = item.limit
    if quantity >= limit then
        TriggerClientEvent('esx:showNotification', source, 'You can not carry any more weed!')
    else
        xPlayer.addInventoryItem('marijuana', 3)
    end
end)