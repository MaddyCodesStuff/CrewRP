-- Paleto Yacht Heist
-- by av8rgeek
-- August 2020

Config                             = {}
Config.debug                       = false   -- Activate this flag for extra debugging info in the logs
Config.Locale                      = 'en'
Config.LSPD                        = 8      -- Min number of cops needed to enable this heist
if Config.debug then
    Config.cooldown_time_min           = 3
    Config.cooldown_time_max           = 4
else
    Config.cooldown_time_min           = 90
    Config.cooldown_time_max           = 150
end
Config.MaxReward                   = 80000 -- Max payout of the heist
Config.MinReward                   = 50000
Config.payout_factor               = 5.0      -- (float) This number affects payout levels
--    lower number = bigger payout
Config.max_distance_from_heist     = 75     -- Max distance you can go before the heist deactivates
Config.hack_timer_min              = 20 -- (Random) Num of seconds for a hack attempt
Config.hack_timer_max              = 50 -- (Random) Num of seconds for a hack attempt
Config.hack_qty_minimum            = 5
-- The actual number of computers to hack is a random number between the
--   minimum qty and the legnth of the table.
-- The max is the length of the table
Config.hack_success_threshold      = 4       -- Lowest 'luck' that will be considered a "success"
--    when trying to hack a computer.  Higher number = more difficult

-- How far away can you be from the coordinates and still see the markers?
Config.marker_display_range        = 10
Config.marker_z_offset             = 0.98
-- This is where the marker to start the heist is placed.
Config.Heist_Marker_ID             = 27     -- 27 = circle with arrows

Config.Hackable_Computer_Locations = {
    -- Paleto Yacht
    { x = -1430.87, y = 6754.88, z = 12.78, is_hacked = false }, -- Computer on left side of bridge
    { x = -1430.03, y = 6757.06, z = 12.78, is_hacked = false }, -- Computer on right side of bridge
    { x = -1418.35, y = 6755.10, z = 11.91, is_hacked = false }, -- Computer Room, left side
    { x = -1420.12, y = 6749.87, z = 11.91, is_hacked = false }, -- Computer Room, right side
    { x = -1427.43, y = 6751.43, z = 8.97, is_hacked = false }, -- Living Room Laptop
    { x = -1423.92, y = 6758.10, z = 5.88, is_hacked = false }, -- Master Bedroom Laptop
    { x = -1414.22, y = 6751.10, z = 3.06, is_hacked = false }, -- Engine Room Computer-Forward
    { x = -1400.37, y = 6747.18, z = 2.59, is_hacked = false }, -- Engine Room Computer-Mid
    { x = -1397.68, y = 6738.10, z = 2.56, is_hacked = false }, -- Engine Room Computer-Port Side
    { x = -1403.60, y = 6750.90, z = 11.91, is_hacked = false }, -- Phone at rooftop bar
    { x = -1433.51, y = 6752.67, z = 8.97, is_hacked = false }, -- TV in the bar area
}

Config.PD_Note_Locations = {
    -- Paleto Yacht
    { x = -1430.87, y = 6754.88, z = 12.78, desc = "Bridge Terminal-Port Side" }, -- Computer on left side of bridge
    { x = -1430.03, y = 6757.06, z = 12.78, desc = "Bridge Terminal-Starboard Side" }, -- Computer on right side of bridge
    { x = -1418.35, y = 6755.10, z = 11.91, desc = "Computer Room Terminal-Port Side" }, -- Computer Room, left side
    { x = -1420.12, y = 6749.87, z = 11.91, desc = "Computer Room Terminal-Starboard Side" }, -- Computer Room, right side
    { x = -1427.43, y = 6751.43, z = 8.97, desc = "Living Room Laptop" }, -- Living Room Laptop
    { x = -1423.92, y = 6758.10, z = 5.88, desc = "Master Bedroom Laptop" }, -- Master Bedroom Laptop
    { x = -1414.22, y = 6751.10, z = 3.06, desc = "Engine Room Terminal-Forward Section" }, -- Engine Room Computer
    { x = -1400.37, y = 6747.18, z = 2.59, desc = "Engine Room Terminal-Mid Section" }, -- Engine Room Computer
    { x = -1397.68, y = 6738.10, z = 2.56, desc = "Engine Room Terminal-Port Side" }, -- Engine Room Computer
    { x = -1403.60, y = 6750.90, z = 11.91, desc = "Phone at the top deck bar" }, -- Phone at rooftop bar
    { x = -1433.51, y = 6752.67, z = 8.97, desc = "TV in the inner bar" }, -- tv in the bar below the bridge
}

-- Variables for the fingerprint minigame
Config.fingerprint_levels_min = 2  -- Minimum number of fingerprints to match (Range 1-max)
Config.fingerprint_levels_max = 4  -- Maximum number of fingerprints to match (Range min-4)
Config.fingerprint_lives_min  = 2  -- Minimum number of chances  (Range 1-max)
Config.fingerprint_lives_max  = 4  -- Maximum number of chances  (Range min-6)
Config.fingerprint_time_min   = 1  -- Lowest amount of time to complete  (Range 1-max)
Config.fingerprint_time_max   = 3  -- Highest amount of time to complete  (Range min-9)

-- Variables for the mini hacking game to start the heist
Config.mhack_solution_len_min = 2  -- How long is each string to match in the grid
Config.mhack_solution_len_max = 4  -- How long is each string to match in the grid
Config.mhack_time_min         = 15 -- How many seconds to make a match
Config.mhack_time_max         = 30 -- How many seconds to make a match

Config.Heist_Start_Point      = { x = -1430.03, y = 6757.06, z = 12.78 } -- Computer on right side of bridge
Config.blip                   = { x = -1362.93, y = 6733.73, z = 2.45, id = 455, color = 22, scale = 0.75 } -- Outside stern deck at water level
-- yacht icon id        = 455
-- white color          = 0
-- light gray           = 22
-- scale (size of icon) = 0.75 (3/4 the normal size)

-- Consumables used in the heist
Config.required_items = {
    { item = 'raspberry', quantity = 1 },
    { item = 'lithium', quantity = 1 },
}

-- This is the vehicle that spawns behind the yacht at the end of the heist
Config.vehicle = {
    model   = 'seashark',
    pos     = { x = -1348.00, y = 6755.89, z = 0 },
    heading = 70,
}

-- These are used to show the tracking blip on the Cop radars
Config.CopBlipTime     = 120000 -- in msec
Config.CopBlipInterval = 5000  -- in msec