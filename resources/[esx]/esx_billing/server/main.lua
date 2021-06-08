ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Get bills for target. Can filter by society account name and/or overdue
function getPlayerBills(target, sharedAccountName, overdueOnly)
    local xPlayer = ESX.GetPlayerFromId(target)
    local bills = {}

    if xPlayer then
        local result = MySQL.Sync.fetchAll(
            'SELECT * FROM billing WHERE identifier = @identifier',
            {
                ['@identifier'] = xPlayer.identifier
            }
        )
        for i = 1, #result, 1 do
            local targetType = result[i].target_type
            local targetAccount = result[i].target
            local curDateTime = os.time()
            local duedate = result[i].duedate
            if ( -- Check for account (if needed)
                sharedAccountName == nil or (targetType == 'society' and sharedAccountName == targetAccount)
            ) and ( -- Check for due date (if needed)
                overdueOnly == nil or not overdueOnly or (duedate ~= nil and curDateTime >= duedate)
            ) then
                table.insert(bills, {
                    id         = result[i].id,
                    identifier = result[i].identifier,
                    sender     = result[i].sender,
                    targetType = targetType,
                    target     = targetAccount,
                    label      = result[i].label,
                    amount     = result[i].amount,
                    due        = duedate
                })
            end
        end
    end
    return bills
end

-- Delete a bill
function deleteBill(id, cb)
    MySQL.Async.execute(
        'DELETE from billing WHERE id = @id',
        {
            ['@id'] = id
        }, function(rowsChanged)
            if cb ~= nil then
                cb()
            end
        end
    )
end

-- Return a character name from a player's steam ID
function getCharacterName(identifier)
    local result    = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    })

    local firstname = result[1].firstname
    local lastname  = result[1].lastname

    return { first = firstname, last = lastname }
end

-- Send unpaid invoices to the tablet
Citizen.CreateThread(function()
    while true do
        local players = GetPlayers()
        local bills = {}

        for _, player in ipairs(players) do
            local playerBills = getPlayerBills(player, 'society_police', true)
            for _, _bill in ipairs(playerBills) do
                local charName = getCharacterName(_bill.identifier)
                local bill = {
                    id = _bill.id,
                    name = string.format("%s, %s", charName.last, charName.first),
                    amount = "$" .. _bill.amount,
                    due = os.date("%b %d, %Y", _bill.due)
                }
                table.insert(bills, bill)
            end
        end

        TriggerClientEvent('tab:unpaidBills', -1, bills)
        Wait(2000)
    end
end)

RegisterServerEvent('esx_billing:sendBill')
AddEventHandler('esx_billing:sendBill', function(playerId, sharedAccountName, label, amount, duedate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(playerId)

    TriggerEvent('esx_addonaccount:getSharedAccount', sharedAccountName, function(account)
        if xTarget ~= nil and amount > 0 and amount < 100000000 then
            local targetType = 'player'
            local target = xPlayer.identifier
            if account ~= nil then
                targetType = 'society'
                target = sharedAccountName
            end
            if duedate ~= nil then
                duedate = os.time() + duedate
            end
            MySQL.Async.execute(
                'INSERT INTO billing (identifier, sender, target_type, target, label, amount, duedate) VALUES (@identifier, @sender, @target_type, @target, @label, @amount, @duedate)',
                {
                    ['@identifier']  = xTarget.identifier,
                    ['@sender']      = xPlayer.identifier,
                    ['@target_type'] = targetType,
                    ['@target']      = target,
                    ['@label']       = label,
                    ['@amount']      = amount,
                    ['@duedate']     = duedate
                },
                function(rowsChanged)
                    TriggerClientEvent('esx:showNotification', xTarget.source, _U('received_invoice'))
                end
            )
        end
    end)
end)

RegisterNetEvent('esx_billing:markBillPaid')
AddEventHandler('esx_billing:markBillPaid', function(id)
    deleteBill(id)
end)

ESX.RegisterServerCallback('esx_billing:getBills', function(source, cb)
    cb(getPlayerBills(source))
end)

ESX.RegisterServerCallback('esx_billing:getTargetBills', function(source, cb, target)
    cb(getPlayerBills(target))
end)

ESX.RegisterServerCallback('esx_billing:payBill', function(source, cb, id)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll(
        'SELECT * FROM billing WHERE id = @id',
        {
            ['@id'] = id
        }, function(result)

            local sender     = result[1].sender
            local targetType = result[1].target_type
            local target     = result[1].target
            local amount     = result[1].amount

            local xTarget    = ESX.GetPlayerFromIdentifier(sender)

            if targetType == 'player' then

                if xTarget ~= nil then

                    if xPlayer.getMoney() >= amount then

                        deleteBill(id, function()
                            xPlayer.removeMoney(amount)
                            xTarget.addMoney(amount)

                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('paid_invoice', amount))
                            TriggerClientEvent('esx:showNotification', xTarget.source,
                                                _U('received_payment', amount))

                            cb()
                        end)

                    elseif xPlayer.getBank() >= amount then

                        deleteBill(id, function()
                            xPlayer.removeAccountMoney('bank', amount)
                            xTarget.addAccountMoney('bank', amount)

                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('paid_invoice', amount))
                            TriggerClientEvent('esx:showNotification', xTarget.source,
                                                _U('received_payment', amount))

                            cb()
                        end)

                    else
                        TriggerClientEvent('esx:showNotification', xTarget.source, _U('target_no_money'))
                        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('no_money'))

                        cb()
                    end

                else
                    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_not_online'))
                    cb()
                end

            else

                TriggerEvent('esx_addonaccount:getSharedAccount', target, function(account)

                    if xPlayer.getMoney() >= amount then

                        deleteBill(id, function()
                            xPlayer.removeMoney(amount)
                            account.addMoney(amount)

                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('paid_invoice', amount))
                            if xTarget ~= nil then
                                TriggerClientEvent('esx:showNotification', xTarget.source,
                                                    _U('received_payment', amount))
                            end

                            cb()
                        end)

                    elseif xPlayer.getBank() >= amount then

                        deleteBill(id, function()
                            xPlayer.removeAccountMoney('bank', amount)
                            account.addMoney(amount)

                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('paid_invoice', amount))
                            if xTarget ~= nil then
                                TriggerClientEvent('esx:showNotification', xTarget.source,
                                                    _U('received_payment', amount))
                            end

                            cb()
                        end)

                    else
                        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('no_money'))

                        if xTarget ~= nil then
                            TriggerClientEvent('esx:showNotification', xTarget.source, _U('target_no_money'))
                        end

                        cb()
                    end
                end)

            end

        end
    )

end)