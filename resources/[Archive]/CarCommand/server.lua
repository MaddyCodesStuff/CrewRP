ESX           = nil
local xPlayer = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterNetEvent('CarCommand:car')
AddEventHandler('CarCommand:car', function(args)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        if user.getGroup() == "superadmin" then
            TriggerClientEvent('CarCommand:car', source, args)
        end
    end)
end)