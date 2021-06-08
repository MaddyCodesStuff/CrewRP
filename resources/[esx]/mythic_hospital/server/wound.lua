local playerInjury = {}

function GetCharsInjuries(source)
    return playerInjury[source]
end

RegisterServerEvent('mythic_hospital:server:SyncInjuries')
AddEventHandler('mythic_hospital:server:SyncInjuries', function(data)
    playerInjury[source] = data
end)

RegisterNetEvent('mythic_hospital:server:RemoveBleed')
AddEventHandler('mythic_hospital:server:RemoveBleed', function(target)
    TriggerClientEvent('mythic_hospital:client:RemoveBleed', target)
end)

RegisterNetEvent('mythic_hospital:server:ResetLimbs')
AddEventHandler('mythic_hospital:server:ResetLimbs', function(target)
    TriggerClientEvent('mythic_hospital:client:ResetLimbs', target)
end)