-- Paleto Yacht Heist
-- by av8rgeek
-- August 2020

-- Define variables
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

local cooldown           = false -- This is used as a boolean to enable/disable cooldown
-- local paleto_yacht_heist = false -- Is the Heist active?
local police             = 0     -- number of police.  This is used in the "heist" event and Calculate_Payout()
local reward             = 0     -- How much is this heist worth?
Hacker             = {}
Hacker.identifier        = nil
Hacker.name              = nil


function GetCooldownTime()
    local rng = 1
    local cooldowntime = 480 * 60 * 1000 -- Default of 8 hours

    math.randomseed(os.time())
    for rng = 1, 3, 1 do
        cooldowntime = ( math.random(Config.cooldown_time_min, Config.cooldown_time_max) * 60 ) * 1000
    end
    
    print ("Paleto Yacht Heist Cooldown = " .. tostring((cooldowntime/1000)/60) .. " minutes")
-- cooldowntime = 10000
    return cooldowntime
end


Citizen.CreateThread(function()
    local xHacker    =  nil
    local minutes    = 1
    local delay      = minutes * 60 * 1000

    while true do
        if Hacker.identifier ~= nil then
            local found   = false
            local players = ESX.GetPlayers()

            for i=1, #players, 1 do
                local xPlayer = ESX.GetPlayerFromId(players[i])

                if xPlayer.identifier == Hacker.identifier then
                    if xHacker == nil then
                        xHacker = xPlayer
                    end
                    found = true
                    break
                end
            end

            if not found then
                Notify_LSPD('attempt_to_hack', 'failed')

                -- Deduct a Raspberry Pi from their balance
                xHacker.removeInventoryItem('raspberry', 1)

                -- The PD gets to try to gather clues
                for i = 1, #players, 1 do
                    local xPlayer = ESX.GetPlayerFromId(players[i])
                    if xPlayer.job.name == 'police' then
                        TriggerClientEvent("paleto_yacht_heist:pd_clue", players[i], reward, Hacker.name, status)
                    end
                end

                -- Here is the cooldown
                Citizen.Wait(GetCooldownTime())
            
                cooldown = false
                TriggerClientEvent("paleto_yacht_heist:setActive", -1, false)
    
                xHacker = nil
                Hacker.identifier = nil
                Hacker.name = ""
    
            end
        
        end
        Citizen.Wait(delay)
    end

end)


-- This is the start of the heist
--   ensures enough PD are on, that cooldown is not active,
--   then activates the heist routines and notifies the cops
RegisterServerEvent('paleto_yacht_heist:heist')
AddEventHandler('paleto_yacht_heist:heist', function(text)
    local _source  = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()

    -- Loop through all the players and see how many police are on duty
    police         = CopCount()

    --############################################################################################## DEBUG
    if Config.debug then
        police = 7  -- DEBUG code only
    end
    --############################################################################################## DEBUG

    -- Get the player's Steam ID and player name
    Hacker.identifier        = xPlayer.identifier
    Hacker.name              = GetPlayerName(Hacker.identifier)


    -- If the heist is in a cooldown mode, don't let another heist start
    if cooldown == true then
        Notify_Player("cooldown", "failed", _source)
        Notify_LSPD("attempt_to_hack", "failed")
    else
        -- Make sure we have enough PD on duty (value set in config.lua)
        if police < Config.LSPD then
            -- Decline the heist if there are not enough cops
            Notify_Player("not_enough_pd", "failed", _source)
            Notify_LSPD("attempt_to_hack", "failed")
            police = 0 -- Need to reset this so the player can't eee 'E' and kick off the heist
        else
            if Check_for_Items(_source, Config.required_items) then
                -- Set the Heist to Active so the circle doesn't draw
                cooldown = true
                TriggerClientEvent('paleto_yacht_heist:setActive', -1, true) -- true = active, -1 = all clients
                -- Start the mhacking game to see if we can start the heist!
                TriggerClientEvent("paleto_yacht_heist:start_mhacking_game", _source)
                xPlayer.removeInventoryItem('raspberry', 1)
                xPlayer.removeInventoryItem('lithium', 1)
            else
                Notify_Player("not_enough_pi", "failed", _source)
                TriggerClientEvent('paleto_yacht_heist:setActive', -1, false) -- true = active, -1 = all clients
            end
        end
    end -- the end is for the commented out cooldown block above, just in case
end)


-- Iterate through all the players and, if they are LSPD, show a notification
--   that the heist is in progress
function Notify_LSPD(notification_event, notification_type)
    -- This is a table of the current players
    local xPlayers = ESX.GetPlayers()

    -- Iterate through the list of online players
    for i = 1, #xPlayers, 1 do
        xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        -- If the player is a cop, notify them of the heist's current status
        if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
            if notification_type == "reported" then
                TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                   { text = _U(notification_event), title = 'Paleto Yacht Heist Reported' })
            elseif notification_type == "failed" then
                TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                   { text = _U(notification_event), title = 'Paleto Yacht Heist Failed' })
            elseif notification_type == "success" then
                TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                   { text = _U(notification_event), title = 'Paleto Yacht Heist Succeeded' })
            end
        end
    end
end


-- Send a notification to the player
function Notify_Player(notification_event, notification_type, xPlayer)
    local _source = xPlayer

    -- Show the right kind of notification (Green or Red depending on the issue).  The "title" doesn't seem to be relevant on this
    --   particular event call, but it is still added, just in case
    if notification_type == 'success' then
        if notification_event == 'heist_successful' then
            msg = _U(notification_event) .. '  $' .. Comma_Value(reward) .. ' has been transferred into your bank account.'
            TriggerClientEvent('mythic_notify:client:SendSuccessAlert', _source, { text = msg, title = 'Heist Complete' })
        else
            TriggerClientEvent('mythic_notify:client:SendSuccessAlert', _source, { text = _U(notification_event), title = 'Heist Update' })
        end
    elseif notification_type == 'failed' then
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source, { text = _U(notification_event), title = 'Heist Failed' })
    end
end


-- Here is the good part, we get to figure out how much the crim makes!
function Calculate_Payout(num_computers_hacked)
    -- Define local variables
    local rickroll = 1987       -- Never gonna give you up, never gonna let you down
    local pi       = 3.14159    -- Marionberry Pie is the best!
    local payout   = 0

    -- Calculate the Payout
    -- If there are not enough cops on, make the payout SIGNIFICANTLY less
    if police >= Config.LSPD then
        payout = math.floor((rickroll * pi * num_computers_hacked * police) / Config.payout_factor)
    else
        payout = math.floor((police / num_computers_hacked) * 1000) -- and we avoid a divide by zero error
    end

    -- Don't let the payout exceed the cap
    if payout > Config.MaxReward then
        payout = Config.MaxReward
    elseif payout < Config.MinReward then
        payout = Config.MinReward
    end

    return payout
end


function Check_for_Items(source, items)
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)  -- Player Info
    local item_count = 0                             -- Working variable to help determine the result
    local result     = false                         -- The end result we pass back.  Defaults to false.

    -- Iterate through the items and see if they have any
    for idx = 1, #items, 1 do
        local xItem = xPlayer.getInventoryItem(items[idx].item)

        -- If the player has enough of this item, then increment the result
        if xItem.count >= items[idx].quantity then
            item_count = item_count + 1
        end
    end

    -- If the player has all the items on the list with enough quantity, then the result is true
    if item_count == #items then
        result = true
    end

    -- Return the result, whatever it is
    return (result)
end


-- Separate thousands and millions with commas
function Comma_Value(n)
    -- credit http://richard.warburton.itC00
    local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)$')
    return left .. (num:reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. right
end


-- Let's get the hacker's name for the "log" clue that PD will get (if they are lucky)
function GetPlayerName(identifier)
    local name       = "DEFAULT VALUE"

    result           = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier",
                                           { ['@identifier'] = identifier }
                                        )
    if result[1]['firstname'] ~= nil then
        name = result[1]['firstname'] .. " " .. result[1]['lastname']
    else
        name = ""
    end

    return (name)
end


-- Count and return the number of cops on duty
function CopCount()
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    local xPlayers  = ESX.GetPlayers()
    local cop_count = 0                             -- Working variable to help determine the result

    -- Loop through all the players and see how many police are on duty
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            cop_count = cop_count + 1
        end
    end

    return (cop_count)
end


-- If they meet all the conditions, electronically add the money to the player's bank account
RegisterServerEvent('paleto_yacht_heist:heist_completed')
AddEventHandler('paleto_yacht_heist:heist_completed', function(result)
    local _source  = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local status   = false -- was this heist successful?  Passing this value to the pd_clue event

    if result > 0 then
        -- Successful Heist
        reward = Calculate_Payout(result)
        xPlayer.addAccountMoney('bank', reward)
        Notify_Player('heist_successful', 'success', _source)
        Notify_LSPD('pd_heist_complete', 'success', _source)
        status = true
    elseif result == 0 then
        -- Failed Heist
        Notify_Player('too_far_away', 'failed', _source)
        Notify_LSPD('attempt_to_hack', 'failed', _source)
        status = false
    elseif result == -1 then
        -- Player died durning the minihack
        Notify_Player('player_died', 'failed', _source)
        Notify_LSPD('attempt_to_hack', 'failed', _source)
        status = false
    elseif result == -2 then
        -- Player disconnected from the server
        Notify_LSPD('attempt_to_hack', 'failed', _source)
        status = false
    end

    -- Deduct a Raspberry Pi from their balance
    xPlayer.removeInventoryItem('raspberry', 1)

    -- The PD gets to try to gather clues
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            --TriggerClientEvent('paleto_yacht_heist:matchFingerprints', -1, true)
            Citizen.Wait(1000)
            TriggerClientEvent("paleto_yacht_heist:pd_clue", xPlayers[i], Hacker.name)
        end
    end

    -- Here is the cooldown
    Citizen.Wait(GetCooldownTime())

    cooldown = false
    TriggerClientEvent("paleto_yacht_heist:setActive", -1, false)

    Hacker.identifier = nil
    Hacker.name = ""
end)


-- We need to notify PD about something
RegisterServerEvent('paleto_yacht_heist:notify_pd')
AddEventHandler('paleto_yacht_heist:notify_pd', function(event_name, event_type)
    Notify_LSPD(event_name, event_type)
end)


-- We need to notify PD the heist completed
RegisterServerEvent('paleto_yacht_heist:notify_player')
AddEventHandler('paleto_yacht_heist:notify_player', function(event_name, event_type)
    local _source = source
    Notify_Player(event_name, event_type, _source)
end)


-- Let's check inventory and return whether or not they have it
ESX.RegisterServerCallback('paleto-yacht-heist:checkItem', function(source, cb, data)
    cb(Check_for_Items(source, data))
end)


-- Remove an item from the player's inventory
RegisterServerEvent('paleto_yacht_heist:removeInventoryItem')
AddEventHandler('paleto_yacht_heist:removeInventoryItem', function(item_name, quantity)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem(item_name, quantity)
end)


-- Print a message to the server console for debugging
RegisterServerEvent('paleto_yacht_heist:print')
AddEventHandler('paleto_yacht_heist:print', function(text)
    print(tostring(text))
end)


-- Put the hackers' blips on the radar for the cops
RegisterServerEvent('paleto_yacht_heist:setcopblips')
AddEventHandler('paleto_yacht_heist:setcopblips', function(coords)
    local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, ["text"] = "[PD] Impound Robbery", ["sprite"] = 161, ["color"] = 10, ["scale"] = 1.0, ["duration"] = Config.CopBlipInterval}
    local _source   = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
        end
    end
end)


-- Let's check inventory and return whether or not they have it
ESX.RegisterServerCallback('paleto-yacht-heist:GetSyslogEntry', function(source, cb, matchedFingerprints, loc, player_name)
    TriggerClientEvent('paleto_yacht_heist:matchFingerprints', -1, false)
    local syslog = CreateSyslogEntry(matchedFingerprints, loc, player_name)
    --print(syslog)
    cb(syslog)
end)


-- This function generates the syslog entry when the cop tries the fingerprint game
function CreateSyslogEntry(fingerprintsMatched, location, name) -- (boolean, string, string)
    local ts = os.date("%a %d %b %Y %X")
    local syslog = string.format("%s %s", ts, _U('syslogd_not_running')) -- default value if things don't work right

    -- If the heist was successful or not....
    if reward > 0 then
        if fingerprintsMatched then
            --syslog = string.format( "%s paletoyacht.network.ls transferd/auditlog: %s completed a funds transfer of $%d to their bank account from the terminal located at %s.", ts, name, payout, location)
            syslog = string.format( "%s %s %s %s%d %s %s.", ts, _U('cleartext_hostname'), name, _U('successful_heist_and_fingerprints-payout'), reward, _U('successful_heist_and_fingerprints-terminal'), location)
        else
            --syslog = string.format( "%s palfgd;lm;565j3yac =-0sb$7i6w0rk.ls tran@!#$GNFM^&itlog: sl;kfdbnlk;34pleted@FBae90j#@f346sferspom_fj%d to;lknw;gnk acco$#ton42qaESQRerminal45 qKLBNJE!#$ %s.", ts, payout, location )
            syslog = string.format( "%s%s%d %s%s.", ts, _U('successful_heist_and_no_fingerprints-payout'), reward, _U('successful_heist_and_no_fingerprints-terminal'), location )
        end
    else
        if fingerprintsMatched then
            --syslog = string.format( "%s paletoyacht.network.ls transferd/auditlog: %s attempted a transfer of funds to their bank account from the terminal located at %s.", ts, name, location)
            syslog = string.format( "%s %s %s %s %s.", ts, _U('cleartext_hostname'), name, _U('unsuccessful_heist_and_fingerprints'), location)
        else
            --syslog = string.format( "%spalfgd;lm;565j3yac =-0sb$7i6w0rk.ls tran@!#$GNFM^&itlog: dSB$&*ttemptfhtj;lkmxferspom_fj%d to;lknw;gnk acco$#ton42qaESQRerminal45 qKLBNJE!#$%s.", ts, location)
            syslog = string.format( "%s%s%s.", ts, _U('unsuccessful_heist_and_no_fingerprints'), location)
        end
    end

    return syslog
end    

