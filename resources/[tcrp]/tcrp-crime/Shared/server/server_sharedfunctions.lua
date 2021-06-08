ESX = nil
cops = 0

TriggerEvent(
    "esx:getSharedObject",
    function(obj)
        ESX = obj
    end
)

--[vars explain Function that triggers if there are enough cops, Function that triggers if there arent enough cops, cops requirement, client or server side. client is true server is false
-- args is any args the function needs 

RegisterServerEvent('tcrp-crime:copCount')
AddEventHandler('tcrp-crime:copCount', function(succeedFunction, failureFunction, copsNeeded, clientsided, args)
    if copsNeeded <= cops then
        if clientsided == true then
            TriggerClientEvent(succeedFunction, source , args)
        else
            TriggerEvent(succeedFunction, args)
        end
    else
        if clientsided == true then
            TriggerClientEvent(failureFunction, source)
        else
            TriggerEvent(failureFunction)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1200)
        local players = ESX.GetPlayers()
        cops = 0
        for i = 1, #players, 1 do
        local player = ESX.GetPlayerFromId(players[i])
            if player.job.name == 'police' then
              cops = cops + 1
            end
        end
    end
end)