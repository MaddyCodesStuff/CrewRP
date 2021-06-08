ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback('esx_lawyers:getUnpaidInvoices', function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayFromId(_source)

    MySQL.Async.fetchAll(
        'SELECT * FROM billing WHERE target = @identifier',
        {
            ['@identifier'] = xPlayer.identifier
        },
        function(result)

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

        end
    )
end)