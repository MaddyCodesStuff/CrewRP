ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Register breakdown items that don't require a station as usable
for itemtype, items in pairs(Config.BreakdownItems) do
    for item, details in pairs(items) do
        if not details.station_required then
            ESX.RegisterUsableItem(item, function(source)
                local _source = source
                BreakdownItem(_source, item, 1, details.breaks_into, details.count)
            end)
        end
    end
end

-- Register combinable items as usable
for enditem, required_items in pairs(Config.CombinableItems) do
    for i = 1, #required_items, 1 do
        ESX.RegisterUsableItem(required_items[i].item, function(source)
            local _source = source
            CombineItems(_source, enditem, 1)
        end)
    end 
end

-- Get player inventory
ESX.RegisterServerCallback("tcrp-crafting:getPlayerInventory", function(source, cb)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    local inventory = xPlayer.getInventory()
    cb(inventory)
end)

-- Breaks down an item into other items
RegisterServerEvent("tcrp-crafting:breakdownItem")
AddEventHandler("tcrp-crafting:breakdownItem", function(srcitem, srcqty, dstitem, dstqty)
    local _source = source
    BreakdownItem(_source, srcitem, srcqty, dstitem, dstqty)
end)

function BreakdownItem(_source, srcitem, srcqty, dstitem, dstqty)
    local xPlayer            = ESX.GetPlayerFromId(_source)
    local dst_inventory_item = xPlayer.getInventoryItem(dstitem)
    local src_label          = ESX.GetItemLabel(srcitem)

    if dst_inventory_item.limit ~= -1 and (dst_inventory_item.count + dstqty) > dst_inventory_item.limit then
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source,
                           { text = "You don't have enough room for " .. dstqty .. " x " .. dst_inventory_item.label })
    else
        xPlayer.removeInventoryItem(srcitem, srcqty)
        xPlayer.addInventoryItem(dstitem, dstqty)
        TriggerClientEvent('mythic_notify:client:SendSuccessAlert', _source,
                           { text = "You have broken down " .. srcqty .. " x " .. src_label .. " into " .. dstqty .. " x " .. dst_inventory_item.label })
    end
end

function CombineItems(_source, dstitem, dstqty)
    local xPlayer            = ESX.GetPlayerFromId(_source)
    local dst_inventory_item = xPlayer.getInventoryItem(dstitem)
    local required_items     = Config.CombinableItems[dstitem]

    if dst_inventory_item.limit ~= -1 and (dst_inventory_item.count + dstqty) > dst_inventory_item.limit then
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source,
                           { text = "You don't have enough room for " .. dstqty .. " x " .. dst_inventory_item.label })
    else
        local has_requirements = true
        for i = 1, #required_items, 1 do
            local src_inventory_item = xPlayer.getInventoryItem(required_items[i].item)
            if src_inventory_item.count < required_items[i].qty then
                TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source,
                                   { text = "You need " .. required_items[i].qty .. " x " .. src_inventory_item.label .. " to make " .. dst_inventory_item.label })
                has_requirements = false
            end
        end
        if has_requirements then
            for i = 1, #required_items, 1 do
                local src_inventory_item = xPlayer.getInventoryItem(required_items[i].item)
                if required_items[i].consume then
                    xPlayer.removeInventoryItem(required_items[i].item, required_items[i].qty)
                end
            end
            xPlayer.addInventoryItem(dstitem, 1)
            TriggerClientEvent('mythic_notify:client:SendSuccessAlert', _source,
                               { text = "You have made a " .. dst_inventory_item.label })
        end
    end
end