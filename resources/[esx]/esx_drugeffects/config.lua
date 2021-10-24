Config                       = {}

Config.Limits                = {
    speed = {
        min = 0.5,
        max = 1.5,
    }
}

Config.DrugEffects           = {
    weed       = {
        health             = 10,
        armor              = 10,
        speed              = 0.8,
        animation_set      = "move_m@gangster@ng",
        start_scenario     = {
            name     = "WORLD_HUMAN_SMOKING_POT",
            duration = 3000
        },
        timecycle_modifier = "spectator1",
        motion_blur        = true,
        is_drunk           = true,
    },
    cocaine    = {
        health             = -15,
        armor              = 15,
        speed              = 1.15,
        --stamina = -15,
        animation_set      = "move_m@hurry_butch@a",
        start_scenario     = {
            name     = "WORLD_HUMAN_SMOKING_POT",
            duration = 3000
        },
        timecycle_modifier = "spectator3",
        motion_blur        = true,
        is_drunk           = true,
    },
    meth       = {
        health             = -15,
        speed              = 1.2,
        --stamina = -30,
        animation_set      = "move_f@scared",
        start_scenario     = {
            name     = "WORLD_HUMAN_SMOKING_POT",
            duration = 3000
        },
        timecycle_modifier = "spectator6",
        motion_blur        = true,
        is_drunk           = true,
    },
    opium      = {
        health             = -50,
        armor              = 50,
        speed              = 0.7,
        animation_set      = "move_m@drunk@moderatedrunk",
        start_scenario     = {
            name     = "WORLD_HUMAN_SMOKING_POT",
            duration = 3000
        },
        timecycle_modifier = "spectator5",
        motion_blur        = true,
        is_drunk           = true,
    },
    extasy     = {
        health             = -10,
        speed              = 1.1,
        --stamina = 25,
        animation_set      = "move_m@hurry_butch@c",
        start_scenario     = {
            name     = "WORLD_HUMAN_AA_COFFEE",
            duration = 3000
        },
        timecycle_modifier = "spectator5",
        motion_blur        = true,
        is_drunk           = true,
    },
    lsd        = {
        animation_set      = "move_m@hurry_butch@c",
        start_scenario     = {
            name     = "WORLD_HUMAN_AA_COFFEE",
            duration = 3000
        },
        timecycle_modifier = "spectator5",
        motion_blur        = true,
        is_drunk           = true,
    },
    chill_pill = {
        armor                  = 100,
        weapon_damage_modifier = 0.2,
    },
    dechill_pill= {
        armor                  = -100,
        weapon_damage_modifier = 1.0, -- Gets set in script
    },
    wax = {
        animation_set      = "base",
        start_scenario     = {
            name     = "world_human_smoking_fat",
            duration = 3000
        },
        timecycle_modifier = "spectator5",
        motion_blur        = true,
        is_drunk           = true,
    }
}

Config.UsableDrugItems       = {
    marijuana     = {
        requires   = {
            { name = "pipe_weed", consume = false },
            { name = "lighter", consume = false },
        },
        drug       = "weed",
        drug_power = 166000,
    },
    marijuana_med = {
        requires   = {
            { name = "pipe_weed", consume = false },
            { name = "lighter", consume = false },
        },
        drug       = "weed",
        drug_power = 166000,
    },
    joint         = {
        requires   = {
            { name = "lighter", consume = false },
        },
        drug       = "weed",
        drug_power = 166000,
    },
    cocaine       = {
        requires   = {
            { name = "CD", items = { "cd1", "cd2", "cd3", "cd4", "cd5", "cd6", "cd7", "cd8", "cd9" }, consume = false },
            { name = "razer", consume = false },
        },
        drug       = "cocaine",
        drug_power = 499000,
    },
    opium         = {
        requires   = {
            { name = "lighter", consume = false },
            { name = "pipe_opium", consume = false },
        },
        drug       = "opium",
        drug_power = 249000,
    },
    meth          = {
        requires   = {
            { name = "lighter", consume = false },
            { name = "pipe_meth", consume = false },
        },
        drug       = "meth",
        drug_power = 333000,
    },
    lsd           = {
        requires   = {},
        drug       = "lsd",
        drug_power = 249000,
    },
    shrooms       = {
        requires   = {},
        drug       = "lsd",
        drug_power = 125000,
    },
    extasy        = {
        requires   = {},
        drug       = "extasy",
        drug_power = 333000,
    },
    chillpill     = {
        requires   = {},
        drug       = "chill_pill",
        drug_power = 0,
    },
    dechillpill = {
        requires = {},
        drug      = "dechill_pill",
        drug_power = 0,
    },
    wax = {
        requries   =  {},
        drug       = "wax",
        drug_power = 166000,
    }
    bestbuds_muffin        = {
        requires   = {},
        drug       = "weed",
        drug_power = 166000,
    },
    bestbuds_brownie        = {
        requires   = {},
        drug       = "weed",
        drug_power = 166000,
    },
    bestbuds_cupcake        = {
        requires   = {},
        drug       = "weed",
        drug_power = 166000,
    },
    bestbuds_chocchipcookie        = {
        requires   = {},
        drug       = "weed",
        drug_power = 166000,
    },
    bestbuds_sourgummies        = {
        requires   = {},
        drug       = "weed",
        drug_power = 166000,
    },
}