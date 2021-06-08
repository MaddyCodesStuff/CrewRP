Config              = {}

Config.DrawDistance = 100.0
Config.MarkerType   = 27
Config.MarkerSize   = { x = 1.5, y = 1.5, z = 3.0 }
Config.MarkerColor  = { r = 255, g = 255, b = 255, a = 1 }

Config.LicenseTypes = {
    { label = "Hunting License", value = 'hunting' },
}

Config.Shops        = {
    ['Ranger'] = {
        -- Blip = {
        -- 	Coords  = vector3(425.1, -979.5, 30.7),
        -- 	Sprite  = 60,
        -- 	Display = 4,
        -- 	Scale   = 1.2,
        -- 	Colour  = 29
        -- },

        Pos         = { x = 383.56, y = 796.53, z = 256.88 },

        name        = 'Beaver Bush Ranger Station',

        Cloakroom   = { x = 386.19, y = 796.64, z = 189.38 },
        -- Inventory = {x = -41.09, y = -1751.53, z = 28.43},
        PanicButton = { x = -46.43, y = -1757.53, z = 28.42 },
    },
}

Config.Uniforms     = {
    male   = {
        ['tshirt_1'] = 129, ['tshirt_2'] = 0,
        ['torso_1']  = 334, ['torso_2'] = 0,
        ['decals_1'] = 0, ['decals_2'] = 0,
        ['arms']     = 0,
        ['pants_1']  = 9, ['pants_2'] = 7,
        ['shoes_1']  = 12, ['shoes_2'] = 6,
        ['chain_1']  = 0, ['chain_2'] = 0,
        ['helmet_1'] = 152, ['helmet_2'] = 1
    },
    female = {
        ['tshirt_1'] = 159, ['tshirt_2'] = 0,
        ['torso_1']  = 349, ['torso_2'] = 0,
        ['decals_1'] = 0, ['decals_2'] = 0,
        ['arms']     = 14,
        ['pants_1']  = 133, ['pants_2'] = 1,
        ['shoes_1']  = 52, ['shoes_2'] = 0,
        ['chain_1']  = 0, ['chain_2'] = 0,
        ['helmet_1'] = 151, ['helmet_2'] = 1
    },
}

Config.Items        = {
    ['water'] = {
        name  = 'Water',
        item  = 'water',
        price = 5,
        max   = 10,
    },
    ['pizza'] = {
        name  = 'Pizza',
        item  = 'pizza',
        price = 15,
        max   = 10,
    },
    ['bread'] = {
        name  = 'Bread',
        item  = 'bread',
        price = 5,
        max   = 10,
    },
}

