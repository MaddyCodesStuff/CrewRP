local ESX = nil
-- ESX
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Open ID card
RegisterServerEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function(ID, targetID, type)
    local identifier = ESX.GetPlayerFromId(ID).identifier
    local _source    = ESX.GetPlayerFromId(targetID).source
    local show       = false
    local license_id

    TriggerClientEvent('jsfour-idcard:close', _source)

    MySQL.Async.fetchAll(
        'SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        },
        function(user)
            if (user[1] ~= nil) then
                MySQL.Async.fetchAll(
                    'SELECT id, type FROM user_licenses WHERE owner = @identifier', {
                        ['@identifier'] = identifier
                    }, function(licenses)
                        -- If we're looking for a license
                        if type ~= nil then
                            for i = 1, #licenses, 1 do
                                if type == licenses[i].type then
                                    show = true
                                    license_id = licenses[i].id
                                    break
                                end
                            end
                        -- If we're looking for an ID card
                        else
                            show = true
                            license_id = -1
                        end

                        if show then
                            TriggerEvent('tcrp-licensepoints:getStatus', license_id, function(license)
                                local suspended = false
                                if license then
                                    suspended = (license.suspended_until ~= 0)
                                end
                                local data = {
                                    user     = user,
                                    licenses = licenses,
                                    suspended = suspended
                                }
                                TriggerClientEvent('jsfour-idcard:open', _source, data, type)
                            end)
                        else
                            TriggerClientEvent('esx:showNotification', _source,
                                                "You do not have that type of license!")
                        end
                    end
                )
            end
        end
    )
end)
