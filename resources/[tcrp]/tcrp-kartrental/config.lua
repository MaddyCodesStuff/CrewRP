Config = {}

	--------------------------------------------------------
	--=====Locations where players can rent vehicles========--
	--------------------------------------------------------
Config.MarkerZones = { 
	{--kart Track
		Marker = vec3(-170.73, -2145.09, 15.84), -- Rental Marker
		Spawn = vec3(-166.61, -2146.29, 16.84), -- Kart Spawn Point
		SpawnHeading = 237.17, -- Kart Heading
		Return = vec3(-168.93, -2150.33, 15.71) -- Kart Return Point
	},
}
Config.RentalPrice = 500

Config.RentalVehicle = {
		"kart",
		"vetok",
		"vetog",
}
