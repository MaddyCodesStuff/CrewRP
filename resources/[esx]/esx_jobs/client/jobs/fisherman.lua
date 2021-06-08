Config.Jobs.fisherman = {

	BlipInfos = {
		Sprite = 68,
		Color  = 38
	},

	Vehicles  = {

		Truck = {
			Spawner    = 1,
			Hash       = "benson",
			Trailer    = "none",
			HasCaution = true
		},

		Boat  = {
			Spawner    = 2,
			Hash       = "tug",
			Trailer    = "none",
			HasCaution = false
		}

	},

	Zones     = {

		CloakRoom          = {
			Pos    = { x = 868.39, y = -1639.75, z = 29.33 },
			Size   = { x = 3.0, y = 3.0, z = 1.0 },
			Color  = { r = 204, g = 204, b = 0 },
			Marker = 1,
			Blip   = true,
			Name   = _U('fm_fish_locker'),
			Type   = "cloakroom",
			Hint   = _U('cloak_change'),
			GPS    = { x = 880.74, y = -1663.96, z = 29.37 }
		},

		FishingSpot        = {
			Pos    = { x = -291.1, y = -3772.99, z = 0 },
			Color  = { r = 204, g = 204, b = 0 },
			Size   = { x = 110.0, y = 110.0, z = 10.0 },
			Marker = 1,
			Blip   = true,
			Name   = _U('fm_fish_area'),
			Type   = "work",
			Hint   = _U('fm_fish_button'),
			GPS    = { x = 3859.43, y = 4448.83, z = 0.39 },
			Item   = {
				{
					name          = _U('fm_fish'),
					db_name       = "fish",
					time          = 5000,
					max           = 50,
					add           = 1,
					remove        = 1,
					requires      = "nothing",
					requires_name = "Nothing",
					drop          = 100
				}
			},

		},

		BoatSpawner        = {
			Pos     = { x = 87.86, y = -2258.13, z = 6.08 },
			Size    = { x = 3.0, y = 3.0, z = 1.0 },
			Color   = { r = 204, g = 204, b = 0 },
			Marker  = 1,
			Blip    = true,
			Name    = _U('fm_spawnboat_title'),
			Type    = "vehspawner",
			Spawner = 2,
			Hint    = _U('fm_spawnboat'),
			Caution = 0,
			GPS     = { x = 4435.21, y = 4829.60, z = 0.34 }
		},

		BoatSpawnPoint     = {
			Pos     = { x = 89.06, y = -2279.08, z = 0.0 },
			Size    = { x = 3.0, y = 3.0, z = 1.0 },
			Marker  = -1,
			Blip    = false,
			Name    = _U('fm_boat_title'),
			Type    = "vehspawnpt",
			Spawner = 2,
			GPS     = 0,
			Heading = 92.99
		},

		BoatDeletePoint    = {
			Pos      = { x = 166.13, y = -2268.03, z = 0.4 },
			Size     = { x = 10.0, y = 10.0, z = 1.0 },
			Color    = { r = 255, g = 0, b = 0 },
			Marker   = 1,
			Blip     = false,
			Name     = _U('fm_boat_return_title'),
			Type     = "vehdelete",
			Hint     = _U('fm_boat_return_button'),
			Spawner  = 2,
			Caution  = 0,
			GPS      = { x = -1012.64, y = -1354.62, z = 5.54 },
			Teleport = { x = 165.15, y = -2258.05, z = 6.08, h = 7.15 }
		},

		VehicleSpawner     = {
			Pos     = { x = 880.74, y = -1663.96, z = 29.37 },
			Size    = { x = 3.0, y = 3.0, z = 1.0 },
			Color   = { r = 204, g = 204, b = 0 },
			Marker  = 1,
			Blip    = false,
			Name    = _U('spawn_veh'),
			Type    = "vehspawner",
			Spawner = 1,
			Hint    = _U('spawn_veh_button'),
			Caution = 500,
			GPS     = { x = 3867.44, y = 4463.62, z = 1.72 }
		},

		VehicleSpawnPoint  = {
			Pos     = { x = 859.35, y = -1656.21, z = 29.56 },
			Size    = { x = 3.0, y = 3.0, z = 1.0 },
			Marker  = -1,
			Blip    = false,
			Name    = _U('service_vh'),
			Type    = "vehspawnpt",
			Spawner = 1,
			GPS     = 0,
			Heading = 70.1
		},

		VehicleDeletePoint = {
			Pos      = { x = 863.23, y = -1718.28, z = 28.63 },
			Size     = { x = 5.0, y = 5.0, z = 1.0 },
			Color    = { r = 255, g = 0, b = 0 },
			Marker   = 1,
			Blip     = false,
			Name     = _U('return_vh'),
			Type     = "vehdelete",
			Hint     = _U('return_vh_button'),
			Spawner  = 1,
			Caution  = 500,
			GPS      = 0,
			Teleport = 0
		},

		Delivery           = {
			Pos     = { x = -1012.64, y = -1354.62, z = 4.84 },
			Color   = { r = 204, g = 204, b = 0 },
			Size    = { x = 5.0, y = 5.0, z = 3.0 },
			Color   = { r = 204, g = 204, b = 0 },
			Marker  = 1,
			Blip    = true,
			Name    = _U('delivery_point'),
			Type    = "delivery",
			Spawner = 2,
			Hint    = _U('fm_deliver_fish'),
			GPS     = { x = 3867.44, y = 4463.62, z = 1.72 },
			Item    = {
				{
					name          = _U('delivery'),
					time          = 5000,
					remove        = 1,
					max           = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price         = 5,
					requires      = "fish",
					requires_name = _U('fm_fish'),
					drop          = 50
				}
			}
		}

	}
}
