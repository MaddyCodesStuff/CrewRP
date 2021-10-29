TriggerEvent('es:addGroupCommand', 'orbitalcannon', 'admin', function(source, args, user)
    TriggerClientEvent("orbital_cannon:toggle", source)
end)

RegisterNetEvent("orbital_cannon:fire")
AddEventHandler("orbital_cannon:fire", function(pos)
    TriggerClientEvent('FireScript:StartFireAtPosition', -1, pos.x, pos.y, pos.z + 2, 10, 10, false)
end)