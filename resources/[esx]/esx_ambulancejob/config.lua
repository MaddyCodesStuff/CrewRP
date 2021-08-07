Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 }
Config.MarkerRotate               = false -- Whether the marker should rotate or not

Config.ReviveReward               = 700  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.MaxInService               = -1

Config.Locale                     = 'en'

local second                      = 1000
local minute                      = 60 * second

Config.EarlyRespawnTimer          = 2 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 60 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint               = { coords = vector3(341.07, -1397.31, 32.51), heading = 48.5 }

Config.Hospitals                  = {

	Pillbox      = {
		Name            = 'Hospital',
		Blip            = {
			Pos     = { x = 335.89, y = -579.87, z = 27.80 },
			Sprite  = 586,
			Display = 4,
			Scale   = 1.2,
			Colour  = 1,
			Show    = true
		},

		Cloakrooms      = {
			{ x = 301.62, y = -599.02, z = 42.3 },
		},

		Pharmacies      = {
			{ x = 309.38, y = -568.53, z = 42.32 },
		},

		Vehicles        = {
		},

		Helicopters     = {
			{
				Spawner    = {},
				SpawnPoint = {},
				Heading    = 0.0,
			}
		},

		VehicleDeleters = {
		},

		BossActions     = {
			{ x = 334.61, y = -593.65, z = 42.32 }
		},
	},
	Sandy        = {
		Name            = 'Hospital',
		Blip            = {
			Pos     = { x = 1839.89, y = 3683.26, z = 33.28 },
			Sprite  = 586,
			Display = 4,
			Scale   = 1.2,
			Colour  = 1,
			Show    = true
		},

		Cloakrooms      = {
			{ x = 1825.34, y = 3675.49, z = 33.28 },

		},

		Pharmacies      = {
			{ x = 1824.13, y = 3666.47, z = 33.28 },
		},

		Vehicles        = {
		},

		Helicopters     = {
			{
				Spawner    = {},
				SpawnPoint = {},
				Heading    = 0.0,
			}
		},

		VehicleDeleters = {
		},

		BossActions     = {
			{ x = 1839.02, y = 3686.88, z = 33.28 }
		},
	},
	Paleto       = {
		Name            = 'Hospital',
		Blip            = {
			Pos     = { x = -251.9, y = 6334.23, z = 31.5 },
			Sprite  = 586,
			Display = 4,
			Scale   = 1.2,
			Colour  = 1,
			Show    = true
		},

		Cloakrooms      = {
			{ x = -259.29, y = 6319.27, z = 31.5 },

		},

		Pharmacies      = {
			{ x = -255.94, y = 6324.85, z = 31.5 },
		},

		Vehicles        = {
		},

		Helicopters     = {
			{
				Spawner    = {},
				SpawnPoint = {},
				Heading    = 0.0,
			}
		},

		VehicleDeleters = {
		},

		BossActions     = {
			{ x = -252.7, y = 6309.14, z = 31.5 }
		},
	},
	Doctorclinic = {
		Name            = 'Doctor Clinic',
		Blip            = {
			Pos     = { x = -154.89, y = 406.59, z = 110.00 },
			Sprite  = 586,
			Display = 4,
			Scale   = 1.2,
			Colour  = 1,
			Show    = false
		},
		Cloakrooms      = {
			{ x = -154.89, y = 406.59, z = 110.00 },

		},
		Pharmacies      = {
			{ x = -176.17, y = 406.23, z = 109.50 },
		},

		Vehicles        = {
		},

		Helicopters     = {
			{
				Spawner    = {},
				SpawnPoint = {},
				Heading    = 0.0,
			}
		},

		VehicleDeleters = {
		},

		BossActions     = {
			{ x = -160.52, y = 407.29, z = 110.00 }
		},
	},

}

Config.AuthorizedVehicles         = {

	Shared = {
		{
			model = 'ambulance',
			label = 'Ambulance',
		},
		{
			model = 'EMSBox1',
			label = 'EMS Box Alpha',
		},
		{
			model = 'EMSox2',
			label = 'EMS Box Bravo',
		},
		{
			model = 'EMSBox3',
			label = 'EMS Box Charlie',
		},
		{
			model = 'EMSBox4',
			label = 'EMS Box Delta',
		},
		{
			model = 'EMSBox5',
			label = 'EMS Box Echo',
		},
		{
			model = 'fdlcsand',
			label = 'Sandking',
		},
		{
			model = 'firehazmat',
			label = 'Blood Donation Truck',
		},
		{
			model = 'EMSExplorer',
			label = 'EMS Explorer',
		},
		{
			model = 'EMSGranger',
			label = 'Granger'
		},
	},
}

Config.AuthorizedHelicopters      = {

	ambulance    = {},

	doctor       = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 150000
		}
	},

	chief_doctor = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 150000
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 300000
		}
	},

	boss         = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 100000
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 250000
		}
	}
}

Config.Uniforms                   = {
	greens_wear        = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 250, ['torso_2'] = 1,
			['decals_1'] = 58, ['decals_2'] = 0,
			['arms']     = 85,
			['pants_1']  = 96, ['pants_2'] = 1,
			['shoes_1']  = 51, ['shoes_2'] = 0,
			['helmet_1'] = 122, ['helmet_2'] = 1,
			['chain_1']  = 148, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 258, ['torso_2'] = 1,
			['decals_1'] = 66, ['decals_2'] = 1,
			['arms']     = 109,
			['pants_1']  = 99, ['pants_2'] = 1,
			['shoes_1']  = 81, ['shoes_2'] = 9,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 96, ['chain_2'] = 0
		}
	},
	greens2_wear      = {
		male   = {
			['tshirt_1'] = 72, ['tshirt_2'] = 3,
			['torso_1']  = 249, ['torso_2'] = 1,
			['decals_1'] = 57, ['decals_2'] = 0,
			['arms']     = 86,
			['pants_1']  = 96, ['pants_2'] = 1,
			['shoes_1']  = 77, ['shoes_2'] = 9,
			['helmet_1'] = 122, ['helmet_2'] = 1,
			['chain_1']  = 148, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 76, ['tshirt_2'] = 3,
			['torso_1']  = 257, ['torso_2'] = 1,
			['decals_1'] = 65, ['decals_2'] = 0,
			['arms']     = 101,
			['pants_1']  = 99, ['pants_2'] = 1,
			['shoes_1']  = 81, ['shoes_2'] = 9,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 96, ['chain_2'] = 0
		}
	},
	blues_wear            = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 250, ['torso_2'] = 0,
			['decals_1'] = 58, ['decals_2'] = 1,
			['arms']     = 85,
			['pants_1']  = 96, ['pants_2'] = 0,
			['shoes_1']  = 77, ['shoes_2'] = 8,
			['helmet_1'] = 122, ['helmet_2'] = 0,
			['chain_1']  = 148, ['chain_2'] = 0,	
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 258, ['torso_2'] = 0,
			['decals_1'] = 66, ['decals_2'] = 1,
			['arms']     = 109,
			['pants_1']  = 99, ['pants_2'] = 0,
			['shoes_1']  = 81, ['shoes_2'] = 8,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 96, ['chain_2'] = 0
		}
	},
	blues2_wear            = {
		male   = {
			['tshirt_1'] = 72, ['tshirt_2'] = 3,
			['torso_1']  = 249, ['torso_2'] = 0,
			['decals_1'] = 57, ['decals_2'] = 0,
			['arms']     = 90,
			['pants_1']  = 96, ['pants_2'] = 0,
			['shoes_1']  = 77, ['shoes_2'] = 9,
			['helmet_1'] = 122, ['helmet_2'] = 0,
			['chain_1']  = 148, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 76, ['tshirt_2'] = 3,
			['torso_1']  = 257, ['torso_2'] = 0,
			['decals_1'] = 65, ['decals_2'] = 0,
			['arms']     = 101,
			['pants_1']  = 99, ['pants_2'] = 0,
			['shoes_1']  = 81, ['shoes_2'] = 8,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 96, ['chain_2'] = 0
		}
	},
	docwhite_wear          = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 413, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 92,
            ['pants_1']  = 33, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 144, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 417, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 106,
			['pants_1']  = 32, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 16,
		}
	},
	docwhite2_wear           = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 414, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 93,
			['pants_1']  = 33, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 144, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 418, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 101,
			['pants_1']  = 32, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 16,
		}
	},
	docblue_wear     = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 413, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 92,
            ['pants_1']  = 33, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 144, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 417, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 106,
			['pants_1']  = 32, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 16,
		}
	},
	docblue2_wear             = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 414, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 93,
            ['pants_1']  = 33, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 144, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 418, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 101,
			['pants_1']  = 32, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 16,
		}
	},
	docgreen_wear      = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 413, ['torso_2'] = 2,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 92,
            ['pants_1']  = 33, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 144, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 417, ['torso_2'] = 2,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 106,
			['pants_1']  = 32, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 16,
		}
	},
	docgreen2_wear = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 414, ['torso_2'] = 2,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 93,
            ['pants_1']  = 33, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 144, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 418, ['torso_2'] = 2,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 101,
			['pants_1']  = 32, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 112, ['chain_2'] = 16,
		}
	},
	formal_wear      = {
		male   = {
			['tshirt_1'] = 204, ['tshirt_2'] = 0,
			['torso_1']  = 409, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 93,
            ['pants_1']  = 25, ['pants_2'] = 0,
			['shoes_1']  = 51, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 8, ['tshirt_2'] = 0,
			['torso_1']  = 420, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 101,
			['pants_1']  = 34, ['pants_2'] = 0,
			['shoes_1']  = 52, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
		}
	},
	hart_wear           = {
		male   = {
			['bproof_1'] = 69, ['bproof_2'] = 4,
		},
		female = {
			['bproof_1'] = 66, ['bproof_2'] = 4,
		}
	},
	hartoff_wear        = {
		male   = {
			['bproof_1'] = 0, ['bproof_2'] = 0,
		},
		female = {
			['bproof_1'] = 0, ['bproof_2'] = 0,
		}
	},
	bagopen_wear        = {
		male   = {
			['bags_1'] = 88, ['bags_2'] = 6,
		},
		female = {
			['bags_1'] = 86, ['bags_2'] = 6,
		}
	},
	bagoff_wear         = {
		male   = {
			['bags_1'] = 0, ['bags_2'] = 0,
		},
		female = {
			['bags_1'] = 0, ['bags_2'] = 0,
		}
	},
	bagclosed_wear      = {
		male   = {
			['bags_1'] = 92, ['bags_2'] = 6,
		},
		female = {
			['bags_1'] = 90, ['bags_2'] = 6,
		}
	},
	stethoscope_wear    = {
		male   = {
			['chain_1'] = 148, ['chain_2'] = 16,
		},
		female = {
			['chain_1'] = 112, ['chain_2'] = 16,
		}
	}
}

Config.VehicleInventory           = {
	"EMSBox1",
	"EMSBox2",
	"EMSBox3",
	"EMSBox4",
	"EMSBox5",
}
