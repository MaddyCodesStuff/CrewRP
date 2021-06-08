Config                      = {}

Config.MaxNodesSpawned      = 50
Config.NodeModel            = 'prop_grapes_01'

Config.HarvestingTime       = 5000

Config.MaxNodes             = 5 -- Maximum number of nodes between each cooldown
Config.Cooldown             = 5 * 60 * 1000 -- How many minutes between cooldown resets?

Config.HarvestingFailChance = 5 -- Can the player fail at harvesting?

Config.LevelChanceBonus     = 5 -- Multiplier for proficiency level bonus
Config.CooldownBonus        = 15000 -- How many miliseconds for cooldown bonus

Config.Node                 = {
    coords = vector3(-1925.08, 1918.7, 169.18)
}

Config.HarvestingMaterials  = {
    {
        name    = 'grapes',
        chance  = 60,
        maximum = 2,
    },
}

Config.SellPoints           = {
    {
        pos   = { x = -1481.46, y = -377.71, z = 39.16 },
        items = {
            {
                name    = 'fresh_bottle',
                label   = 'Fresh Wine',
                price   = 50,
                maximum = 10,
            },
            {
                name    = 'middle_bottle',
                label   = 'Middle-aged Wine',
                price   = 150,
                maximum = 10,
            },
            {
                name    = 'fine_bottle',
                label   = 'Fine Wine',
                price   = 250,
                maximum = 10,
            },
        },
    },
    {
        pos   = { x = -1222.64, y = -912.93, z = 11.33 },
        items = {
            {
                name    = 'fresh_bottle',
                label   = 'Fresh Wine',
                price   = 50,
                maximum = 10,
            },
            {
                name    = 'middle_bottle',
                label   = 'Middle-aged Wine',
                price   = 150,
                maximum = 10,
            },
            {
                name    = 'fine_bottle',
                label   = 'Fine Wine',
                price   = 250,
                maximum = 10,
            },
        },
    },
    {
        pos   = { x = -2963.11, y = 387.31, z = 13.04 },
        items = {
            {
                name    = 'fresh_bottle',
                label   = 'Fresh Wine',
                price   = 50,
                maximum = 10,
            },
            {
                name    = 'middle_bottle',
                label   = 'Middle-aged Wine',
                price   = 150,
                maximum = 10,
            },
            {
                name    = 'fine_bottle',
                label   = 'Fine Wine',
                price   = 250,
                maximum = 10,
            },
        },
    },
    {
        pos   = { x = -165.8, y = 6321.17, z = 30.6 },
        items = {
            {
                name    = 'fresh_bottle',
                label   = 'Fresh Wine',
                price   = 50,
                maximum = 10,
            },
            {
                name    = 'middle_bottle',
                label   = 'Middle-aged Wine',
                price   = 150,
                maximum = 10,
            },
            {
                name    = 'fine_bottle',
                label   = 'Fine Wine',
                price   = 250,
                maximum = 10,
            },
        },
    },
    {
        pos   = { x = 1387.91, y = 3607.57, z = 32.98 },
        items = {
            {
                name    = 'fresh_bottle',
                label   = 'Fresh Wine',
                price   = 50,
                maximum = 10,
            },
            {
                name    = 'middle_bottle',
                label   = 'Middle-aged Wine',
                price   = 150,
                maximum = 10,
            },
            {
                name    = 'fine_bottle',
                label   = 'Fine Wine',
                price   = 250,
                maximum = 10,
            },
        },
    },
    {
        pos   = { x = 1130.57, y = -979.73, z = 45.42 },
        items = {
            {
                name    = 'fresh_bottle',
                label   = 'Fresh Wine',
                price   = 50,
                maximum = 10,
            },
            {
                name    = 'middle_bottle',
                label   = 'Middle-aged Wine',
                price   = 150,
                maximum = 10,
            },
            {
                name    = 'fine_bottle',
                label   = 'Fine Wine',
                price   = 250,
                maximum = 10,
            },
        },
    }
}

-- This is for a single bottle of wine
Config.FineWine             = {
    item        = 'fine_bottle',
    name        = 'Fine Wine',
    processing  = 10000, -- How long does the process take ? (In milliseconds)
    pos         = { x = -1880.96, y = 2063.07, z = 135.92 },
    glasses     = 25,
    drunk       = 160000, -- How much drunk level should it give you?
    thirst      = 10000, -- How much thirst should it recover?
    ingredients = {
        {
            name     = 'middle_bottle',
            quantity = 1,
        },
        {
            name     = 'grapes',
            quantity = 35,
        },
    }
}

Config.Middle               = {
    item        = 'middle_bottle',
    name        = 'Middle-aged Wine',
    processing  = 5000, -- How long does the process take ? (In milliseconds)
    pos         = { x = -1879.51, y = 2062.49, z = 135.92 },
    glasses     = 25,
    drunk       = 135000, -- How much drunk level should it give you?
    thirst      = 10000, -- How much thirst should it recover?
    ingredients = {
        {
            name     = 'fresh_bottle',
            quantity = 1,
        },
        {
            name     = 'grapes',
            quantity = 25,
        },
    }
}

Config.Fresh                = {
    item         = 'fresh_bottle',
    name         = 'Fresh Wine',
    processing   = 2500, -- How long does the process take ? (In milliseconds)
    pos          = { x = -1878.15, y = 2061.97, z = 135.92 },
    glasses      = 25,
    drunk        = 160000, -- How much drunk level should it give you?
    poisonChance = 10,
    poison       = 240000,
    thirst       = 10000, -- How much thirst should it recover?
    ingredients  = {
        {
            name     = 'grapes',
            quantity = 15,
        },
    }
}