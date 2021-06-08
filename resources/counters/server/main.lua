ESX                 = nil

local counts        = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.UpdateTime)

        getPlayerCounter()
    end
end)

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- ESX.RegisterServerCallback('counters:getPlayers', function(source, cb)
function getPlayerCounter()
    local players = ESX.GetPlayers()
    initPlayerCounts()

    for i = 1, #players, 1 do
        player = ESX.GetPlayerFromId(players[i])
        job    = player.job.name
        group  = player.getGroup()

        if job == 'cardealer2' or job == 'cardealer3' then
            job = 'cardealer'
            
        end
        if Config.Show[job] then
            counts[job] = counts[job] + 1
        end
        if Config.Show.admins and (group == 'admin' or group == 'superadmin') then
            counts.admins = counts.admins + 1
        end
        if Config.Show.users then
            counts.users  = counts.users + 1
        end
    end

    TriggerClientEvent('counters:updateUI', -1, counts)
end

function initPlayerCounts()
    counts        = {
        admins          = 0,
        users           = 0,
        fireman         = 0,
        police          = 0,
        mecano          = 0,
        ambulance       = 0,
        storeclerk      = 0,
        cardealer       = 0,
        lawyer          = 0,
        realestateagent = 0,
        taxi            = 0,
        corrections     = 0,
        parkranger      = 0,
    }

    if not counts.dispatch then
        counts.dispatch = 0
    end
end

RegisterServerEvent('counters:addDispatch')
AddEventHandler('counters:addDispatch', function()
    if counts.dispatch then
        counts.dispatch = counts.dispatch + 1
    else
        counts.dispatch = 1
    end
end)

RegisterServerEvent('counters:removeDispatch')
AddEventHandler('counters:removeDispatch', function()
    if counts.dispatch and counts.dispatch > 0 then
        counts.dispatch = counts.dispatch - 1
    else
        counts.dispatch = 0
    end
end)

-- Exposes counter information via HTTP
SetHttpHandler(function(req, res)
    local path = req.path

    if path == '/list' then
        res.send(json.encode({
            counters = counts
        }))
    end
end)