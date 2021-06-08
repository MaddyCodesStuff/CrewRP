AddEventHandler('chatMessage', function(player, playerName, message)
    local msg = split(message, ' ')

    if msg[1] == '/livery' then
        TriggerClientEvent('VehicleLivery', player, msg[2])
        CancelEvent()
    end
end)

function split(s, delimiter)
    result = {};
    for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match);
    end
    return result;
end
