Config                    = {}

Config.Locale             = 'en'

-- Set the time (in minutes) during the player is outlaw
Config.Timer              = 1

-- Set if show alert when player use gun
Config.GunshotAlert       = true

-- Set if show when player do carjacking
Config.CarJackingAlert    = false

-- Set if show when player fight in melee
Config.MeleeAlert         = false

-- In seconds
Config.BlipGunTime        = 120

-- Blip radius, in float value!
Config.BlipGunRadius      = 35.0

-- In seconds
Config.BlipMeleeTime      = 7

-- Blip radius, in float value!
Config.BlipMeleeRadius    = 50.0

-- EMS In seconds
Config.BlipEMSTime        = 300

-- Fire In seconds
Config.BlipFireTime       = 300

-- In seconds
Config.BlipJackingTime    = 10

-- Blip radius, in float value!
Config.BlipJackingRadius  = 50.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave  = true

-- Jobs in this table are considered as cops
Config.WhitelistedCops    = {
    'police',
    'journalist',
}

Config.ExplosiveHashes = {
    741814745, -- Sticky Bomb
    -1813897027, -- Grenade
    -1312131151, -- RPG
    -1420407917, -- Prox Mine
    -1169823560, -- Pipebomb
    -1568386805, -- Grenade Launcher
    1834241177, -- Railgun
    1672152130, -- Homing Launcher
    125959754, -- Compact Launcher
}

Config.WhitelistedWeapons = {
    'WEAPON_STUNGUN',
    'WEAPON_FLAREGUN',
    'WEAPON_FLARE',
    'WEAPON_SNOWBALL',
    'WEAPON_FIREWORK',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_STICKYBOMB',
    "WEAPON_SMOKEGRENADE",
    "WEAPON_BALL",
    "WEAPON_GRENADE",
    'WEAPON_PROXMINE',
    'WEAPON_PIPEBOMB',
    'WEAPON_RPG',
    'WEAPON_FIREWORKLAUNCHER',
    'WEAPON_RAILGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_COMPACTLAUNCHER',

}

Config.GunshotAlertDelay  = 10

-- Interior Hashes and Names --
Config.InteriorLocations = {
    ["Galaxy"] = {
        271617,
    },
    ["The FIB Building"] = {
        136449,
        136705,
        58882,
        136449,
        136193,
        135937,
        135425,
    },
    ["Pillbox"] = {
        537601,
        547841,
    },
    ["the Diamond Casino"] = {
        123138,
    },
    ["MRPD"] = {
        537345,
    },
    ["PDM"] = {
        7170,
    },
    ["the Real Estate Offices"] = {
        548353,
    },
    ["the Maze Bank Arena"] = {
        78338,
    },
    ["the Vanilla Unicorn"] = {
        197121,
    },
    ["the Davis Fire Station"] = {
        198913,
    },
    ["the Taco Farmer"] = {
        548097,
    },
    ["Cindy's Flowers"] = {
        551937,
    },
    ["Burgershot"] = {
        548609,
    },
    ["Bahama Mama's"] = {
        168961,
    },
    ["Pearls"] = {
        536065,
    },
    ["Quinn's Bakery"] = {
        124930,
    },
    ["the Lifeinvader Building"] = {
        3330,
    },
    ["Vangelico's"] = {
        82690,
    },
    ["City Hall"] = {
        541697,
    },
    ["the Bowling Alley"] = {
        152322,
    },
    ["Here's the Scoop Ice Cream Parlor"] = {
        535809,
    },
    ["the Coffee Shop"] = {
        547073,
    },
    ["Tequi-la-la"] = {
        233729,
    },
    ["Split Sides"] = {
        550401,
    },
    ["Pacific Standard Bank"] = {
        139265,
    },
    ["Auto Exotic"] = {
        126210,
    },
    ["the Mineshaft"] = {
        202241,
        258561,
    },
    ["Humane Labs"] = {
        184321,
    },
    ["Rex's Diner"] = {
        150018,
    },
    ["Larry's Automotive"] = {
        152066,
    },
    ["Hookie's"] = {
        126466,
    },
    ["Sandy Medical"] = {
        544769,
    },
    ["BCSO"] = {
        200193,
    },
    ["Pop's Diner"] = {
        537089,
    },
    ["Benny's"] = {
        125442,
    },
    ["D&D Automotive"] = {
        551169,
        179457,
    },
    ["Blaine County Savings"] = {
        179969,
    },
    ["Paleto Medical"] = {
        542209,
    },
    ["Helmuts European Auto"] = {
        547329,
    },
    ["SAHP"] = {
        132866,
    },
    ["the Bayview Lodge"] = {
        544001,
    },
    ["Legion Bank and Trust"] = {
        137985,
    },
    ["Capital Fire Station"] = {
        251393,
    },
    -- Teleport Interiors --
    ["the Morgue"] = {
        60418,
    },
    ["Little Seoul mechanic shop"] = {
        246529,
    },
    ["Maze Bank Tower"] = {
        254465,
        257537,
    },
    ["the Data & Records Building"] = {
        270337,
    },
    ["a LSIA Hanger"] = {
        260353,
        163585,
    },
    ["a building in Harmony"] = {
        246273,
    },
    ["a Grain Storage Warehouse off Senora Freeway"] = {
        247041,
    },
    ["a College Campus Building"] = {
        247297,
    },
    ["a Building off Cortes Street"] = {
        247809,
    },
    ["the Marina Office"] = {
        246785,
    },
    ["a Warehouse on Marina Drive"] = {
        235521,
    },
    ["a Large Warehouse near LSIA"] = {
        236033,
    },
    ["a abandoned building in Grapeseed"] = {
        247553,
    },
    ["the Union Depository"] = {
        134913,
        119042,
    },
    ["a movie Director's Office"] = {
        164865,
    },
    ["the Arcadius Business Center"] = {
        134657,
        253441,
        254209,
        238337,
    },
    ["the Innocence Blvd Car wash"] = {
        149249,
    },
    ["a Marathon Ave Garage"] = {
        148737,
    },
    ["a South Boulevard Del Perro Garage"] = {
        146433,
    },
    ["Fort Zancudo"] = {
        269313,
    },
    ["the Grand Senora Desert"] = {
        270081,
    },
    -- Everything below this point is just for the Tunnels under the city, I hated getting these so much. --
    ["the Sewers"] ={
        14082,
        42242,
        45826,
        55810,
        57346,
        109826,
        10498,
        71938,
        43266,
        29954,
        26114,
    },
    ["the subway tunnels near Pillbox"] ={
        51714,
        91138,
        98562,
        73730,
        82946,
        78850,
        88322,
        105986,
        63490,
        65026,
        113154,
        38914,
        19970,
        7426,
        89346,
        5378,
        57602,
        67586,
        9986,
        72194,
        103426,
        57858,
        94466,
        41218,
        68354,
        105474,
    },
    ["the subway maintenance tunnel"] = {
        23298,
        59906,
        36610,
        120322,
    },
    ["the subway tunnels near Rockford Plaza"] = {
        59394,
        102402,
        65794,
        82434,
        47618,
        13570,
        11010,
        72962,
        20738,
        23810,
        64258,
        33794,
        44546,
        63234,
        2818,
    },
    ["the Rockford Plaza Subway Station"] = {
        4610,
        5634,
        32770,
        233473,
    },
    ["the subway tunnels near City Hall"] = {
        67330,
        48898,
        107522,
        101890,
        74498,
        42498,
        41730,
    },
    ["the subway tunnels near Rockford Hills"] = {
        96514,
        87298,
        45314,
        99330,
        37634,
        18434,
        92418,
        84738,
        8962,
        14594,
        77826,
        17410,
        51458,
        120066,
        68098,
        111874,
        35842,
        57090,
        27906,
        76034,
        75266,
    },
    ["the Rockford Hills Subway Station"] = {
        84482,
        91650,
        166913,
    },
    ["the subway tunnels near Del Perro"] = {
        18946,
        12290,
        2306,
        52738,
        24322,
        115202,
        110594,
        118786,
        6402,
        107010,
        38146,
        116738,
        116482,
        26882,
        38402,
        770,
        117250,
        4098,
        54274,
        54530,
        109058,
        43010,
        99586,
        53762,
        48386,
        91906,
        50434,
        58370,
        109314,
        85506,
        93954,
        65282,
        66818,
    },
    ["the Del Perro Subway Station"] = {
        98306,
        5122,
        168705,
    },
    ["the subway tunnels near Little Seoul"] = {
        74242,
        58114,
        44802,
        103682,
        44290,
        68610,
        24066,
        100098,
        92930,
        43778,
        92162,
        75522,
        56322,
        25346,
        46082,
        120578,
        97794,
        114434,
        47106,
        30210,
        28930,
        107266,
        36098,
        106754,
        21506,
        84994,
        86786,
        56066,
        78594,
        23554,
        54786,
        46594,
        1026,
        71426,
        52994,
        14850,
        56834,
        31234,
        83458,
        81410,
        55298,
    },
    ["the LIttle Seoul Subway Station"] = {
        68866,
        20482,
        167681,
    },
    ["the subway tunnels near the Scrapyard"] = {
        54018,
        33538,
        27394,
        29186,
        49666,
        87042,
        83714,
        89858,
        77570,
        79618,
        48642,
        109570,
        84226,
        34050,
    },
    ["the subway tunnels near LSIA"] = {
        4354,
        45058,
        12546,
        16642,
        56578,
        8450,
        102658,
        26626,
        6658,
        69378,
        39170,
        51970,
        63746,
        62210,
        78082,
        25858,
        53506,
        81922,
        77058,
        73218,
        11778,
        93698,
        95746,
        26370,
        67842,
        70658,
        40706,
        112130,
        76546,
        98050,
        32514,
        9218,
        15362,
        119554,
        11522,
        44034,
        51202,
        24834,
        34562,
        79362,
        88578,
        59650,
        40706,
    },
    ["the Northern LSIA Subway Station"] = {
        61698,
        65538,
        164097,
    },
    ["the Southern LSIA Subway Station"] = {
        77314,
        108546,
        163329,
    }
}