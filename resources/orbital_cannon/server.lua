TriggerEvent('es:addGroupCommand', 'orbitalcannon', 'admin', function(source, args, user)
    TriggerClientEvent("orbital_cannon:toggle", source)
end)