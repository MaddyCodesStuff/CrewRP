-- Paleto Yacht Heist
-- by av8rgeek
-- August 2020

-- Define variables
local PlayerData                        = nil
ESX                                     = nil

-- Number of hacked computers and total number of computers
local paleto_yacht_num_hacked_computers = 0
local paleto_yacht_total_computers      = 0
local Computer_Locations                = {}
local start_marker                      = Config.Heist_Start_Point  -- Where to place the starting marker
local floor_z_offset                    = Config.marker_z_offset  -- offset to place the circle on the floor
local HeistIsActive                     = false
local cooldown                          = false
local match_fingerprints                = true
local beingTracked                      = false
local blipExpireTime                    = 0
local isDead                            = false
local log_msg                           = ""


-- When the resource is started, populate the ESX and PlayerData variables from the game
Citizen.CreateThread(function()
    -- While the ESX variable has no value/properties, keep querying ESX until it has one/them.
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)


-- When ESX fires off the "playerLoaded" event, create a local variable that refers to xPlayer
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    while PlayerData == nil do
        PlayerData = xPlayer
    end
end)


-- When the resource is started, check the player position, draw the markers as needed, and interact if the heist has not started yet
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        -- If there is no active yacht heist and the player is close enough, draw the marker
        --    and let them start the heist (by triggering the start_heist event)
        if not cooldown  then
            if not HeistIsActive then
                local ped = PlayerPedId() -- Get the player'd ID so we can reference it later
                if GetDistanceBetweenCoords(GetEntityCoords(ped), start_marker.x, start_marker.y, start_marker.z, true) < Config.marker_display_range then
                    DrawMarker(Config.Heist_Marker_ID, start_marker.x, start_marker.y, start_marker.z - floor_z_offset, 0, 0, 0, 0, 0, 75.0, 1.0, 1.0, 1.0, 0, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), start_marker.x, start_marker.y, start_marker.z, true) < 1.5 then
                        ESX.ShowHelpNotification(_U('start_heist'))
                        if IsControlJustReleased(1 --[[INPUTGROUP_LOOK --]], 51 --[[INPUT_CONTEXT --]]) then
                            HeistIsActive = true     -- stop drawing the circle for all players while a heist is active.
                            isDead = false
                            TriggerServerEvent("paleto_yacht_heist:heist")
                        end   -- if IsControlJustReleased
                    end   -- if GetDist... < 1 show the "start the heist" notification
                end   -- if GetDist... < Config.marker_display_range, draw the marker
            end   -- if HeistIsActive == false
        end     -- if cooldown == false
    end -- while loop
end)


-- 
function mhack_result(success, timeremaining)
    if not isDead then
        if success then
            -- cooldown = true
            TriggerEvent('mhacking:hide')
            TriggerServerEvent('paleto_yacht_heist:notify_player', 'heist_started', 'success')
            TriggerServerEvent('paleto_yacht_heist:notify_pd', 'pd_hack_started', 'reported')
            TriggerEvent('paleto_yacht_heist:start', _source) -- This starts the heist
        else
            TriggerServerEvent('paleto_yacht_heist:heist_completed', 0)  --  0 = number of computers hacked
            TriggerEvent('mhacking:hide')
        end
    else
        TriggerServerEvent('paleto_yacht_heist:heist_completed', -1)  --  -1 = player died
        TriggerEvent('mhacking:hide')
    end
end


-- Start the Mhacking game
RegisterNetEvent("paleto_yacht_heist:start_mhacking_game")
AddEventHandler("paleto_yacht_heist:start_mhacking_game", function()
    local solution_length = nil
    local solution_time = nil
    
    if not IsPlayerDead(Player()) then
        -- Generate as random of numbers as possible, 3rd time should be the charm
        math.randomseed(GetGameTimer())
        for rng = 1, 3, 1 do
            solution_length = math.random(Config.mhack_solution_len_min, Config.mhack_solution_len_max)
            solution_time = math.random(Config.mhack_time_min, Config.mhack_time_max)
        end

        TriggerEvent('mhacking:show')
        TriggerEvent('mhacking:start', solution_length, solution_time, mhack_result)
    end
end)


-- This actually is the heist itself
RegisterNetEvent("paleto_yacht_heist:start")
AddEventHandler("paleto_yacht_heist:start", function()
    local _source = source
    local rng = 1
    math.randomseed(GetGameTimer())

    local not_hacking                       = true

    -- Reset the locations table in case this was not the first hack of the day
    Computer_Locations = nil
    -- Randomize the locations so the crims can't figure out the pattern!
    Computer_Locations = Randomize_Computer_Locations(Config.Hackable_Computer_Locations)
 
    -- Generate as random of numbers as possible, 3rd time should be the charm
    for rng = 1, 3, 1  do
        paleto_yacht_total_computers = math.random(Config.hack_qty_minimum, #Computer_Locations)
    end
    -- local paleto_yacht_total_computers  = #Computer_Locations   -- FOR DEVELOPMENT USE ONLY

    while HeistIsActive do
        Citizen.Wait(1)

        -- Iterate through the randomized list of locations
        for index = 1, paleto_yacht_total_computers, 1 do
            local Location = Computer_Locations[index]
            local ped = PlayerPedId()

            -- If the player moves too far away from the heist's start point, cancel the heist as a failure
            --    and then break out of the for loop
            if isDead or (GetDistanceBetweenCoords(GetEntityCoords(ped), start_marker.x, start_marker.y, start_marker.z, true) > Config.max_distance_from_heist) then
                -- Reset the number of hacked computers back to 0
                paleto_yacht_num_hacked_computers = 0   -- 0 = failed heist

                --Let the player know the heist is over and that they failed
                if isDead then
                    TriggerServerEvent('paleto_yacht_heist:heist_completed', -1)
                else
                    TriggerServerEvent('paleto_yacht_heist:heist_completed', paleto_yacht_num_hacked_computers)
                    -- COMMENTED OUT THE GETAWAY BOAT IF THEY FAILED.  We can always uncomment it later.
                    -- Give them a getaway boat
                    --    ESX.Game.SpawnVehicle( Config.vehicle['model'],
                    --                           vector3( Config.vehicle['pos']['x'],
                    --                                    Config.vehicle['pos']['y'],
                    --                                    Config.vehicle['pos']['z']),
                    --                           Config.vehicle['heading'] )
                end
                HeistIsActive = false
                break
            elseif Location.is_hacked == false then
                if index - 1 == paleto_yacht_num_hacked_computers then
                    --Draw the circle
                    DrawMarker(Config.Heist_Marker_ID, Location.x, Location.y, Location.z - floor_z_offset, 0, 0, 0, 0,
                               0, 75.0, 1.0, 1.0, 1.0, 255, 0, 0, 155, 0, 0, 2, 0, 0, 0, 0)
                    -- If the player is close to the center of the circle, display the notification to hack the computer
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), Location.x, Location.y, Location.z, true) < 1 then
                        ESX.ShowHelpNotification(_U('hack_computer'))
                        if IsControlJustReleased(1 --[[INPUTGROUP_LOOK --]], 51 --[[INPUT_CONTEXT --]]) then
                            if not_hacking then
                                not_hacking = false
                                ESX.TriggerServerCallback('paleto-yacht-heist:checkItem', function(hasItem)
                                    if hasItem then
                                        -- Begin hacking, baby!

                                        -- Let's set some local variables for use in this if...then statement
                                        local luck = nil
                                        local timer = nil
                                        
                                        for rng = 1, 3, 1 do
                                            luck  = math.random(0, 10) -- Let's see how lucky the hacker got!
                                            timer = math.random(Config.hack_timer_min, Config.hack_timer_max) * 1000 -- gotta make it in milliseconds
                                        end

                                        --This is the actual animation
                                        TriggerEvent("mythic_progbar:client:progress", {
                                            name            = "hacking_the_computer",
                                            duration        = timer,
                                            label           = "Attempting to hack the computer",
                                            useWhileDead    = false,
                                            canCancel       = true,
                                            controlDisables = {
                                                disableMovement    = true,
                                                disableCarMovement = true,
                                                disableMouse       = false,
                                                disableCombat      = true,
                                            },
                                            animation       = {
                                                animDict = "mp_bank_heist_1",
                                                anim     = "hack_loop",
                                            },
                                            prop            = {}
                                            -- model = "prop_paper_bag_small",
                                            --}
                                        }, function(canceled)
                                            -- Consume a set of batteries
                                            TriggerServerEvent('paleto_yacht_heist:removeInventoryItem', 'lithium', 1)

                                            if canceled then
                                                not_hacking = true

                                                -- Consume a raspberry pi
                                                TriggerServerEvent('paleto_yacht_heist:removeInventoryItem', 'raspberry', 1)

                                                -- Notify the player they failed and whether or not they have the supplies to try again
                                                ESX.TriggerServerCallback('paleto-yacht-heist:checkItem', function(hasItem)
                                                    if hasItem then
                                                        TriggerServerEvent('paleto_yacht_heist:notify_player','try_again','failed')
                                                    else
                                                        TriggerServerEvent('paleto_yacht_heist:notify_player','failed_hack','failed')
                                                    end
                                                end, Config.required_items)
                                            else
                                                -- Do Something If Event Wasn't Cancelled
                                                if luck >= Config.hack_success_threshold then
                                                    -- If they were lucky...
                                                    Location.is_hacked                = true
                                                    not_hacking                       = true
                                                    paleto_yacht_num_hacked_computers = paleto_yacht_num_hacked_computers + 1

                                                    -- If they were successful, but still have computers to hack then.....
                                                    if paleto_yacht_num_hacked_computers < paleto_yacht_total_computers then
                                                        TriggerServerEvent('paleto_yacht_heist:notify_player', 'computer_hacked', 'success')
                                                        PlaySoundFrontend(-1, "HACKING_SUCCESS", 0, 1)
                                                        local msg = _U('progress1') .. tostring(paleto_yacht_num_hacked_computers) .. _U('progress2') .. tostring(paleto_yacht_total_computers) .. _U('progress3')
                                                        ESX.ShowNotification(msg)

                                                        -- Else, if they have hacked all the computers successfully
                                                    elseif paleto_yacht_num_hacked_computers == paleto_yacht_total_computers then
                                                        -- HEIST IS OVER
                                                        TriggerServerEvent("paleto_yacht_heist:heist_completed", paleto_yacht_num_hacked_computers) -- Pass the number of computers hacked
                                                        PlaySoundFrontend(-1, "HACKING_SUCCESS", 0, 1)
                                                        local msg = _U('progress1') .. tostring(paleto_yacht_num_hacked_computers) .. _U('progress2') .. tostring(paleto_yacht_total_computers) .. _U('progress3')
                                                        ESX.ShowNotification(msg)
                                                        -- Give them a getaway vehicle
                                                        ESX.Game.SpawnVehicle(Config.vehicle['model'],
                                                                              vector3(Config.vehicle['pos']['x'],
                                                                                      Config.vehicle['pos']['y'],
                                                                                      Config.vehicle['pos']['z']),
                                                                                      Config.vehicle['heading'])
                                                        
                                                        -- Track their escape!
                                                        blipExpireTime                    = GetGameTimer() + Config.CopBlipTime
                                                        beingTracked                      = true
                                                        
                                                        -- Cleanup activities to prepare for the next heist
                                                        -- This has to be reset, or the logic in this event fails
                                                        paleto_yacht_num_hacked_computers = 0
                                                        HeistIsActive = false
                                                    end
                                                else
                                                    -- Or if they were unlucky
                                                    not_hacking = true
                                                    -- Notify the player they failed and whether or not they have the supplies to try again
                                                    ESX.TriggerServerCallback('paleto-yacht-heist:checkItem',function(hasItem)
                                                        if hasItem then
                                                            TriggerServerEvent('paleto_yacht_heist:notify_player','try_again','failed')
                                                        else
                                                            TriggerServerEvent('paleto_yacht_heist:notify_player','failed_hack','failed')
                                                        end
                                                    end, Config.required_items)
                                                end
                                            end
                                        end)
                                    else
                                        not_hacking = true
                                        TriggerServerEvent('paleto_yacht_heist:notify_player', 'not_enough_pi', 'failed')
                                    end
                                end, Config.required_items)
                            end
                        end
                    end
                end
            end
        end
    end
    Computer_Locations = nil   -- Clear the table
end)


RegisterNetEvent("paleto_yacht_heist:pd_clue")
AddEventHandler("paleto_yacht_heist:pd_clue", function(hacker_name)
    -- When the resource is started, check the player position, draw the markers as needed, and interact if the heist has not started yet
    Citizen.CreateThread(function()
        local _source = source
        local clue_location = nil
        local fingerprint_levels = nil
        local fingerprint_lives = nil
        local fingerprint_time = nil

        math.randomseed(GetGameTimer())
        for rng = 1, 3, 1 do
            -- Pick a place to show the clue
            clue_location      = Config.PD_Note_Locations[math.random(1, #Config.PD_Note_Locations)]
            fingerprint_levels = math.random(Config.fingerprint_levels_min, Config.fingerprint_levels_max)
            fingerprint_lives  = math.random(Config.fingerprint_lives_min,  Config.fingerprint_lives_max)
            fingerprint_time   = math.random(Config.fingerprint_time_min,   Config.fingerprint_time_max)
        end

        while true do
            Citizen.Wait(1)
            -- Define variables scoped within the while/do
            local ped = PlayerPedId(-1) -- Get the players ID so we can reference it later

            if match_fingerprints then 
                if GetDistanceBetweenCoords(GetEntityCoords(ped), clue_location.x, clue_location.y, clue_location.z, true) < Config.marker_display_range then
                    DrawMarker(Config.Heist_Marker_ID, clue_location.x, clue_location.y, clue_location.z - floor_z_offset, 0, 0, 0, 0, 0, 75.0, 1.0, 1.0, 1.0, 0, 0, 255, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), clue_location.x, clue_location.y, clue_location.z, true) < 1 then
                        ESX.ShowHelpNotification(_U('pd_gather_clues'))
                        if IsControlJustReleased(1 --[[INPUTGROUP_LOOK --]], 51 --[[INPUT_CONTEXT --]]) then
                            match_fingerprints = false
                            TriggerEvent("utk_fingerprint:Start", fingerprint_levels, fingerprint_lives, fingerprint_time, function(outcome, reason)
                                ESX.TriggerServerCallback('paleto-yacht-heist:GetSyslogEntry',function(pdnote)
                                    TriggerServerEvent("server:newNote", pdnote, clue_location.x, clue_location.y, clue_location.z, true)
                                end, outcome, clue_location, hacker_name)
                            end)
                        end -- if IsControlJustReleased
                    end   -- if GetDist... < 1 show the "Gather evidence" notification
                end       -- if ped is close enough to see the marker
            end -- if match_fingerprints
        end -- while loop
    end) -- End of thread
end) -- End of event


-- Randomize the Computer Locations
function Randomize_Computer_Locations(t)
    -- Create a local table so we are not working with the original data
    local tbl = {}

    -- Populate the local table with the original table's data
    for i = 1, #t do

        -- Since Lua passes everything by reference....  we have to reset the values to have another heist
        if t[i].is_hacked then
            t[i].is_hacked = false
        end
        tbl[i] = t[i]
    end

    -- Randomize the order in the table through an algorithm I don't understand, but works
    for i = #tbl, 2, -1 do
        local j        = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end

    if Config.debug then
        -- Debug output to server console
        for a = 1, #tbl do
            print("x=" .. tbl[a].x .. " y=" .. tbl[a].y .. " z=" .. tbl[a].z .. " is_hacked= " .. tostring(tbl[a].is_hacked))
        end
    end
    -- Pass the tbl reference back to the calling routine
    return tbl
end


-- Track thief
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if beingTracked then
            if blipExpireTime >= GetGameTimer() then
                local coords = GetEntityCoords(GetPlayerPed(-1))
                TriggerServerEvent('paleto_yacht_heist:setcopblips', coords)
            else
                beingTracked = false
            end
        end

--[[
        if blipExpireTime >= GetGameTimer() and beingTracked then
            local coords = GetEntityCoords(GetPlayerPed(-1))
            TriggerServerEvent('paleto_yacht_heist:setcopblips', coords)
        elseif beingTracked then
            beingTracked = 0
        end
--]]
        Citizen.Wait(Config.CopBlipInterval * 1000)
    end
end)


-- Method for server/main.lua to deactivate the heist for all clients
RegisterNetEvent('paleto_yacht_heist:setActive')
AddEventHandler('paleto_yacht_heist:setActive', function(HeistActive)
    if HeistActive then
        HeistIsActive = true
        cooldown = true
    else
        HeistIsActive = false
        cooldown = false
    end

end)


-- Detect player death
AddEventHandler('esx:onPlayerDeath', function()
    isDead = true
end)


-- Method for server/main.lua to deactivate the heist for all clients
RegisterNetEvent('paleto_yacht_heist:matchFingerprints')
AddEventHandler('paleto_yacht_heist:matchFingerprints', function(fingerprints)
    match_fingerprints = fingerprints
end)
