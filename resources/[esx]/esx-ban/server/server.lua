ESX           = nil
local xPlayer = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)

    deferrals.defer()
    deferrals.update("Checking bans...")

    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            id = string.sub(v, string.len("steam:") + 1, string.len(v))

            MySQL.Async.fetchAll(
                'SELECT banned FROM users WHERE identifier LIKE @identifier',
                {
                    ['@identifier'] = "%" .. id
                },
                function(users)

                    if users[1].banned == 1 then
                        setKickReason("You are banned. Please consult Discord for more information.")
                        deferrals.done("You are banned. Please consult Discord for more information.")
                        CancelEvent()
                    else
                        deferrals.done()
                    end
                end
            )
        end
    end

end)
