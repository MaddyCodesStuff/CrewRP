Config = {}
Config.Locale = 'en' -- The local you want to use for your server
Config.TruckPlateNumb = 0  -- This starts the custom plate for trucks at 0
Config.MaxStops	= 5 -- Total number of stops a person is allowed to do before having to return to depot.
Config.MaxBags = 10 -- Total number of bags a person can get out of a bin
Config.MinBags = 4 -- Min number of bags that a bin can contain.
Config.BagPay = 20 -- The amount paid to each person per bag
Config.StopPay = 360 -- Total pay for the stop before bagpay.
Config.JobName = 'garbage'  -- use this to set the jobname that you want to be able to do garbagecrew 

Config.Trucks = {
  --'trash',
  'trash2',
}

Config.DumpstersAvaialbe = {
  218085040,
  666561306,
  -58485588,
  -206690185,
  1511880420,
  682791951,
  -387405094,
  364445978,
  1605769687,
  -1831107703,
  -515278816,
  -1790177567,
}

Config.VehicleSpawn = {pos = vector3(-328.50,-1520.99, 27.53),}

Config.Zones = {
	[1] = {type = 'Zone', size = 5.0 , name = 'endmission', pos = vector3(-332.64,-1522.88, 26.58)},
	[2] = {type = 'Zone', size = 3.0 , name = 'timeclock', pos = vector3(-321.70,-1545.94, 30.02)},
	[3] = {type = 'Zone', size = 3.0 , name = 'vehiclelist', pos = vector3(-316.16,-1536.08, 26.65)},
}

-- if you wish to add more pickup locations must have the same format as below.  Make sure when you are selecting locations you have
-- your Settings\Graphics\Distance Scaling - turned all the way down to make sure the bin will show up for everyone.
Config.Collections = {
  [1] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(114.83,-1462.31, 29.29508)},
  [2] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-6.04,-1566.23, 29.209197)},
  [3] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1.88,-1729.55, 29.300233)},
  [4] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(159.09,-1816.69, 27.91234)},
  [5] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(358.94,-1805.07, 28.96659)},
  [6] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(481.36,-1274.82, 29.64475)},
  [7] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(127.9472,-1057.73, 29.19237)},
  [8] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1613.123, -509.06, 34.99874)},
  [9] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(342.78,-1036.47, 29.19420)},
  [10] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(383.03,-903.60, 29.15601)}, 
  [11] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(165.44,-1074.68, 28.90792)}, 
  [12] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(50.42,-1047.98, 29.31497)}, 
  [13] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1463.92, -623.96, 30.20619)},
  [14] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(443.96,-574.33, 28.49450)},
  [15] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1255.41,-1286.82,3.58411)}, 
  [16] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1229.35, -1221.41, 6.44954)},
  [17] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-31.94,-93.43, 57.24907)},
  [18] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(274.31,-164.43, 60.35734)},
  [19] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-364.33,-1864.71, 20.24249)}, 
  [20] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1239.42, -1401.13, 3.75217)},
}

Config.chanceItems = {
  battery = {min = 1, max = 1, itemNumber = 1},
  drill = {min = 1, max = 1, itemNumber = 2},
  screwdriver = {min = 1, max = 4, itemNumber = 4},
  sandpaper = {min = 5, max = 8, itemNumber = 5},
  screws = {min = 3, max = 5, itemNumber = 6},
  nails = {min = 3, max = 5, itemNumber = 7},
  copperpipe = {min = 3, max = 10, itemNumber = 11},
  plier = {min = 1, max = 2, itemNumber = 12},
  saw = {min = 1, max = 2, itemNumber = 13},
  washers = {min = 1, max = 3, itemNumber = 14},
  socketwrench = {min = 1, max = 3, itemNumber = 15},
  layeredmetal = {min = 1, max = 1, itemNumber = 16},
  layeredplastic = {min = 1, max = 1, itemNumber = 17},
  beer_1 = {min = 6, max = 12, itemNumber = 18},    
  razer = {min = 1, max = 1, itemNumber = 20},
  wood = {min = 5, max = 10, itemNumber = 21},
  electronics = {min = 5, max = 10, itemNumber = 22},
  metal = {min = 5, max = 10, itemNumber = 23}, 
  plastic = {min = 5, max = 10, itemNumber = 24},
  clothe = {min = 5, max = 10, itemNumber = 25},
  cigarette2 = {min = 1, max = 3, itemNumber = 26},
  fishbait = {min = 2, max = 5, itemNumber = 27},
  newspaper = {min = 1, max = 1, itemNumber = 28},
  perscription_bottle = {min = 1, max = 1, itemNumber = 29},
  shoes = {min = 1, max = 1, itemNumber = 30},
  perscription_bottle = {min = 1, max = 1, itemNumber = 31},
  slaughtered_chicken = {min = 1, max = 1, itemNumber = 32},
}
