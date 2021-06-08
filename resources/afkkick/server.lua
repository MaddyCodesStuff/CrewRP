RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
    DropPlayer(source, "You were AFK for too long. Restart your FiveM client to reconnect.")
end)