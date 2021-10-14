ESX               = nil
Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(10)
      end
end)


RegisterServerEvent('ls-radio:enableBlip')
AddEventHandler('ls-radio:enableBlip', function(job)

    if job == 'police' then
        color    = 38
        job_name = "[Police]"
        image = "PoliceToken"
    elseif job == 'ambulance' then
        color    = 1
        job_name = "[Medical]"
        image = "MedicalToken"
    elseif job == 'fireman' then
        color    = 47
        job_name = "[Fire]"
        image = "FireToken"
    elseif job == 'dispatch' then
        color    = 46
        job_name = "[Dispatch]"
        image = "DefaultTCRP"
    elseif job == 'corrections' then
        color    = 39
        job_name = "[DOC]"
        image = "DefaultTCRP"
    elseif job == 'parkranger' then
        color    = 25
        job_name = "[Park Ranger]"
        image = "DefaultTCRP"
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
                         {job = job_name, name = firstname .. " " .. lastname, src = _src, color = color, image = image })
        end)
    end

end)

RegisterServerEvent('ls-radio:disableBlip')
AddEventHandler('ls-radio:disableBlip', function(job)
    TriggerEvent('eblips:remove', source)
end)

-- checking is player have item

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer ~= nil then
              if xPlayer.getInventoryItem('radio').count == 0 then
                local source = xPlayers[i]
                TriggerClientEvent('ls-radio:onRadioDrop', source)
                break
              end
            end
        end
    end
end)