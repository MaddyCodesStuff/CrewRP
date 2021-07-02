Config                       = {}

Config.DrawDistance          = 100.0
Config.MarkerType            = 27
Config.MarkerSize            = { x = 1.5, y = 1.5, z = 3.0 }
Config.MarkerColor           = { r = 255, g = 255, b = 0 }

Config.MaxInService          = -1

Config.CheckInterval         = 1800000
--Config.CheckInterval = 30000 -- Enabled for testing. Comment the line above and remove this line in production

Config.FireChance            = 65 -- Default chance of starting a fire.
Config.FireChanceIncrease    = 35 -- Every time a fire start check fails, probability will increase by this much

Config.MaxDumpsterFires      = 5
Config.MaxDumpsterFireSpread = 3

Config.MinSmallFires         = 3
Config.MaxSmallFires         = 10
Config.MaxSmallFireSpread    = 3

Config.MinMedFires           = 7
Config.MaxMedFires           = 15
Config.MaxMedFireSpread      = 5

Config.MinLargeFires         = 15
Config.MaxLargeFires         = 25 -- Set this to above MinLargeFires
Config.MaxLargeFireSpread    = 10

Config.VehicleInventory      = {
	"pd-mav",
	"lsmd-ambo1",
	"lsmd-bigambo",
	"lsmd-firetruk",
	"lsmd-truck",
	"lsmd-utility",
	"lsmd-utility2",
	"pd-mav",
	"stairtruck",
	"emerg-dodo",
}

Config.FireAlarms            = {
	dumpster = "1 Alarm",
	small    = "1 Alarm",
	medium   = "2 Alarm",
	large    = "Multiple Alarm",
}

Config.FireStations          = {
	LSFD_Capital  = {
		Blip              = {
			Pos     = { x = 1200.31, y = -1475.4, z = 33.86 },
			Sprite  = 648,
			Display = 4,
			Scale   = 1.2,
			Colour  = 64,
		},
		Cloakrooms        = {
			{ x = 1209.03, y = -1480.82, z = 33.87 }
		},
		Armories          = {
			{ x = 1207.65, y = -1474.5, z = 33.87 }
		},
		BossActions       = {
			{ x = 1207.61, y = -1467.58, z = 33.87 },
		},
		AuthorizedWeapons = {
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
			{ name = 'WEAPON_POOLCUE', price = 0 },
		},
	},
	LSFD_Davis    = {
		Blip              = {
			Pos     = { x = 205.17, y = -1651.17, z = 28.81 },
			Sprite  = 648,
			Display = 4,
			Scale   = 1.2,
			Colour  = 64,
		},
		Cloakrooms        = {
			{ x = 207.24, y = -1662.30, z = 28.81 }
		},
		Armories          = {
			{ x = 210.43, y = -1656.73, z = 28.81 }
		},
		BossActions       = {
			{ x = 214.94, y = -1651.28, z = 28.81 },
		},
		AuthorizedWeapons = {
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
			{ name = 'WEAPON_POOLCUE', price = 0 },
		},
	},
	LSFD_CityHall = {
		Blip              = {
			Pos     = { x = -642.85, y = -119.75, z = 36.93 },
			Sprite  = 648,
			Display = 4,
			Scale   = 1.2,
			Colour  = 64,
		},
		Cloakrooms        = {
			{ x = -633.82, y = -121.83, z = 38.03 }
		},
		Armories          = {
			{ x = -630.15, y = -96.06, z = 37.08 }
		},
		BossActions       = {
			{ x = -630.20, y = -99.09, z = 37.08 },
		},
		AuthorizedWeapons = {
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
			{ name = 'WEAPON_POOLCUE', price = 0 },
		},
	},
	PaletoFD      = {
		Blip              = {
			Pos     = { x = -360.08, y = 6108.04, z = 38.46 },
			Sprite  = 648,
			Display = 4,
			Scale   = 1.2,
			Colour  = 64,
		},
		Cloakrooms        = {
			{ x = -366.21, y = 6103.34, z = 34.45 }
		},
		Armories          = {
			{ x = -378.96, y = 6093.22, z = 30.45 }
		},
		BossActions       = {
			{ x = -377.12, y = 6122.25, z = 30.49 },
		},
		AuthorizedWeapons = {
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
			{ name = 'WEAPON_POOLCUE', price = 0 },
		},
	},
	SandyFD       = {
		Blip              = {
			Pos     = { x = 1692.27, y = 3589.04, z = 40.46 },
			Sprite  = 648,
			Display = 4,
			Scale   = 1.2,
			Colour  = 64,
		},
		Cloakrooms        = {
			{ x = 1696.99, y = 3592.42, z = 34.63 }
		},
		Armories          = {
			{ x = 1690.78, y = 3592.35, z = 34.63 }
		},
		BossActions       = {
			{ x = 1695.45, y = 3594.72, z = 34.63 },
		},
		AuthorizedWeapons = {
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
			{ name = 'WEAPON_POOLCUE', price = 0 },
		},
	}
}

Config.Uniforms              = {
	shirtlong_wear    = {
		male   = {
			['tshirt_1'] = 193, ['tshirt_2'] = 0,
			['torso_1']  = 407, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 1,
			['pants_1']  = 141, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 418, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 1,
			['pants_1']  = 144, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	shirtshort_wear   = {
		male   = {
			['tshirt_1'] = 193, ['tshirt_2'] = 0,
			['torso_1']  = 406, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 11,
			['pants_1']  = 141, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 417, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 9,
			['pants_1']  = 144, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	formal_wear       = {
		male   = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 408, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 1,
			['pants_1']  = 25, ['pants_2'] = 0,
			['shoes_1']  = 10, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 8, ['tshirt_2'] = 0,
			['torso_1']  = 420, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 1,
			['pants_1']  = 133, ['pants_2'] = 0,
			['shoes_1']  = 29, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	
	supelong_wear     = {
		male   = {
			['tshirt_1'] = 193, ['tshirt_2'] = 0,
			['torso_1']  = 407, ['torso_2'] = 4,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 1,
			['pants_1']  = 141, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 418, ['torso_2'] = 4,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 9,
			['pants_1']  = 144, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	supeshort_wear    = {
		male   = {
			['tshirt_1'] = 193, ['tshirt_2'] = 0,
			['torso_1']  = 406, ['torso_2'] = 4,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 11,
			['pants_1']  = 141, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 0,
			['torso_1']  = 417, ['torso_2'] = 4,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 9,
			['pants_1']  = 144, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	supeformal_wear   = {
		male   = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 408, ['torso_2'] = 4,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 1,
			['pants_1']  = 25, ['pants_2'] = 0,
			['shoes_1']  = 10, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 8, ['tshirt_2'] = 0,
			['torso_1']  = 420, ['torso_2'] = 4,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 1,
			['pants_1']  = 133, ['pants_2'] = 0,
			['shoes_1']  = 29, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	
	turnout_wear      = {
		male   = {
			['tshirt_1'] = 228, ['tshirt_2'] = 0,
			['torso_1']  = 432, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 17,
			['pants_1']  = 164, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = 137, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 252, ['tshirt_2'] = 0,
			['torso_1']  = 432, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 18,
			['pants_1']  = 162, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = 136, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
	},
	turnin_wear       = {
		male   = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1']  = 432, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 17,
			['pants_1']  = 164, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 8, ['tshirt_2'] = 0,
			['torso_1']  = 432, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 18,
			['pants_1']  = 162, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},
	fire_wear         = {
		male   = {
			['tshirt_1'] = 217, ['tshirt_2'] = 4,
			['torso_1']  = 416, ['torso_2'] = 1,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 1,
			['pants_1']  = 141, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 209, ['tshirt_2'] = 1,
			['torso_1']  = 373, ['torso_2'] = 3,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms']     = 14,
			['pants_1']  = 144, ['pants_2'] = 1,
			['shoes_1']  = 24, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1']  = 0, ['chain_2'] = 0,
			['mask_1']   = 0, ['mask_2'] = 0,
		}
	},

	medic_bag         = {
		male   = {
			['bags_1'] = 86, ['bags_2'] = 17
		},
		female = {
			['bags_1'] = 88, ['bags_2'] = 17
		}
	},
	medic_bag_off     = {
		male   = {
			['bags_1'] = 0, ['bags_2'] = 0
		},
		female = {
			['bags_1'] = 0, ['bags_2'] = 0
		}
	}
}

Config.DumpsterFires         = {
	{
		coords = { x = 635.47, y = 2730.72, z = 43.26 }, -- Taco Farmer Rt 68
	},
	{
		coords = { x = 546.92, y = 2655.88, z = 42.21 }, -- 24/7 Rt 68
	},
	{
		coords = { x = 1066.65, y = 2658.51, z = 41.92 }, -- Abandoned Gas Station / Cafe Rt 68
	},
	{
		coords = { x = 1993.1, y = 3041.13, z = 47.21 }, -- Yellow Jack
	},
	{
		coords = { x = 1285.21, y = 3621.41, z = 34.12 }, -- Marina Dr/Meringue Ln
	},
	{
		coords = { x = 1579.49, y = 3620.83, z = 35.5 }, -- Algonquin Blvd
	},
	{
		coords = { x = 984.01, y = 3581.23, z = 34.73 }, -- Joshua Rd
	},
	{
		coords = { x = 116.56, y = 3702.74, z = 39.75 }, -- Calafia Rd
	},
	{
		coords = { x = -461.38, y = 1090.62, z = 328.63 }
	},
	{
		coords = { x = 22.68, y = 541.56, z = 176.03 },
	},
	{
		coords = { x = 148.86, y = 308.69, z = 112.14 }, --Clinton Ave - Vinewood
	},
	{
		coords = { x = 272.42, y = 310.59, z = 105.54 }, --Clinton Ave / Alta Vinewood
	},
	{
		coords = { x = 373.53, y = 348.99, z = 102.91 }, --Power Street / Clinton Ave Vinewood
	},
	{
		coords = { x = -120.35, y = 217.53, z = 94.48 }, --North Archer Ave - Eclipse Blvd
	},
	{
		coords = { x = -1942.84, y = 401.35, z = 96.51 }, --North Rockford Drive
	},
	{
		coords = { x = 11656.11, y = 239.24, z = 63.31 }, --Richman Street
	},
	{
		coords = { x = -1565.79, y = -456.59, z = 35.98 }, --Blv Del Perro / Liberty St.
	},
	{
		coords = { x = -8.66, y = 521.25, z = 174.63 }, -- S. Rockford Dr. Del Perro
	},
	{
		coords = { x = -1176.56, y = -903.38, z = 13.62 }, -- Prosperity St.
	},
	{
		coords = { x = -1115.19, y = -967.42, z = 2.15 }, -- Prosperity St.
	},
	{
		coords = { x = -1115.26, y = -967.16, z = 2.16 }, -- Prosperity St.
	},
	{
		coords = { x = -1071.29, y = -1145.64, z = 2.16 }, -- Prosperity St.
	},
	{
		coords = { x = -1130.72, y = -1416.67, z = 5.15 }, -- Bay City Ave
	},
	{
		coords = { x = -1227.22, y = -1315.64, z = 4.23 }, -- Magellan Ave
	},
	{
		coords = { x = -635.27, y = -1226.6, z = 11.94 }, -- S. Rockford Drive
	},
	{
		coords = { x = -709.21, y = -2545.59, z = 15.06 }, -- Exceptionalists Way
	},
	{
		coords = { x = -359.05, y = -2274.72, z = 8.79 }, -- Miriam Turner
	},
	{
		coords = { x = -43.0, y = -1758.71, z = 29.49 }, -- Davis Ave
	},
	{
		coords = { x = 118.74, y = -1807.87, z = 23.9 }, -- Covenant Ave
	},
	{
		coords = { x = 442.23, y = -1579.5, z = 29.28 }, --Innocence Blvd
	},
	{
		coords = { x = 479.85, y = -1330.81, z = 29.2 }, -- Capital Blvd / Little Big Horn
	},
	{
		coords = { x = 774.63, y = -1314.16, z = 26.22 }, -- Popular St. / Olympic Fwy
	},
	{
		coords = { x = 945.37, y = -1244.4, z = 27.81 }, -- Elysian Fields Fwy
	},
	{
		coords = { x = 871.53, y = -1138.73, z = 24.09 }, -- Olympic Fwy
	},
	{
		coords = { x = 827.89, y = -1071.55, z = 28.85 }, -- Supply St.
	},
	{
		coords = { x = 750.26, y = -946.98, z = 25.63 }, -- Popular St.
	},
	{
		coords = { x = 1120.39, y = -970.03, z = 46.65 }, -- Vespucci Blvd
	},
	{
		coords = { x = 452.78, y = -876.31, z = 27.59 }, -- San Andreas Ave (alley)
	},
	{
		coords = { x = 1238.11, y = -406.06, z = 68.97 }, -- East Mirror Park Drive
	},
	{
		coords = { x = -23.72, y = -1031.97, z = 29.72 }, -- Power St.
	},
	{
		coords = { x = -103.1, y = 6468.91, z = 31.63 }, -- Paleto Blvd (Blaine County Savings)
	},
	{
		coords = { x = -311.38, y = 6314.3, z = 33.09 }, -- Procopio Dr.
	},
	{
		coords = { x = 51.0, y = 6302.22, z = 31.23 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -68.55, y = 6256.29, z = 31.09 }, -- Great Ocean Hwy
	},
}

Config.SmallFires            = {
	{
		coords = { x = 540.13, y = 26666.16, z = 42.16 }, -- 24/7 Rt 68
	},
	{
		coords = { x = 1996.28, y = 3050.78, z = 47.21 }, -- Yellow Jack
	},
	{
		coords = { x = 1404.7, y = 3612.33, z = 39.0 }, -- Meth Lab Roof Sandy (ac unit)
	},
	{
		coords = { x = 912.19, y = 3651.08, z = 36.13 }, -- Marina Dr.
	},
	{
		coords = { x = 376.5, y = 3574.58, z = 33.29 }, -- Marina Dr. Zancundo River
	},
	{
		coords = { x = 178.29, y = 3087.11, z = 43.07 }, -- Galileo Park
	},
	{
		coords = { x = 176.04, y = 571.01, z = 186.56 }, -- Whispymound Dr - Vinewood Hills
	},
	{
		coords = { x = 184.02, y = 305.57, z = 105.4 }, -- Alta St. Vinewood
	},
	{
		coords = { x = -154.38, y = 201.94, z = 90.98 }, -- North Archer Ave - West Vine
	},
	{
		coords = { x = -1498.44, y = -185.79, z = 50.4 }, -- South Rockford Dr / West Eclipse
	},
	{
		coords = { x = -1482.44, y = -208.44, z = 59.96 }, -- Cougar Ave/S. Rockford Dr. (roof)
	},
	{
		coords = { x = -1183.64, y = -489.52, z = 35.54 }, -- Marathon Ave
	},
	{
		coords = { x = -1127.25, y = -963.06, z = 6.63 }, -- Prosperity St.
	},
	{
		coords = { x = -1148.35, y = -1175.69, z = 2.48 }, -- Invention Ct.
	},
	{
		coords = { x = -894.68, y = -2758.89, z = 16.37 }, -- New Empire Way
	},
	{
		coords = { x = 300.1, y = -2019.9, z = 20.05 }, -- Jamestown St.
	},
	{
		coords = { x = 496.9, y = -1813.77, z = 28.86 } -- Jamestown,
	},
	{
		coords = { x = 531.45, y = -1658.25, z = 33.33 }, -- Jamestown / Innocence Rd (roof)
	},
	{
		coords = { x = 478.95, y = -1388.2, z = 29.47 }, -- Capital Blvd
	},
	{
		coords = { x = 706.82, y = -1388.4, z = 26.28 }, -- Olympic Fwy
	},
	{
		coords = { x = 742.56, y = -1401.08, z = 27.88 }, -- Capital Blvd
	},
	{
		coords = { x = 871.91, y = -1324.48, z = 26.77 }, -- Olympic Fwy
	},
	{
		coords = { x = 838.92, y = -1226.76, z = 26.14 }, -- Olympic Fwy
	},
	{
		coords = { x = 889.96, y = -1031.29, z = 39.98 }, -- Vespucci Blvd (roof)
	},
	{
		coords = { x = 719.81, y = -993.68, z = 26.23 }, -- Vespucci Blvd
	},
	{
		coords = { x = 797.26, y = -759.87, z = 26.85 }, -- Popular St.
	},
	{
		coords = { x = 1071.76, y = -796.36, z = 58.32 }, -- West Mirror Drive
	},
	{
		coords = { x = 1231.43, y = -481.09, z = 66.55 }, -- Mirror Park Blvd
	},
	{
		coords = { x = 18.09, y = -1024.41, z = 46.37 }, -- Vespucci Blvd
	},
	{
		coords = { x = 13.75, y = -1009.97, z = 57.25 }, -- Vespucci Blvd
	},
	{
		coords = { x = 9.75, y = 6494.84, z = 31.67 }, -- Paleto Blvd
	},
	{
		coords = { x = 101.51, y = 6617.22, z = 32.47 }, -- Paleto Blvd (Interior, mechanic garage)
	},
	{
		coords = { x = -267.69, y = 6323.86, z = 37.6 }, -- Paleto Blvd (Paleto Medical Roof)
	},
	{
		coords = { x = -198.83, y = 6466.91, z = 33.45 }, -- Procopio Dr
	},
	{
		coords = { x = 66.37, y = 6652.48, z = 32.28 }, -- Procopio
	},
	{
		coords = { x = 183.45, y = 6441.19, z = 31.24 }, -- Great Ocean Hwy
	},
	{
		coords = { x = 58.03, y = 6305.56, z = 31.23 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -146.64, y = 6163.09, z = 31.21 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -35.79, y = 6278.17, z = 39.54 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -146.63, y = 6180.13, z = 40.16 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -41.13, y = -1393.27, z = 34.76 }, -- Innocence Blvd (roof)
	},
}

Config.MediumFires           = {
	{
		coords = { x = 1982.01, y = 3052.13, z = 47.22 }, -- Yellow Jack
	},
	{
		coords = { x = 1365.39, y = 3648.32, z = 33.79 }, -- Marina Drive
	},
	{
		coords = { x = 1597.13, y = 3584.01, z = 38.77 }, -- Algonquin Blvd
	},
	{
		coords = { x = -607.88, y = 1328.7, z = 297.64 }, -- West Galileo Ave - Vinewood Hills
	},
	{
		coords = { x = 179.78, y = 328.41, z = 112.43 }, -- Clinton Ave - Vinewood
	},
	{
		coords = { x = 401.18, y = 345.37, z = 114.45 }, -- Power Street - Clinton Ave (Roof)
	},
	{
		coords = { x = 269.04, y = 275.73, z = 105.63 }, -- Alta St. Vinewood
	},
	{
		coords = { x = -1152.67, y = -1381.16, z = 18.83 }, -- Bay City Ave
	},
	{
		coords = { x = -1166.17, y = -1396.23, z = 4.91 }, -- Aguja St
	},
	{
		coords = { x = 89.79, y = -1906.92, z = 21.28 }, -- Grove Street
	},
	{
		coords = { x = -218.17, y = -2009.52, z = 19.29 },
	},
	{
		coords = { x = 550.21, y = -1605.82, z = 28.77 }, -- Roy Lowenstein Blvd
	},
	{
		coords = { x = 445.51, y = -1469.36, z = 33.1 }, -- Davis Ave / Capital (roof)
	},
	{
		coords = { x = 481.02, y = -1325.72, z = 29.21 }, -- Little Bighorn Ave (interior)
	},
	{
		coords = { x = 744.22, y = -1321.68, z = 35.53 }, -- Olympic Fwy (roof)
	},
	{
		coords = { x = 846.4, y = -1376.0, z = 26.2 }, -- Olympic Fwy
	},
	{
		coords = { x = 941.15, y = -1274.03, z = 38.88 }, -- Elysian Fields Fwy (roof)
	},
	{
		coords = { x = 916.98, y = -1157.59, z = 25.22 }, -- Olympic Fwy
	},
	{
		coords = { x = 705.87, y = -960.42, z = 30.4 }, -- Vespucci Blvd (interior)
	},
	{
		coords = { x = 727.63, y = -1071.47, z = 28.31 }, -- Olympic Fwy (interior)
	},
	{
		coords = { x = 773.68, y = -1195.1, z = 24.29 }, -- Olympic Fwy/Popular St.
	},
	{
		coords = { x = 1130.72, y = -982.38, z = 46.42 }, -- El Ranco Blvd / Vespucci Blvd (interior)
	},
	{
		coords = { x = 1129.59, y = -317.46, z = 67.08 }, -- West Mirror Dive
	},
	{
		coords = { x = 1161.64, y = -303.46, z = 73.84 }, -- Mirror Park Blvd
	},
	{
		coords = { x = 424.86, y = -805.54, z = 29.49 }, -- Sinner St.
	},
	{
		coords = { x = 1141.31, y = -427.21, z = 67.29 }, -- Mirror Park Blvd
	},
	{
		coords = { x = 1158.85, y = -431.08, z = 70.78 }, -- Mirror Park Blvd
	},
	{
		coords = { x = -12.92, y = -1012.16, z = 46.34 }, -- Power St.
	},
	{
		coords = { x = 1.04, y = -1007.5, z = 89.19 }, -- Vespucci Blvd
	},
	{
		coords = { x = 250.77, y = -47.96, z = 69.94 }, -- Spanish Ave Ammunition
	},
	{
		coords = { x = 5.46, y = -6513.65, z = 31.88 }, -- Paleto Blvd
	},
	{
		coords = { x = -111.14, y = -6470.45, z = 31.63 }, -- Paleto Blvd (Blaine County Savings)
	},
	{
		coords = { x = -241.02, y = 6323.32, z = 37.62 }, -- Plateo Blvd (Paleto Bay Medical Roof)
	},
	{
		coords = { x = 65.33, y = 6663.57, z = 31.79 }, -- Procopio Dr.
	},
	{
		coords = { x = -80.39, y = 6223.23, z = 32.03 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -105.35, y = 6109.6, z = 38.43 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -10.35, y = 6288.55, z = 38.86 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -101.9, y = 6195.06, z = 36.2 }, -- Great Ocean Hwy
	},
	{
		coords = { x = 32.93, y = -1460.17, z = 29.31 }, -- Great Ocean Hwy
	},
}

Config.LargeFires            = {
	{
		coords = { x = 1176.93, y = 2636.9, z = 37.75 }, -- Los Customs Rt 68
	},
	{
		coords = { x = 1390.38, y = 3606.85, z = 38.94 }, -- Meth Lab Sandy
	},
	{
		coords = { x = 1540.47, y = 3588.0, z = 38.77 }, -- Algonquin Blvd
	},
	{
		coords = { x = 64.26, y = 3677.04, z = 39.74 }, -- Calafia Rd.
	},
	{
		coords = { x = -264.22, y = 1513.6, z = 328.09 }, -- East Galileo Ave
	},
	{
		coords = { x = -8.66, y = 521.25, z = 174.63 }, -- Whispymoud Dr. / Wild Oats Dr. Vinewood Hills
	},
	{
		coords = { x = 1417.31, y = -618.3, z = 38.9 } -- Marathon Ave (roof),
	},
	{
		coords = { x = -1127.25, y = -963.06, z = 6.63 }, -- Prosperity St.
	},
	{
		coords = { x = 506.79, y = -1804.66, z = 28.5 }, -- Jamestown St.
	},
	{
		coords = { x = 516.09, y = -1750.59, z = 28.69 }, -- Jamestown St.
	},
	{
		coords = { x = 530.81, y = -1617.45, z = 34.33 }, -- Roy Lowenstein Blvd
	},
	{
		coords = { x = 475.18, y = -1311.23, z = 29.21 }, --Little Bighorn Ave (Interior)
	},
	{
		coords = { x = 697.19, y = -1350.74, z = 25.43 }, -- Olympic fwy
	},
	{
		coords = { x = 478.7, y = -1285.59, z = 39.68 }, -- Olympic Fwy (roof)
	},
	{
		coords = { x = 915.96, y = -1140.22, z = 24.62 }, -- Olympic Fwy
	},
	{
		coords = { x = 842.45, y = -1031.64, z = 28.19 }, -- Olympic Fwy (Ammunition)
	},
	{
		coords = { x = 931.87, y = -894.44, z = 50.05 }, -- Supply St.
	},
	{
		coords = { x = 923.54, y = -947.68, z = 59.09 }, -- Vespucci Blvd (roof)
	},
	{
		coords = { x = 712.55, y = -961.27, z = 30.4 }, --Vespucci Blvd (interior)
	},
	{
		coords = { x = 1138.22, y = -336.35, z = 72.4 }, -- West Mirror Drive (roof)
	},
	{
		coords = { x = 364.16, y = -1195.34, z = 32.26 }, -- Olympic Fwy (under)
	},
	{
		coords = { x = 460.46, y = -849.65, z = 27.65 }, -- San Andreas Ave (Under)
	},
	{
		coords = { x = 1170.78, y = -436.69, z = 70.78 }, -- Mirror Park Blvd
	},
	{
		coords = { x = 20.48, y = -1002.06, z = 83.38 }, -- Vespucci Blvd
	},
	{
		coords = { x = 231.92, y = 6406.34, z = 31.7 }, -- Great Ocean Hwy
	},
	{
		coords = { x = -163.94, y = 6150.99, z = 31.21 }, -- Great Ocean Hwy
	},
	{
		coords = { x = 75.68, y = -1399.54, z = 34.83 }, -- Innocence Blvd (roof)
	},
}
