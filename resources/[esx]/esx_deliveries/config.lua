Config = {}

-- Locales
Config.Locale = 'en'

-- Delivery Base Location
Config.Base = {
	-- Blip coords
	coords  = {x = -314.0, y = -1035.21, z = 30.53},
	-- Scooter mark
	scooter = {x = -319.17, y = -1032.14, z = 29.55},
	-- Van mark
	van     = {x = -323.17, y = -1030.63, z = 29.55},
	-- Truck mark
	truck   = {x = -326.75, y = -1029.23, z = 29.55},
	-- Return vehicle mark
	retveh  = {x = -271.3, y = -1009.66, z = 29.87},
	-- Delete vehicle mark
	deleter = {x = -338.26, y = -1023.18, z = 30.38},
	-- Heading
	heading = 245.0,
}

Config.DecorCode = 0

-- Min and max deliveries jobs
Config.Deliveries = {
	min = 5,
	max = 7,
}

-- The salary of jobs
Config.Rewards = {
	scooter = math.random(50, 100),
	van     = math.random(100, 150),
	truck   = math.random(300, 400),
}

-- Vehicle model
Config.Models = {
	scooter = 'faggio3',
	van     = 'pony',      
	truck   = 'mule',
	vehDoor = {
		-- If this value is true, it will open the vehicle trunk when player remove the goods from the vehicle.
		usingTrunkForVan   = true,  -- If you using original game vehicle, set this to false
		usingTrunkForTruck = false,
	},
}

-- Scale of the arrow, usually not modified it
Config.Scales = {
	scooter = 0.6,
	van     = 3.0,
	truck   = 4.5,
}

-- Random delivery locations of scooter
-- Item1 = parking location, Item2 = Place goods location
Config.DeliveryLocationsScooter = {
	{Item1 = {x = -153.19, y = -838.31, z = 30.12},		Item2 = {x = -143.85, y = -846.3, z = 30.60}}, --Law Offices
	{Item1 = {x = 37.72, y = -795.71, z = 30.93},		Item2 = {x = 44.94, y = -803.24, z = 31.52}}, --G&P Lower Power
	{Item1 = {x = 111.70, y = -809.56, z = 30.71},		Item2 = {x = 102.19, y = -818.22, z = 31.35}}, --San Andreas Fancy Building
	{Item1 = {x = 132.61, y = -889.41, z = 29.71},		Item2 = {x = 121.25, y = -879.82, z = 31.12}}, --Escapism Travel San Andreas
	{Item1 = {x = 54.41, y = -994.86, z = 28.70},		Item2 = {x = 43.89, y = -997.98, z = 29.34}}, --Wisdahl Hotel Vespucci
	{Item1 = {x = 54.41, y = -994.86, z = 28.70},		Item2 = {x = 57.65, y = -1003.72, z = 29.36}}, -- Hot Dog Stand
	{Item1 = {x = 142.87, y = -1026.78, z = 28.67},		Item2 = {x = 135.44, y = -1031.19, z = 29.35}}, --Spines Bookshop Vespucci
	{Item1 = {x = 248.03, y = -1005.49, z = 28.61},		Item2 = {x = 254.83, y = -1013.25, z = 29.27}}, --Shenanigan's Bar Strawberry
	{Item1 = {x = 275.68, y = -929.64, z = 28.47},		Item2 = {x = 285.55, y = -937.26, z = 29.39}}, --Elkridge Hotel Strawberry 
	{Item1 = {x = 294.29, y = -877.33, z = 28.61},		Item2 = {x = 301.12, y = -883.47, z = 29.28}}, --International Jewelry Exchange
	{Item1 = {x = 247.68, y = -832.03, z = 29.16},		Item2 = {x = 258.66, y = -830.44, z = 29.58}}, --Crucial Fix Coffee Shop
	{Item1 = {x = 227.21, y = -705.26, z = 35.07},		Item2 = {x = 232.20, y = -714.55, z = 35.78}}, --Elgin Ave
	{Item1 = {x = 241.06, y = -667.74, z = 37.44},		Item2 = {x = 245.50, y = -677.70, z = 37.75}}, --Elgin Ave
	{Item1 = {x = 257.05, y = -628.21, z = 40.59},		Item2 = {x = 268.54, y = -640.44, z = 42.02}}, --Elgin Ave
	{Item1 = {x = 211.33, y = -605.63, z = 41.42},		Item2 = {x = 222.32, y = -596.71, z = 43.87}}, --Skyscraper Across From Pillbox
	{Item1 = {x = 126.27, y = -555.46, z = 42.66},		Item2 = {x = 168.11, y = -567.17, z = 43.87}}, --Penris tower
	{Item1 = {x = 254.20, y = -377.17, z = 43.96},		Item2 = {x = 239.06, y = -409.27, z = 47.92}}, --Occupation City Hall
	{Item1 = {x = 211.34, y = 348.81, z = 105.67},		Item2 = {x = 225.11, y = 337.41, z = 105.6}}, --Pitchers
	{Item1 = {x = 130.77, y = -307.27, z = 44.58},		Item2 = {x = 138.67, y = -285.45, z = 50.45}}, --Random House Occupation Ave
	{Item1 = {x = 54.44, y = -280.40, z = 46.90},		Item2 = {x = 61.86, y = -260.86, z = 52.35}}, --Motel Occupation
	{Item1 = {x = 55.15, y = -225.54, z = 50.44},		Item2 = {x = 76.29, y = -233.15, z = 51.4}}, --Alta 24/7
	{Item1 = {x = 44.60, y = -138.99, z = 54.66},		Item2 = {x = 50.78, y = -136.23, z = 55.2}}, --Trey baker Hawick
	{Item1 = {x = 32.51, y = -162.61, z = 54.86},		Item2 = {x = 26.84, y = -168.84, z = 55.54}}, --Knowwear hawick
	{Item1 = {x = -29.60, y = -110.84, z = 56.51},		Item2 = {x = -23.50, y = -106.74, z = 57.04}}, --Vinewood Sports LS Hawick
	{Item1 = {x = -96.86, y = -86.84, z = 57.44},		Item2 = {x = -87.82, y = -83.55, z = 57.82}}, --Los Santos Corner Store
	{Item1 = {x = -146.26, y = -71.46, z = 53.90},		Item2 = {x = -132.92, y = -69.02, z = 55.42}}, --Fruit of the Vine Wine Hawick
	{Item1 = {x = -238.41, y = 91.97, z = 68.11},		Item2 = {x = -263.61, y = 98.88, z = 69.30}}, --Apartments San Vitus
	{Item1 = {x = -251.45, y = 20.43, z = 53.9},		Item2 = {x = -273.35, y = 28.21, z = 54.75}}, --Eclipse Lodge San Vitus
	{Item1 = {x = -322.40, y = -10.06, z = 47.42},		Item2 = {x = -315.48, y = -3.76, z = 48.20}}, --Hawick Apt Complex
	{Item1 = {x = -497.33, y = -8.38, z = 44.33},		Item2 = {x = -500.95, y = -18.65, z = 45.13}}, --Banger's Bicycles
	{Item1 = {x = -406.69, y = -44.87, z = 45.13},		Item2 = {x = -429.07, y = -24.12, z = 46.23}}, --Cockatoos
	{Item1 = {x = -583.22, y = -154.84, z = 37.51},		Item2 = {x = -582.80, y = -146.80, z = 38.23}}, --Rockford PD
	{Item1 = {x = -613.68, y = -213.46, z = 36.51},		Item2 = {x = -622.23, y = -210.97, z = 37.33}}, --Anna Rex Rockford
	{Item1 = {x = -582.44, y = -322.69, z = 34.33},		Item2 = {x = -583.02, y = -330.38, z = 34.97}}, --Pendulus Carcer Way
	{Item1 = {x = -658.25, y = -329.00, z = 34.20},		Item2 = {x = -666.69, y = -329.06, z = 35.20}}, --Perseus Portola
	{Item1 = {x = -645.84, y = -419.67, z = 34.10},		Item2 = {x = -654.84, y = -414.21, z = 35.45}}, --Leopold's Palomino Ave
	{Item1 = {x = -712.70, y = -668.08, z = 29.81},		Item2 = {x = -714.58, y = -675.37, z = 30.63}}, --Valdez Cinema
	{Item1 = {x = -648.24, y = -681.53, z = 30.61},		Item2 = {x = -656.77, y = -678.12, z = 31.46}}, --Taco Bomb
	{Item1 = {x = -648.87, y = -904.30, z = 23.80},		Item2 = {x = -660.88, y = -900.72, z = 24.61}}, --Garden Store Palomino Ave
	{Item1 = {x = -529.01, y = -848.03, z = 29.26},		Item2 = {x = -531.00, y = -854.04, z = 29.79}}, --Blick Store Vespucci
	{Item1 = {x = -1102.00, y = -2148.71, z = 13.29},	Item2 = {x = -1097.94, y = -2138.78, z = 13.40}}, --Levito's Warehouse
	{Item1 = {x = 113.82, y = -1934.31, z = 20.66},		Item2 = {x = 124.92, y = -1929.55, z = 21.38}}, --Grove Cul De Sac Home
	{Item1 = {x = 1282.07, y = -1730.15, z = 52.74},	Item2 = {x = 1274.97, y = -1721.36, z = 54.67}}, --Amarillo Vista House
	{Item1 = {x = 1186.34, y = -1452.38, z = 34.97},	Item2 = {x = 1193.68, y = -1461.32, z = 34.87}}, --Capital Fire
	{Item1 = {x = 11.23, y = -1590.04, z = 29.29},		Item2 = {x = 19.87, y = -1598.47, z = 29.28}}, --Taco Farmer
	{Item1 = {x = -69.63, y = -1085.37, z = 26.69},		Item2 = {x = -51.87, y = -1089.61, z = 26.42}}, --PDM
	{Item1 = {x = 394.80, y = -981.58, z = 29.29},		Item2 = {x = 441.22, y = -984.46, z = 30.69}}, --MRPD
	{Item1 = {x = 277.03, y = -583.29, z = 43.14},		Item2 = {x = 308.55, y = -591.88, z = 43.28}}, --Pillbox
	{Item1 = {x = -41.28, y = -1284.08, z = 29.20},		Item2 = {x = -52.62, y = -1289.61, z = 30.91}}, --Los Santos Gym
	{Item1 = {x = -1219.49, y = -862.59, z = 13.18},	Item2 = {x = -1201.15, y = -884.61, z = 13.26}}, --Burgershot
	{Item1 = {x = -1393.70, y = -581.99, z = 30.15},	Item2 = {x = -1392.85, y = -598.37, z = 30.32}}, --Bahama Mama's
	{Item1 = {x = -638.09, y = -243.6, z = 38.12},		Item2 = {x = -625.12, y = -231.25, z = 38.06}}, --Vangelico's
	{Item1 = {x = -622.23, y = 254.19, z = 81.59},		Item2 = {x = -623.11, y = 231.25, z = 81.90}}, --Coffee Shop
	{Item1 = {x = -1612.79, y = 185.85, z = 59.79},		Item2 = {x = -1635.71, y = 181.22, z = 61.76}}, --University
	{Item1 = {x = -1284.71, y = 294.73, z = 64.88},		Item2 = {x = -1274.54, y = 314.45, z = 65.51}}, --The Richman Hotel
	{Item1 = {x = -956.34, y = 796.26, z = 178.29},		Item2 = {x = -962.44, y = 811.27, z = 177.57}}, --House Sheldon Ave
	{Item1 = {x = 852.49, y = -123.81, z = 79.14},		Item2 = {x = 840.59, y = -117.27, z = 79.77}}, --O'Conors Pub
	{Item1 = {x = 221.05, y = 219.29, z = 105.43},		Item2 = {x = 242.10, y = 224.15, z = 106.29}}, --PSB
	{Item1 = {x = 321.79, y = -269.38, z = 53.76},		Item2 = {x = 313.04, y = -278.41, z = 54.17}}, --Hawick Fleeca
	{Item1 = {x = -1219.89, y = -318.18, z = 37.54},	Item2 = {x = -1214.20, y = -330.93, z = 37.79}}, --Rockford Fleeca
	{Item1 = {x = 152.46, y = -1029.84, z = 29.20},		Item2 = {x = 148.76, y = -1039.93, z = 29.38}}, --Vespucci Fleeca
	{Item1 = {x = 306.98, y = -1080.82, z = 29.37},		Item2 = {x = 319.98, y = -1075.42, z = 29.48}}, --Vespucci Pharmacy
	{Item1 = {x = 316.26, y = -737.18, z = 29.20},		Item2 = {x = 304.10, y = -731.11, z = 29.35}}, --Strawberry Pharmacy
	{Item1 = {x = 377.71, y = -841.43, z = 29.15},		Item2 = {x = 376.82, y = -828.69, z = 29.30}}, --Best Buds
	{Item1 = {x = -1203.19, y = -1190.87, z = 7.59},	Item2 = {x = -1190.36, y = -1193.89, z = 7.79}}, --Flower Shop
	{Item1 = {x = -130.64, y = -257.79, z = 43.32},		Item2 = {x = -141.62, y = -247.47, z = 44.05}}, --Bowling Alley
	{Item1 = {x = -1679.49, y = -296.96, z = 51.81},	Item2 = {x = -1693.22, y = -280.82, z = 51.86}}, --Church
	{Item1 = {x = -2296.51, y = 375.65, z = 174.47},	Item2 = {x = -2288.63, y = 352.40, z = 174.60}}, --Kortz Center
	{Item1 = {x = 477.97, y = -3123.45, z = 6.07},		Item2 = {x = 466.90, y = -3128.90, z = 6.07}}, --Merryweather Docks
}

-- Random delivery locations of van
Config.DeliveryLocationsVan = {
	{Item1 = {x = -51.17, y = -1734.52, z = 29.29},		Item2 = {x = -40.59, y = -1747.47, z = 29.30}}, --Grove St LTD
	{Item1 = {x = 369.38, y = 317.44, z = 103.21},		Item2 = {x = 375.08, y = 333.65, z = 103.57}}, --Clinton 24/7
	{Item1 = {x = -723.06, y = -916.31, z = 19.01},		Item2 = {x = -702.84, y = -917.71, z = 19.22}}, --Little Seoul LTD
	{Item1 = {x = -1225.49, y = -893.3, z = 12.13},		Item2 = {x = -1223.77, y = -912.26, z = 12.33}}, --San Andreas Rob's Liquor
	{Item1 = {x = -1506.82, y = -383.06, z = 40.64},	Item2 = {x = -1482.29, y = -378.95, z = 40.16}}, --Prosperity Rob's Liquor
	{Item1 = {x = 1149.13, y = -985.08, z = 45.64},		Item2 = {x = 1131.86, y = -979.32, z = 46.42}}, --El Rancho Rob's Liquor
	{Item1 = {x = 1157.19, y = -331.77, z = 68.64},		Item2 = {x = 1159.99, y = -327.66, z = 69.21}}, --Mirror Park LTD
	{Item1 = {x = -1145.42, y = -1590.97, z = 4.06},	Item2 = {x = -1150.31, y = -1601.70, z = 4.39}}, --Gyro Day Vespucci Beach
	{Item1 = {x = 48.18, y = -992.62, z = 29.03},		Item2 = {x = 38.41, y = -1005.30, z = 29.48}}, --Hot Dog Shop
	{Item1 = {x = 370.05, y = -1036.4, z = 28.99},		Item2 = {x = 376.70, y = -1028.82, z = 29.34}}, --Ground Pound Cafe by MRPD
	{Item1 = {x = 785.95, y = -761.67, z = 26.33},		Item2 = {x = 797.00, y = -757.31, z = 26.89}}, --Casey's Diner Popular Street
	{Item1 = {x = 41.53, y = -138.21, z = 55.08},		Item2 = {x = 50.96, y = -135.49, z = 55.2}}, --Trey Baker Hawick
	{Item1 = {x = 102.16, y = 303.96, z = 110.02},		Item2 = {x = 90.86, y = 298.51, z = 110.21}}, --Up N Atom Vinewood
	{Item1 = {x = -565.73, y = 268.54, z = 82.55},		Item2 = {x = -562.25, y = 283.98, z = 82.18}}, --Tequila La
	{Item1 = {x = -153.19, y = -838.31, z = 30.12},		Item2 = {x = -143.85, y = -846.3, z = 30.6}}, --Law Offices
	{Item1 = {x = 37.72, y = -795.71, z = 30.93},		Item2 = {x = 44.94, y = -803.24, z = 31.52}}, --G&P Lower Power
	{Item1 = {x = 111.70, y = -809.56, z = 30.71},		Item2 = {x = 102.19, y = -818.22, z = 31.35}}, --San Andreas Fancy Building
	{Item1 = {x = 132.61, y = -889.41, z = 29.71},		Item2 = {x = 121.25, y = -879.82, z = 31.12}}, --Escapism Travel San Andreas
	{Item1 = {x = 54.41, y = -994.86, z = 28.70},		Item2 = {x = 43.89, y = -997.98, z = 29.34}}, --Wisdahl Hotel Vespucci
	{Item1 = {x = 54.41, y = -994.86, z = 28.70},		Item2 = {x = 57.65, y = -1003.72, z = 29.36}}, -- Hot Dog Stand
	{Item1 = {x = 142.87, y = -1026.78, z = 28.67},		Item2 = {x = 135.44, y = -1031.19, z = 29.35}}, --Spines Bookshop Vespucci
	{Item1 = {x = 248.03, y = -1005.49, z = 28.61},		Item2 = {x = 254.83, y = -1013.25, z = 29.27}}, --Shenanigan's Bar Strawberry
	{Item1 = {x = 275.68, y = -929.64, z = 28.47},		Item2 = {x = 285.55, y = -937.26, z = 29.39}}, --Elkridge Hotel Strawberry 
	{Item1 = {x = 294.29, y = -877.33, z = 28.61},		Item2 = {x = 301.12, y = -883.47, z = 29.28}}, --Interantional Jewelry Exchange
	{Item1 = {x = 247.68, y = -832.03, z = 29.16},		Item2 = {x = 258.66, y = -830.44, z = 29.58}}, --Crucial Fix Coffee Shop
	{Item1 = {x = 227.21, y = -705.26, z = 35.07},		Item2 = {x = 232.2, y = -714.55, z = 35.78}}, --Elgin Ave
	{Item1 = {x = 241.06, y = -667.74, z = 37.44},		Item2 = {x = 245.5, y = -677.70, z = 37.75}}, --Elgin Ave
	{Item1 = {x = 257.05, y = -628.21, z = 40.59},		Item2 = {x = 268.54, y = -640.44, z = 42.02}}, --Elgin Ave
	{Item1 = {x = 211.33, y = -605.63, z = 41.42},		Item2 = {x = 222.32, y = -596.71, z = 43.87}}, --Skyscraper Across From Pillbox
	{Item1 = {x = 126.27, y = -555.46, z = 42.66},		Item2 = {x = 168.11, y = -567.17, z = 43.87}}, --Penris tower
	{Item1 = {x = 254.20, y = -377.17, z = 43.96},		Item2 = {x = 239.06, y = -409.27, z = 47.92}}, --Occupation City Hall
	{Item1 = {x = 211.34, y = 348.81, z = 105.67},		Item2 = {x = 225.11, y = 337.41, z = 105.60}}, --Pitchers
	{Item1 = {x = 130.77, y = -307.27, z = 44.58},		Item2 = {x = 138.67, y = -285.45, z = 50.45}}, --Random House Occupation Ave
	{Item1 = {x = 54.44, y = -280.40, z = 46.90},		Item2 = {x = 61.86, y = -260.86, z = 52.35}}, --Motel Occupation
	{Item1 = {x = 55.15, y = -225.54, z = 50.44},		Item2 = {x = 76.29, y = -233.15, z = 51.40}}, --Alta 24/7
	{Item1 = {x = 44.60, y = -138.99, z = 54.66},		Item2 = {x = 50.78, y = -136.23, z = 55.20}}, --Trey baker Hawick
	{Item1 = {x = 32.51, y = -162.61, z = 54.86},		Item2 = {x = 26.84, y = -168.84, z = 55.54}}, --Knowwear hawick
	{Item1 = {x = -29.60, y = -110.84, z = 56.51},		Item2 = {x = -23.50, y = -106.74, z = 57.04}}, --Vinewood Sports LS Hawick
	{Item1 = {x = -96.86, y = -86.84, z = 57.44},		Item2 = {x = -87.82, y = -83.55, z = 57.82}}, --Los Santos Corner Store
	{Item1 = {x = -146.26, y = -71.46, z = 53.9},		Item2 = {x = -132.92, y = -69.02, z = 55.42}}, --Fruit of the Vine Wine Hawick
	{Item1 = {x = -238.41, y = 91.97, z = 68.11},		Item2 = {x = -263.61, y = 98.88, z = 69.30}}, --Apartments San Vitus
	{Item1 = {x = -251.45, y = 20.43, z = 53.9},		Item2 = {x = -273.35, y = 28.21, z = 54.75}}, --Eclipse Lodge San Vitus
	{Item1 = {x = -322.40, y = -10.06, z = 47.42},		Item2 = {x = -315.48, y = -3.76, z = 48.20}}, --Hawick Apt Complex
	{Item1 = {x = -497.33, y = -8.38, z = 44.33},		Item2 = {x = -500.95, y = -18.65, z = 45.13}}, --Banger's Bicycles
	{Item1 = {x = -406.69, y = -44.87, z = 45.13},		Item2 = {x = -429.07, y = -24.12, z = 46.23}}, --Cockatoos
	{Item1 = {x = -583.22, y = -154.84, z = 37.51},		Item2 = {x = -582.80, y = -146.80, z = 38.23}}, --Rockford PD
	{Item1 = {x = -613.68, y = -213.46, z = 36.51},		Item2 = {x = -622.23, y = -210.97, z = 37.33}}, --Anna Rex Rockford
	{Item1 = {x = -582.44, y = -322.69, z = 34.33},		Item2 = {x = -583.02, y = -330.38, z = 34.97}}, --Pendulus Carcer Way
	{Item1 = {x = -658.25, y = -329.00, z = 34.2},		Item2 = {x = -666.69, y = -329.06, z = 35.20}}, --Perseus Portola
	{Item1 = {x = -645.84, y = -419.67, z = 34.1},		Item2 = {x = -654.84, y = -414.21, z = 35.45}}, --Leopold's Palomino Ave
	{Item1 = {x = -712.70, y = -668.08, z = 29.81},		Item2 = {x = -714.58, y = -675.37, z = 30.63}}, --Valdez Cinema
	{Item1 = {x = -648.24, y = -681.53, z = 30.61},		Item2 = {x = -656.77, y = -678.12, z = 31.46}}, --Taco Bomb
	{Item1 = {x = -648.87, y = -904.3, z = 23.80},		Item2 = {x = -660.88, y = -900.72, z = 24.61}}, --Garden Store Palomino Ave
	{Item1 = {x = -529.01, y = -848.03, z = 29.26},		Item2 = {x = -531.00, y = -854.04, z = 29.79}}, --Blick Store Vespucci
	{Item1 = {x = -1102.00, y = -2148.71, z = 13.29},	Item2 = {x = -1097.94, y = -2138.78, z = 13.40}}, --Levito's Warehouse
	{Item1 = {x = 113.82, y = -1934.31, z = 20.66},		Item2 = {x = 124.92, y = -1929.55, z = 21.38}}, --Grove Cul De Sac Home
	{Item1 = {x = 1282.07, y = -1730.15, z = 52.74},	Item2 = {x = 1274.97, y = -1721.36, z = 54.67}}, --Amarillo Vista House
	{Item1 = {x = 1186.34, y = -1452.38, z = 34.97},	Item2 = {x = 1193.68, y = -1461.32, z = 34.87}}, --Capital Fire
	{Item1 = {x = 11.23, y = -1590.04, z = 29.29},		Item2 = {x = 19.87, y = -1598.47, z = 29.28}}, --Taco Farmer
	{Item1 = {x = -69.63, y = -1085.37, z = 26.69},		Item2 = {x = -51.87, y = -1089.61, z = 26.42}}, --PDM
	{Item1 = {x = 394.80, y = -981.58, z = 29.29},		Item2 = {x = 441.22, y = -984.46, z = 30.69}}, --MRPD
	{Item1 = {x = 277.03, y = -583.29, z = 43.14},		Item2 = {x = 308.55, y = -591.88, z = 43.28}}, --Pillbox
	{Item1 = {x = -41.28, y = -1284.08, z = 29.20},		Item2 = {x = -52.62, y = -1289.61, z = 30.91}}, --Los Santos Gym
	{Item1 = {x = -1219.49, y = -862.59, z = 13.18},	Item2 = {x = -1201.15, y = -884.61, z = 13.26}}, --Burgershot
	{Item1 = {x = -1393.70, y = -581.99, z = 30.15},	Item2 = {x = -1392.85, y = -598.37, z = 30.32}}, --Bahama Mama's
	{Item1 = {x = -638.09, y = -243.60, z = 38.12},		Item2 = {x = -625.12, y = -231.25, z = 38.06}}, --Vangelico's
	{Item1 = {x = -622.23, y = 254.19, z = 81.59},		Item2 = {x = -623.11, y = 231.25, z = 81.90}}, --Coffee Shop
	{Item1 = {x = -1612.79, y = 185.85, z = 59.79},		Item2 = {x = -1635.71, y = 181.22, z = 61.76}}, --University
	{Item1 = {x = -1284.71, y = 294.73, z = 64.88},		Item2 = {x = -1274.54, y = 314.45, z = 65.51}}, --The Richman Hotel
	{Item1 = {x = -956.34, y = 796.26, z = 178.29},		Item2 = {x = -962.44, y = 811.27, z = 177.57}}, --House Sheldon Ave
	{Item1 = {x = 852.49, y = -123.81, z = 79.14},		Item2 = {x = 840.59, y = -117.27, z = 79.77}}, --O'Conors Pub
	{Item1 = {x = 221.05, y = 219.29, z = 105.43},		Item2 = {x = 242.10, y = 224.15, z = 106.29}}, --PSB
	{Item1 = {x = 321.79, y = -269.38, z = 53.76},		Item2 = {x = 313.04, y = -278.41, z = 54.17}}, --Hawick Fleeca
	{Item1 = {x = -1219.89, y = -318.18, z = 37.54},	Item2 = {x = -1214.20, y = -330.93, z = 37.79}}, --Rockford Fleeca
	{Item1 = {x = 152.46, y = -1029.84, z = 29.20},		Item2 = {x = 148.76, y = -1039.93, z = 29.38}}, --Vespucci Fleeca
	{Item1 = {x = 306.98, y = -1080.82, z = 29.37},		Item2 = {x = 319.98, y = -1075.42, z = 29.48}}, --Vespucci Pharmacy
	{Item1 = {x = 316.26, y = -737.18, z = 29.20},		Item2 = {x = 304.10, y = -731.11, z = 29.35}}, --Strawberry Pharmacy
	{Item1 = {x = 377.71, y = -841.43, z = 29.15},		Item2 = {x = 376.82, y = -828.69, z = 29.30}}, --Best Buds
	{Item1 = {x = -1203.19, y = -1190.87, z = 7.59},	Item2 = {x = -1190.36, y = -1193.89, z = 7.79}}, --Flower Shop
	{Item1 = {x = -130.64, y = -257.79, z = 43.32},		Item2 = {x = -141.62, y = -247.47, z = 44.05}}, --Bowling Alley
	{Item1 = {x = -1679.49, y = -296.96, z = 51.81},	Item2 = {x = -1693.22, y = -280.82, z = 51.86}}, --Church
	{Item1 = {x = -2296.51, y = 375.65, z = 174.47},	Item2 = {x = -2288.63, y = 352.40, z = 174.60}}, --Kortz Center
	{Item1 = {x = 477.97, y = -3123.45, z = 6.07},		Item2 = {x = 466.90, y = -3128.90, z = 6.07}}, --Merryweather Docks
}

-- Random delivery locations of truck
Config.DeliveryLocationsTruck = {
	{Item1 = {x = -1102.00, y = -2148.71, z = 13.29},	Item2 = {x = -1097.94, y = -2138.78, z = 13.40}}, --Levito's Warehouse
	{Item1 = {x = 113.82, y = -1934.31, z = 20.66},		Item2 = {x = 124.92, y = -1929.55, z = 21.38}}, --Grove Cul De Sac Home
	{Item1 = {x = 1186.34, y = -1452.38, z = 34.97},	Item2 = {x = 1193.68, y = -1461.32, z = 34.87}}, --Capital Fire
	{Item1 = {x = 11.23, y = -1590.04, z = 29.29},		Item2 = {x = 19.87, y = -1598.47, z = 29.28}}, --Taco Farmer
	{Item1 = {x = -69.63, y = -1085.37, z = 26.69},		Item2 = {x = -51.87, y = -1089.61, z = 26.42}}, --PDM
	{Item1 = {x = 394.80, y = -981.58, z = 29.29},		Item2 = {x = 441.22, y = -984.46, z = 30.69}}, --MRPD
	{Item1 = {x = 277.03, y = -583.29, z = 43.14},		Item2 = {x = 308.55, y = -591.88, z = 43.28}}, --Pillbox
	{Item1 = {x = -41.28, y = -1284.08, z = 29.20},		Item2 = {x = -52.62, y = -1289.61, z = 30.91}}, --Los Santos Gym
	{Item1 = {x = -1219.49, y = -862.59, z = 13.18},	Item2 = {x = -1201.15, y = -884.61, z = 13.26}}, --Burgershot
	{Item1 = {x = -1393.70, y = -581.99, z = 30.15},	Item2 = {x = -1392.85, y = -598.37, z = 30.32}}, --Bahama Mama's
	{Item1 = {x = -638.09, y = -243.60, z = 38.12},		Item2 = {x = -625.12, y = -231.25, z = 38.06}}, --Vangelico's
	{Item1 = {x = -622.23, y = 254.19, z = 81.59},		Item2 = {x = -623.11, y = 231.25, z = 81.90}}, --Coffee Shop
	{Item1 = {x = -1612.79, y = 185.85, z = 59.79},		Item2 = {x = -1635.71, y = 181.22, z = 61.76}}, --University
	{Item1 = {x = -1284.71, y = 294.73, z = 64.88},		Item2 = {x = -1274.54, y = 314.45, z = 65.51}}, --The Richman Hotel
	{Item1 = {x = -956.34, y = 796.26, z = 178.29},		Item2 = {x = -962.44, y = 811.27, z = 177.57}}, --House Sheldon Ave
	{Item1 = {x = 852.49, y = -123.81, z = 79.14},		Item2 = {x = 840.59, y = -117.27, z = 79.77}}, --O'Conors Pub
	{Item1 = {x = 221.05, y = 219.29, z = 105.43},		Item2 = {x = 242.10, y = 224.15, z = 106.29}}, --PSB
	{Item1 = {x = 321.79, y = -269.38, z = 53.76},		Item2 = {x = 313.04, y = -278.41, z = 54.17}}, --Hawick Fleeca
	{Item1 = {x = -1219.89, y = -318.18, z = 37.54},	Item2 = {x = -1214.2, y = -330.93, z = 37.79}}, --Rockford Fleeca
	{Item1 = {x = 152.46, y = -1029.84, z = 29.20},		Item2 = {x = 148.76, y = -1039.93, z = 29.38}}, --Vespucci Fleeca
	{Item1 = {x = 306.98, y = -1080.82, z = 29.37},		Item2 = {x = 319.98, y = -1075.42, z = 29.48}}, --Vespucci Pharmacy
	{Item1 = {x = 316.26, y = -737.18, z = 29.20},		Item2 = {x = 304.1, y = -731.11, z = 29.35}}, --Strawberry Pharmacy
	{Item1 = {x = 377.71, y = -841.43, z = 29.15},		Item2 = {x = 376.82, y = -828.69, z = 29.30}}, --Best Buds
	{Item1 = {x = -1203.19, y = -1190.87, z = 7.59},	Item2 = {x = -1190.36, y = -1193.89, z = 7.79}}, --Flower Shop
	{Item1 = {x = -130.64, y = -257.79, z = 43.32},		Item2 = {x = -141.62, y = -247.47, z = 44.05}}, --Bowling Alley
	{Item1 = {x = -1679.49, y = -296.96, z = 51.81},	Item2 = {x = -1693.22, y = -280.82, z = 51.86}}, --Church
	{Item1 = {x = -2296.51, y = 375.65, z = 174.47},	Item2 = {x = -2288.63, y = 352.40, z = 174.60}}, --Kortz Center
	{Item1 = {x = 477.97, y = -3123.45, z = 6.07},		Item2 = {x = 466.90, y = -3128.90, z = 6.07}}, --Merryweather Docks
	--Paleto Deliveries
	{Item1 = {x = -137.06, y = 6438.63, z = 31.04},     Item2 = {x = -153.63, y = 6433.83, z = 31.92}}, -- South Seas Apartments
	{Item1 = {x = -101.01, y = 6401.96, z = 30.76},     Item2 = {x = -93.92, y = 6410.13, z = 31.64}}, -- Xero Gas Paleto and Cascabel
	{Item1 = {x = -136.47, y = 6356.20, z = 30.80},     Item2 = {x = -125.66, y = 6358.38, z = 31.52}}, -- Mojito Inn
	{Item1 = {x = -164.10, y = 6381.95, z = 30.64},     Item2 = {x = -179.7, y = 6387.65, z = 31.50}}, -- Bay Side Drugs
	{Item1 = {x = -149.82, y = 6327.60, z = 30.77},     Item2 = {x = -163.85, y = 6319.36, z = 31.60}}, -- Del Vecchio Liquors
	{Item1 = {x = -94.31, y = 6309.66, z = 30.80},      Item2 = {x = -105.43, y = 6316.88, z = 31.58}}, -- Dream View Motel
	{Item1 = {x = -431.92, y = 6135.04, z = 31.38},     Item2 = {x = -438.0, y = 6148.02, z = 31.48}}, -- Post Ops
	{Item1 = {x = -375.92, y = 6098.22, z = 31.68},     Item2 = {x = -370.55, y = 6101.84, z = 31.63}}, -- Paleto Fire
	{Item1 = {x = -233.03 , y = 6242.40, z = 31.43 },   Item2 = {x = -231.34, y = 6234.88 , z = 31.50}},--Helmuts
	{Item1 = {x = -450.03 , y = 6036.22 , z = 31.34 },  Item2 = {x = -447.69 , y = 6013.54 , z = 31.72}},--Highway Patrol
	{Item1 = {x = -67.22, y = 6275.02 , z = 31.37 },    Item2 = {x = -70.84 , y = 6253.54, z = 31.09 }},--Chicken Factory
	{Item1 = {x = -240.54, y = 6335.29 , z = 32.40 },   Item2 = {x = -252.18 , y = 6333.91 , z = 32.43 }},--Paleto Bay Hospital
	{Item1 = {x = -200.44 , y = 6272.02 , z = 30.86 },  Item2 = {x = -195.41 , y = 6264.64 , z = 31.49 }},--Reds Machine Supplies
	{Item1 = {x = -132.63 , y = 6469.78 , z = 30.82 },  Item2 = {x = -99.54 , y = 6461.35 , z = 31.63 }},--Blaine County Savings
	{Item1 = {x = -54.27 , y = 6531.29 , z = 31.49 },   Item2 = {x = -59.50 , y = 6523.92 , z = 31.49 }},--Willies Supermarket
	{Item1 = {x = 134.74 , y = 6634.12 , z = 31.03 },   Item2 = {x = 115.78 , y = 6633.46 , z = 32.00 }},--Paleto Custom Shop
	{Item1 = {x = 134.74 , y = 6634.12 , z = 31.03 },   Item2 = {x = 158.09 , y = 6653.05 , z = 31.67}},--Pat's Keys Shop
	{Item1 = {x = 134.74 , y = 6634.12 , z = 31.03 },   Item2 = {x = 164.19 , y = 6644.56 , z = 31.71 }},--Paleto Shop
	{Item1 = {x = 86.85 , y = 6368.11 , z = 30.60 },    Item2 = {x = 96.18 , y = 6369.12 , z = 31.38 }},--Bell Farms
	{Item1 = {x = -769.91 , y = 5573.00 , z = 32.86 },  Item2 = {x = -753.97 , y = 5579.00 , z = 36.71 }},--Trimway
	{Item1 = {x = -685.59 , y = 5821.88 , z = 16.70 },  Item2 = {x = -672.40 , y = 5835.83 , z = 17.33 }},--Bayview Lodge Store
	{Item1 = {x = -685.59 , y = 5821.88 , z = 16.70 },  Item2 = {x = -689.95 , y = 5798.55 , z = 17.33}},--Bayview Lodge
	{Item1 = {x = 1584.03, y = 6448.77 , z = 25.16 },   Item2 = {x = 1590.50 , y = 6457.87 , z = 26.01 }},--Pops Diner
	{Item1 = {x = 1736.14 , y = 6386.76 , z = 35.03 },  Item2 = {x = 1730.82 , y = 6419.78 , z = 35.04 }},-- 24/7 Senora Fwy North
	{Item1 = {x = -574.25, y = 5371.04, z = 70.47},     Item2 = {x = -589.04, y = 5347.99, z = 70.28}}, -- Lumber Mill
	{Item1 = {x = -1092.06, y = 4943.64, z = 218.57},   Item2 = {x = -1111.49, y = 4936.17, z = 218.38}}, -- Cassidy Resort
	--Grapeseed Deliveries
	{Item1 = {x = 1311.37, y = 4323.21, z = 38.35},     Item2 = {x = 1301.60, y = 4319.40, z = 38.20}}, -- Fishing Village 1
	{Item1 = {x = 1311.37, y = 4323.21, z = 38.35},     Item2 = {x = 1332.92, y = 4326.29, z = 38.04}}, -- FishingVillage 2
	{Item1 = {x = 1311.37, y = 4323.21, z = 38.35},     Item2 = {x = 1309.54, y = 4361.87, z = 41.54}}, -- Millards Boat Shop
	{Item1 = {x = 1691.20, y = 4762.00, z = 42.15},     Item2 = {x = 1719.36, y = 4758.05, z = 41.94}}, -- Wonderama Arcade
	{Item1 = {x = 2109.67, y = 4770.16, z = 41.44},     Item2 = {x = 2123.23, y = 4783.34, z = 40.97}}, -- McKenzie Air Field
	{Item1 = {x = 2569.96, y = 4697.19, z = 34.28},     Item2 = {x = 2564.34, y = 4680.99, z = 34.09}}, -- Shady Tree Farm
	{Item1 = {x = 3320.87, y = 5142.1, z = 18.55},      Item2 = {x = 3316.79, y = 5175.87, z = 18.49}}, -- Lighthouse
	{Item1 = {x = 3576.75, y = 3665.01, z = 34.10},     Item2 = {x = 3601.94, y = 3660.12, z = 33.87}}, -- Humane Labs
	{Item1 = {x = 2764.75, y = 3466.4, z = 55.88},      Item2 = {x = 2750.77, y = 3485.17, z = 55.66}}, -- You Tool
	{Item1 = {x = 2695.75, y = 3280.76, z = 55.47},     Item2 = {x = 2671.39, y = 3284.60, z = 55.24}}, -- 24/7 Senora Fwy South
	--Harmony / Sandy Deliveries
	{Item1 = {x = 2558.42, y = 2740.89, z = 43.04},     Item2 = {x = 2571.19, y = 2720.41, z = 42.9}}, -- Davis Quartz
	{Item1 = {x = 2531.89, y = 2582.56, z = 38.17},     Item2 = {x = 2548.86, y = 2582.01, z = 37.96}}, -- Rex's Diner
	{Item1 = {x = 1860.31, y = 2578.99, z = 45.9},      Item2 = {x = 1837.2, y = 2571.69, z = 45.89}}, -- Bolingbroke Prison
	{Item1 = {x = 1998.99, y = 3060.92, z = 47.28},     Item2 = {x = 1981.37, y = 3051.22, z = 47.21}}, -- Yellow Jack Inn
	{Item1 = {x = 1713.55, y = 3596.74, z = 35.57},     Item2 = {x = 1691.48, y = 3581.82, z = 35.62}}, -- Sandy Fire
	{Item1 = {x = 1805.96, y = 3661.10, z = 34.49},     Item2 = {x = 1829.01, y = 3674.08, z = 34.27}}, -- Sandy Med
	{Item1 = {x = 1869.28, y = 3692.44, z = 33.88},     Item2 = {x = 1852.58, y = 3687.43, z = 34.27}}, -- BCSO
	{Item1 = {x = 1972.32, y = 3746.64, z = 32.50},     Item2 = {x = 1956.38, y = 3746.99, z = 32.34}}, -- 24/7 Sandy
	{Item1 = {x = 1724.69, y = 3715.90, z = 34.40},     Item2 = {x = 1731.07, y = 3708.95, z = 34.18}}, -- Sandy Garages
	{Item1 = {x = 1381.86, y = 3597.79, z = 35.11},     Item2 = {x = 1390.96, y = 3609.18, z = 34.98}}, -- Liquor Ace
	{Item1 = {x = 46.74, y = 3728.41, z = 39.86},       Item2 = {x = 52.01, y = 3742.13, z = 40.29}}, -- Stab City 1
	{Item1 = {x = 46.74, y = 3728.41, z = 39.86},       Item2 = {x = 41.49, y = 3705.15, z = 40.72}}, -- Stab City 2
	{Item1 = {x = 46.74, y = 3728.41, z = 39.86},       Item2 = {x = 65.28, y = 3716.05, z = 39.75}}, -- Stab City 3
	{Item1 = {x = 533.31, y = 2669.99, z = 42.51},      Item2 = {x = 549.65, y = 2663.17, z = 42.16}}, -- 24/7 Route 68
	{Item1 = {x = 642.14, y = 2741.46, z = 42.12},      Item2 = {x = 649.54, y = 2727.72, z = 41.88}}, -- Taco Farmer Route 68
	{Item1 = {x = 1206.20, y = 2703.45, z = 38.22},     Item2 = {x = 1200.11, y = 2714.59, z = 38.22}}, -- discount clothing store Route 68
	{Item1 = {x = 1206.20, y = 2703.45, z = 38.22},     Item2 = {x = 1180.72, y = 2712.23, z = 38.09}}, -- Fleeca Bank Route 68
	{Item1 = {x = 1206.20, y = 2703.45, z = 38.22},     Item2 = {x = 1166.09, y = 2713.90, z = 38.16}}, -- Liquor Store Route 68
	{Item1 = {x = 1225.98, y = 2718.55, z = 38.24},     Item2 = {x = 1229.56, y = 2730.23, z = 38.01}}, -- Larry's Discount Autos
	{Item1 = {x = 331.65, y = 2615.50, z = 44.73},      Item2 = {x = 316.56, y = 2624.77, z = 44.46}}, -- Eastern Motel Route 68
	--Zancudo Valley Deliveries
	{Item1 = {x = -306.98, y = 2742.81, z = 67.46},     Item2 = {x = -310.26, y = 2793.59, z = 59.47}}, -- Church Zancudo Grand Valley
	{Item1 = {x = -1781.93, y = 3085.13, z = 33.04},    Item2 = {x = -1814.15, y = 3097.87, z = 32.84}}, -- Fort Zancudo
	{Item1 = {x = -1889.99, y = 2046.20, z = 141.09},   Item2 = {x = -1863.04, y = 2055.06, z = 135.46}}, -- Winery
	{Item1 = {x = -2206.47, y = 4259.21, z = 47.83},    Item2 = {x = -2185.32, y = 4281.06, z = 49.18}}, -- Hookies
	{Item1 = {x = -1576.22, y = 5167.29, z = 19.80},    Item2 = {x = -1602.76, y = 5193.37, z = 4.31}}, -- Great Ocean Highway Chip Shop
	}

-- Random van goods
Config.VanGoodsPropNames = {
	"prop_crate_11e",
    "prop_cardbordbox_02a",
}
