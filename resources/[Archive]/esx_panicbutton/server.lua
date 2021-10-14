ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('sendChatMessage')
AddEventHandler('sendChatMessage', function(message)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], '911', 'Officer In Need', message,
                               'CHAR_CALL911', 1)
        end
    end
end)