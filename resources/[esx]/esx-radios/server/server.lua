ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('esx-radios:enableBlip')
AddEventHandler('esx-radios:enableBlip', function(job)

    if job == 'police' then
        color    = 38
        job_name = "[PD]"
    elseif job == 'ambulance' then
        color    = 1
        job_name = "[EMS]"
    elseif job == 'fireman' then
        color    = 47
        job_name = "[FD]"
    elseif job == 'dispatch' then
        color    = 46
        job_name = "[Dispatch]"
    elseif job == 'corrections' then
        color    = 39
        job_name = "[DOC]"
    elseif job == 'parkranger' then
        color    = 25
        job_name = "[Park Ranger]"
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    local _src    = source

    if xPlayer then
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
            ['@identifier'] = xPlayer.identifier
        }, function(result)
            local firstname = result[1].firstname
            local lastname  = result[1].lastname
            TriggerEvent('eblips:add',
                         { name = job_name .. " " .. lastname .. ", " .. firstname, src = _src, color = color })
        end)
    end

end)

RegisterServerEvent('esx-radios:disableBlip')
AddEventHandler('esx-radios:disableBlip', function(job)
    TriggerEvent('eblips:remove', source)
end)

RegisterServerEvent('esx-radios:addToNumber')
AddEventHandler('esx-radios:addToNumber', function(number)
    TriggerEvent('esx_addons_gcphone:addSource', number, source)
end)

RegisterServerEvent('esx-radios:removeFromNumber')
AddEventHandler('esx-radios:removeFromNumber', function(number)
    TriggerEvent('esx_addons_gcphone:removeSource', number, source)
end)