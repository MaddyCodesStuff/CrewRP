ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

TriggerEvent('esx_society:registerSociety', 'humane', 'humane', 'society_humane', 'society_humane',
             'society_humane', { type = 'public' })

RegisterServerEvent('tcrp-humane:getStockItem')
AddEventHandler('tcrp-humane:getStockItem', function(itemName, count)

local xPlayer = ESX.GetPlayerFromId(source)

TriggerEvent('esx_addoninventory:getSharedInventory', 'society_humane', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
    inventory.removeItem(itemName, count)
    xPlayer.addInventoryItem(itemName, count)
    else
    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Invalid Quantity')
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Withdrew ' .. count .. ' ' .. item.label)

end)

end)

ESX.RegisterServerCallback('tcrp-humane:getStockItems', function(source, cb)

TriggerEvent('esx_addoninventory:getSharedInventory', 'society_humane', function(inventory)
    cb(inventory.items)
end)

end)

RegisterServerEvent('tcrp-humane:putStockItems')
AddEventHandler('tcrp-humane:putStockItems', function(itemName, count)

local xPlayer = ESX.GetPlayerFromId(source)

TriggerEvent('esx_addoninventory:getSharedInventory', 'society_humane', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
    xPlayer.removeInventoryItem(itemName, count)
    inventory.addItem(itemName, count)
    else
    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Invalid Quantity')
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Deposited ' .. count .. ' ' .. item.label)

end)

end)

ESX.RegisterServerCallback('tcrp-humane:getPlayerInventory', function(source, cb)

local xPlayer    = ESX.GetPlayerFromId(source)
local items      = xPlayer.inventory

cb({
    items      = items
})

end)
