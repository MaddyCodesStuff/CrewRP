ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)
    ESX.RegisterServerCallback('Lenzh_chopshop:anycops', function(source, cb)
        local anycops    = 0
        local playerList = GetPlayers()
        for i = 1, #playerList, 1 do
            local _source = playerList[i]
            local xPlayer = ESX.GetPlayerFromId(_source)
            if xPlayer and xPlayer.job then
                if xPlayer.job.name == 'police' then
                    anycops = anycops + 1
                end
            end
        end
        cb(anycops)
    end)

    RegisterServerEvent("lenzh_chopshop:rewards")
    AddEventHandler("lenzh_chopshop:rewards", function(rewards)
        --Rewards()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        if not xPlayer then
            return ;
        end
        for k, v in pairs(Config.Items) do
            local randomCount = math.random(0, Config.Itemschance[v])
            if xPlayer.getInventoryItem(v).count >= xPlayer.getInventoryItem(v).limit and xPlayer.getInventoryItem(v).limit ~= -1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source,
                                   { type = 'error', text = 'You can\'t carry any more <em>' .. xPlayer.getInventoryItem(v).label .. '</em>', length = 10000 })
            else
                if (randomCount) > 0 then
                    xPlayer.addInventoryItem(v, randomCount)
                    TriggerClientEvent('mythic_notify:client:SendAlert', source,
                                       { type = 'inform', text = 'Received ' .. randomCount .. ' <em>' .. xPlayer.getInventoryItem(v).label .. '</em>', length = 10000 })
                end
            end
        end

    end)

    RegisterServerEvent('chopNotify')
    AddEventHandler('chopNotify', function(coords)
        local source   = source
        local xPlayer  = ESX.GetPlayerFromId(source)
        local xPlayers = ESX.GetPlayers()

        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.job.name == 'police' then
                TriggerClientEvent('outlawChopNotify', xPlayers[i], coords)
            end
        end
    end)

    RegisterServerEvent('lenzh_chopshop:sell')
    AddEventHandler('lenzh_chopshop:sell', function(itemName, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        local price   = Config.Itemsprice[itemName]
        local xItem   = xPlayer.getInventoryItem(itemName)

        if xItem.count < amount then
            TriggerClientEvent('mythic_notify:client:SendAlert', source,
                               { type = 'error', text = _U('not_enough'), length = 10000 })
            return
        end

        price = ESX.Math.Round(price * amount)

        if Config.GiveBlack then
            xPlayer.addAccountMoney('black_money', price)
        else
            xPlayer.addMoney(price)
        end

        xPlayer.removeInventoryItem(xItem.name, amount)
        TriggerClientEvent('mythic_notify:client:SendAlert', source,
                           { type = 'success', text = _U('sold', amount, xItem.label,
                                                         ESX.Math.GroupDigits(price)), length = 10000 })
    end)

