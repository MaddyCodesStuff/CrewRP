Config = {}

Config.CopsRequired = 3

Config.MaxNodesSpawned = 50 -- Maximum number of nodes that spawn at a time

Config.NodeModel = 'v_ind_cs_toolbox2'

Config.cooldown = 15

Config.Heists = {
    {--Vespucci
        loc = 'Vespucci',
        type = 'trapForeman',
        start = vec3(-471.14, -864.99, 22.97),
        Nodes = vec3(-461.09, -994.24, 23.55),
        robberyTime = 8,
    },
    {--Power Street Lower
        loc = 'lowerPower',
        type = 'disableCrane',
        start = vec3(-115.11, -1036.91, 26.40),
        Nodes = vec3(-147.18, -1037.02, 27.27),
        robberyTime = 5,
    },
    {--Power Street Upper
        loc = 'upperPower',
        type = 'disableCrane',
        start = vec3(131.29, -347.19, 42.36),
        Nodes = vec3(91.31, -387.25, 41.03),
        robberyTime = 5,
    },
}

Config.Fence = {
    {--Hawick UTool
        pos = vec3(244.20, -267.70, 53.05), 
    },
    {--Senora UTool
        pos = vec3(2752.26, 3488.87, 54.67), 
    },
    {--Paleto Pat's Keys
    pos = vec3(163.39, 6650.84, 30.68), 
    },
}

Config.guarenteedItems = {
    electronics = {price = 25, min = 5, max = 10},
    metal = {price = 25, min = 6, max = 10}, 
    plastic = {price = 25, min = 5, max = 10},
}

Config.chanceItems = {
    battery = {min = 1, max = 1, itemNumber = 1},
    drill = {min = 1, max = 1, itemNumber = 2},
    wrench = {min = 1, max = 2, itemNumber = 3},
    screwdriver = {min = 1, max = 4, itemNumber = 4},
    sandpaper = {min = 5, max = 15, itemNumber = 5},
    screws = {min = 3, max = 10, itemNumber = 6},
    nails = {min = 3, max = 10, itemNumber = 7},
    boltcutter = {min = 1, max = 1, itemNumber = 8},
    padlock = {min = 1, max = 3, itemNumber = 9},
    caulkgun = {min = 1, max = 2, itemNumber = 10},
    copperpipe = {min = 3, max = 10, itemNumber = 11},
    plier = {min = 1, max = 2, itemNumber = 12},
    saw = {min = 1, max = 2, itemNumber = 13},
    washers = {min = 1, max = 3, itemNumber = 14},
    socketwrench = {min = 1, max = 3, itemNumber = 15},
    layeredmetal = {min = 1, max = 1, itemNumber = 16},
    layeredplastic = {min = 1, max = 1, itemNumber = 17},
    ironplate = {min = 1, max = 1, itemNumber = 18},
    goldplate = {min = 1, max = 1, itemNumber = 19},
    diamondplate = {min = 1, max = 1, itemNumber = 20},
    beer_1 = {min = 6, max = 12, itemNumber = 21},
    blowtorch = {min = 1, max = 1, itemNumber = 22},    
    razer = {min = 1, max = 1, itemNumber = 23},
    wood = {min = 5, max = 10, itemNumber = 24},
    weapon_crowbar = {min = 1, max = 1, itemNumber = 25},
    weapon_hammer = {min = 1, max = 1, itemNumber = 26},
    weapon_wrench = {min = 1, max = 1, itemNumber = 27},
    weapon_breachhammer = {min = 1, max = 1, itemNumber = 28},
    weapon_broom = {min = 1, max = 1, itemNumber = 29},
    weapon_pickaxe = {min = 1, max = 1, itemNumber = 30},
    weapon_pipe = {min = 1, max = 1, itemNumber = 31},
    weapon_screwdriver = {min = 1, max = 1, itemNumber = 32},
    weapon_shovel = {min = 1, max = 1, itemNumber = 33},
    weapon_sledgehammer = {min = 1, max = 1, itemNumber = 34},
    hoseline = {min = 1, max = 3, itemNumber = 35},
}

Config.fenceItems = {
    electronics = 5,
    metal = 5, 
    plastic = 5,
    battery = 150,
    drill = 200,
    wrench = 100,
    screwdriver = 25,
    sandpaper = 10,
    screws = 15,
    nails = 15,
    boltcutter = 200,
    padlock = 10,
    caulkgun = 10,
    copperpipe = 15,
    plier = 10,
    saw = 50,
    washers = 20,
    socketwrench = 75,
    beer_1 = 5,
    blowtorch = 500,    
    razer = 60,
    wood = 25,
    hoseline = 20,
}