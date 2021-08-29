ESX           = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function checkPerms(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return (xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin')
end

RegisterServerEvent("FireScript:FirePutOut")
AddEventHandler("FireScript:FirePutOut", function(x, y, z)
    if checkPerms(source) then
        TriggerClientEvent('FireScript:StopFireAtPosition', -1, x, y, z)
    end
end)

RegisterCommand('stopfirepos', function(source, args, rawCommand)
    if checkPerms(source) then
        --Args are:X, Y, Z)
        TriggerClientEvent('FireScript:StopFireAtPosition', -1, tonumber(args[1]), tonumber(args[2]), tonumber(args[3]))
    end
end, false)


RegisterCommand('startfirepos', function(source, args, rawCommand)
    if checkPerms(source) then
        --Args are:X, Y, Z, Flames, Range, Explosion)
        TriggerClientEvent('FireScript:StartFireAtPosition', -1, tonumber(args[1]), tonumber(args[2]), tonumber(args[3]), tonumber(args[4]), tonumber(args[5]), args[6] == "true")
    end
end, false)

RegisterCommand('startfire', function(source, args, rawCommand)
    if checkPerms(source) then
        TriggerClientEvent('FireScript:StartFireAtPlayer', -1, source, tonumber(args[1]), tonumber(args[2]),
                           args[3] == "true")
    end
end, false)

RegisterCommand('stopfire', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if checkPerms(source) then
        TriggerClientEvent('FireScript:StopFiresAtPlayer', -1, source)
    end
end, false)

RegisterCommand('stopallfires', function(source, args, rawCommand)
    if checkPerms(source) then
        TriggerClientEvent('FireScript:StopAllFires', -1)
    end
end, false)

RegisterCommand('startsmoke', function(source, args, rawCommand)
    if checkPerms(source) then
        TriggerClientEvent('FireScript:StartSmokeAtPlayer', -1, source, tonumber(args[1]))
    end
end, false)

RegisterCommand('stopsmoke', function(source, args, rawCommand)
    if checkPerms(source) then
        TriggerClientEvent('FireScript:StopSmokeAtPlayer', -1, source)
    end
end, false)

RegisterCommand('stopallsmoke', function(source, args, rawCommand)
    if checkPerms(source) then
        TriggerClientEvent('FireScript:StopAllSmoke', -1)
    end
end, false)

print('FireScript by Albo1125 (LUA, C#. FiveM)')