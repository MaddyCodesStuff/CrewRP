Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnablePvCommand            = false
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 50
Config.Locale                     = 'en'

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters               = 3
Config.PlateNumbers               = 3
Config.PlateUseSpace              = true

Config.Labels                     = {
	cardealer  = "PDM",
	cardealer2 = "Paleto",
	cardealer3 = "Sandy",
}

Config.Zones                      = {

	cardealer  = { -- PDM

		ShopEntering    = {
			Pos  = { x = -33.777, y = -1102.021, z = 25.422 },
			Size = { x = 1.5, y = 1.5, z = 1.0 },
			Type = 1,
		},

		ShopInside      = {
			Pos     = { x = -47.570, y = -1097.221, z = 25.422 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = -20.0,
			Type    = -1,
		},

		ShopOutside     = {
			Pos     = { x = -28.637, y = -1085.691, z = 25.565 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 330.0,
			Type    = -1,
		},

		BossActions     = {
			Pos  = { x = -32.065, y = -1114.277, z = 25.422 },
			Size = { x = 1.5, y = 1.5, z = 1.0 },
			Type = -1,
		},

		GiveBackVehicle = {
			Pos  = { x = -18.227, y = -1078.558, z = 25.675 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = 1,
		},

		ResellVehicle   = {
			Pos  = { x = -44.630, y = -1080.738, z = 25.683 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = -1,
		},
	},
	cardealer2 = {
		ShopEntering    = {
			Pos  = { x = -242.89, y = 6219.94, z = 30.94 },
			Size = { x = 1.5, y = 1.5, z = 0.3 },
			Type = 1,
		},

		ShopInside      = {
			Pos     = { x = -237.12, y = 6211.03, z = 31.94, h = 218.64 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 300.0,
			Type    = -1,
		},

		ShopOutside     = {
			Pos     = { x = -237.73, y = 6248.5, z = 30.49, h = 218.64 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 330.0,
			Type    = -1,
		},

		BossActions     = {
			Pos  = { x = -239.45, y = 6218.53, z = 30.94 },
			Size = { x = 1.5, y = 1.5, z = 0.3 },
			Type = -1,
		},

		GiveBackVehicle = {
			Pos  = { x = -221.03, y = 6248.35, z = 30.5 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = 1,
		},

		ResellVehicle   = {
			Pos  = { x = -228.59, y = 6241.01, z = 30.50 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = -1,
		}
	},
	cardealer3 = {
		ShopEntering    = { --Store main selling point
			Pos  = { x = 1231.89, y = 2732.86, z = 37.00, h = 168.8 },
			Size = { x = 1.5, y = 1.5, z = 0.5 },
			Type = 1,
		},

		ShopInside      = {
			Pos     = { x = 1212.17, y = 2719.26, z = 37.03, h = 168.8 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = -20.0,
			Type    = -1,
		},

		ShopOutside     = {
			Pos     = { x = 1212.17, y = 2719.26, z = 37.03, h = 168.8 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 330.0,
			Type    = -1,
		},

		BossActions     = { --store boss area
			Pos  = { x = 1231.97, y = 2730.51, z = 37.00, h = 159.31 },
			Size = { x = 1.5, y = 1.5, z = 0.5 },
			Type = -1,
		},

		GiveBackVehicle = {
			Pos  = { x = 1235.63, y = 2736.24, z = 37.01 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = 1,
		},

		ResellVehicle   = {
			Pos  = { x = 1253.32, y = 2727.49, z = 37.5 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = -1,
		}
	},
	cardealer4 = {
		ShopEntering    = { --Store main selling point
			Pos  = { x = 373.60, y = -1610.21, z = 28.29, h = 229.69 },
			Size = { x = 1.5, y = 1.5, z = 0.5 },
			Type = 1,
		},

		ShopInside      = {
			Pos     = { x = 390.27, y = -1621.49, z = 29.29, h = 320.4 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = -20.0,
			Type    = -1,
		},

		ShopOutside     = {
			Pos     = { x = 390.27, y = -1621.49, z = 28.31, h = 320.4 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 330.0,
			Type    = -1,
		},

		BossActions     = { --store boss area
			Pos  = { x = 371.33, y = -1612.74, z = 28.31, h = 159.31 },
			Size = { x = 1.5, y = 1.5, z = 0.5 },
			Type = -1,
		},

		GiveBackVehicle = {
			Pos  = { x = 379.56, y = -1627.63, z = 27.90 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = 1,
		},

		ResellVehicle   = {
			Pos  = { x = 386.77, y = -1634.77, z = 28.31 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = -1,
		}
	}
}

Config.Zones2                      = {

	cardealer  = { -- PDM

		ShopEntering    = {
			Pos  = { x = -33.777, y = -1102.021, z = 25.422 },
			Size = { x = 1.5, y = 1.5, z = 1.0 },
			Type = 1,
		},

		ShopInside      = {
			Pos     = { x = -47.570, y = -1097.221, z = 25.422 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = -20.0,
			Type    = -1,
		},

		ShopOutside     = {
			Pos     = { x = -28.637, y = -1085.691, z = 25.565 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 330.0,
			Type    = -1,
		},

		BossActions     = {
			Pos  = { x = -32.065, y = -1114.277, z = 25.422 },
			Size = { x = 1.5, y = 1.5, z = 1.0 },
			Type = -1,
		},

		GiveBackVehicle = {
			Pos  = { x = -18.227, y = -1078.558, z = 25.675 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = 1,
		},

		ResellVehicle   = {
			Pos  = { x = -44.630, y = -1080.738, z = 25.683 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = -1,
		},
	},
	cardealer2 = {
		ShopEntering    = {
			Pos  = { x = -242.89, y = 6219.94, z = 30.94 },
			Size = { x = 1.5, y = 1.5, z = 0.3 },
			Type = 1,
		},

		ShopInside      = {
			Pos     = { x = -237.12, y = 6211.03, z = 31.94, h = 218.64 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 300.0,
			Type    = -1,
		},

		ShopOutside     = {
			Pos     = { x = -237.73, y = 6248.5, z = 30.49, h = 218.64 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 330.0,
			Type    = -1,
		},

		BossActions     = {
			Pos  = { x = -239.45, y = 6218.53, z = 30.94 },
			Size = { x = 1.5, y = 1.5, z = 0.3 },
			Type = -1,
		},

		GiveBackVehicle = {
			Pos  = { x = -221.03, y = 6248.35, z = 30.5 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = 1,
		},

		ResellVehicle   = {
			Pos  = { x = -228.59, y = 6241.01, z = 30.50 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = -1,
		}
	},
	cardealer3 = {
		ShopEntering    = { --Store main selling point
			Pos  = { x = 1231.89, y = 2732.86, z = 37.00, h = 168.8 },
			Size = { x = 1.5, y = 1.5, z = 0.5 },
			Type = 1,
		},

		ShopInside      = {
			Pos     = { x = 1212.17, y = 2719.26, z = 37.03, h = 168.8 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = -20.0,
			Type    = -1,
		},

		ShopOutside     = {
			Pos     = { x = 1212.17, y = 2719.26, z = 37.03, h = 168.8 },
			Size    = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 330.0,
			Type    = -1,
		},

		BossActions     = { --store boss area
			Pos  = { x = 1231.97, y = 2730.51, z = 37.00, h = 159.31 },
			Size = { x = 1.5, y = 1.5, z = 0.5 },
			Type = -1,
		},

		GiveBackVehicle = {
			Pos  = { x = 1235.63, y = 2736.24, z = 37.01 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = 1,
		},

		ResellVehicle   = {
			Pos  = { x = 1253.32, y = 2727.49, z = 37.5 },
			Size = { x = 3.0, y = 3.0, z = 1.0 },
			Type = -1,
		}
	}
}
