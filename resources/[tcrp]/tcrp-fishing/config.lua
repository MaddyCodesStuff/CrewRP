Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
	Config.FishTime = {a = 20000, b = 44000}

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.Sell = {
		{
			pos = vec3(-2175.14, 4288.03, 48.12), 
			type = "legal",
			sellText = "Fish Market",
			blip = 317,
			colour = 69,
			onMap = true
		},
	{
			pos = vec3(-106.39, -2230.01, 6.61), 
			type = "illegal", 
			sellText = "Fish Black Market",
			blip = 68,
			colour = 49,
			onMap = false
		}
	}

	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
Config.MarkerZones = { 
	{--Chumash
		Marker = vec3(-3426.7,	955.66, 7.35), -- Rental Marker
		Spawn = vec3(-3426.2, 942.4, 1.1), -- Boat Spawn Point
		SpawnHeading = 90.0, -- Boat Heading
		Return = vec3(-3407.70, 949.22, -0.2) -- Boat Return Point
	},
	{--Marina
		Marker = vec3(-800.22, -1512.83, 0.6),
		Spawn = vec3(-802.05, -1504.36, -0.47),
		SpawnHeading = 112.27,
		Return = vec3(-792.59, -1501.81, 0.0)
	},  
	{--Paleto
		Marker = vec3(-281.25,	6632.1, 6.4),
		Spawn = vec3(-330.22, 6660.0, 1.0),
		SpawnHeading = 45.0,
		Return = vec3(-284.55, 6640.66, -0.2)
	},
	{--Catfish View
		Marker = vec3(3839.49, 4444.32, 0.10),
		Spawn = vec3(3855.92, 4448.27, 1.0),
		SpawnHeading = 274.86,
		Return = vec3(3862.1, 4440.4, -0.2)
	},
	{--North Alamo Sea
		Marker = vec3(1330.8, 4226.6, 32.9),
		Spawn = vec3(1328.17, 4218.90, 30.0),
		SpawnHeading = 256.00,
		Return = vec3(1326.88, 4236.65, 30.0)
	},
}
Config.RentalPrice = 500

Config.RentalBoats = {
	"seashark",
	"dinghy", 
	"marquis", 
	"tropic", 
	"jetmax", 
	"speeder", 
	"tug", 
}

Config.prices = {
	fish = {min = 25, max = 25},
	sharktiger = {min = 700, max = 1000},
	stingray = {min = 400, max = 600},
	turtle = {min = 200, max = 400} 
} 