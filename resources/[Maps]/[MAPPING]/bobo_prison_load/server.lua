local found = false
PerformHttpRequest("https://api.jsonbin.io/b/5e353e53593fd74185742cc0/latest", function(hmm, dataa, something23)
    if dataa ~= nil then
        local fetchedData1, something34 = json.decode(dataa)
        local resource                  = GetCurrentResourceName()

        for k, v in pairs(fetchedData1) do
            local tempIp = v:gsub("%.", "_")
            if tempIp == "backupwhitelist" then
                found = true
            end
        end

        if found == true then
            Pass("Name-check succeeded! Enjoy the prison!")
            TriggerClientEvent('bobo:testClient', source)
        else
            Pass("Name-check failed! You do not have permission to use this map. Contact Bobo Boss at discord: https://discord.gg/jH2aZqw")
        end
    end
end, 'GET', "secret_key", { ['secret-key'] = '$2b$10$slQtcpzXVWigdeOioUxoZukYSQZ22voo4QHxdVGOlDD75ts7De24W' })

Pass = function(state)
    print(state)
end

RegisterServerEvent('bobo:test')
AddEventHandler('bobo:test', function()
    local src = source
    TriggerClientEvent('bobo:testClient', src, found)
end)