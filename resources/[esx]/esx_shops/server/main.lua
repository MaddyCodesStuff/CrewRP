ESX             = nil
local hasSqlRun = false

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('esx_shops:buyItem')
AddEventHandler('esx_shops:buyItem', function(itemName, amount, zone)
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem(itemName)
    local isWeapon = false

    if string.match(itemName, "weapon") then
        isWeapon = true
    end
    


    -- is the player trying to exploit?
    if amount < 0 then
        print('esx_shops: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
        return
    end

    -- get price
    local price     = 0
    local itemLabel = ''
    for i = 1, #Config.Zones[zone].Items, 1 do
        if Config.Zones[zone].Items[i].item == itemName then
            price     = Config.Zones[zone].Items[i].price
            itemLabel = Config.Zones[zone].Items[i].label
            break
        end
    end
    price = price * amount

    -- can the player afford this item?
    if xPlayer.getMoney() >= price then
        -- can the player carry the said amount of x item?
        if isWeapon == false then
            if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
                TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source,
                               { title = "Can't Carry Anymore", text = "You can't carry anymore " .. itemLabel })
            else
            
                xPlayer.removeMoney(price)
                xPlayer.addInventoryItem(itemName, amount)
                TriggerClientEvent('mythic_notify:client:SendSuccessAlert', _source,
                               { title = "Purchase Successful", text = "You have bought " .. amount .. " x " .. itemLabel })
            end
        else
            xPlayer.removeMoney(price)
            xPlayer.addWeapon(itemName, 50)
            TriggerClientEvent('mythic_notify:client:SendSuccessAlert', _source,
                               { title = "Purchase Successful", text = "You have bought a " .. itemLabel .. "!"})
        end
    else
        local missingMoney = price - xPlayer.getMoney()
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source,
                           { title = "Not Enough Money", text = "You don't have enough money." })
    end
end)