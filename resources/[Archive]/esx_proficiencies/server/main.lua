ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

local proficiencies        = {} -- Stores the proficiencies data
local players              = {} -- Stores the players data
local proficiencies_levels = {}

AddEventHandler('esx:playerLoaded', function(xPlayer)
    player = ESX.GetPlayerFromId(xPlayer)

    print("============= Loading player proficiencies data")
    LoadPlayerProficiencies(player)
end)

AddEventHandler('esx:playerDropped', function(source)
    local src     = source
    local xPlayer = ESX.GetPlayerFromId(src)

    SavePlayer(source)

    Citizen.Wait(5000)
    players[xPlayer.identifier] = {}
end)

--[ Save all players proficiency at a set interval ]--
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.UpdateInterval * 1000)
        SaveAllPlayers() -- Save all player proficiencies
    end
end)

--[ Debug info ]--
Citizen.CreateThread(function()
    -- while true do
    -- 	Citizen.Wait(1000)
    -- 	print(dump(proficiencies)) -- Remove this after proficiencies is done. It's only here for debugging.
    -- end
end)

AddEventHandler('onResourceStart', function(resourceName)

    if resourceName == 'esx_proficiencies' then
        proficiencies = {}

        print("============= Loading all proficiencies data")

        MySQL.Async.fetchAll('SELECT * FROM `proficiencies`', {}, function(result)
            if result then
                for i = 1, #result, 1 do
                    proficiencies[result[i].name]            = {}
                    -- table.insert(proficiencies[result[i].name], {name = result[i].name, label = result[i].label, maxlevel = result[i].maxlevel, nextlevel = 1000})
                    proficiencies[result[i].name].name       = result[i].name
                    proficiencies[result[i].name].label      = result[i].label
                    proficiencies[result[i].name].maxlevel   = result[i].maxlevel
                    proficiencies[result[i].name].basexp     = result[i].basexp
                    proficiencies[result[i].name].multiplier = result[i].multiplier
                end
            end
        end)

        MySQL.Async.fetchAll('SELECT * FROM `proficiencies_xp`', {}, function(result)
            if result then
                for i = 1, #result, 1 do
                    proficiencies_levels[result[i].level]       = {}
                    -- table.insert(proficiencies[result[i].name], {name = result[i].name, label = result[i].label, maxlevel = result[i].maxlevel, nextlevel = 1000})
                    proficiencies_levels[result[i].level].level = result[i].level
                    proficiencies_levels[result[i].level].xp    = result[i].xp
                end
            end
        end)

        local players = ESX.GetPlayers()

        -- Do we need this? We are loading them up as the player logs in
        print("============= Reloading player proficiencies")
        for i = 1, #players, 1 do
            LoadPlayerProficiencies(ESX.GetPlayerFromId(players[i]))
        end
    end
end)

--[ Award XP to the player for doing the proficiency ]--
RegisterServerEvent('esx_proficiencies:giveXP')
AddEventHandler('esx_proficiencies:giveXP', function(xp, proficiency)
    local src     = source
    local xPlayer = ESX.GetPlayerFromId(src)

    -- Does this player already have values for any proficiency?
    if players[xPlayer.identifier] then
        -- Does this player already have values for this specific proficiency?
        if players[xPlayer.identifier]["proficiencies"][proficiency] then
            if players[xPlayer.identifier]["proficiencies"][proficiency].level < proficiencies[proficiency].maxlevel then
                playerXP = players[xPlayer.identifier]["proficiencies"][proficiency].xp
                -- Find the XP needed to achieve the next level

                newXP    = playerXP + xp
                -- If the earned XP is enough to create a levelup, award them the next level
                if (players[xPlayer.identifier]["proficiencies"][proficiency].level + 1) <= proficiencies[proficiency].maxlevel then
                    -- Get the needed XP for the next level
                    needXP = proficiencies_levels[players[xPlayer.identifier]["proficiencies"][proficiency].level + 1].xp
                    if newXP > needXP then
                        players[xPlayer.identifier]["proficiencies"][proficiency].xp    = needXP
                        players[xPlayer.identifier]["proficiencies"][proficiency].level = players[xPlayer.identifier]["proficiencies"][proficiency].level + 1

                        if Config.NotifyLevelUp then
                            TriggerClientEvent('esx:showNotification', src,
                                               "You've earned a new level in ~b~ " .. proficiencies[proficiency].label .. "~w~!")
                        end
                    else
                        players[xPlayer.identifier]["proficiencies"][proficiency].xp = newXP
                        notify                                                       = true
                    end
                end
            else
                notify = false
            end
        else
            players[xPlayer.identifier]["proficiencies"][proficiency]       = {}
            players[xPlayer.identifier]["proficiencies"][proficiency].name  = proficiency
            players[xPlayer.identifier]["proficiencies"][proficiency].xp    = xp
            players[xPlayer.identifier]["proficiencies"][proficiency].level = 0
            notify                                                          = true

            if Config.NotifyNew then
                TriggerClientEvent('esx:showNotification', src,
                                   "You\'ve learned the ~b~" .. proficiencies[proficiency].label .. "~w~ proficiency!")
            end
        end
    else
        players[xPlayer.identifier]                                     = {}
        players[xPlayer.identifier].identifier                          = xPlayer.identifier

        players[xPlayer.identifier]["proficiencies"]                    = {}
        players[xPlayer.identifier]["proficiencies"][proficiency]       = {}
        players[xPlayer.identifier]["proficiencies"][proficiency].name  = proficiency
        players[xPlayer.identifier]["proficiencies"][proficiency].xp    = xp
        players[xPlayer.identifier]["proficiencies"][proficiency].level = 0
        notify                                                          = true

        if Config.NotifyNew then
            TriggerClientEvent('esx:showNotification', src,
                               "You\'ve learned the ~b~" .. proficiencies[proficiency].label .. "~w~ proficiency!")
        end
    end

    -- Add in a check to only display this if they actually get XP
    if Config.NotifyXP and notify then
        TriggerClientEvent('esx:showNotification', src,
                           "You\'ve earned ~y~" .. xp .. " ~w~experience in ~b~" .. proficiencies[proficiency].label .. "~w~!")
    end
end)

--[ Increase the players level by 1 when they reach the XP needed for the next level (Up to max) ]--
function LevelPlayerUp(source, proficiency)
    local src     = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if players[xPlayer.identifier]["proficiencies"][proficiency].level + 1 < proficiencies[proficiency].maxlevel then
        players[xPlayer.identifier]["proficiencies"][proficiency].level = players[xPlayer.identifier]["proficiencies"][proficiency].level + 1
        local xpNeeded                                                  = proficiencies[proficiency].basexp * (players[xPlayer.identifier]["proficiencies"][proficiency].level + 1)

        -- Clamp the players XP to the minimum needed for the next level
        if players[xPlayer.identifier]["proficiencies"][proficiency].xp > xpNeeded then
            players[xPlayer.identifier]["proficiencies"][proficiency].xp = xpNeeded
        else
            players[xPlayer.identifier]["proficiencies"][proficiency].xp = xp
        end

        if Config.NotifyLevelUp then
            TriggerClientEvent('esx:showNotification', src,
                               "You've earned a new level in ~b~ " .. proficiencies[proficiency].label .. "~w~!")
        end
    end
end

-- [ Load player proficiencies from database. Only load stored proficiencies. The rest will be added as they gain them. ]--
function LoadPlayerProficiencies(player)
    MySQL.Async.fetchAll('SELECT * FROM `characters_proficiencies_xp` WHERE `owner` = @owner;', {
        ['@owner'] = tostring(player.identifier)
    }, function(result)
        if #result > 0 then
            -- Player has proficiencies, so let's load them (If they don't have one, we'll save the default value on player save)
            players[player.identifier]                  = {}
            players[player.identifier].identifier       = player.identifier
            players[player.identifier]["proficiencies"] = {}
            for i = 1, #result, 1 do
                players[player.identifier]["proficiencies"][result[i].proficiency]       = {}
                players[player.identifier]["proficiencies"][result[i].proficiency].name  = result[i].name
                players[player.identifier]["proficiencies"][result[i].proficiency].xp    = result[i].xp
                players[player.identifier]["proficiencies"][result[i].proficiency].level = result[i].level
            end
        else
            players[player.identifier]                  = {}
            players[player.identifier].identifier       = player.identifier
            players[player.identifier]["proficiencies"] = {}
        end
    end)
end

--[ Save single player proficiency ]--
function SavePlayer(source)
    local src     = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if players[xPlayer.identifier] then
        for k, v in pairs(proficiencies) do
            if players[xPlayer.identifier]["proficiencies"] and players[xPlayer.identifier]["proficiencies"][k] ~= nil then
                query = 'INSERT INTO `characters_proficiencies_xp` (`owner`,`xp`,`proficiency`,`level`) VALUES (@owner,@xp,@proficiency,@level) ON DUPLICATE KEY UPDATE `xp` = @xp, `level` = @level'

                MySQL.Async.execute(query,
                                    {
                                        ['@owner']       = tostring(players[xPlayer.identifier].identifier),
                                        ['@xp']          = tostring(players[xPlayer.identifier]["proficiencies"][k].xp),
                                        ['@proficiency'] = tostring(proficiencies[k].name),
                                        ['@level']       = tostring(players[xPlayer.identifier]["proficiencies"][k].level)
                                    }, function(result)
                        if result then
                            return
                        end
                    end)
            end
        end
        print("[SAVED] player proficiencies")
    end
end

--[ Save player proficiencies. Save only the values stored in the players table. ]--
function SaveAllPlayers()
    allPlayers = ESX.GetPlayers()

    for i = 1, #allPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(allPlayers[i])
        if players[xPlayer.identifier] then
            for k, v in pairs(proficiencies) do
                if players[xPlayer.identifier]["proficiencies"][k] ~= nil then
                    query = 'INSERT INTO `characters_proficiencies_xp` (`owner`,`xp`,`proficiency`,`level`) VALUES (@owner,@xp,@proficiency,@level) ON DUPLICATE KEY UPDATE `xp` = @xp, `level` = @level'

                    MySQL.Async.execute(query,
                                        {
                                            ['@owner']       = tostring(players[xPlayer.identifier].identifier),
                                            ['@xp']          = tostring(players[xPlayer.identifier]["proficiencies"][k].xp),
                                            ['@proficiency'] = tostring(proficiencies[k].name),
                                            ['@level']       = tostring(players[xPlayer.identifier]["proficiencies"][k].level)
                                        }, function(result)
                            if result then
                                return
                            end
                        end)
                end
            end
            print("[SAVED] All player proficiencies")
        end
    end
end

--[ Dump function used to debug and dump table data to console ]--
function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

--[ Decay (so that you lose XP as you don't use a proficiency) ]--
-- Citizen.CreateThread(function() 
-- 	local time = os.time()
-- 	local decay_rate = 0.025

-- 	local decay = basexp(100-decay_rate)^(time-lastcheck)
-- 	local lastcheck = os.time()
-- end)