ESX           = nil

local gotItem = false

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterUsableItem('fresh_bottle', function(source)
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    targetItem    = xPlayer.getInventoryItem('fresh_glass')

    if targetItem.limit ~= -1 and targetItem.count + Config.Fresh.glasses > targetItem.limit then
        TriggerClientEvent('esx:showNotification', source, "Cannot carry anymore Fresh wine glasses")
    else
        xPlayer.addInventoryItem('fresh_glass', Config.Fresh.glasses)
        xPlayer.addInventoryItem('empty_bottle', 1)
        xPlayer.removeInventoryItem('fresh_bottle', 1)
    end
end)

ESX.RegisterUsableItem('fine_bottle', function(source)
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    targetItem    = xPlayer.getInventoryItem('fine_glass')

    if targetItem.limit ~= -1 and targetItem.count + Config.FineWine.glasses > targetItem.limit then
        TriggerClientEvent('esx:showNotification', source, "Cannot carry anymore Fine wine glasses")
    else
        xPlayer.addInventoryItem('fine_glass', Config.FineWine.glasses)
        xPlayer.addInventoryItem('empty_bottle', 1)
        xPlayer.removeInventoryItem('fine_bottle', 1)
    end
end)

ESX.RegisterUsableItem('middle_bottle', function(source)
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    targetItem    = xPlayer.getInventoryItem('middle_glass')

    if targetItem.limit ~= -1 and targetItem.count + Config.Middle.glasses > targetItem.limit then
        TriggerClientEvent('esx:showNotification', source, "Cannot carry anymore Middle aged wine glasses")
    else
        xPlayer.addInventoryItem('middle_glass', Config.Middle.glasses)
        xPlayer.addInventoryItem('empty_bottle', 1)
        xPlayer.removeInventoryItem('middle_bottle', 1)
    end
end)

ESX.RegisterUsableItem('fresh_glass', function(source)
    local _src         = source
    local xPlayer      = ESX.GetPlayerFromId(_src)

    local randomNumber = math.random(1, 100);
    if randomNumber <= Config.Fresh.poisonChance then
        TriggerClientEvent('esx:showNotification', source, "You got poisoned from Fresh Wine")
        TriggerClientEvent('esx_status:add', source, 'poison', Config.Fresh.poison)
    end
    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Fresh.drunk)
    TriggerClientEvent('esx_status:add', source, 'thirst', Config.Fresh.thirst)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_drink_redwine')
    TriggerClientEvent('esx:showNotification', source, "You used 1x Fresh Wine")
    xPlayer.removeInventoryItem('fresh_glass', 1)
end)

ESX.RegisterUsableItem('middle_glass', function(source)
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Middle.drunk)
    TriggerClientEvent('esx_status:add', source, 'thirst', Config.Middle.thirst)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_drink_redwine')
    TriggerClientEvent('esx:showNotification', source, "You used 1x Middle Aged Wine")
    xPlayer.removeInventoryItem('middle_glass', 1)
end)

ESX.RegisterUsableItem('fine_glass', function(source)
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.FineWine.drunk)
    TriggerClientEvent('esx_status:add', source, 'thirst', Config.FineWine.thirst)
    TriggerClientEvent('esx_optionalneeds:onDrink', source,  'prop_drink_redwine')
    TriggerClientEvent('esx:showNotification', source, "You used 1x Fine Wine")
    xPlayer.removeInventoryItem('fine_glass', 1)
end)

RegisterServerEvent('esx_winery:doProcessing')
AddEventHandler('esx_winery:doProcessing', function(winetype)
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local count   = 0
    -- Get the list of items needed to make the wine

    for k, v in pairs(Config[winetype].ingredients) do
        local targetItem = xPlayer.getInventoryItem(v.name)

        if targetItem.count < v.quantity then
            TriggerClientEvent('esx:showNotification', _src, "You do not have enough " .. targetItem.label)
        else
            count = count + 1
        end
    end

    if count == #Config[winetype].ingredients then
        TriggerClientEvent('esx_winery:doProcessing', _src, winetype)
    end
end)

RegisterServerEvent('esx_winery:makeWine')
AddEventHandler('esx_winery:makeWine', function(winetype)
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    targetItem    = xPlayer.getInventoryItem(Config[winetype].item)

    if targetItem.limit == -1 or targetItem.count + 1 < targetItem.limit then

        for k, v in pairs(Config[winetype].ingredients) do
            local targetItem = xPlayer.getInventoryItem(v.name)

            xPlayer.removeInventoryItem(v.name, v.quantity)
        end

        xPlayer.addInventoryItem(Config[winetype].item, 1);
    else
        TriggerClientEvent('esx:showNotification', _src, "You cannot carry anymore " .. Config[winetype].name)
    end
end)

RegisterServerEvent('esx_winery:giveItems')
AddEventHandler('esx_winery:giveItems', function()
    local _src       = source
    local xPlayer    = ESX.GetPlayerFromId(_src)

    local randomSeed = GetGameTimer()

    local source     = _src

    local random     = math.random(1, 100)

        for k, v in ipairs(Config.HarvestingMaterials) do
            local random     = math.random(1, 100)

            local targetItem = xPlayer.getInventoryItem(v.name)

            -- Always give at least 1 item
            local count      = 1

            if random <= v.chance then
                -- Item was received, let's make sure they can hold it

                count          = count + math.random(v.maximum)
                local newCount = targetItem.count + count
            end

            if targetItem.limit ~= -1 and newCount > targetItem.limit then
                TriggerClientEvent('esx:showNotification', source, "Cannot carry anymore " .. targetItem.label)
            else
                xPlayer.addInventoryItem(v.name, count)
                TriggerClientEvent('esx:showNotification', source,
                                   "Received " .. count .. " " .. targetItem.label)
                gotItem = true
            end
        end
end)

RegisterServerEvent('esx_winery:sellWine')
AddEventHandler('esx_winery:sellWine', function(item, quantity, price)
    local _src     = source
    local xPlayer  = ESX.GetPlayerFromId(source)

    local wineitem = xPlayer.getInventoryItem(item)

    if wineitem.count < quantity then
        TriggerClientEvent('esx:showNotification', _src, 'You don\'t have enough ' .. wineitem.label .. '!')
    else
        local amount = price * quantity
        xPlayer.addMoney(price * quantity)
        TriggerClientEvent('esx:showNotification', _src,
                           'Sold ' .. quantity .. ' ' .. wineitem.label .. ' for $' .. amount .. '.')
        xPlayer.removeInventoryItem(item, quantity)
    end
end)
