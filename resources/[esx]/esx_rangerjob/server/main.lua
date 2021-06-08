-- Relocate panic button behind register
-- Find an animation that works when the panic button is pressed
-- Keep the stores how they are, and not use inventory (unless a delivery driver wants to use it)
-- Add money to go into the parkranger society when a player pays for their goods at the store


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

TriggerEvent('esx_society:registerSociety', 'parkranger', 'Park Ranger', 'society_parkranger', 'society_parkranger',
             'society_parkranger', { type = 'public' })
TriggerEvent('esx_phone:registerNumber', 'parkranger', 'ParkRanger', true, true)
RegisterNetEvent('esx_rangerjob:giveItem')
AddEventHandler('esx_rangerjob:giveItem', function(itemName, amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'parkranger' then
        print(('esx_rangerjob: %s attempted to spawn in an item!'):format(xPlayer.identifier))
        return
    end

    local item = xPlayer.getInventoryItem(itemName)
    if item.limit == -1 then
        cantake = true
    elseif item.count < item.limit then
        cantake = true
    else
        cantake = false
    end

    if cantake then
        local totalAmount = Config.Items[itemName].price * amount
        xPlayer.removeMoney(totalAmount)
        xPlayer.addInventoryItem(itemName, amount)
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Error~w~ Cannot carry anymore!')
    end
end)

RegisterNetEvent('esx_rangerjob:panicAlarm')
AddEventHandler('esx_rangerjob:panicAlarm', function(store)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job ~= nil and xPlayer.job.name == 'police' then
            TriggerClientEvent('esx_advanced_holdup:robPoliceNotification', xPlayer.source, Config.Shops[store].name)
            TriggerClientEvent('esx_advanced_holdup:setBlip', xPlayer.source, Config.Shops[store].Pos)

            ESX.SetTimeout(60000, function()
                TriggerClientEvent('esx_advanced_holdup:killBlip', xPlayer.source)
            end)
        end
    end

end)

ESX.RegisterServerCallback('esx_rangerjob:getStockItems', function(source, cb)
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_parkranger', function(inventory)
        cb(inventory.items)
    end)
end)

RegisterServerEvent('esx_rangerjob:getStockItem')
AddEventHandler('esx_rangerjob:getStockItem', function(itemName, count)
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem(itemName)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_parkranger', function(inventory)

        local inventoryItem = inventory.getItem(itemName)

        -- is there enough in the society?
        if count > 0 and inventoryItem.count >= count then

            -- can the player carry the said amount of x item?
            if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
                TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
            else
                inventory.removeItem(itemName, count)
                xPlayer.addInventoryItem(itemName, count)
                TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
            end
        else
            TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
        end
    end)

end)

-- Handle the functionality to give the rangerjob society money for purchases
RegisterNetEvent('esx_rangerjob:buy')
AddEventHandler('esx_rangerjob:buy', function(amount)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_parkranger', function(account)
        account.addMoney(amount)
    end)
end)
