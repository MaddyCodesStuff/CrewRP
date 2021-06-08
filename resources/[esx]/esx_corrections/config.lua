Config              = {}

Config.DrawDistance = 100.0
Config.MarkerType   = 27
Config.MarkerSize   = { x = 1.5, y = 1.5, z = 3.0 }
Config.MarkerColor  = { r = 255, g = 255, b = 255, a = 1 }

Config.Shops        = {
    ['Corrections'] = {
        -- Blip = {
        -- 	Coords  = vector3(425.1, -979.5, 30.7),
        -- 	Sprite  = 60,
        -- 	Display = 4,
        -- 	Scale   = 1.2,
        -- 	Colour  = 29
        -- },

        Pos         = { x = 383.56, y = 796.53, z = 256.88 },

        name        = 'Corrections Office',

        Cloakroom   = { x = 1765.22, y = 2591.22, z = 48.71 },
        PanicButton = { x = 1843.39, y = 2589.84, z = 44.90 },
        -- Inventory = {x = -41.09, y = -1751.53, z = 28.43},
        --	PanicButton = {
        --{x = 1843.39, y = 2589.84, z = 48.71},
        --{x = 1834.55, y = 2570.38, z = 48.71},
        --{x = 1788.76, y = 2597.93, z = 48.71},
        --{x = 1774.29, y = 2589.03, z = 48.71},
        --{x = 1781.53, y = 2592.21, z = 48.71},
        -- }
    },
    --['Corrections'] = {
    --	PanicButton = {x = 1834.55, y = 2570.38, z = 45.79},
    --},
}

Config.Uniforms     = {
    court_wear= {
        male   = {
            ['tshirt_1'] = 194, ['tshirt_2'] = 0,
            ['torso_1']  = 408, ['torso_2'] = 6,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 1,
            ['pants_1']  = 25, ['pants_2'] = 0,
            ['shoes_1']  = 10, ['shoes_2'] = 0,
	        ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1']  = 136, ['chain_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 420, ['torso_2'] = 6,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 9,
            ['pants_1']  = 6, ['pants_2'] = 0,
            ['shoes_1']  = 29, ['shoes_2'] = 0,
	        ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1']  = 105, ['chain_2'] = 0,
        }
    },
    long_wear = {
        male   = {
            ['tshirt_1'] = 194, ['tshirt_2'] = 0,
            ['torso_1']  = 407, ['torso_2'] = 6,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 1,
            ['pants_1']  = 31, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
	        ['bproof_1'] = 76, ['bproof_2'] = 8,
            ['helmet_1'] = 171, ['helmet_2'] = 2,
            ['chain_1']  = 136, ['chain_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 409, ['torso_2'] = 2,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 36,
            ['pants_1']  = 30, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['bproof_1'] = 73, ['bproof_2'] = 8,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1']  = 105, ['chain_2'] = 0,
        }
    },
    short_wear= {
        male   = {
            ['tshirt_1'] = 194, ['tshirt_2'] = 0,
            ['torso_1']  = 406, ['torso_2'] = 6,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 11,
            ['pants_1']  = 31, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
	        ['bproof_1'] = 76, ['bproof_2'] = 8,
            ['helmet_1'] = 171, ['helmet_2'] = 2,
            ['chain_1']  = 136, ['chain_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 410, ['torso_2'] = 2,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 14,
            ['pants_1']  = 30, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['bproof_1'] = 73, ['bproof_2'] = 8,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1']  = 105, ['chain_2'] = 0,
        }
    },
    winter_wear= {
        male   = {
            ['tshirt_1'] = 218, ['tshirt_2'] = 4,
            ['torso_1']  = 415, ['torso_2'] = 1,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 17,
            ['pants_1']  = 31, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
	        ['bproof_1'] = 39, ['bproof_2'] = 6,
            ['helmet_1'] = 171, ['helmet_2'] = 2,
            ['chain_1']  = 136, ['chain_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 215, ['tshirt_2'] = 3,
            ['torso_1']  = 422, ['torso_2'] = 1,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 9,
            ['pants_1']  = 30, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1']  = 105, ['chain_2'] = 0,
        }
    },
    tactical_wear= {
        male   = {
            ['tshirt_1'] = 194, ['tshirt_2'] = 0,
            ['torso_1']  = 53, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 17,
            ['pants_1']  = 31, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
	        ['bproof_1'] = 76, ['bproof_2'] = 8,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1']  = 136, ['chain_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 216, ['tshirt_2'] = 0,
            ['torso_1']  = 46, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 18,
            ['pants_1']  = 30, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['bproof_1'] = 79, ['bproof_2'] = 2,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1']  = 105, ['chain_2'] = 0,
        }
    },
    polo_wear= {
        male   = {
            ['tshirt_1'] = 194, ['tshirt_2'] = 0,
            ['torso_1']  = 423, ['torso_2'] = 5,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 0,
            ['pants_1']  = 31, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
	        ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['helmet_1'] = 171, ['helmet_2'] = 2,
            ['chain_1']  = 136, ['chain_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 373, ['torso_2'] = 4,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 44,
            ['pants_1']  = 30, ['pants_2'] = 0,
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1']  = 105, ['chain_2'] = 0,
        }
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

