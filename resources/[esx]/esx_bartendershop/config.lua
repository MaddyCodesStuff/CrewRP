Config              = {}
Config.DrawDistance = 10
Config.Size         = { x = 1.0, y = 1.0, z = 1.0 }
Config.Color        = { r = 255, g = 255, b = 255 }
Config.Type         = 27
Config.Locale       = 'en'
Config.MarkerOffset = 1

-- Prices Have to be edited from the "shops" table from the database, or they only apply on a resource reload

Config.Items        = {
    beer_1       = {
        label = 'Domestic Beer',
        item  = 'beer_1',
        price = 4,
        limit = 10,
        drunk = 50000,
    },
    beer_2       = {
        label = 'Imported Beer',
        item  = 'beer_2',
        price = 4,
        limit = 10,
        drunk = 50000,
    },
    beer_3       = {
        label = 'Craft Beer',
        item  = 'beer_3',
        price = 8,
        limit = 10,
        drunk = 50000,
    },
    bourbon      = {
        label = 'Bourbon',
        item  = 'bourbon',
        price = 50,
        limit = 10,
        drunk = 400000,
    },
    rye          = {
        label = 'Rye Whiskey',
        item  = 'rye',
        price = 60,
        limit = 10,
        drunk = 510000,
    },
    scotch       = {
        label = 'Scotch Whisky',
        item  = 'scotch',
        price = 75,
        limit = 10,
        drunk = 675000,
    },
    tequila      = {
        label = 'Tequila',
        item  = 'tequila',
        price = 35,
        limit = 10,
        drunk = 450000,
    },
    moonshine    = {
        label        = 'Moonshine',
        item         = 'moonshine',
        price        = 50,
        limit        = 10,
        drunk        = 750000,
        poisonChance = 25,
        poison       = 500000,
    },
    vodka        = {
        label = 'Vodka',
        item  = 'vodka',
        price = 60,
        limit = 10,
        drunk = 650000,
    },
    gin          = {
        label = 'Gin',
        item  = 'gin',
        price = 50,
        limit = 10,
        drunk = 400000,
    },
    fresh_glass  = {
        label = 'Fresh Wine',
        item  = 'fresh_glass',
        price = 4,
        limit = 10,
        drunk = 55000,
    },
    middle_glass = {
        label = 'Middle Aged Wine',
        item  = 'middle_glass',
        price = 20,
        limit = 10,
        drunk = 135000,
    },
    fine_glass   = {
        label = 'Fine Wine',
        item  = 'fine_glass',
        price = 60,
        limit = 10,
        drunk = 160000,
    },
    martini = {
        label = 'Martini',
        item = 'martini',
        price = 30,
        limit = 10,
        drunk = 250000,
    },
    shirley_temple = {
        label = 'Shirley Temple',
        item = 'shirley_temple',
        price = 20,
        limit = 10,
        thirst = 100000,
        drunk = 0,
    },
    margarita = {
        label = 'Margarita',
        item = 'margarita',
        price = 20,
        limit = 10,
        drunk = 300000,
    },
    grand_cru = {
        label = 'Vintage Bottle',
        item = 'grand_cru',
        price = 50,
        limit = 10,
        drunk = 500000,
    },
    rum = {
        label = 'Rum',
        item = 'rum',
        price = 50,
        limit = 10,
        drunk = 400000,
    },
}

-- New Items Have to be added to the "shops" table from the database, or they only apply on a resource reload
local BoozeToSell   = {
    Config.Items.beer_1,
    Config.Items.beer_2,
    Config.Items.beer_3,
    Config.Items.bourbon,
    Config.Items.rye,
    Config.Items.scotch,
    Config.Items.tequila,
    Config.Items.vodka,
    Config.Items.gin,
    Config.Items.rum,
    Config.Items.martini,
    Config.Items.margarita, 

}

local SnacksToSell  = {
    {
        label = 'Big Cheese Chips',
        item  = 'cheesebows',
        price = 2,
        limit = 10,
    },
    {
        label = 'SuperSalt Chips',
        item  = 'chips',
        price = 2,
        limit = 10,
    },
    {
        label = 'Habanero Chips',
        item  = 'chips2',
        price = 2,
        limit = 10,
    },
    {
        label = 'Sticky Ribs Chips',
        item  = 'chips3',
        price = 2,
        limit = 10,
    },
    {
        label = 'Sandwich',
        item  = 'bread',
        price = 5,
        limit = 10,
    },
    {
        label = 'Pizza',
        item  = 'pizza',
        price = 15,
        limit = 10,
    },
}

Config.Zones        = {
    Tequilalala           = {
        Items     = BoozeToSell,
        BlipColor = 47,
        Blip      = 93,
        BlipName  = 'Bar',
        ShowBlip  = true,
        Pos       = {
            { x = -562.16, y = 285.49, z = 82.18 },
        }
    },
    Tequilalala_2         = {
        Items    = BoozeToSell,
        ShowBlip = false,
        Pos      = {
            { x = -565.09, y = 287.07, z = 85.38 },
        }
    },
    YellowJackInn         = {
        Items     = BoozeToSell,
        BlipColor = 47,
        Blip      = 93,
        BlipName  = 'Bar',
        ShowBlip  = true,
        Pos       = {
            { x = 1982.67, y = 3053.21, z = 47.22 },
        }
    },
    GalaxyNightclub           = {
        Items     = BoozeToSell,
        BlipColor = 7,
        Blip      = 136,
        BlipName  = 'Nightclub',
        ShowBlip  = true,
        Pos       = {
            { x = -133.77, y = -1273.27, z = 30.32 },
        }
    },
    BahamaMamas           = {
        Items     = BoozeToSell,
        BlipColor = 7,
        Blip      = 136,
        BlipName  = 'Nightclub',
        ShowBlip  = true,
        Pos       = {
            { x = -1391.64, y = -604.81, z = 30.33 },
        }
    },
    VanillaUnicorn        = {
        Items     = BoozeToSell,
        BlipColor = 7,
        Blip      = 136,
        BlipName  = 'Nightclub',
        ShowBlip  = true,
        Pos       = {
            { x = 129.34, y = -1283.96, z = 29.27 },
        }
    },
    Underground_1         = {
        Items    = BoozeToSell,
        ShowBlip = false,
        Pos      = {
            { x = -1576.8, y = -3016.91, z = -79.01 },
        }
    },
    Underground_2         = {
        Items    = BoozeToSell,
        ShowBlip = false,
        Pos      = {
            { x = -1584.21, y = -3014.74, z = -76.0 },
        }
    },
    Underground_3         = {
        Items    = BoozeToSell,
        ShowBlip = false,
        Pos      = {
            { x = -1610.72, y = -3018.76, z = -75.21 },
        }
    },
    Tequilalala_snacks    = {
        Items    = SnacksToSell,
        ShowBlip = false,
        Pos      = {
            { x = -561.64, y = 289.79, z = 82.18 },
        }
    },
    Tequilalala_2_snacks  = {
        Items    = SnacksToSell,
        ShowBlip = false,
        Pos      = {
            { x = -565.26, y = 284.68, z = 85.38 },
        }
    },
    YellowJackInn_snacks  = {
        Items    = SnacksToSell,
        ShowBlip = false,
        Pos      = {
            { x = 1984.17, y = 3049.52, z = 47.22 },
        }
    },
    BahamaMamas_snacks    = {
        Items    = SnacksToSell,
        ShowBlip = false,
        Pos      = {
            { x = -1390.35, y = -607.31, z = 30.33 },
        }
    },
    VanillaUnicorn_snacks = {
        Items    = SnacksToSell,
        ShowBlip = false,
        Pos      = {
            { x = 132.66, y = -1287.55, z = 29.27 },
        }
    },
    Undergound_Snack_1    = {
        Items    = SnacksToSell,
        ShowBlip = false,
        Pos      = {
            { x = -1579.77, y = -3017.12, z = -79.01 },
        }
    },
    Undergound_Snack_2    = {
        Items    = SnacksToSell,
        ShowBlip = false,
        Pos      = {
            { x = -1585.05, y = -3012.13, z = -76.01 },
        }
    },
}