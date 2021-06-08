Config                        = {}

Config.DrawDistance           = 100.0
Config.MarkerType             = 6
Config.MarkerSize             = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor            = { r = 255, g = 128, b = 0 }

Config.EnablePlayerManagement = false
Config.EnableArmoryManagement = false
Config.EnableESXIdentity      = false
Config.EnableNonFreemodePeds  = false
Config.EnableLicenses         = false

Config.EnableHandcuffTimer    = true
Config.HandcuffTimer          = 10 * 60000

Config.EnableJobBlip          = false

Config.MaxInService           = -1
Config.Locale                 = 'en'

Config.Cloakrooms             = {
    Cloakrooms = {
        vector3(458.75, -997.82, 24.91),
        vector3(-3257.45, 1225.79, 2.64),
        vector3(-450.2878112793, 6016.482421875, 31.716369628906),
        vector3(1845.84, 3683.97, 33.28)
    }
}

Config.Uniforms               = {

    basic_wear    = {
        male   = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1']  = 22, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 0,
            ['pants_1']  = 3, ['pants_2'] = 7,
            ['shoes_1']  = 42, ['shoes_2'] = 2,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1']  = 286, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 14,
            ['pants_1']  = 66, ['pants_2'] = 6,
            ['shoes_1']  = 66, ['shoes_2'] = 6,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        }
    },

    topless_wear  = {
        male   = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1']  = 15, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 15,
            ['pants_1']  = 3, ['pants_2'] = 7,
            ['shoes_1']  = 42, ['shoes_2'] = 2,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1']  = 74, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 4,
            ['pants_1']  = 66, ['pants_2'] = 6,
            ['shoes_1']  = 66, ['shoes_2'] = 6,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        }
    },

    tanktop_wear  = {
        male   = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1']  = 5, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 5,
            ['pants_1']  = 3, ['pants_2'] = 7,
            ['shoes_1']  = 42, ['shoes_2'] = 2,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1']  = 247, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 4,
            ['pants_1']  = 66, ['pants_2'] = 6,
            ['shoes_1']  = 66, ['shoes_2'] = 6,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        }
    },


    full_wear     = {
        male   = {
            ['tshirt_1'] = 23, ['tshirt_2'] = 0,
            ['torso_1']  = 3, ['torso_2'] = 7,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 1,
            ['pants_1']  = 3, ['pants_2'] = 7,
            ['shoes_1']  = 42, ['shoes_2'] = 2,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        },
        female = {
            ['tshirt_1'] = 57, ['tshirt_2'] = 0,
            ['torso_1']  = 270, ['torso_2'] = 13,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 14,
            ['pants_1']  = 66, ['pants_2'] = 6,
            ['shoes_1']  = 66, ['shoes_2'] = 6,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        }
    },


    orange_beanie = {
        male   = {
            ['helmet_1'] = 120, ['helmet_2'] = 1,
        },
        female = {
            ['helmet_1'] = 119, ['helmet_2'] = 1,
        }
    }
}