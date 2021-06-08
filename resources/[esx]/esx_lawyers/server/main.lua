ESX = nil

local data

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback('esx_lawyers:getUnpaidInvoices', function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Async.fetchAll(
        'SELECT * FROM billing WHERE target = @identifier',
        {
            ['@identifier'] = xPlayer.identifier
        },
        function(result)

            if #result > 0 then
                local bills = {}

                for i = 1, #result, 1 do
                    table.insert(bills, {
                        id         = result[i].id,
                        identifier = result[i].identifier,
                        sender     = result[i].sender,
                        targetType = result[i].target_type,
                        target     = result[i].target,
                        label      = result[i].label,
                        amount     = result[i].amount
                    })
                end

                cb(bills)
            else
                cb('empty')
            end

        end
    )
end)

function GetIdentity(target, source)

    MySQL.Async.fetchAll(
        'SELECT * FROM `users` WHERE identifier = @identifier',
        {
            ['@identifier'] = target
        },
        function(result)
            if result then
                data = result[1].firstname .. ' ' .. result[1].lastname
            end

            TriggerClientEvent('esx_lawyers:sendIdentity', source, data)
        end
    )
end

ESX.RegisterServerCallback('esx_lawyers:getInvoiceDetails', function(source, cb, id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Async.fetchAll(
        'SELECT * FROM billing WHERE id = @id',
        {
            ['@id'] = id
        },
        function(result)

            if #result > 0 then
                local details = {}

                for i = 1, #result, 1 do
                    table.insert(details, {
                        target = GetIdentity(result[i].target, source),
                        label  = result[i].label,
                        amount = result[i].amount
                    })
                end

                cb(details)
            else
                cb('empty')
            end

        end
    )
end)