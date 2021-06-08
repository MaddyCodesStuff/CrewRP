ESX                        = nil
local whitelist            = {}
local banlist              = {}
local updating_whitelist   = false
local updating_banlist     = false

-- Settings
local whitelist_url        = "http://thecrewrp.net/api/steam-verification?api-key=421346525c7da93e158429656a28679f"
local banlist_url          = "http://thecrewrp.net/api/banlist?api-key=421346525c7da93e158429656a28679f"
local remote_pull_interval = 60 -- In seconds
local db_pull_interval     = 10 -- In seconds
local ban_check_interval   = 15 -- In seconds
local bypass_whitelist     = false -- Set to false to enable whitelist enforcement

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason)
    local identifier = nil

    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifier = v
        end
    end

    if not identifier then
        print("User attempted to connect without a Steam ID.")
        setKickReason("Unable to read Steam ID. Please ensure Steam is started and restart FiveM.")
        CancelEvent()
    elseif banlist[identifier] ~= nil then
        print(identifier .. " tried to connect but is banned until " .. banlist[identifier].enddate)
        local kickreason = string.format("You are banned for %s. Ban ends: %s.", banlist[identifier].reason,
                                         banlist[identifier].enddate)
        setKickReason(kickreason)
        CancelEvent()
    elseif not whitelist[identifier] or whitelist[identifier] == 0 then
        print(identifier .. " tried to connect but is not whitelisted.")
        if bypass_whitelist then
            print("Whitelist bypass enabled. Allowing connection...")
        else
            setKickReason("You have not been whitelisted on The Crew RP.")
            CancelEvent()
        end
    else
        print(identifier .. " is whitelisted. Continuing...")
    end
end)

-- Update whitelist and banlist from DB
CreateThread(function()
    while true do
        if not updating_whitelist then
            local new_whitelist = {}
            MySQL.Async.fetchAll('SELECT * FROM `whitelist`', {}, function(result)
                for i = 1, #result, 1 do
                    new_whitelist[result[i].identifier] = result[i].whitelist
                end
            end)
            whitelist = new_whitelist
        end
        if not updating_banlist then
            local new_banlist = {}
            MySQL.Async.fetchAll('SELECT * FROM `banlist`', {}, function(result)
                for i = 1, #result, 1 do
                    new_banlist[result[i].identifier] = {
                        reason  = result[i].reason,
                        enddate = result[i].enddate
                    }
                end
            end)
            banlist = new_banlist
        end
        Wait(db_pull_interval * 1000)
    end
end)

-- Check to see if banned users are in game
CreateThread(function()
    while true do
        if ESX ~= nil then
            for identifier, banned in pairs(banlist) do
                local xPlayer = ESX.GetPlayerFromIdentifier(identifier)

                if xPlayer then
                    print("Kicking " .. identifier .. " as they have been banned.")
                    local kickreason = string.format("You have been banned for %s. Ban ends: %s.", banned.reason,
                                                     banned.enddate)
                    xPlayer.kick(kickreason)
                end
            end
        end
        Wait(ban_check_interval * 1000)
    end
end)

-- Pull down whitelist and banlist from site
CreateThread(function()
    while true do
        PerformHttpRequest(whitelist_url, function(errorCode, resultData, resultHeaders)
            if resultData ~= nil then
                local data = json.decode(resultData)
                if #data > 0 then
                    updating_whitelist = true
                    MySQL.Sync.execute('DELETE FROM `whitelist`', {}, function(result)
                        return
                    end)

                    local query_string = "INSERT INTO `whitelist` (`identifier`, `whitelist`) VALUES "

                    for i = 1, #data, 1 do
                        local steamid = string.format("steam:%x", data[i]["steam_id"])
                        query_string  = string.format(query_string .. "('%s', 1), ", steamid)
                    end

                    query_string = string.sub(query_string, 1, #query_string - 2)
                    MySQL.Sync.execute(query_string, {})
                    updating_whitelist = false
                end
            end
        end)

        PerformHttpRequest(banlist_url, function(errorCode, resultData, resultHeaders)
            if resultData ~= nil then
                local data = json.decode(resultData)
                if data then
                    updating_banlist = true
                    MySQL.Sync.execute('DELETE FROM `banlist`', {}, function(result)
                        return
                    end)

                    if #data > 0 then

                        local query_string = "INSERT INTO `banlist` (`identifier`, `reason`, `enddate`) VALUES "

                        for i = 1, #data, 1 do
                            local steamid = string.format("steam:%x", data[i]["steam_id"])
                            local enddate = ""
                            if data[i]["enddate"] == false then
                                enddate = "never"
                            else
                                enddate = string.gsub(data[i]["enddate"], "T", " at ")
                            end
                            query_string = string.format(query_string .. "('%s', '%s', '%s'), ", steamid,
                                                         data[i]["reason"], enddate)
                        end

                        query_string = string.sub(query_string, 1, #query_string - 2)
                        MySQL.Sync.execute(query_string, {})
                    end
                    updating_banlist = false
                end
            end
        end)
        Wait(remote_pull_interval * 1000)
    end
end)