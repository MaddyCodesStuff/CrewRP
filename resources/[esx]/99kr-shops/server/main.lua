--[[ Gets the ESX library ]]--
ESX = nil
TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)

RegisterNetEvent('99kr-shops:Cashier')
AddEventHandler('99kr-shops:Cashier', function(price, account)
    local src     = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if account == "cash" then
        xPlayer.removeMoney(price)
    else
        xPlayer.removeAccountMoney(account, price)
    end

    -- Put the stuff in here to add items to storeclerk society

    pNotify('You bought products for <span style="color: green">$' .. price .. '</span>', 'success', 3000)

end)

RegisterNetEvent('99kr-shops:AddBasketToInventory')
AddEventHandler('99kr-shops:AddBasketToInventory', function(basket)
    local src     = source
    local xPlayer = ESX.GetPlayerFromId(src)

    for i = 1, #basket do
        xPlayer.addInventoryItem(basket[i]["value"], basket[i]["amount"])
    end
end)

ESX.RegisterServerCallback('99kr-shops:CheckMoney', function(source, cb, price, account)
    local src     = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money
    if account == "cash" then
        money = xPlayer.getMoney()
    else
        money = xPlayer.getAccount(account)["money"]
    end

    if money >= price then
        cb(true)
    end
    cb(false)
end)

ESX.RegisterServerCallback('99kr-shops:anycops', function(source, cb)
    local anycops    = 0
    local playerList = ESX.GetPlayers()
    for i = 1, #playerList, 1 do
        local _source = playerList[i]
        local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
            anycops = anycops + 1
        end
    end
    cb(anycops)
end)

ESX.RegisterServerCallback('99kr-shops:carrycheck', function(source, cb, item, value, amount)
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem(item)
    if amount == nil then
        amount = 0
    end
    --print('Added To Basket: ' .. value .. ' ' .. item .. ' Already In Inventory: ' .. sourceItem.count)
    if sourceItem.limit ~= -1 and (sourceItem.count + value + amount) > sourceItem.limit then
        cb(false)
    else
        cb(true)
    end
end)

RegisterServerEvent('99kr-shops:setcopblips')
AddEventHandler('99kr-shops:setcopblips', function(coords)
    local source   = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    print(coords, coords.x, coords.y, coords.z)
    local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["text"] = "[Shoplifting]", ["sprite"] = 161, ["color"] = 10, ["scale"] = 1.0, ["duration"] = Config.CopBlipInterval}

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
        end
    end
end)

RegisterServerEvent('99kr-shops:alertcops')
AddEventHandler('99kr-shops:alertcops', function()
    TriggerEvent('esx_outlawalert:shopliftingInProgress')
end)

pNotify = function(message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", source, {
        text    = message,
        type    = messageType,
        queue   = "shop_sv",
        timeout = messageTimeout,
        layout  = "topRight"
    })
end

