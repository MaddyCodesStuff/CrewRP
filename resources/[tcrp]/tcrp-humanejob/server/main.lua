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

ESX.RegisterServerCallback('tcrp-humane:getVaultWeapons', function(source, cb)

TriggerEvent('esx_datastore:getSharedDataStore', 'society_humane', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
    weapons = {}
    end

    cb(weapons)

end)

end)

ESX.RegisterServerCallback('tcrp-humane:addVaultWeapon', function(source, cb, weaponName)

local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeWeapon(weaponName)

TriggerEvent('esx_datastore:getSharedDataStore', 'society_humane', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
    weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
    if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
    end
    end

    if not foundWeapon then
    table.insert(weapons, {
        name  = weaponName,
        count = 1
    })
    end

    store.set('weapons', weapons)

    cb()

end)

end)

ESX.RegisterServerCallback('tcrp-humane:removeVaultWeapon', function(source, cb, weaponName)

local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.addWeapon(weaponName, 1000)

TriggerEvent('esx_datastore:getSharedDataStore', 'society_humane', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
    weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
    if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
    end
    end

    if not foundWeapon then
    table.insert(weapons, {
        name  = weaponName,
        count = 0
    })
    end

    store.set('weapons', weapons)

    cb()

end)

end)