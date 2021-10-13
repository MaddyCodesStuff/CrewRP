Config             = {}

Config.RegrowDelay = 600000 --Time delay on regrow loop.

Config.ZoneTypes   = {
    weed    = {
        object           = "prop_weed_01",
        spawn_object     = true,
        gives_item       = "marijuana_eighth",
        gives_count      = 1,
        harvest_scenario = 'world_human_gardener_plant',
    },
    shrooms = {
        object           = "prop_stoneshroom1",
        spawn_object     = true,
        gives_item       = "shrooms_fresh",
        gives_count      = 1,
        harvest_scenario = 'world_human_gardener_plant',
    },
    peaches = {
        object       = 'prop_veg_crop_orange',
        spawn_object = false,
        gives_item   = "peach",
        gives_count  = 1,
    },
    apples  = {},
    lettuce = {
        object       = "prop_veg_crop_03_cab",
        spawn_object = true,
    },
}

Config.Zones       = {
    weed1    = {
        type         = 'weed',
        coords       = vector3(298.07, 4311.33, 46.57),
        radius       = 25.0,
        crops        = {},
        crop_limit   = 15,
        min_distance = 4.0,
    },
    weed2    = {
        type         = 'weed',
        coords       = vector3(1389.27, 6348.5, 32.0),
        radius       = 20.0,
        crops        = {},
        crop_limit   = 10,
        min_distance = 4.0,
    },
    weed3    = {
        type         = 'weed',
        coords       = vector3(-579.04, 5845.53, 32.0),
        radius       = 20.0,
        crops        = {},
        crop_limit   = 15,
        min_distance = 4.0,
    },
    weed4    = {
        type         = 'weed',
        coords       = vector3(1842.41, 6587.41, 54.0),
        radius       = 30.0,
        crops        = {},
        crop_limit   = 35,
        min_distance = 5.0,
    },
    peaches1 = {
        type   = 'peaches',
        coords = vector3(235.52, 6512.7, 31.22),
        radius = 30.0,
        crops  = {},
    },
}