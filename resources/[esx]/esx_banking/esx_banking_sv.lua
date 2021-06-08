ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function playerIdentity(source)
    local _source    = source
    local identifier = GetPlayerIdentifiers(source)[1]

    local result     = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    })

    if result then
        return result[1].firstname .. ' ' .. result[1].lastname
    end
end

-- Bank withdraw callback
RegisterServerEvent('esx_banking:withdraw')
AddEventHandler('esx_banking:withdraw', function(amount)
    if not amount then
        return
    end
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)
    amount           = tonumber(amount)

    --local playerName = user.identity.firstname .. " " .. user.identity.name
    local playerName = playerIdentity(source)

    -- If the user is trying to withdraw more than they have, let's not let them
    if (amount > xPlayer.getAccount('bank').money) then
        -- If there isn't enough money, throw an error in the UI
        TriggerClientEvent("bank:showWarning", _source,
                           '<div class="alert alert-danger">Insufficient funds to complete that transaction.</div>')
    else
        -- Deduct the amount from the bank, add it to the wallet
        xPlayer.removeAccountMoney('bank', amount)
        xPlayer.addMoney(amount)
        TriggerClientEvent('bank:updateBalance', _source,
                           { amount = xPlayer.getAccount('bank').money, playerName = playerName, wallet = xPlayer.getMoney() })
        TriggerClientEvent("bank:showWarning", _source, '<div class="alert alert-success">Transaction completed.</div>')
    end
end)

-- Quick withdraw callback
RegisterServerEvent('esx_banking:quickWithdraw')
AddEventHandler('esx_banking:quickWithdraw', function()
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)

    -- local playerName = user.identity.firstname .. " " .. user.identity.name
    local playerName = playerIdentity(source)

    if (xPlayer.getAccount('bank').money < 100) then
        TriggerClientEvent('bank:showWarning', _source,
                           '<div class="alert alert-danger">Insufficient funds to complete that transaction.</div>')
    else
        xPlayer.removeAccountMoney('bank', 100)
        xPlayer.addMoney(100)
        TriggerClientEvent('bank:showWarning', _source, '<div class="alert alert-success">Transaction completed.</div>')
        TriggerClientEvent('bank:updateBalance', _source,
                           { amount = xPlayer.getAccount('bank').money, playerName = playerName, wallet = xPlayer.getMoney() })
    end
end)

-- Bank deposit callback
RegisterServerEvent('esx_banking:deposit')
AddEventHandler('esx_banking:deposit', function(amount)
    if not amount then
        return
    end

    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)

    -- local playerName = user.identity.firstname .. " " .. user.identity.name
    local playerName = playerIdentity(source)

    -- If the user is trying to withdraw more than they have, let's not let them
    if (amount > xPlayer.getMoney()) then
        -- If there isn't enough money, throw an error in the UI
        TriggerClientEvent("bank:showWarning", _source,
                           '<div class="alert alert-danger">Insufficient funds to complete that transaction.</div>')
    else
        -- Deduct the amount from the bank, add it to the wallet
        xPlayer.removeMoney(amount)
        xPlayer.addAccountMoney('bank', amount)
        TriggerClientEvent('bank:updateBalance', _source,
                           { source = source, xPlayer.getAccount('bank').money, playerName = playerName, wallet = xPlayer.getMoney() })
        TriggerClientEvent("bank:showWarning", _source, '<div class="alert alert-success">Transaction completed.</div>')
    end
end)

RegisterServerEvent('esx_banking:updateBalance')
AddEventHandler('esx_banking:updateBalance', function()
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)

    local balance    = xPlayer.getAccount('bank').money
    -- local playerName = user.identity.firstname.. " "..user.identity.name
    local playerName = playerIdentity(source)
    TriggerClientEvent('bank:updateBalance', _source,
                       { amount = xPlayer.getAccount('bank').money, player = playerName, wallet = xPlayer.getMoney() })
end)

RegisterServerEvent('esx_banking:transfer')
AddEventHandler('esx_banking:transfer', function(data)
    if not data.amount and not data.target then
        return
    end
    local user      = vRP.users_by_source[source]
    local amount    = data.amount
    local targetcid
    -- Get the target by phone number
    phonedata       = vRP:query("vRP/get_characterbyphone", { phone = data.target or "" })
    local phone     = table.unpack(phonedata)

    local targetcid = phone.character_id

    if targetcid == nil then
        TriggerClientEvent("bank:showWarning", _source,
                           '<div class="alert alert-danger">Unable to lookup phone number.</div>')
    else
        -- if targetcid == user.cid then
        -- TriggerClientEvent("bank:showWarning",_source,'<div class="alert alert-danger">Cannot bank transfer to yourself.</div>')
        -- else
        local target = vRP.users_by_cid[targetcid]

        if target then
            -- If the user is online
            local targetBalance = target:getBank()
            -- local targetNewBalance = target:setBank(targetBalance+amount)

            local bankBalance   = user:getBank()
            -- local bankNewBalance = user:setBank(bankBalance-amount)

            if (bankBalance < amount) then
                TriggerClientEvent("bank:showWarning", _source,
                                   '<div class="alert alert-danger">Not enough funds to cover transfer.</div>')
            else
                local targetNewBalance = target:setBank(targetBalance + amount)
                local bankNewBalance   = user:setBank(bankBalance - amount)
                TriggerClientEvent('bank:updateBalance', _source,
                                   { amount = user:getBank(), playerName = playerName, wallet = user:getWallet() })
                if (self.cfg.notifyRecipient == true) then
                    vRP.EXT.Base.remote._notifyPicture(target.source, "CHAR_BANK_FLEECA", "Bank", "Transfer",
                                                       playerName .. " has sent you money.")
                end
                TriggerClientEvent("bank:showWarning", _source,
                                   '<div class="alert alert-success">Transaction completed.</div>')
            end
        else
            -- If there is no target it means the player is not online, so we need to find their user_id
            TriggerClientEvent("bank:showWarning", _source,
                               '<div class="alert alert-danger">Player is not online.</div>')
        end
        -- end
    end
end)