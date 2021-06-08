Config                          = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale                   = 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape = 8

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation          = { x = 170.43, y = -990.7, z = 30.09 }

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation          = { x = 427.33, y = -979.51, z = 30.2 }


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations         = {
    { type = "cleaning", coords = vector3(170.0, -1006.0, 29.34) },
    { type = "cleaning", coords = vector3(177.0, -1007.94, 29.33) },
    { type = "cleaning", coords = vector3(181.58, -1009.46, 29.34) },
    { type = "cleaning", coords = vector3(189.33, -1009.48, 29.34) },
    { type = "cleaning", coords = vector3(195.31, -1016.0, 29.34) },
    { type = "cleaning", coords = vector3(169.97, -1001.29, 29.34) },
    { type = "cleaning", coords = vector3(164.74, -1008.0, 29.43) },
    { type = "cleaning", coords = vector3(163.28, -1000.55, 29.35) },
    { type = "gardening", coords = vector3(181.38, -1000.05, 29.29) },
    { type = "gardening", coords = vector3(188.43, -1000.38, 29.29) },
    { type = "gardening", coords = vector3(194.81, -1002.0, 29.29) },
    { type = "gardening", coords = vector3(198.97, -1006.85, 29.29) },
    { type = "gardening", coords = vector3(201.47, -1004.37, 29.29) }
}

Config.Uniforms                 = {
    prison_wear = {
        male   = {
            ['tshirt_1'] = 57, ['tshirt_2'] = 0,
            ['torso_1']  = 5, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 5,
            ['pants_1']  = 3, ['pants_2'] = 7,
            ['shoes_1']  = 30, ['shoes_2'] = 1,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        },
        female = {
            ['tshirt_1'] = 34, ['tshirt_2'] = 0,
            ['torso_1']  = 247, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 15,
            ['pants_1']  = 3, ['pants_2'] = 15,
            ['shoes_1']  = 37, ['shoes_2'] = 3,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        },
    }
}
