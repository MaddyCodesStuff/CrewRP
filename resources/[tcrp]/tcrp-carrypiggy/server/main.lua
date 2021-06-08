-- Register commands (dynamic)
Citizen.CreateThread(function()
    for action, _ in pairs(Config.ActionDetails) do
        RegisterCommand(action, function(source)
            TriggerClientEvent('tcrp-carrypiggy:start', source, action)
        end)
    end
end)

-- Send event to target if applicable
RegisterNetEvent('tcrp-carrypiggy:startTarget')
AddEventHandler('tcrp-carrypiggy:startTarget', function(target, action)
    TriggerClientEvent('tcrp-carrypiggy:startTarget', target, source, action)
end)

-- Stop event
RegisterNetEvent('tcrp-carrypiggy:stopTarget')
AddEventHandler('tcrp-carrypiggy:stopTarget', function(target)
    TriggerClientEvent('emote:cancel', target)
end)