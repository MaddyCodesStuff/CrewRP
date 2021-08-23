Config                    = {}
Config.DrawDistance       = 3
Config.CopsRequired       = 3
Config.BlipUpdateTime     = 1000 --In milliseconds. I used it on 3000. If you want instant update, 50 is more than enough. Even 100 is good. I hope it doesn't kill FPS and the server.
Config.CooldownMinutes    = 15
Config.CarDamageReduction = .10 -- How much damage reduction cost should you lose for turning in a damaged vehicle?
Config.Locale             = 'en'

Config.Zones              = {
	VehicleSpawner = {
		Pos    = { x = -58.41, y = 6441.68, z = 31.31 },
		Size   = { x = 1.0, y = 1.0, z = 1.0 },
		Color  = { r = 204, g = 204, b = 0 },
		Type   = 1,
		Colour = 6, --BLIP
		Id     = 229, --BLIP
	},
}

Config.VehicleSpawnPoint  = {
	Pos  = { x = -61.94, y = 6443.87, z = 31.49, h = 46.85},
	Size = { x = 3.0, y = 3.0, z = 1.0 },
	Type = -1,
}

Config.TrackerTimer = 420 -- seconds it takes for the tracker to time out, this is depentent on the BlipUpdateTimer delay 

Config.Delivery           = {
	--El Rancho Blvd
	Delivery1  = {
		Pos     = { x = 857.16, y = -2120.27, z = 29.67 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 1800,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Little Bighorn Ave
	Delivery4  = {
		Pos     = { x = 498.32, y = -1966.42, z = 23.85 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 1800,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
					'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Brouge Ave1
	Delivery7  = {
		Pos     = { x = 161.29, y = -1811.71, z = 27.72 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--MacDonald St
	Delivery8  = {
		Pos     = { x = 295.75, y = -1716.53, z = 29.19 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--GroveStreet
	Delivery9  = {
		Pos     = { x = -70.72, y = -1822.31, z = 26.94 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Capital Blvd
	Delivery14  = {
		Pos     = { x = 489.22, y = -1400.27, z = 29.37 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2100,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Carson Ave East
	Delivery10 = {
		Pos     = { x = 181.31, y = -1839.14, z = 28.11 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Carson Ave 
	Delivery11 = {
		Pos     = { x = 139.18, y = -1693.87, z = 29.29 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Brouge 2
	Delivery12 = {
		Pos     = { x = 207.19, y = -1687.42, z = 29.58 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'nero', 'seven70', 'tempesta', 'xa21', 'raiden' },
	},
	--Comedy Club
	Delivery13 = {
		Pos     = { x = -456.94, y = 303.25, z = 89.26 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'specter', 'comet5', 'nightshade', 'sc1', 'banshee2' },
	},
	--Alta Scrapyard
	Delivery15  = {
		Pos     = { x = -511.12, y = -1736.8, z = 19.21 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Airport Area
	Delivery16  = {
		Pos     = { x = -802.91, y = -2117.68, z = 8.81 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2500,
		Cars    = { 'stafford', 'superd', 'toros', 'swinger', 'patriot2' },
	},
	--South Rockford Drive
	Delivery17  = {
		Pos     = { x = -676.42, y = -1178.08, z = 10.61 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--South Rockford Drive - 2
	Delivery18  = {
		Pos     = { x = -702.01, y = -1141.16, z = 10.61 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Vespucci
	Delivery19  = {
		Pos     = { x = -1170.51, y = -1390.05, z = 4.91 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Vespucci 2
	Delivery20  = {
		Pos     = { x = -1213.31, y = -1313.42, z = 4.66 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Vespucci 3
	Delivery21  = {
		Pos     = { x = -1275.18, y = -1364.66, z = 4.31 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Vespucci 4
	Delivery22  = {
		Pos     = { x = -1157.35, y = -1520.48, z = 4.35 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Vespucci 5
	Delivery23  = {
		Pos     = { x = -1315.91, y = -1263.95, z = 3.58 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Vespucci 6
	Delivery24  = {
		Pos    = { x = -1355.54, y = -887.93, z = 12.89 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Vespucci 7
	Delivery25  = {
		Pos    = { x = -1409.17, y = -636.21, z = 27.68 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Boulecard Del Perro
	Delivery26  = {
		Pos     = { x = -1451.56, y = -382.34, z = 37.36 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--South Rockford Drive 3 
	Delivery27  = {
		Pos     = { x = -1422.15, y = -240.91, z = 45.39 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Dorset Drive
	Delivery28  = {
		Pos     = { x = -975.98, y = -267.50, z = 37.31 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Del Perro Fwy
	Delivery29  = {
		Pos     = { x = -758.95, y = -419.96, z = 34.68 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--San Andreas Ave
	Delivery30  = {
		Pos     = { x = -518.11, y = -622.93, z = 24.32 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Vespucci Blvd
	Delivery31  = {
		Pos     = { x = -477.42, y = -737.17, z = 30.56 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Del Perro 2
	Delivery32  = {
		Pos     = { x = -277.67, y = -564.31, z = 29.59},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Alta North
	Delivery33  = {
		Pos     = { x = 44.79, y = -103.39, z = 55.02 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Las Lagunas
	Delivery34  = {
		Pos     = { x = -16.28, y = -80.33, z = 56.93 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Go Postal
	Delivery35  = {
		Pos     = { x = 114.68, y = 100.33, z = 79.86 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Clinton
	Delivery36  = {
		Pos     = { x = 178.46, y = 306.06, z = 104.38 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Clinton 2
	Delivery37  = {
		Pos     = { x = 188.57, y = 349.29, z = 107.36 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Mirror Park Blvd
	Delivery38  = {
		Pos     = { x = 954.61, y = -202.58, z = 72.15 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Mirror Park Blvd 2
	Delivery39  = {
		Pos     = { x = 1129.78, y = -450.62, z = 65.50 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Mirror Park Blvd 3
	Delivery40  = {
		Pos     = { x = 1139.80, y = -794.34, z = 56.60 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Mirror Park Blvd 4
	Delivery41  = {
		Pos     = { x = 1117.67, y = -983.37, z = 45.33 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Supply Street
	Delivery42  = {
		Pos     = { x = 966.02, y = -1014.27, z = 40.85 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Supply Street 2
	Delivery43  = {
		Pos     = { x = 842.16, y = -1162.84, z = 25.27 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Popular Street
	Delivery44  = {
		Pos     = { x = 823.17, y = -1057.22, z = 27.95 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Popular Street 2
	Delivery45  = {
		Pos     = { x = 893.97, y = -891.62, z = 27.11 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Popular Street 3
	Delivery46  = {
		Pos     = { x = 847.68, y = -951.59, z = 26.28 },
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Popular Street 4
	Delivery47  = {
		Pos     = { x = 719.54, y = -767.09, z = 24.92},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Popular Street 5
	Delivery48  = {
		Pos     = { x = 689.83, y = -717.89, z = 26.02},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Popular Street 6
	Delivery49  = {
		Pos     = { x = 692.63, y = -832.36, z = 24.37},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Popular Street 7
	Delivery50  = {
		Pos     = { x = 706.97, y = -679.32, z = 26.63},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Popular Street 8
	Delivery51  = {
		Pos     = { x = 815.43, y = -757.76, z = 26.73},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Otto's Parts
	Delivery52  = {
		Pos     = { x = 821.55, y = -825.59, z = 26.21},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Under Olypmic Freeway
	Delivery53  = {
		Pos     = { x = 703.98, y = -1142.41, z = 23.58},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Supply Street
	Delivery54  = {
		Pos     = { x = 909.35, y = -1059.35, z = 32.83},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Roy Lowenstein
	Delivery55  = {
		Pos     = { x = 482.24, y = -1526.58, z = 29.31},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--JJ's Forklifts
	Delivery56  = {
		Pos     = { x = 363.17, y = -1244.99, z = 32.51},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Middle of Strawberry
	Delivery57  = {
		Pos     = { x = 317.93, y = -1240.99, z = 30.12},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Strawberry Back Alley
	Delivery58  = {
		Pos     = { x = 183.91, y = -1268.32, z = 29.21},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Near the Gym
	Delivery59  = {
		Pos     = { x = -19.87, y = -1307.92, z = 29.27},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Near Fourm
	Delivery60  = {
		Pos     = { x = -78.11, y = -1394.15, z = 29.32},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Near Fourm 2
	Delivery61  = {
		Pos     = { x = -141.17, y = -1415.11, z = 30.45},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Glass Hero's
	Delivery62  = {
		Pos     = { x = -217.61, y = -1378.24, z = 31.26},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--South Alta
	Delivery63  = {
		Pos     = { x = -326.21, y = -1348.57, z = 31.36},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Paper Factory
	Delivery64  = {
		Pos     = { x = -619.42, y = -1604.06, z = 26.75},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Little Seoul Construction
	Delivery65  = {
		Pos     = { x = -842.26, y = -797.52, z = 19.19},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'everon', 'hellion', 'freecrawler', 'caracara', 'landstalker2' },
	},
	--South Rock 2 
	Delivery66  = {
		Pos     = { x = -1016.28, y = -780.11, z = 16.37},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--North Rock 2 
	Delivery67  = {
		Pos     = { x = -1201.88, y = -729.41, z = 21.14},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Del Perro 
	Delivery69  = {
		Pos     = { x = -1353.82, y = -753.11, z = 22.29},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--EastBorne Way
	Delivery70  = {
		Pos     = { x = -463.03, y = -63.05, z = 44.51},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 2000,
		Cars    = { 'sultanrs', 'osiris', 'cyclone', 'ruston', 'turismor', 'zentorno', 't20', 'reaper', 'italigtb', 'pfister811', 'visione', 'entityxf',
		'sheava', 'gp1', 'vagner', 'neon', 'entity2', 'tyrant', 'taipan', 'coquette4', 's80', 'openwheel', 'neo', 'kreiger', 'thrax', 'novak', 'jugular' },
	},
	--Meme
	Delivery71  = {
		Pos     = { x = 1853.45, y = 3676.19, z = 33.78},
		Size    = { x = 3.0, y = 3.0, z = 1.0 },
		Color   = { r = 204, g = 204, b = 0 },
		Type    = 1,
		Payment = 6000,
		Cars    = { 'unibmx', 'ruiner3','tractor' },
	},
}
