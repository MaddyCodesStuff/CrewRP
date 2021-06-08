ESX                     = nil
Items                   = {}
local InventoriesIndex  = {}
local Inventories       = {}
local SharedInventories = {}
local inventoryData     = {}

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

AddEventHandler('onMySQLReady', function(test)

    local items = MySQL.Sync.fetchAll('SELECT * FROM items')

    for i = 1, #items, 1 do
        Items[items[i].name] = items[i].label
    end

    local result = MySQL.Sync.fetchAll('SELECT * FROM addon_inventory')

    for i = 1, #result, 1 do

        local name    = result[i].name
        local label   = result[i].label
        local shared  = result[i].shared

        local result2 = MySQL.Sync.fetchAll(
            'SELECT * FROM addon_inventory_items WHERE inventory_name = @inventory_name',
            {
                ['@inventory_name'] = name
            }
        )

        if shared == 0 then

            table.insert(InventoriesIndex, name)

            Inventories[name] = {}
            local items       = {}

            for j = 1, #result2, 1 do

                local itemName  = result2[j].name
                local itemCount = result2[j].count
                local itemOwner = result2[j].owner

                if items[itemOwner] == nil then
                    items[itemOwner] = {}
                end

                table.insert(items[itemOwner], {
                    name  = itemName,
                    count = itemCount,
                    label = Items[itemName]
                })

            end

            for k, v in pairs(items) do
                local addonInventory = CreateAddonInventory(name, k, v)
                table.insert(Inventories[name], addonInventory)
            end

        else
            local items = {}

            for j = 1, #result2, 1 do
                table.insert(items, {
                    name  = result2[j].name,
                    count = result2[j].count,
                    label = Items[result2[j].name]
                })
            end

            local addonInventory    = CreateAddonInventory(name, nil, items)
            SharedInventories[name] = addonInventory

        end

    end

end)

function dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end

function GetInventory(name, owner)
    MySQL.Async.fetchAll("SELECT * FROM addon_inventory_items WHERE `inventory_name` = @name AND `owner` = @owner", {
        ['@owner'] = owner,
        ['@name']  = name,
    },
                         function(result)

                             local items     = {}

                             local Items     = {}

                             local tempitems = MySQL.Sync.fetchAll('SELECT * FROM items')

                             for i = 1, #tempitems, 1 do
                                 Items[tempitems[i].name] = tempitems[i].label
                             end

                             for i = 1, #result, 1 do
                                 itemName = result[i].name
                                 label    = Items[result[i].name]
                                 count    = result[i].count

                                 table.insert(items, { name = itemName, label = label, count = count })
                             end

                             local addonInventory = CreateAddonInventory(name, owner, items)

                             inventoryData        = addonInventory

                             TriggerEvent('esx_property:inventoryData', inventoryData)
                         end);

    -- for i=1, #Inventories[name], 1 do
    -- 	if Inventories[name][i].owner == owner then
    -- 		return Inventories[name][i]
    -- 	end
    -- end
end

function GetSharedInventory(name)
    return SharedInventories[name]
end

AddEventHandler('esx_addoninventory:getInventory', function(name, owner, cb)
    cb(GetInventory(name, owner))
end)

AddEventHandler('esx_addoninventory:getSharedInventory', function(name, cb)
    cb(GetSharedInventory(name))
end)

AddEventHandler('esx:playerLoaded', function(source)

    local xPlayer          = ESX.GetPlayerFromId(source)
    local addonInventories = {}

    for i = 1, #InventoriesIndex, 1 do

        local name      = InventoriesIndex[i]
        local inventory = GetInventory(name, xPlayer.identifier)

        if inventory == nil then
            inventory = CreateAddonInventory(name, xPlayer.identifier, {})
            table.insert(Inventories[name], inventory)
        end

        table.insert(addonInventories, inventory)

    end

    xPlayer.set('addonInventories', addonInventories)

end)
