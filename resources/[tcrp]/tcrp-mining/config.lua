Config                  = {}

-- Change the washed_stone inside of the database to be mineral ore

Config.MaxNodes         = 5 -- Maximum number of nodes between each cooldown
Config.Cooldown         = 5 * 60 * 1000 -- How many minutes between cooldown resets?

Config.MaxNodesSpawned  = 25 -- Maximum number of nodes that spawn at a time

Config.NodeModel        = 'prop_rock_4_cl_2'
Config.CooldownBonus    = 15000 -- how many miliseconds for cooldown bonus

Config.Mine = {
    coords = vec3(-544.02, 1984.27, 127.01),
}

Config.Blips = {
    {
        pos = vec3(-596.41, 2088.56, 131.41),
        Text = "Hobby - Mine",
        blip = 566,
        colour = 81,
        onMap = true
    },
    {
        pos = vec3(1077.96, -1965.83, 31.01), 
        Text = "Hobby - Mining Smelt/Sell",
        blip = 566,
        colour = 81,
        onMap = true
    }
}

Config.Node             = {
    node1 = {x = -543.10, y = 1982.83, z = 127.03},
    node2 = {x = -527.92, y = 1978.77, z = 126.86},
    node3 = {x = -510.98, y = 1980.02, z = 126.21},
    node4 = {x = -497.63, y = 1979.67, z = 125.60},
    node5 = {x = -483.38, y = 1985.48, z = 124.18},
    node6 = {x = -469.63, y = 1992.93, z = 123.62},
    node7 = {x = -459.47, y = 1988.50, z = 123.57},
    node8 = {x = -447.81, y = 2013.84, z = 123.55},
    node9 = {x = -449.73, y = 2029.38, z = 123.38},
    node10 = {x = -461.71, y = 2057.42, z = 121.70},
    node11 = {x = -469.79, y = 2072.18, z = 120.48},
    node12 = {x = -472.84, y = 2089.47, z = 120.07},
    node13 = {x = -543.64, y = 1971.78, z = 126.99},
    node14 = {x = -540.20, y = 1959.54, z = 126.64},
    node15 = {x = -539.39, y = 1946.39, z = 126.02},
    node16 = {x = -534.53, y = 1935.23, z = 125.17},
    node17 = {x = -538.19, y = 1912.78, z = 123.50},
    node18 = {x = -537.85, y = 1907.17, z = 123.22},
    node19 = {x = -539.25, y = 1905.08, z = 123.14},
    node20 = {x = -529.31, y = 1898.98, z = 122.90},
    node21 = {x = -520.69, y = 1897.25, z = 122.38},
    node22 = {x = -505.16, y = 1892.47, z = 121.28},
    node23 = {x = -493.13, y = 1895.16, z = 120.38},
    node24 = {x = -485.68, y = 1893.69, z = 119.98},
    node25 = {x = -543.50, y = 1903.82, z = 123.08},
    node26 = {x = -550.66, y = 1893.56, z = 123.04},
    node27 = {x = -558.21, y = 1891.05, z = 123.03},
    node28 = {x = -562.37, y = 1888.89, z = 123.03},
    node29 = {x = -564.64, y = 1886.16, z = 123.04},
}

Config.Smelting         = {
    coords = vec3(1075.98, -1978.72, 30.48),
    item   = 'washed_stone',
    label  = 'Mineral Ore',
}

Config.prices = {
	copper = 5,
	iron = 17,
	gold = 50,
	diamond = 100, 
} 
Config.Sell = {
    pos = vec3(1079.61, -1948.85, 30.08), 
    type = "legal",
    sellText = "Fish Market",
    blip = 317,
    colour = 69,
}

Config.MineTime = {a = 100, b = 1000}