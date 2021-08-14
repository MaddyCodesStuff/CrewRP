ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)


function JobCheck(Src, Identifier)
    local xPlayer = ESX.GetPlayerFromId(Src)
    local job = xPlayer.getJob.name()
    end
end