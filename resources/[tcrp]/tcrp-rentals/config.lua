Config = {}

Config.PlaneRentals = {
	{car = "vestra", price = 12500},
    {car = "velum2", price = 12500},
    {car = "stunt", price = 10000},
    {car = "duster", price = 3500},
    {car = "besra", price = 25000},
    {car = "alphaz1", price = 15000},
    {car = "nimbus", price = 20000},
    {car = "blimp3", price = 3500},
    {car = "microlight", price = 2500},
    {car = "mammatus", price = 10000},
    {car = "luxor", price = 25000},
    {car = "howard", price = 12500},
    {car = "maverick", price = 15000},
    {car = "havok", price = 12500},
    {car = "seasparrow", price = 12500},
    {car = "supervolito", price = 20000},
    {car = "swift", price = 25000},
    {car = "swift2", price = 30000},
    {car = "cargobob2", price = 12500},
}

Config.PDMRentals = {
    {car = "jackal", price = 1500},
    {car = "windsor", price = 1500},
    {car = "toros", price = 1500},
    {car = "coquette3", price = 1500},
    {car = "stretch", price = 3000},
    {car = "monroe", price = 2500},
    {car = "voltic", price = 1000},
    {car = "hakuchou", price = 750},
    {car = "stryder", price = 750},
    {car = "kuruma", price = 2500},
}

Config.LarrysRentals = {
    {car = "club", price = 500},
    {car = "glendale2", price = 750},
    {car = "granger", price = 2500},
    {car = "paradise", price = 750},
    {car = "camper", price = 500},
    {car = "moonbeam", price = 750},
    {car = "tulip", price = 2500},
    {car = "sandking", price = 2500},
    {car = "zombieb", price = 500},
    {car = "blazer", price = 300},
    {car = "manchez", price = 500},
    {car = "sanchez", price = 500},
}

Config.HelmutsRentals = {
    {car = "dilettante", price = 750},
    {car = "panto", price = 750},
    {car = "surfer", price = 500},
    {car = "oracle2", price = 2000},
    {car = "tailgater", price = 1500},
    {car = "patriot", price = 3000},
    {car = "sabregt", price = 2000},
    {car = "everon", price = 2500},
    {car = "vader", price = 500},
}

Config.LSIARentals = {
    {car = "dilettante", price = 750},
    {car = "panto", price =750},
    {car = "vader", price = 500},
    {car = "moonbeam", price = 750},
    {car = "camper", price = 500},
    {car = "jackal", price = 1500},
    {car = "club", price = 500},
    {car = "glendale2", price = 750},
    {car = "sandking", price = 2500},
}

Config.KartRentals = {
    {car = "kart", price = 500},
    {car = "vetok", price = 500},
    {car = "vetog", price = 500},
    {car = "veto", price = 500},
    {car = "veto2", price = 500},
}

Config.BoatRentals = {
    {car = "dinghy", price = 500},
    {car = "marquis", price = 500},
    {car = "tropic", price = 500},
    {car = "jetmax", price = 500},
    {car = "speeder", price = 500},
    {car = "tug", price = 500},
}

Config.BikeRentals = {
    {car = "bmx", price = 50},
    {car = "scorcher", price = 50},
    {car = "tribike", price = 50},
    {car = "cruiser", price = 50},
    {car = "fixter", price = 50},
}

Config.MarkerZones = { 
    --[[{--Helmut's Rentals 
        Type = "car3",
        Menu = vec3(-216.24, 6211.77, 30.50),
        Spawn = vec3(-216.24, 6211.77, 30.49),
        SpawnHeading = 314.86,
    },
    {--Larry's Rentals 
        Type = "car2",
        Menu = vec3(1247.57, 2716.6, 37.02),
        Spawn = vec3(1247.57, 2716.6, 37.01),
        SpawnHeading = 192.69,
    },
    {--LSIA Car Rentals 
        Type = "car4",
        Menu = vec3(-1028.42, -2743.67, 19.18),
        Spawn = vec3(-1024.95, -2733.95, 19.50),
        SpawnHeading = 236.58,
    },
    {--PDM Rentals 
        Type = "car1", 
        Menu = vec3(-17.4, -1108.86, 25.68),
        Spawn = vec3(-17.4, -1108.86, 25.67),
        SpawnHeading = 166.35,
    },--]]
    {--LSIA Plane Rentals 
        Type = "plane",
        Menu = vec3(-1061.39, -3493.22, 13.15),
        Spawn = vec3(-1061.39, -3493.22, 14.14),
        SpawnHeading = 333.02,
    },
    {--Grapeseed Plane Rentals
        Type = "plane",
        Menu = vec3(2148.35, 4794.99, 40.16),
        Spawn = vec3(2141.08, 4813.42, 41.21),
        SpawnHeading = 117.79,
    },
    {--Sandy Plane Rentals 
        Type = "plane",
        Menu = vec3(1727.86, 3289.52, 40.18),
        Spawn = vec3(1715.83, 3253.74, 41.12),
        SpawnHeading = 101.19,
    },
    {--Kart Track
        Type = "karts",
		Menu = vec3(-170.73, -2145.09, 15.86), -- Rental Marker
		Spawn = vec3(-166.61, -2146.29, 16.84), -- Kart Spawn Point
		SpawnHeading = 237.17, -- Kart Heading
	},
    {--Chumash
        Type = "boats",
		Menu = vec3(-3426.7,	955.66, 7.35), -- Rental Marker
		Spawn = vec3(-3426.2, 942.4, 1.1), -- Boat Spawn Point
		SpawnHeading = 90.0, -- Boat Heading
	},
	{--Marina
        Type = "boats",
		Menu = vec3(-800.22, -1512.83, 0.6),
		Spawn = vec3(-802.05, -1504.36, -0.47),
		SpawnHeading = 112.27,
	},  
	{--Paleto
        Type = "boats",
		Menu = vec3(-281.25, 6632.1, 6.4),
		Spawn = vec3(-330.22, 6660.0, 1.0),
		SpawnHeading = 45.0,
	},
	{--Catfish View
        Type = "boats",
		Menu = vec3(3839.49, 4444.32, 0.10),
		Spawn = vec3(3855.92, 4448.27, 1.0),
		SpawnHeading = 274.86,
	},
	{--North Alamo Sea
        Type = "boats",
		Menu = vec3(1330.8, 4226.6, 32.9),
		Spawn = vec3(1328.17, 4218.90, 30.0),
		SpawnHeading = 256.00,
	},
    {--Olympic Skate Park
        Type = "bikes",
        Menu = vec3(765.26, -1224.86, 24.23),
        Spawn = vec3(764.61, -1222.92, 24.57),
        SpawnHeading = 90.02,
    },
    {--Decker Skate Park
        Type = "bikes",
        Menu = vec3(-895.88, -778.98, 14.92),
        Spawn = vec3(-897.38, -761.52, 15.30),
        SpawnHeading = 142.99,
    },
    {--Vespucci Skate Park
        Type = "bikes",
        Menu = vec3(-1107.86, -1693.42, 3.38),
        Spawn = vec3(-1105.84, -1692.43, 3.74),
        SpawnHeading = 35.36,
    },
}

