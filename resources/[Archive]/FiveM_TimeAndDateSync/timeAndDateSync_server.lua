time = { hour = 8, minute = 0, second = 0 } -- start time
date = { day = 1, month = 1, year = 2017 } -- start date

RegisterServerEvent("tads:newplayer")
AddEventHandler("tads:newplayer", function()
    print("Syncing time and date for: " .. GetPlayerName(source))
    TriggerClientEvent("tads:timeanddatesync", source, time, date)
end)

RegisterServerEvent("tads:timeanddatesync")
AddEventHandler("tads:timeanddatesync", function(newTime, newDate)
    time = newTime
    date = newDate
end)