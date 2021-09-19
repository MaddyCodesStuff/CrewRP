ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("crafting:CraftItem")
AddEventHandler("crafting:CraftItem", function(item, code)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
    local required_items = Config.Recipes[code]

    local has_requirements = true
    for i = 1, #required_items, 1 do
        local src_inventory_item = xPlayer.getInventoryItem(required_items[i].item)
        if src_inventory_item.count < required_items[i].quantity then
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source,
                                { text = "You do not have the necessary materials."})
            has_requirements = false
        end
    end
    if has_requirements then
        for i = 1, #required_items, 1 do
            local src_inventory_item = xPlayer.getInventoryItem(required_items[i].item)
            xPlayer.removeInventoryItem(required_items[i].item, required_items[i].quantity)
        end
        if string.match(string.lower(code), "weapon_") then
            xPlayer.addWeapon(code, 0)
        else
            xPlayer.addInventoryItem(code, 1)
        end
        TriggerClientEvent('mythic_notify:client:SendSuccessAlert', _source,
                            { text = "You have made a " .. item })
    end
end)