Config                         = {}
Config.Locale                  = 'en'
Config.DrawDistance            = 25.0

Config.PercentCurrentMoney     = 40 -- % of store current money to transfer to bank
Config.MaxRandomMultiplier     = 2  -- multiplier (musn't go over 100% of PercentCurrentMoney)
-- For example : if 25% : multiplieur max = 4 (4*25=100)
-- partOfCurrentMoney = CurrentMoney * Config.PercentCurrentMoney / 100
-- randomMoneyToBank 	= math.random(partOfCurrentMoney, partOfCurrentMoney * Config.MaxRandomMultiplier)

Config.AddMoneyToStoresTimeOut = 10 -- minutes
Config.AddMoneyToBanksTimeOut  = 60 -- minutes
Config.Cooldown                = 15 -- minutes
Config.TimeBetweenRobs         = 1 -- minutes

--[[
---------- TEMPLATES ----------

-- STORES
["My Little Store"] = {
	Pos				= { x = 28.288, y = -1339.537, z = 28.497 },
	Size  		= { x = 1.5, y = 1.5, z = 1.0 },
	Color 		= { r = 220, g = 110, b = 0 },
	Type  		= 1,
	AreaSize 	= 15, -- maximum area size the player can walk in without canceling the robbery
	CurrentMoney			= 1000, -- store starting money
	MaxMoney 					= 25000, -- store maximum money
	MoneyRegeneration	= nil, -- store money generation each Config.AddMoneyToStoresTimeOut
	BankToDeliver 		= "My Little Bank", -- bank where the store money will go each Config.AddMoneyToBanksTimeOut
	Robbed						= 0, -- DO NOT CHANGE : current timer before new robbery allowed for this store
	TimeToRob					= 10, -- time to take the store money
	TimeBeforeNewRob 	= 100, -- time reference before new robbery allowed
	PoliceRequired		= 2 -- number of cops required to rob this store
},

-- BANKS (must be related to store's BankToDeliver)
["My Little Bank"] = {
	Pos				= { x = -706.193, y = -910.005, z = 18.216 },
	Size  		= { x = 1.5, y = 1.5, z = 1.0 },
	Color 		= { r = 220, g = 110, b = 0 },
	Type  		= 1,
	AreaSize 	= 15, -- maximum area size the player can walk in without canceling the robbery
	CurrentMoney			= 0, -- bank starting money
	MaxMoney 					= 200000,	-- bank maximum money
	Robbed						= 0, -- DO NOT CHANGE : current timer before new robbery allowed for this bank
	TimeToRob					= 10, -- time to take the bank money
	TimeBeforeNewRob 	= 100, -- time reference before new robbery allowed
	PoliceRequired		= 2 -- number of cops required to rob this bank
},

-------------------------------
]]--

Config.Zones                   = {

	-- STORES
	["24/7 Innocence Boulevard"]                    = {
		Pos               = { x = 28.288, y = -1339.537, z = 28.497 },
		NotePos           = { x = 24.33, y = -1345.81, z = 29.3 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Palomino Freeway"]                       = {
		Pos               = { x = 2549.42, y = 384.83, z = 107.62 },
		NotePos           = { x = 2555.47, y = 380.81, z = 108.42 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Clinton Ave"]                            = {
		Pos               = { x = 378.18, y = 333.4, z = 102.57 },
		NotePos           = { x = 372.8, y = 328.24, z = 103.37 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 - Ineseno Road"]                         = {
		Pos               = { x = -3047.67, y = 585.73, z = 6.91 },
		NotePos           = { x = -3041.43, y = 583.57, z = 7.71 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Barbareno Road"]                         = {
		Pos               = { x = -3249.91, y = 1004.32, z = 11.83 },
		NotePos           = { x = -3243.81, y = 999.91, z = 12.63 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Senora Freeway - Chiliad"]               = {
		Pos               = { x = 1734.61, y = 6420.3, z = 34.04 },
		NotePos           = { x = 1728.45, y = 6416.87, z = 34.84 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Niland Ave - Sandy Shores"]              = {
		Pos               = { x = 1959.76, y = 3748.32, z = 31.34 },
		NotePos           = { x = 1959.02, y = 3741.37, z = 32.14 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Senora Freeway - Grand Senora Desert"]   = {
		Pos               = { x = 2673.25, y = 3286.3, z = 54.24 },
		NotePos           = { x = 2676.37, y = 3280.1, z = 55.04 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Route 68 - Harmony"]                     = {
		Pos               = { x = 546.33, y = 2663.68, z = 41.16 },
		NotePos           = { x = 549.46, y = 2669.71, z = 41.96 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Palomino Freeway"]                       = {
		Pos               = { x = 2549.94, y = 384.95, z = 107.62 },
		NotePos           = { x = 2555.53, y = 380.67, z = 108.42 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Legion"]                                 = {
		Pos               = { x = 275.09, y = -984.53, z = 28.37 },
		NotePos           = { x = 271.03, y = -978.88, z = 29.37 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["24/7 Paleto"]                                 = {
		Pos               = { x = 168.66, y = 6644.33, z = 30.71 },
		NotePos           = { x = 162.31, y = 6643.54, z = 31.71 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["LTD Gasoline Grove Street"]                   = {
		Pos               = { x = -43.057, y = -1748.811, z = 28.421 },
		NotePos           = { x = -45.87, y = -1757.23, z = 29.22 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["LTD Gasoline Mirror Park"]                    = {
		Pos               = { x = 1159.5, y = -314.14, z = 68.21 },
		NotePos           = { x = 1164.63, y = -321.46, z = 69.01 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["LTD Gasoline Palomino Ave"]                   = {
		Pos               = { x = -709.74, y = -904.03, z = 18.22 },
		NotePos           = { x = -705.99, y = -912.62, z = 19.02 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["LTD Gasoline Banham Canyon Drive"]            = {
		Pos               = { x = -1829.25, y = 798.75, z = 137.19 },
		NotePos           = { x = -1820.81, y = 795.15, z = 137.89 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["LTD Gasoline Grapeseed - Main Street"]        = {
		Pos               = { x = 1707.5, y = 4919.76, z = 41.06 },
		NotePos           = { x = 1698.81, y = 4922.11, z = 41.86 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 4,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["Rob's Liquor - El Rancho Boulevard"]          = {
		Pos               = { x = 1126.8, y = -980.0, z = 44.42 },
		NotePos           = { x = 1133.77, y = -981.07, z = 46.22 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["Rob's Liquor - San Andreas Ave"]              = {
		Pos               = { x = -1220.68, y = -916.04, z = 10.33 },
		NotePos           = { x = -1223.43, y = -909.53, z = 12.13 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["Rob's Liquor - Prosperity Street"]            = {
		Pos               = { x = -1479.03, y = -375.39, z = 38.16 },
		NotePos           = { x = -1484.69, y = -379.2, z = 39.96 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["Rob's Liquor - Great Ocean Highway"]          = {
		Pos               = { x = -2959.6, y = 387.17, z = 13.04 },
		NotePos           = { x = -2966.25, y = 389.06, z = 14.84 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["Rob's Liquor - Grand Senora Desert"]          = {
		Pos               = { x = 1168.48, y = 2717.84, z = 36.16 },
		NotePos           = { x = 1167.75, y = 2711.15, z = 37.96 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["Del Vecchio Liquor - Paleto Bay"]             = {
		Pos               = { x = -168.09, y = 6318.34, z = 29.6 },
		NotePos           = { x = -162.63, y = 6322.57, z = 31.4 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["Bayview Lodge General Store - Paleto Forest"] = {
		Pos               = { x = -670.97, y = 5832.74, z = 16.33 },
		NotePos           = { x = -673.69, y = 5835.74, z = 17.33 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 2000,
		MaxMoney          = 3000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 120,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 2
	},
	["Blaine County Savings Teller"]                = {
		Pos               = { x = -110.31, y = 6469.52, z = 30.63 },
		NotePos           = { x = -109.16, y = 6467.12, z = 31.43 },
		Size              = { x = 1.5, y = 1.5, z = 1.0 },
		Color             = { r = 225, g = 0, b = 0 },
		AreaSize          = 8,
		Type              = 1,
		CurrentMoney      = 3000,
		MaxMoney          = 6000,
		MoneyRegeneration = nil,
		BankToDeliver     = "Fleeca Bank Vespucci Boulevard 2",
		Robbed            = 0, -- DO NOT CHANGE
		TimeToRob         = 240,
		TimeBeforeNewRob  = 900,
		PoliceRequired    = 4
	},

	-- BANKS
	-- ["Fleeca Bank Vespucci Boulevard"] = {
	-- 	Pos				= { x = 146.913, y = -1044.836, z = 28.376 },
	-- 	Size  		= { x = 1.5, y = 1.5, z = 1.0 },
	-- 	Color 		= { r = 220, g = 110, b = 0 },
	-- 	Type  		= 1,
	-- 	AreaSize 	= 15,
	-- 	CurrentMoney			= 0,
	-- 	MaxMoney 					= 300000,
	-- 	Robbed						= 0, -- DO NOT CHANGE
	-- 	TimeToRob					= 120,
	-- 	TimeBeforeNewRob 	= 7200,
	-- 	PoliceRequired		= 2
	-- },
	["Fleeca Bank Vespucci Boulevard 2"]            = {
		Pos              = { x = 0, y = 0, z = 0 },
		Size             = { x = 1.5, y = 1.5, z = 1.0 },
		Color            = { r = 225, g = 0, b = 0 },
		Type             = 1,
		AreaSize         = 15,
		CurrentMoney     = 0,
		MaxMoney         = 300000,
		Robbed           = 0, -- DO NOT CHANGE
		TimeToRob        = 120,
		TimeBeforeNewRob = 7200,
		PoliceRequired   = 2
	},

}

