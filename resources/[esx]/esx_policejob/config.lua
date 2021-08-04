Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 3.0 }
Config.MarkerColor                = { r = 0, g = 0, b = 255 }
Config.LicenseTypes = {
    { label = "Weapons License", value = 'weapon' },
    { label = "Aircraft License", value = 'aircraft' },
}
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins
Config.BillDue                    = 7 -- How long bills are due (in days)

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.PoliceStations             = {

	LSPD     = {

		Blip              = {
			Pos     = { x = 425.130, y = -979.558, z = 30.711 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_NIGHTSTICK', price = 0 },
			{ name = 'WEAPON_COMBATPISTOL', price = 0 },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 0 },
			{ name = 'WEAPON_STUNGUN', price = 0 },
			{ name = 'WEAPON_FLASHLIGHT', price = 0 },
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
			{ name = 'WEAPON_FLAREGUN', price = 0 },
			{ name = 'GADGET_PARACHUTE', price = 0 },
		},

		Cloakrooms        = {
			{ x = 463.53, y = -999.05, z = 29.750 },
		},

		Armories          = {
			{ x = 474.64, y = -997.03, z = 25.30 },
		},

		PDStore		  = {
			{ x = 485.61, y = -995.85, z = 29.70 },
		},

		-- Vehicles = {
		-- 	{
		-- 		Spawner    = { x = 454.69, y = -1017.40, z = 27.50 }, -- Front of PD
		-- 		SpawnPoints = {
		-- 			{ x = 438.42, y = -1018.30, z = 27.75, heading = 90.0, radius = 6.0 },
		-- 			{ x = 441.08, y = -1024.23, z = 28.30, heading = 90.0, radius = 6.0 },
		-- 			{ x = 453.53, y = -1022.20, z = 28.02, heading = 90.0, radius = 6.0 },
		-- 			{ x = 450.97, y = -1016.55, z = 28.10, heading = 90.0, radius = 6.0 }
		-- 		}
		-- 	},

		-- 	-- {
		-- 		-- Spawner    = { x = 474.25, y = -1020.81, z = 27.20 }, -- Back of PD
		-- 		-- SpawnPoints = {
		-- 		-- 	{ x = 475.98, y = -1021.65, z = 28.06, heading = 276.11, radius = 6.0 },
		-- 		-- 	{ x = 484.10, y = -1023.19, z = 27.57, heading = 302.54, radius = 6.0 }
		-- 		-- }
		-- 	-- }
		-- },

		Helicopters       = {
			{
				Spawner    = { x = 466.477, y = -982.819, z = 42.691 },
				SpawnPoint = { x = 450.04, y = -981.14, z = 42.691 },
				Heading    = 0.0
			}
		},

		Boats             = {
			{
				Spawner    = { x = -777.3, y = -1430.0, z = -1.6 },
				SpawnPoint = { x = -775.0, y = -1428.82, z = -0.47 },
				Heading    = 0.0
			}
		},


		VehicleDeleters   = {
			-- { x = 462.74, y = -1014.4, z = 27.30 },
			-- { x = 462.40, y = -1019.7, z = 27.30 },
			-- { x = 469.12, y = -1024.52, z = 27.25 } -- Back of PD
		},

		BossActions       = {
			{ x = 463.46, y = -985.04, z = 29.689 }
		},

	},
	SandyPD  = {

		Blip              = {
			Pos     = { x = 1852.88, y = 3689.41, z = 34.27 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_NIGHTSTICK', price = 0 },
			{ name = 'WEAPON_COMBATPISTOL', price = 0 },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 0 },
			{ name = 'WEAPON_STUNGUN', price = 0 },
			{ name = 'WEAPON_FLASHLIGHT', price = 0 },
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
			{ name = 'WEAPON_FLAREGUN', price = 0 },
			{ name = 'GADGET_PARACHUTE', price = 0 },
		},

		Cloakrooms        = {
			{ x = 1856.51, y = 3697.11, z = 33.27 },
		},

		Armories          = {
			{ x = 1846.73, y = 3680.43, z = 33.27 },
		},

		PDStore		  = {
			{ x = 1847.14, y = 3682.85, z = 33.27 },
		},

		Helicopters       = {
			--{
			--	Spawner    = { x = -470.67, y = 6001.42, z = 30.4 },
			--	SpawnPoint = { x = -475.27, y = 5988.35, z = 30.5 },
			--	Heading    = 0.0
			--}
		},

		Boats             = {
		},


		VehicleDeleters   = {
		},

		BossActions       = {
			{ x = 1841.98, y = 3692.12, z = 33.27 }
		},

	},
	PaletoPD = {

		Blip              = {
			Pos     = { x = -448.7, y = 6012.0, z = 31.72 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_NIGHTSTICK', price = 0 },
			{ name = 'WEAPON_COMBATPISTOL', price = 0 },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 0 },
			{ name = 'WEAPON_STUNGUN', price = 0 },
			{ name = 'WEAPON_FLASHLIGHT', price = 0 },
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
			{ name = 'WEAPON_FLAREGUN', price = 0 },
			{ name = 'GADGET_PARACHUTE', price = 0 },
		},

		Cloakrooms        = {
			{ x = -437.72, y = 5989.03, z = 30.72 },
		},

		Armories          = {
			{ x = -441.51, y = 5987.24, z = 30.62 },
		},

		PDStore		  = {
			{ x = -439.7, y = 5991.79, z = 30.72 },
		},

		Helicopters       = {
			--{
			--	Spawner    = { x = -470.67, y = 6001.42, z = 30.4 },
			--	SpawnPoint = { x = -475.27, y = 5988.35, z = 30.5 },
			--	Heading    = 0.0
			--}
		},

		Boats             = {
		},


		VehicleDeleters   = {
		},

		BossActions       = {
			{ x = -435.81, y = 5999.81, z = 30.72 }
		},

	},
}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles         = {
	Shared      = {
		{
			model = 'scorcher',
			label = 'Bicycle'
		},
		{
			model = 'charger1',
			label = 'Charger Alpha',
		},
		{
			model = 'charger2',
			label = 'Charger Bravo',
		},
		{
			model = 'charger3',
			label = 'Charger Charlie',
		},
		{
			model = 'charger4',
			label = 'Charger Delta',
		},
		{
			model = 'charger5',
			label = 'Charger Echo',
		},
		{
			model = 'policecart',
			label = 'Cart',

		},
		{
			model = 'polmav',
			label = 'Police Helicopter'
		},
	},

	cadet       = {
	},

	probie      = {
	},

	officer     = {

	},

	detective   = {

	},

	fto         = {

	},

	detcorporal = {

	},

	corporal    = {

	},

	sergeant    = {

	},

	lieutenant  = {

	},

	inspector   = {

	},

	sheriff     = {

	},

	captain     = {

	},

	assistant   = {
	},

	boss        = {

	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms                   = {
	cadet_wear       = {
		male   = {
			['tshirt_1'] = 183, ['tshirt_2'] = 0,
			['torso_1']  = 423, ['torso_2'] = 9,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 30,
            ['pants_1']  = 148, ['pants_2'] = 0,
			['shoes_1']  = 51, ['shoes_2'] = 6,
			['helmet_1'] = 167, ['helmet_2'] = 0,
			['chain_1']  = 140, ['chain_2'] = 0,
			['bproof_1'] = 59, ['bproof_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 248, ['tshirt_2'] = 0,
			['torso_1']  = 372, ['torso_2'] = 10,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 44,
			['pants_1']  = 148, ['pants_2'] = 0,
			['shoes_1']  = 52, ['shoes_2'] = 0,
			['bproof_1'] = 57, ['bproof_2'] = 0,
			['helmet_1'] = 163, ['helmet_2'] = 0,
			['chain_1']  = 109, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	officer_wear     = {
		male = {
            ['tshirt_1'] = 183, ['tshirt_2'] = 0,
            ['torso_1']  = 413, ['torso_2'] = 7,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 37,
            ['pants_1']  = 148, ['pants_2'] = 0,
            ['shoes_1']  = 12, ['shoes_2'] = 6,
            ['bproof_1'] = 76, ['bproof_2'] = 0,
            ['helmet_1'] = 171, ['helmet_2'] = 4,
            ['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 248, ['tshirt_2'] = 0,
            ['torso_1']  = 375, ['torso_2'] = 7,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 41,
            ['pants_1']  = 148, ['pants_2'] = 0,
            ['shoes_1']  = 52, ['shoes_2'] = 0,
            ['bproof_1'] = 66, ['bproof_2'] = 2,
            ['helmet_1'] = 170, ['helmet_2'] = 4,
            ['chain_1']  = 110, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        }
	},
	police2_wear     = {
		male = {
            ['tshirt_1'] = 183, ['tshirt_2'] = 0,
            ['torso_1']  = 414, ['torso_2'] = 7,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 38,
            ['pants_1']  = 148, ['pants_2'] = 0,
            ['shoes_1']  = 12, ['shoes_2'] = 6,
            ['bproof_1'] = 76, ['bproof_2'] = 0,
            ['helmet_1'] = 171, ['helmet_2'] = 4,
            ['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 248, ['tshirt_2'] = 0,
            ['torso_1']  = 418, ['torso_2'] = 7,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 36,
            ['pants_1']  = 148, ['pants_2'] = 0,
            ['shoes_1']  = 52, ['shoes_2'] = 0,
            ['bproof_1'] = 66, ['bproof_2'] = 2,
            ['helmet_1'] = 170, ['helmet_2'] = 4,
            ['chain_1']  = 110, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        }
	},
	formal_wear      = {
		male   = {
			['tshirt_1'] = 218, ['tshirt_2'] = 0,
			['torso_1']  = 357, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 75,
			['pants_1']  = 148, ['pants_2'] = 0,
			['shoes_1']  = 21, ['shoes_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 3,
			['helmet_1'] = 153, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 38, ['tshirt_2'] = 0,
			['torso_1']  = 379, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 92,
			['pants_1']  = 151, ['pants_2'] = 3,
			['shoes_1']  = 29, ['shoes_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
			['helmet_1'] = 152, ['helmet_2'] = 0,
			['chain_1']  = 87, ['chain_2'] = 9,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	ticket_wear      = {
		male   = {
			['tshirt_1'] = 183, ['tshirt_2'] = 0,
			['torso_1']  = 413, ['torso_2'] = 7,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 37,
			['pants_1']  = 143, ['pants_2'] = 0,
			['shoes_1']  = 51, ['shoes_2'] = 6,
			['bproof_1'] = 67, ['bproof_2'] = 0,
			['helmet_1'] = 1, ['helmet_2'] = 0,
			['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 248, ['tshirt_2'] = 0,
			['torso_1']  = 417, ['torso_2'] = 7,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 41,
			['pants_1']  = 138, ['pants_2'] = 0,
			['shoes_1']  = 25, ['shoes_2'] = 0,
			['bproof_1'] = 70, ['bproof_2'] = 0,
			['helmet_1'] = 1, ['helmet_2'] = 0,
			['chain_1']  = 110, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	swat_wear        = {
		male   = {
			['tshirt_1'] = 183, ['tshirt_2'] = 0,
			['torso_1']  = 401, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 22,
			['pants_1']  = 146, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['bproof_1'] = 66, ['bproof_2'] = 0,
			['helmet_1'] = 170, ['helmet_2'] = 0,
			['chain_1']  = 136, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 247, ['tshirt_2'] = 0,
			['torso_1']  = 413, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 21,
			['pants_1']  = 146, ['pants_2'] = 0,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['bproof_1'] = 79, ['bproof_2'] = 1,
			['helmet_1'] = 167, ['helmet_2'] = 0,
			['chain_1']  = 105, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	bomb_wear        = {
		male   = {
			['tshirt_1'] = 216, ['tshirt_2'] = 0,
			['torso_1']  = 402, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 17,
			['pants_1']  = 156, ['pants_2'] = 0,
			['shoes_1']  = 33, ['shoes_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
			['helmet_1'] = 123, ['helmet_2'] = 15,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 52, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 242, ['tshirt_2'] = 0,
			['torso_1']  = 414, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 111,
			['pants_1']  = 157, ['pants_2'] = 0,
			['shoes_1']  = 34, ['shoes_2'] = 0,
			['bproof_1'] = 0, ['bproof_2'] = 0,
			['helmet_1'] = 122, ['helmet_2'] = 15,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 52, ['mask_2'] = 0,
		}
	},
	tac_wear         = {
		male   = {
			['tshirt_1'] = 183, ['tshirt_2'] = 0,
			['torso_1']  = 413, ['torso_2'] = 8,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 37,
			['pants_1']  = 155, ['pants_2'] = 2,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['bproof_1'] = 66, ['bproof_2'] = 0,
			['helmet_1'] = 171, ['helmet_2'] = 5,
			['chain_1']  = 136, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 247, ['tshirt_2'] = 0,
			['torso_1']  = 417, ['torso_2'] = 8,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 41,
			['pants_1']  = 136, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['bproof_1'] = 79, ['bproof_2'] = 1,
			['helmet_1'] = 170, ['helmet_2'] = 5,
			['chain_1']  = 105, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	tac1_wear        = {
		male   = {
			['tshirt_1'] = 183, ['tshirt_2'] = 0,
			['torso_1']  = 414, ['torso_2'] = 8,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 38,
			['pants_1']  = 155, ['pants_2'] = 2,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['bproof_1'] = 66, ['bproof_2'] = 0,
			['helmet_1'] = 171, ['helmet_2'] = 5,
			['chain_1']  = 136, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 247, ['tshirt_2'] = 0,
			['torso_1']  = 418, ['torso_2'] = 8,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 36,
			['pants_1']  = 136, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['bproof_1'] = 79, ['bproof_2'] = 1,
			['helmet_1'] = 170, ['helmet_2'] = 5,
			['chain_1']  = 105, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	county_wear      = {
		male = {
            ['tshirt_1'] = 178, ['tshirt_2'] = 0,
            ['torso_1']  = 423, ['torso_2'] = 8,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 30,
            ['pants_1']  = 144, ['pants_2'] = 2,
            ['shoes_1']  = 12, ['shoes_2'] = 6,
            ['bproof_1'] = 69, ['bproof_2'] = 1,
            ['helmet_1'] = 171, ['helmet_2'] = 8,
            ['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 375, ['torso_2'] = 11,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 44,
            ['pants_1']  = 151, ['pants_2'] = 0,
            ['shoes_1']  = 52, ['shoes_2'] = 0,
            ['bproof_1'] = 66, ['bproof_2'] = 1,
            ['helmet_1'] = 170, ['helmet_2'] = 8,
            ['chain_1']  = 110, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        }
	},
	county2_wear     = {
		male = {
            ['tshirt_1'] = 178, ['tshirt_2'] = 0,
            ['torso_1']  = 409, ['torso_2'] = 5,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 38,
            ['pants_1']  = 144, ['pants_2'] = 2,
            ['shoes_1']  = 12, ['shoes_2'] = 6,
            ['bproof_1'] = 76, ['bproof_2'] = 2,
            ['helmet_1'] = 165, ['helmet_2'] = 1,
            ['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 420, ['torso_2'] = 10,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 36,
            ['pants_1']  = 151, ['pants_2'] = 0,
            ['shoes_1']  = 52, ['shoes_2'] = 0,
            ['bproof_1'] = 73, ['bproof_2'] = 2,
            ['helmet_1'] = 161, ['helmet_2'] = 1,
            ['chain_1']  = 110, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        }
	},
	countybike_wear        = {
		male   = {
            ['tshirt_1'] = 178, ['tshirt_2'] = 0,
            ['torso_1']  = 409, ['torso_2'] = 5,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 38,
            ['pants_1']  = 151, ['pants_2'] = 2,
            ['shoes_1']  = 33, ['shoes_2'] = 0,
            ['bproof_1'] = 76, ['bproof_2'] = 2,
            ['helmet_1'] = 161, ['helmet_2'] = 2,
            ['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 420, ['torso_2'] = 10,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 36,
            ['pants_1']  = 152, ['pants_2'] = 2,
            ['shoes_1']  = 9, ['shoes_2'] = 0,
            ['bproof_1'] = 73, ['bproof_2'] = 2,
            ['helmet_1'] = 159, ['helmet_2'] = 2,
            ['chain_1']  = 109, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        }
	},
	highway_wear     = {
		male   = {
            ['tshirt_1'] = 178, ['tshirt_2'] = 0,
            ['torso_1']  = 413, ['torso_2'] = 9,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 30,
            ['pants_1']  = 144, ['pants_2'] = 1,
            ['shoes_1']  = 51, ['shoes_2'] = 0,
            ['bproof_1'] = 76, ['bproof_2'] = 3,
            ['helmet_1'] = 171, ['helmet_2'] = 6,
            ['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 375, ['torso_2'] = 9,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 44,
            ['pants_1']  = 151, ['pants_2'] = 2,
            ['shoes_1']  = 52, ['shoes_2'] = 0,
            ['bproof_1'] = 73, ['bproof_2'] = 3,
            ['helmet_1'] = 170, ['helmet_2'] = 6,
            ['chain_1']  = 110, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        }
	},
	highway2_wear    = {
		male   = {
            ['tshirt_1'] = 178, ['tshirt_2'] = 0,
            ['torso_1']  = 409, ['torso_2'] = 9,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 38,
            ['pants_1']  = 144, ['pants_2'] = 1,
            ['shoes_1']  = 51, ['shoes_2'] = 0,
            ['bproof_1'] = 76, ['bproof_2'] = 3,
            ['helmet_1'] = 160, ['helmet_2'] = 0,
            ['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 420, ['torso_2'] = 9,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 36,
            ['pants_1']  = 151, ['pants_2'] = 2,
            ['shoes_1']  = 52, ['shoes_2'] = 0,
            ['helmet_1'] = 158, ['helmet_2'] = 1,
            ['bproof_1'] = 73, ['bproof_2'] = 3,
            ['chain_1']  = 110, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        }
	},
	hwybike_wear        = {
		male   = {
            ['tshirt_1'] = 178, ['tshirt_2'] = 0,
            ['torso_1']  = 409, ['torso_2'] = 9,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 38,
            ['pants_1']  = 151, ['pants_2'] = 0,
            ['shoes_1']  = 33, ['shoes_2'] = 0,
            ['bproof_1'] = 76, ['bproof_2'] = 3,
            ['helmet_1'] = 161, ['helmet_2'] = 1,
            ['chain_1']  = 140, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        },
        female = {
            ['tshirt_1'] = 247, ['tshirt_2'] = 0,
            ['torso_1']  = 420, ['torso_2'] = 9,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms']     = 36,
            ['pants_1']  = 152, ['pants_2'] = 0,
            ['shoes_1']  = 9, ['shoes_2'] = 0,
            ['helmet_1'] = 159, ['helmet_2'] = 1,
            ['bproof_1'] = 73, ['bproof_2'] = 3,
            ['chain_1']  = 110, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
        }
	},
}
