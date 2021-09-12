Config                        = {}

Config.DrawDistance           = 100.0
Config.MarkerType             = 27
Config.MarkerSize             = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor            = { r = 0, g = 0, b = 255 }

Config.EnablePlayerManagement = false
Config.EnableArmoryManagement = false
Config.EnableESXIdentity      = false
Config.EnableNonFreemodePeds  = false
Config.EnableLicenses         = false

Config.EnableHandcuffTimer    = true
Config.HandcuffTimer          = 10 * 60000

Config.EnableJobBlip          = false

Config.MaxInService           = -1
Config.Locale                = 'en'

Config.Cloakrooms             = {
    Cloakrooms = {
        vector3(332.81, -569.67, 42.28),
        vector3(-3257.45, 1225.79, 2.64),
        vector3(-450.2878112793, 6016.482421875, 31.716369628906),
        vector3(1845.84, 3683.97, 33.28)
    }
}

Config.Uniforms               = {

    gown_wear  = {
        male   = {
			['tshirt_1'] = 1, ['tshirt_2'] = 0,
			['torso_1']  = 1, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 0,
			['pants_1']  = 5, ['pants_2'] = 0,
			['shoes_1']  = 42, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 2, ['tshirt_2'] = 0,
			['torso_1']  = 2, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 2,
			['pants_1']  = 66, ['pants_2'] = 10,
			['shoes_1']  = 81, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 0, ['mask_2'] = 0,
		}
    },

    scrubs1_wear  = {
        male   = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 410, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 92,
			['pants_1']  = 138, ['pants_2'] = 0,
			['shoes_1']  = 42, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 148, ['chain_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 191, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 387, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 106,
			['pants_1']  = 142, ['pants_2'] = 0,
			['shoes_1']  = 81, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 185, ['mask_2'] = 0,
		}
    },

    scrubs2_wear     = {
        male   = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 410, ['torso_2'] = 2,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 92,
			['pants_1']  = 138, ['pants_2'] = 1,
			['shoes_1']  = 42, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 148, ['chain_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 191, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 387, ['torso_2'] = 2,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 106,
			['pants_1']  = 142, ['pants_2'] = 1,
			['shoes_1']  = 81, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 185, ['mask_2'] = 0,
		}
    },

    scrubs3_wear     = {
        male   = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 410, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 92,
			['pants_1']  = 138, ['pants_2'] = 3,
			['shoes_1']  = 42, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 148, ['chain_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 191, ['mask_2'] = 1,
		},
		female = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 387, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 106,
			['pants_1']  = 142, ['pants_2'] = 3,
			['shoes_1']  = 81, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 185, ['mask_2'] = 1,
		}
    },

}