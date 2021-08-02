Config = {}

-- General
Config.ImpoundTime = 60 -- Impound time in seconds
Config.DetectDistance = 20 -- Detect distance for lots. Vehicles can be impounded in this radius.
Config.PromptDistance = 2.0 -- Distance from coords to prompt. IMPORTANT: Prompts must be at least this far apart
Config.DoorLockKey = 57 -- Set to the same key as vehicle door locks
Config.ImpoundLot = {
    doorway = {
        inside = vector3(1004.69, -2992.38, -38.65),
        outside = vector3(1018.79, -2511.59, 27.48),
    },
    garage = {
        inside = vector3(971.25, -2989.81, -38.65),
        outside = vector3(1008.06, -2519.93, 27.31),
    },
    alarms = {
        vector3(1018.23, -2517.58, 28.3),
        vector3(1004.69, -2992.38, -38.65),
    },
    computer = vector3(964.46, -3003.38, -39.64),
    heading = 87.01,
    car_spawn = {
        coords = vector3(983.81, -3001.94, -39.65),
        heading = 85.21,
    },
}
Config.ActionLabels = {
    enter = "enter the impound lot.",
    exit = "exit the impound lot.",
    break_in = "break into the impound lot.",
    hack_computer = "hack the impound list.",
    access_computer = "access the impound list.",
    search_keys = "search for vehicle keys.",
}

-- Heist
Config.GlobalCooldown = 60 -- Heist cooldown time in minutes globally
Config.DoorUnlockTimer = 10 -- Time in minutes to leave door unlocked after breaking in (resets hack as well)
Config.CopsRequired = 5 -- Heist cop requirement
Config.LockPickTime = 30 -- Time to pick lock in seconds
Config.RegistrationTime = 30 -- Time to hack vehicle registration in seconds
Config.KeySearchTime = 5 -- Time to search for keys in seconds (per location)
Config.KeyLocations = { -- Possible locations where car keys can be located
    vector3(963.02, -2994.24, -39.65),
    vector3(962.65, -3016.55, -39.65),
    vector3(995.19, -2988.45, -39.65),
    vector3(966.08, -2993.07, -39.65),
    vector3(968.62, -3002.25, -39.65),
}
Config.LocalVehicles = {
    'surfer',
    'camper',
    'romero',
    'patriot',
    'rumpo3',
    'sandking',
    'rebel',
    'stratum',
    'picador',
    'kalahari',
    'baller3',
    'club',
    'glendale',
    'warrener',
    'dubsta2',
    'bifta',
    'futo',
    'oracle',
    'sultan',
    'prairie',
    'washington',
    'bodhi',
    'schafter',
    'schafter3',
    'buffalo',
    'felon',
    'tulip',
    'vamos',
    'z190',
    'zion',
    'zion2',
    'zion3',
    'ruiner',
    'monroe',
    'sentinel',
    'sentinel2',
    'tailgater',
    'retinue2',
    'novak',
    'rebla',
    'coquette2',
    'dominator3',
    'elegy',
    'jester',
    'bestiagts',
    'alpha',
    'surano',
    'sugoi',
}

-- Mythic actions config
Config.MythicActions = {
    break_in = {
        name            = "policeimpound-breakin",
        duration        = Config.LockPickTime * 1000,
        label           = "Picking lock...",
        useWhileDead    = false,
        canCancel       = true,
        controlDisables = {
            disableMovement    = true,
            disableCarMovement = false,
            disableMouse       = false,
            disableCombat      = true,
        },
        animation       = {
            animDict = 'mp_common_heist',
            anim     = "pick_door",
            flags    = 1,
            task     = nil,
        },
        prop            = {
            model    = nil,
            bone     = nil,
            coords   = { x = 0.0, y = 0.0, z = 0.0 },
            rotation = { x = 0.0, y = 0.0, z = 0.0 },
        },
    },
    hack_registration = {
        name            = "policeimpound-hackregistration",
        duration        = Config.RegistrationTime * 1000,
        label           = "Hacking vehicle registration...",
        useWhileDead    = false,
        canCancel       = true,
        controlDisables = {
            disableMovement    = true,
            disableCarMovement = false,
            disableMouse       = false,
            disableCombat      = true,
        },
        animation       = {
            animDict = 'mp_prison_break',
            anim     = "hack_loop",
            flags    = 1,
            task     = nil,
        },
        prop            = {
            model    = nil,
            bone     = nil,
            coords   = { x = 0.0, y = 0.0, z = 0.0 },
            rotation = { x = 0.0, y = 0.0, z = 0.0 },
        },
    },
    impound_vehicle = {
        name            = "policeimpound-impoundvehicle",
        duration        = math.floor(Config.ImpoundTime / 2) * 1000,
        label           = "Preparing vehicle for impound...",
        useWhileDead    = false,
        canCancel       = true,
        controlDisables = {
            disableMovement    = true,
            disableCarMovement = false,
            disableMouse       = false,
            disableCombat      = true,
        },
        animation       = {
            animDict = 'amb@world_human_bum_wash@male@low@idle_a',
            anim     = "idle_a",
            flags    = 1,
            task     = nil,
        },
        prop            = {
            model    = nil,
            bone     = nil,
            coords   = { x = 0.0, y = 0.0, z = 0.0 },
            rotation = { x = 0.0, y = 0.0, z = 0.0 },
        },
    },
    update_registration = {
        name            = "policeimpound-impoundvehicle2",
        duration        = math.floor(Config.ImpoundTime / 2) * 1000,
        label           = "Updating vehicle registration...",
        useWhileDead    = false,
        canCancel       = true,
        controlDisables = {
            disableMovement    = true,
            disableCarMovement = false,
            disableMouse       = false,
            disableCombat      = true,
        },
        animation       = {
            animDict = 'amb@world_human_tourist_map@male@idle_a',
            anim     = "idle_b",
            flags    = 1,
            task     = nil,
        },
        prop            = {
            model    = "prop_cs_tablet",
            bone     = 28422,
            coords   = { x = 0.0, y = -0.03, z = 0.0 },
            rotation = { x = 20.0, y = -90.0, z = 0.0 },
        },
    },
    search_keys = {
        name            = "policeimpound-searchkeys",
        duration        = Config.KeySearchTime * 1000,
        label           = "Searching for vehicle keys...",
        useWhileDead    = false,
        canCancel       = true,
        controlDisables = {
            disableMovement    = true,
            disableCarMovement = false,
            disableMouse       = false,
            disableCombat      = true,
        },
        animation       = {
            animDict = 'missexile3',
            anim     = "ex03_dingy_search_case_a_michael",
            flags    = 1,
            task     = nil,
        },
        prop            = {
            model    = nil,
            bone     = nil,
            coords   = { x = 0.0, y = 0.0, z = 0.0 },
            rotation = { x = 0.0, y = 0.0, z = 0.0 },
        },
    },
}

-- DO NOT CHANGE
Config.LotCoords = {
    { Config.ImpoundLot.doorway.inside, "inside", false, 55 },
    { Config.ImpoundLot.doorway.outside, "outside", false, Config.DetectDistance },
    { Config.ImpoundLot.garage.inside, "inside", true, 55 },
}