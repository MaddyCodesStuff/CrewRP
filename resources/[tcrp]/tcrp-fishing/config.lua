Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
	Config.FishTime = {a = 20000, b = 44000}

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.SellLegal = {
		{
			pos = vec3(-2175.14, 4288.03, 48.12), 
			type = "legal",
			sellText1 = "Fish Market",
			blip = 317,
			colour = 69,
			onMap = true,
		},
	}

	Config.SellIllegal = {
		{
			pos = vec3(-106.39, -2230.01, 7.31), 
			type = "illegal", 
			sellText2 = "Fish Black Market",
			blip = 68,
			colour = 49,
			onMap = false,
		},
	}

Config.prices = {
	fish = {min = 25, max = 25},
	sharktiger = {min = 700, max = 1000},
	stingray = {min = 400, max = 600},
	turtle = {min = 200, max = 400} 
} 