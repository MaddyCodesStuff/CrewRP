Config                  = {}

-- Change the washed_stone inside of the database to be mineral ore

Config.MaxNodes         = 5 -- Maximum number of nodes between each cooldown
Config.Cooldown         = 5 * 60 * 1000 -- How many minutes between cooldown resets?

Config.MaxNodesSpawned  = 25 -- Maximum number of nodes that spawn at a time

Config.NodeModel        = 'prop_rock_4_cl_2'

Config.UseBigNode       = false -- If true, big nodes will spawn (they need to be blown up using tnt)
Config.BigNodeModel     = 'prop_rock_4_big2'

Config.SmeltFailChance  = 5
Config.MiningFailChance = 5

Config.LevelChanceBonus = 5 -- Multiplier for proficiency level bonus
Config.CooldownBonus    = 15000 -- how many miliseconds for cooldown bonus

Config.Node             = {
    coords = vector3(2939.9, 2777.5, 39.29)
}

Config.Clothes          = {
    male   = {
        ["tshirt_2"]  = 1,
        ["ears_1"]    = 8,
        ["glasses_1"] = 15,
        ["torso_2"]   = 0,
        ["ears_2"]    = 2,
        ["glasses_2"] = 3,
        ["shoes_2"]   = 1,
        ["pants_1"]   = 75,
        ["shoes_1"]   = 51,
        ["bags_1"]    = 0,
        ["helmet_2"]  = 0,
        ["pants_2"]   = 7,
        ["torso_1"]   = 71,
        ["tshirt_1"]  = 59,
        ["arms"]      = 2,
        ["bags_2"]    = 0,
        ["helmet_1"]  = 0,
    },
    female = {
        ["tshirt_2"]  = 0,
        ["ears_1"]    = 8,
        ["glasses_1"] = 15,
        ["torso_2"]   = 0,
        ["ears_2"]    = 2,
        ["glasses_2"] = 3,
        ["shoes_2"]   = 1,
        ["pants_1"]   = 101,
        ["shoes_1"]   = 52,
        ["bags_1"]    = 0,
        ["helmet_2"]  = 0,
        ["pants_2"]   = 4,
        ["torso_1"]   = 73,
        ["tshirt_1"]  = 36,
        ["arms"]      = 0,
        ["bags_2"]    = 0,
        ["helmet_1"]  = 0,
    }
}

Config.MiningMinerals   = {
    {
        name    = 'washed_stone',
        chance  = 50,
        maximum = 5,
        bonus   = 2,
    },
    {
        name    = 'clay',
        chance  = 100,
        maximum = 10,
        bonus   = 2,
    },
}

Config.Smelting         = {
    coords = { x = 1075.98, y = -1978.72, z = 31.47 },
    item   = 'washed_stone',
    label  = 'Mineral Ore',
}

Config.SmeltingMinerals = {
    {
        name    = 'diamond',
        chance  = 5,
        maximum = 2,
        bonus   = 2,
    },
    {
        name    = 'gold',
        chance  = 15,
        maximum = 5,
        bonus   = 2,
    },
    {
        name    = 'iron',
        chance  = 25,
        maximum = 10,
        bonus   = 2,
    },
    {
        name    = 'copper',
        chance  = 50,
        maximum = 20,
        bonus   = 2,
    },
}