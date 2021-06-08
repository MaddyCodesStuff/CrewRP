RegisterServerEvent("Drag")
AddEventHandler("Drag", function(Target)
    local Source = source
    TriggerClientEvent("Drag", Target, Source)
end)