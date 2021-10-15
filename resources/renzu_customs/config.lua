Config = {}
Config.Locale = "en"
-- MAIN CONFIG START
Config.framework = 'ESX' -- FRAMEWORK! , "ESX", "QBCORE"
Config.Mysql = 'mysql-async' -- "ghmattisql", "mysql-async", "oxmysql"
Config.usePopui = false -- POPUI or Drawmarker Floating Text https://github.com/renzuzu/renzu_popui
Config.showmarker = true -- Drawmarker and FLoating Text
Config.DisableRepair = true -- Disable Repairing before Showing Upgrade Menu
Config.OwnedVehiclesOnly = false -- set this to False if you want to allow modifying of non owned vehicles, AKA local cars, spawned cars
--JOB
-- Config.job = 'mechanic' -- Default job (job permission if job is not indicated here Config.Customs) -- OBSOLETE , Configure jobs here Config.Customs
Config.DefaultJobGradePermmission = 0 -- default jobgrade in each job shop (ignored if its indicated at Config.VehicleMod)
Config.JobPermissionAll = false -- if this is true only mechanics can access even the upgrade menu (Main Menu)
--JOB
Config.InteractiveFeature = { -- Enable Disable All Extra Features like: Inventory, Stock Room, Paint Room
	['garage_inventory'] = false,
	['stockroom'] = false,
	['paintmenu'] = false,
}
--EXTRA OPTION
Config.PlateSpace = true -- is your plate is ABC 123 format
Config.VehicleValuetoFormula = true -- if true we will calculate the final cost for each upgrades from the original value from vehicles.table ----- ( IF THIS IS FALSE, the fixed value will be used (var cost from vehicle_mods table))
Config.VehicleValuePercent = 0.5 -- 0.1 = 10% 0.5 = 50%, 1.0 = 100% (this will be the formula to calculate the total cost for each upgrade)
Config.VehicleValueList = { -- custom cars that are not exist in vehicles table (vehicles pricing are automatic fetched from DB vehicles table by default)
}
Config.FreeUpgradeToClass = { -- want to have a free upgrade for a selected vehicles class?
	[18] = true, -- emergency class , ex. police, ambulance vehicle.
	[19] = false, -- military class
}
Config.EnableDiscounts = true -- discount for all jobs and per mods
Config.JobDiscounts = { -- global discount jobs
	['mecano'] = 0.3, -- 0.2 == 20% , 1.0 == 100%
}
--EXTRA OPTION
-- Main Config END

-- CUSTOM FEATURE CONFIG
Config.UseRenzu_jobs = false -- to have a profits for each upgrades https://github.com/renzuzu/renzu_jobs (This Have Crafting Table, Shop, Vehicle Shop, Garage and more Job Needs!) (NOT AVAILABLE IN QB)
Config.UseRenzu_progressbar = false -- Use Progressbar while repairing a vehicle and maybe more use case in future update https://github.com/renzuzu/renzu_progressbar
Config.PayoutShare = 0.5 -- 0.5 = 50% (how much profit share)
Config.DefaultProp = 'hei_prop_heist_box' -- default prop when carrying a parts

-- if you want CUSTOM ENGINE UPGRADE ,TURBO and TIRES make sure to true this all
Config.UseCustomTurboUpgrade = false -- use renzu_custom Turbo System -- enable disable custom turbo upgrade
Config.useturbosound = false -- use custom BOV Sound for each turbo
Config.turbosoundSync = true -- true = Server Sync Sound? or false = only the driver can hear it

Config.UseCustomEngineUpgrade = false -- enable disable custom engine upgrade
Config.UseCustomTireUpgrade = false -- enable disable custom tires upgrade

Config.RepairCost = 1500 -- repair cost
-- CUSTOM END

-- FAQ
-- RADIUS = SHOP SIZE in radius
-- STOCK ROOM = COMPLETE LIST OF VEHICLE MOD LIST FOR EA VEHICLES IN AREA
-- PAINTMENU = CUSTOM PAINT MENU (SPRAY)
-- SHOPCOORDS = The main and center of the Shop Area
-- MOD.coord = Upgrade Section ( you can insert multiple )
-- garage_inventory = Custom Inventory for VEHICLE MOD PARTS
-- BLIPS = BLIP info sprite , color and scale.
-- grade = minimum job grade to access the feature/ menu/ options
-- Can a single job can owned both/multiple shop? = yes
Config.Customs = { -- Multiple Shop Start

    ['Benny\'s'] = { -- Shop id -- Sample bennys (IPL coordinates) Change this to your liking (CHANGE COORDINATES IF CUSTOM BENNYS MAP)
		job = 'mechanic', -- job name permmision for this shop
		min_grade = 0, -- min grade to access the whole shop feature
		radius = 10, -- radius for whole shop
		stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
		paintmenu = {coord = vector3(0,0,0), grade = 0},
		garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
		shopcoord = vector4(-212.58,-1325.01,30.89,157.28),
		mod = {
			{coord = vector4(-221.88,-1329.31,30.21,90.12), taken = false},
		},
		Blips = {sprite = 446, color = 68, scale = 0.8},
    },
	['PDM Benny\'s'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(-31.91,-1064.19,27.72,162.52),
	mod = {
		{coord = vector4(-31.91,-1064.19,27.72,162.52), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Auto Exotic'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(544.66,-189.35,54.49,88.68),
	mod = {
		{coord = vector4(544.66,-189.35,53.79,88.68), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['LS Customs'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(-337.3863,-136.9247,38.5737,253.51),
	mod = {
		{coord = vector4(-337.3863,-136.9247,38.5737,253.51), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['LS Customs 2'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(-1155.536,-2007.183,12.9,136.75),
	mod = {
		{coord = vector4(-1155.536,-2007.183,12.9,136.75), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['LS Customs 3'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(731.8163,-1088.822,21.733,269.12),
	mod = {
		{coord = vector4(731.8163,-1088.822,21.733,269.12), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['LS Customs 4'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(1175.04,2640.216,37.32177,180.0),
	mod = {
		{coord = vector4(1175.04,2640.216,37.32177,180.0), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['LS Customs 5'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(110.23,6627.9,31.22,42.83),
	mod = {
		{coord = vector4(110.23,6627.9,31.22,42.83), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['LS Customs 6'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 100, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(-1550.1,-3181.79,13.94,147.77),
	mod = {
		{coord = vector4(-1550.1,-3181.79,13.94,147.77), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Haye\'s Rockford'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(-1423.63,-450.18,35.91,211.03),
	mod = {
		{coord = vector4(-1423.63,-450.18,35.91,211.03), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Lost Compound'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 20, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(995.48,-125.78,73.37,238.39),
	mod = {
		{coord = vector4(995.48,-125.78,73.37,238.39), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Haye\'s Little Bighorn'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(481.06,-1317.26,28.51,116.73),
	mod = {
		{coord = vector4(481.06,-1317.26,28.51,116.73), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Galaxy'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 20, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(-1627.81,-3005.51,-78.83,180.52),
	mod = {
		{coord = vector4(-1627.81,-3005.51,-78.83,180.52), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Flywheels'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 10, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(1767.45,3329.34,40.75,119.70),
	mod = {
		{coord = vector4(1767.45,3329.34,40.75,119.70), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Sandy Airfield'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 50, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(1737.00,3289.80,40.5,13.95),
	mod = {
		{coord = vector4(1737.00,3289.80,40.5,13.95), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Marina'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 50, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(-798.4,-1500.8,0.00,108.43),
	mod = {
		{coord = vector4(-798.4,-1500.8,0.00,108.43), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
	['Admin'] = { -- Shop ID
	job = 'mechanic', -- job name permmision for this shop
	min_grade = 0, -- min grade to access the whole shop feature
	radius = 50, -- radius for whole shop
	stockroom = {coord = vector4(0,0,0,0), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
	paintmenu = {coord = vector3(0,0,0), grade = 0},
	garage_inventory = {coord = vector4(0,0,0,0), grade = 0},
	shopcoord = vector4(-1994.98,3202.01,32.81,0.01),
	mod = {
		{coord = vector4(-1994.98,3202.01,32.81,0.01), taken = false},
	},
	Blips = {sprite = 446, color = 68, scale = 0.8},
	},
}

-- PAINT COLORS AND INDEX NAME
Config.Metallic = {
    ['Black'] = 0,
    ['Carbon Black'] = 147,
    ['Graphite'] = 1,
    ['Anhracite Black'] = 11,
    ['Black Steel'] = 2,
    ['Dark Steel'] = 3,
    ['Silver'] = 4,
    ['Bluish Silver'] = 5,
    ['Rolled Steel'] = 6,
    ['Shadow Silver'] = 7,
    ['Stone Silver'] = 8,
    ['Midnight Silver'] = 9,
    ['Cast Iron Silver'] = 10,
    ['Red'] = 27,
    ['Torino Red'] = 28,
    ['Formula Red'] = 29,
    ['Lava Red'] = 150,
    ['Blaze Red'] = 30,
    ['Grace Red'] = 31,
    ['Garnet Red'] = 32,
    ['Sunset Red'] = 33,
    ['Cabernet Red'] = 34,
    ['Wine Red'] = 143,
    ['Candy Red'] = 35,
    ['Hot Pink'] = 135,
    ['Pfsiter Pink'] = 137,
    ['Salmon Pink'] = 136,
    ['Sunrise Orange'] = 36,
    ['Orange'] = 38,
    ['Bright Orange'] = 138,
    ['Gold'] = 99,
    ['Bronze'] = 90,
    ['Yellow'] = 88,
    ['Race Yellow'] = 89,
    ['Dew Yellow'] = 91,
    ['Dark Green'] = 49,
    ['Racing Green'] = 50,
    ['Sea Green'] = 51,
    ['Olive Green'] = 52,
    ['Bright Green'] = 53,
    ['Gasoline Green'] = 54,
    ['Lime Green'] = 92,
    ['Midnight Blue'] = 141,
    ['Galaxy Blue'] = 61,
    ['Dark Blue'] = 62,
    ['Saxon Blue'] = 63,
    ['Blue'] = 64,
    ['Mariner Blue'] = 65,
    ['Harbor Blue'] = 66,
    ['Diamond Blue'] = 67,
    ['Surf Blue'] = 68,
    ['Nautical Blue'] = 69,
    ['Racing Blue'] = 73,
    ['Ultra Blue'] = 70,
    ['Light Blue'] = 74,
    ['Chocolate Brown'] = 96,
    ['Bison Brown'] = 101,
    ['Creeen Brown'] = 95,
    ['Feltzer Brown'] = 94,
    ['Maple Brown'] = 97,
    ['Beechwood Brown'] = 103,
    ['Sienna Brown'] = 104,
    ['Saddle Brown'] = 98,
    ['Moss Brown'] = 100,
    ['Woodbeech Brown'] = 102,
    ['Straw Brown'] = 99,
    ['Sandy Brown'] = 105,
    ['Bleached Brown'] = 106,
    ['Schafter Purple'] = 71,
    ['Spinnaker Purple'] = 72,
    ['Midnight Purple'] = 142,
    ['Bright Purple'] = 145,
    ['Cream'] = 107,
    ['Ice White'] = 111,
    ['Frost White'] = 112,
}

Config.Matte = {
    ['Black'] = 12,
    ['Gray'] = 13,
    ['Light Gray'] = 14,
    ['Ice White'] = 131,
    ['Blue'] = 83,
    ['Dark Blue'] = 82,
    ['Midnight Blue'] = 84,
    ['Midnight Purple'] = 149,
    ['Schafter Purple'] = 148,
    ['Red'] = 39,
    ['Dark Red'] = 40,
    ['Orange'] = 41,
    ['Yellow'] = 42,
    ['Lime Green'] = 55,
    ['Green'] = 128,
    ['Forest Green'] = 151,
    ['Foliage Green'] = 155,
    ['Olive Darb'] = 152,
    ['Dark Earth'] = 153,
    ['Desert Tan'] = 154,
}

Config.Metals = {
    ['Brushed Steel'] = 117,
    ['Brushed Black Steel'] = 118,
    ['Brushed Aluminum'] = 119,
    ['Pure Gold'] = 158,
    ['Brushed Gold'] = 159,
}

allcolors = {}
for k,v in pairs(Config.Metallic) do
	allcolors[k] = v
end

for k,v in pairs(Config.Matte) do
	allcolors[k] = v
end

for k,v in pairs(Config.Metals) do
	allcolors[k] = v
end

Config.Chrome = {['Chrome'] = 120}

-- VEHICLE MODS , you can change parts value / cost here
-- FAQ
-- multicost  = if true cost will multiple the level from the original cost
-- camera angles (you can customize this as i dont have a proper test to perfect the angles yet)
-- type = Menu Main title
-- bone = bone target for camera (obsolete)
-- index = MOD index name
-- cost = the cost of vehicle mod in all lvls (unless multicost)
-- job_grade = MINIMUM job_grade lvl permmision to access the upgrade type (if no indicated, Config.DefaultJobGradePermmission will be used as default) (THIS WILL ONLY WORK if Config.JobPermissionAll = true)
-- discount = This is Persistent config!, it means Config.JobDiscounts will be ignored as long as this job ex. mechanic is here and job ex. mechanic is in Config.JobDiscounts too. , any unlisted jobs here will be using the default listed here Config.JobDiscounts (if its registered)
Config.VehicleMod = {
    ----------Liveries--------
	[48] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
			['mechanic'] = 0.3, -- 30%
		},
		label = 'Liveries',
		name = 'liveries',
        index = 48,
		cost = 250,
		percent_cost = 50.0,
		bone = 'chassis',
        type = 'Exterior',
		camera = {val = 'front', x = -2.1, y = 0.6,z = 1.1},
	},
	
----------Windows--------
	[46] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Windows',
		name = 'windows',
        index = 46,
		cost = 250,
		percent_cost = 50.0,
		bone = 'window_lf1',
		camera = {val = 'right', x = 0.8, y = 0.8,z = 0.8},
        type = 'Exterior',
	},
	
----------Tank--------
	[45] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Intercooler',
		name = 'tank',
        index = 45,
		cost = 250,
		percent_cost = 50.0,
		bone = 'chassis',
        type = 'Exterior',
		camera = {val = 'front', x = 0.2, y = 0.3,z = 0.1},
	},
	
----------Trim--------
	[44] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Trim',
		name = 'trim',
        index = 44,
		cost = 250,
		percent_cost = 50.0,
		bone = 'boot',
		camera = {val = 'middle', x = 2.1, y = 2.1,z = -0.1},
        type = 'cosmetic',
	},
	
----------Aerials--------
	[43] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Aerials',
		name = 'aerials',
        index = 42,
		cost = 250,
		percent_cost = 50.0,
		camera = {val = 'front', x = 0.5, y = 0.6,z = 0.4},
        type = 'cosmetic',
	},

----------Arch cover--------
	[42] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Arch cover',
		name = 'archcover',
        index = 42,
		cost = 250,
		percent_cost = 50.0,
		bone = 'engine',
		action = 'openhood',
		action = 'openhood',
        type = 'cosmetic',
	},

----------Struts--------
	[41] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Struts',
		name = 'struts',
        index = 41,
		cost = 250,
		percent_cost = 50.0,
		bone = 'engine',
		action = 'openhood',
        type = 'cosmetic',
	},
	
----------Air filter--------
	[40] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Air filter',
		name = 'airfilter',
        index = 40,
		cost = 250,
		percent_cost = 50.0,
		bone = 'engine',
		action = 'openhood',
        type = 'Cosmetic',
	},
	
----------Engine block--------
	[39] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Engine block',
		name = 'engineblock',
        index = 39,
		cost = 250,
		percent_cost = 50.0,
		bone = 'engine',
		action = 'openhood',
        type = 'cosmetic',
	},

----------Hydraulics--------
	[38] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Hydraulics',
		name = 'hydraulics',
        index = 38,
		cost = 1250,
		percent_cost = 50.0,
		bone = 'wheel_rf',
        type = 'cosmetic',
	},
	
----------Trunk--------
	[37] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Trunk',
		name = 'trunk',
        index = 37,
		cost = 250,
		percent_cost = 50.0,
        type = 'Exterior',
		bone = 'boot',
		camera = {val = 'back', x = 0.5, y = -1.6,z = 1.3},
        prop = 'imp_prop_impexp_trunk_01a',
	},

----------Speakers--------
	[36] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Speakers',
		name = 'speakers',
        index = 36,
		cost = 250,
		percent_cost = 50.0,
		bone = 'door_dside_f',
        type = 'Interior',
	},

----------Plaques--------
	[35] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Plaques',
		name = 'plaques',
        index = 35,
		cost = 250,
		percent_cost = 50.0,
		camera = {val = 'left', x = -0.2, y = -0.5,z = 0.9},
		bone = 'steeseat_dside_fring',
        type = 'Interior',
	},
	
----------Shift leavers--------
	[34] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Shift leavers',
		name = 'shiftleavers',
        index = 34,
		camera = {val = 'left', x = -0.2, y = -0.5,z = 0.9},
		bone = 'steeseat_dside_fring',
		cost = 250,
		percent_cost = 50.0,
        type = 'Interior',
	},
	
----------Steeringwheel--------
	[33] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Steeringwheel',
		name = 'steeringwheel',
        index = 33,
		bone = 'seat_dside_f',
		cost = 250,
		percent_cost = 50.0,
		camera = {val = 'left', x = -0.2, y = -0.5,z = 0.9},
        type = 'Interior',
	},
	
----------Seats--------
	[32] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Seats',
		name = 'seats',
        index = 32,
		cost = 250,
		percent_cost = 50.0,
        type = 'Interior',
		bone = 'seat_dside_f',
        prop = 'prop_car_seat',
	},
	
----------Door speaker--------
	[31] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Door speaker',
		name = 'doorspeaker',
        index = 31,
		cost = 250,
		percent_cost = 50.0,
		bone = 'door_dside_f',
        type = 'Interior',
	},

----------Dial--------
	[30] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Dial',
		name = 'dial',
        index = 30,
		cost = 250,
		percent_cost = 50.0,
		bone = 'seat_dside_f',
		camera = {val = 'left', x = -0.2, y = -0.5,z = 0.9},
        type = 'Interior',
	},
----------Dashboard--------
	[29] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Dashboard',
		name = 'dashboard',
        index = 29,
		cost = 250,
		percent_cost = 50.0,
		bone = 'seat_dside_f',
        type = 'interior',
	},
	
----------Ornaments--------
	[28] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Ornaments',
		name = 'ornaments',
        index = 28,
		cost = 250,
		percent_cost = 50.0,
		bone = 'seat_dside_f',
        type = 'cosmetic',
	},
	
----------Trim--------
	[27] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Trim',
		name = 'trim',
        index = 27,
		cost = 250,
		percent_cost = 50.0,
		bone = 'bumper_f',
        type = 'cosmetic',
	},
	
----------Vanity plates--------
	[26] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Vanity plates',
		name = 'vanityplates',
        index = 26,
		cost = 250,
		percent_cost = 50.0,
		bone = 'exhaust',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        type = 'cosmetic',
        prop = 'p_num_plate_01',
	},
	
----------Plate holder--------
	[25] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Plate holder',
		name = 'plateholder',
        index = 25,
		cost = 250,
		percent_cost = 50.0,
		bone = 'exhaust',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        type = 'cosmetic',
	},
---------Back Wheels---------
	[24] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Back Wheels',
		name = 'backwheels',
        index = 24,
		cost = 250,
		percent_cost = 50.0,
        type = 'Wheel Parts',
		bone = 'wheel_lr',
        prop = 'imp_prop_impexp_wheel_03a',
	},
---------Front Wheels---------
	[23] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Front Wheels',
		name = 'frontwheels',
        index = 23,
		cost = 250,
		percent_cost = 50.0,
		bone = 'wheel_rf',
        type = 'Wheel Parts',
        prop = 'imp_prop_impexp_wheel_03a',
		list = {WheelType = {Sport = 0, Muscle = 1, Lowrider = 2, SUV = 3, Offroad = 4,Tuner = 5, BikeWheel = 6, HighEnd = 7 , BennysWheel = 8, BespokeWheel = 9, Dragster = 10, Street = 11 } , WheelColor = allcolors, Accessories = { SmokeColor = 1} } -- BennysWheel = 8, BespokeWheel = 9
	},
---------Headlights---------
	[22] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Headlights',
		name = 'headlights',
        index = 22,
		cost = 250,
		percent_cost = 50.0,
		bone = 'headlight_r',
        type = 'cosmetic',
        prop = 'v_ind_tor_bulkheadlight',
	},
	
----------Turbo---------
	[18] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Turbo',
		name = 'turbo',
        index = 18,
		cost = 500,
		percent_cost = 5.0,
		bone = 'engine',
        type = 'Performance Parts',
		list = {Default = 0, Turbo = 1}
	},
	
-----------Armor-------------
	[16] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Armor',
		name = 'armor',
        index = 16,
		cost = 10000,
		percent_cost = 5.0,
		bone = 'bodyshell',
		multicostperlvl = true,
        type = 'Shell',
	},

---------Suspension-----------
	[15] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Suspension',
		name = 'suspension',
        index = 15,
		cost = 500,
		percent_cost = 20,
		bone = 'wheel_rf',
		multicostperlvl = true,
        type = 'Performance Parts',
	},
-----------Horn----------
    [14] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
        label = 'Horn',
		name = 'horn',
        index = 14,
		cost = 250,
		percent_cost = 50.0,
		bone = 'bumper_f',
		camera = {val = 'middle', x = 2.1, y = 2.1,z = -0.1},
        type = 'cosmetic',
    },
-----------Transmission-------------
    [13] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
        label = 'Transmission',
		name = 'transmission',
        index = 13,
		cost = 250,
		percent_cost = 14.285,
		bone = 'engine',
		multicostperlvl = true,
        type = 'Performance Parts',
        prop = 'imp_prop_impexp_gearbox_01',
	},
	
-----------Brakes-------------
	[12] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
        label = 'Brakes',
		name = 'brakes',
        index = 12,
		cost = 150,
		percent_cost = 20,
		bone = 'wheel_rf',
		multicostperlvl = true,
        type = 'Performance Parts',
        prop = 'imp_prop_impexp_brake_caliper_01a',
	},
	
------------Engine----------
	[11] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
        label = 'Engine',
		name = 'engine',
        index = 11,
		cost = 500,
		percent_cost = 10,
		bone = 'engine',
		action = 'openhood',
		multicostperlvl = true,
        type = 'Performance Parts',
        prop = 'prop_car_engine_01',
	},
    ---------Roof----------
	[10] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Roof',
		name = 'roof',
        index = 10,
		cost = 250,
		percent_cost = 50.0,
		bone = 'roof',
		camera = {val = 'front-top', x = 0.5, y = -2.6,z = 1.5},
        type = 'exterior',
	},
	
------------Fenders---------
	[8] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Fenders',
		name = 'fenders',
        index = 8,
		cost = 250,
		percent_cost = 50.0,
        type = 'cosmetic',
		bone = 'wheel_rf',
        prop = 'imp_prop_impexp_car_panel_01a'
	},
	
------------Hood----------
	[7] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Hood',
		name = 'Hood',
        index = 7,
		cost = 250,
		percent_cost = 50.0,
        type = 'cosmetic',
		bone = 'bumper_f',
		camera = {val = 'front', x = 0.1, y = 0.8,z = 0.8},
        prop = 'imp_prop_impexp_bonnet_02a',
	},
	
----------Grille----------
	[6] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Grille',
		name = 'grille',
        index = 6,
		cost = 250,
		percent_cost = 50.0,
		bone = 'bumper_f',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        type = 'cosmetic',
	},
	
----------Roll cage----------
	[5] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Roll cage',
		name = 'rollcage',
        index = 5,
		cost = 250,
		percent_cost = 50.0,
        type = 'interior',
		bone = 'seat_dside_f',
		camera = {val = 'front-top', x = 0.1, y = -1.5,z = 0.5},
        prop = 'imp_prop_impexp_rear_bars_01b'
	},
	
----------Exhaust----------
	[4] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Exhaust',
		name = 'exhaust',
        index = 4,
		cost = 250,
		percent_cost = 50.0,
        type = 'exterior',
		bone = 'exhaust',
		camera = {val = 'back', x = 0.5, y = -1.6,z = 0.4},
        prop = 'imp_prop_impexp_exhaust_01',
	},
	
----------Skirts----------
	[3] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Skirts',
		name = 'skirts',
        index = 3,
		cost = 250,
		percent_cost = 50.0,
		bone = 'neon_r',
        type = 'cosmetic',
        prop = 'imp_prop_impexp_rear_bumper_01a',
	},
	
-----------Rear bumpers----------
	[2] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Rear bumpers',
		name = 'rearbumpers',
        index = 2,
		cost = 250,
		percent_cost = 50.0,
		bone = 'bumper_r',
		camera = {val = 'back', x = 0.5, y = -1.6,z = 0.4},
        type = 'cosmetic',
        prop = 'imp_prop_impexp_rear_bumper_03a',
	},
	
----------Front bumpers----------
	[1] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Front bumpers',
		name = 'frontbumpers',
        index = 1,
		cost = 250,
		percent_cost = 50.0,
		bone = 'bumper_f',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        type = 'cosmetic',
        prop = 'imp_prop_impexp_front_bumper_01a',
	},
	
----------Spoiler----------
	[0] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Spoiler',
		name = 'spoiler',
        index = 0,
		cost = 250,
		percent_cost = 50.0,
		bone = 'boot',
		camera = {val = 'back', x = 0.5, y = -1.6,z = 1.3},
        type = 'cosmetic',
        prop = 'imp_prop_impexp_spoiler_04a',
	},

	['paint1'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Primary Color',
		name = 'paint1',
        index = 99,
		cost = 150,
		percent_cost = 50.0,
		bone = 'boot',
        type = 'Primary Color',
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {Metallic = Config.Metallic, Matte = Config.Matte, Metals = Config.Metals, Chrome = Config.Chrome, Pearlescent = Config.Metallic}
	},
	['paint2'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Secondary Color',
		name = 'paint2',
        index = 100,
		cost = 150,
		percent_cost = 50.0,
		bone = 'boot',
        type = 'Secondary Color',
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {Metallic = Config.Metallic, Matte = Config.Matte, Metals = Config.Metals, Chrome = Config.Chrome}
	},
	['headlight'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Headlights',
		name = 'headlight',
        index = 101,
		cost = 250,
		percent_cost = 50.0,
		bone = 'boot',
        type = 'Headlights',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {Default = false, XenonLights = true, 
		XenonColor = {
				Default = -1,
			},
		}
	},
	['plate'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Plate',
		name = 'plate',
        index = 102,
		cost = 250,
		percent_cost = 50.0,
		camera = {val = 'back', x = 0.5, y = -1.6,z = 1.3},
		bone = 'boot',
        type = 'Plate',
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {BlueWhite = 0, YellowBlack = 1, YellowBlue = 2,BlueWhite1 = 3,BlueWhite2 = 4,Yankton = 5}
	},
	['neon'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Neon Lights',
		name = 'neon',
        index = 103,
		cost = 250,
		percent_cost = 50.0,
		bone = 'boot',
        type = 'Neon Lights',
		camera = {val = 'middle', x = 2.1, y = 2.1,z = -0.1},
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {Default = 0, NeonKit = 1, NeonColor = 2}
	},
	['window'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
		},
		discount = {
		},
		label = 'Window Tints',
		name = 'window',
        index = 104,
		cost = 250,
		percent_cost = 50.0,
        type = 'Window Tints',
		bone = 'boot',
		camera = {val = 'left', x = -0.3, y = -0.3,z = 0.9},
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {  
			None = 0,  
			PURE_BLACK = 1,  
			DARKSMOKE = 2,  
			LIGHTSMOKE = 3,  
			STOCK = 4,  
			LIMO = 5,  
			GREEN = 6  
		}
	},
}

-- RGB color for Spray Cans
-- do not rename and edit custom
Config.Pilox = {
    ['white'] = {255, 255, 255},
    ['red'] =  {246, 75, 60},
    ['pink'] = {253, 226, 226},
    ['blue'] = {0, 168, 204},
    ['yellow'] = {245, 252, 193},
    ['green'] = {99, 154, 103},
    ['orange'] = {255, 164, 27},
    ['brown'] = {156, 85, 24},
    ['purple'] =  {190, 121, 223},
    ['grey'] = {50, 50, 50},
    ['black'] = {0, 0, 0},
	['custom'] = {0, 0, 0}, -- do not change this is a custom for RGB
}
id = 'A'
cam = nil
gameplaycam = nil
inGarage = false
ingarage = false
garage_coords = {}
shell = nil
ESX = nil
QBCore = nil
fetchdone = false
PlayerData = {}
playerLoaded = false
canpark = false
spawned_cars = {}
local type = 'car'
newprop = nil
multimenu = {}
openmenu = false
object = nil
saved = {}
control = nil
vehiclesdb = {}
insidegarage = true
private_garages = {}
activeshare = nil
currentprivate = nil
carrymode = false
carrymod = false
tostore = {}
vehicleinarea = {}
spraying = false
customturbo = {}
customengine = {}
netids = {}
customtire = {}
extras = nil
spraycan = nil
custompaint = nil
tospray = false
oldprop = {}
inmark = false
markers = {}
currentshop = nil
TriggerServerCallback_ = nil
vehicletable = 'owned_vehicles'
vehiclemod = 'vehicle'
vehiclesname = {}