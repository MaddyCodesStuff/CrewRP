-- Commands
RegisterCommand('engine', function(source, args)
    TriggerClientEvent('tcrp-vehiclecontrol:engine', source)
end)

RegisterCommand('windown', function(source, args)
    local window = 0
    if args[1] ~= nil and tonumber(args[1]) then
        window = tonumber(args[1])
    end
    TriggerClientEvent('tcrp-vehiclecontrol:win', source, window, 'down')
end)

RegisterCommand('winup', function(source, args)
    local window = 0
    if args[1] ~= nil and tonumber(args[1]) then
        window = tonumber(args[1])
    end
    TriggerClientEvent('tcrp-vehiclecontrol:win', source, window, 'up')
end)

RegisterCommand('trunk', function(source, args)
    TriggerClientEvent('tcrp-vehiclecontrol:startAction', source, 'trunk')
end)

RegisterCommand('rdoors', function(source, args)
    TriggerClientEvent('tcrp-vehiclecontrol:startAction', source, 'rdoors')
end)

RegisterCommand('hood', function(source, args)
    TriggerClientEvent('tcrp-vehiclecontrol:startAction', source, 'hood')
end)

-- Completes a network action. Sends event to the network "owner" of the vehicle
RegisterNetEvent('tcrp-vehiclecontrol:deployAction')
AddEventHandler('tcrp-vehiclecontrol:deployAction', function(owner, vehicle, action)
    TriggerClientEvent('tcrp-vehiclecontrol:'..action, owner, vehicle)
end)