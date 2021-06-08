Config              = {}

Config.DrawDistance = 100.0
Config.MarkerType   = 27
Config.MarkerSize   = { x = 1.5, y = 1.5, z = 3.0 }
Config.MarkerColor  = { r = 255, g = 255, b = 255, a = 1 }

Config.Shops        = {
    ['LTD1'] = {
        -- Blip = {
        -- 	Coords  = vector3(425.1, -979.5, 30.7),
        -- 	Sprite  = 60,
        -- 	Display = 4,
        -- 	Scale   = 1.2,
        -- 	Colour  = 29
        -- },

        Pos         = { x = -48.06, y = -1752.68, z = 30.7 },

        name        = 'LTD Gasoline - Davis Ave',

        Cloakroom   = { x = -44.98, y = -1751.06, z = 28.43 },
        -- Inventory = {x = -41.09, y = -1751.53, z = 28.43},
        PanicButton = { x = -46.43, y = -1757.53, z = 28.42 },
    },
    ['LTD2'] = {
        -- Blip = {
        -- 	Coords  = vector3(425.1, -979.5, 30.7),
        -- 	Sprite  = 60,
        -- 	Display = 4,
        -- 	Scale   = 1.2,
        -- 	Colour  = 29
        -- },

        Pos         = { x = 1157.61, y = -320.01, z = 30.7 },

        name        = 'LTD Gasoline - Mirror Park Blvd',

        Cloakroom   = { x = 1160.74, y = -316.91, z = 68.21 },
        -- Inventory = {x = -41.09, y = -1751.53, z = 28.43},
        PanicButton = { x = 1164.62, y = -322.3, z = 68.21 },
    },
    ['LTD3'] = {
        -- Blip = {
        -- 	Coords  = vector3(425.1, -979.5, 30.7),
        -- 	Sprite  = 60,
        -- 	Display = 4,
        -- 	Scale   = 1.2,
        -- 	Colour  = 29
        -- },

        Pos         = { x = -711.01, y = -911.25, z = 19.22 },

        name        = 'LTD Gasoline - Palomino Ave',

        Cloakroom   = { x = -708.95, y = -907.3, z = 18.22 },
        -- Inventory = {x = -41.09, y = -1751.53, z = 28.43},
        PanicButton = { x = -706.11, y = -913.59, z = 18.22 },
    },
    ['LTD4'] = {
        -- Blip = {
        -- 	Coords  = vector3(425.1, -979.5, 30.7),
        -- 	Sprite  = 60,
        -- 	Display = 4,
        -- 	Scale   = 1.2,
        -- 	Colour  = 29
        -- },

        Pos         = { x = -1827.64, y = 793.31, z = 138.22 },

        name        = 'LTD Gasoline - Bahnam Canyon',

        Cloakroom   = { x = -1826.5, y = 796.96, z = 137.17 },
        -- Inventory = {x = -41.09, y = -1751.53, z = 28.43},
        PanicButton = { x = -1820.22, y = 794.3, z = 137.09 },
    },
    ['LTD5'] = {
        -- Blip = {
        -- 	Coords  = vector3(425.1, -979.5, 30.7),
        -- 	Sprite  = 60,
        -- 	Display = 4,
        -- 	Scale   = 1.2,
        -- 	Colour  = 29
        -- },

        Pos         = { x = -1827.64, y = 793.31, z = 138.22 },

        name        = 'LTD Gasoline - Grapeseed',

        Cloakroom   = { x = 1704.96, y = 4921.57, z = 41.06 },
        -- Inventory = {x = -41.09, y = -1751.53, z = 28.43},
        PanicButton = { x = 1698.07, y = 4922.89, z = 41.06 },
    },

}

Config.Uniforms     = {
    male   = {
        ['tshirt_1'] = 57, ['tshirt_2'] = 0,
        ['torso_1']  = 18, ['torso_2'] = 0,
        ['decals_1'] = 0, ['decals_2'] = 0,
        ['arms']     = 0,
        ['pants_1']  = 35, ['pants_2'] = 0,
        ['shoes_1']  = 25, ['shoes_2'] = 0,
        ['helmet_1'] = 76, ['helmet_2'] = 10
    },
    female = {
        ['tshirt_1'] = 1, ['tshirt_2'] = 0,
        ['torso_1']  = 45, ['torso_2'] = 0,
        ['decals_1'] = 0, ['decals_2'] = 0,
        ['arms']     = 0,
        ['pants_1']  = 35, ['pants_2'] = 0,
        ['shoes_1']  = 25, ['shoes_2'] = 0,
        ['helmet_1'] = 76, ['helmet_2'] = 10
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

