Config                  = {}
Config.Informant        = {}

Config.Locale           = 'en'

Config.Delays           = {
	WeedProcessing    = 1000 * 10,
	CocaineProcessing = 1000 * 20,
}

Config.DrugDealerItems  = {
	marijuana = 20,
	cocaine   = 25,
}

Config.LicenseEnable    = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices    = {
	weed_processing = { label = _U('license_weed'), price = 15000 }
}

Config.GiveBlack        = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones      = {
	WeedField         = { coords = vector3(310.91, 4290.87,
										   45.15), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0 },
	CocaField         = { coords = vector3(2489.12, 4850.62,
										   36.18), name = _U('blip_cocafield'), color = 0, sprite = 514, radius = 10.0 },
	WeedProcessing    = { coords = vector3(2329.02, 2571.29,
										   46.68), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 100.0 },
	CocaineProcessing = { coords = vector3(1391.5, 3603.32,
										   38.94), name = _U('blip_cocaineprocessing'), color = 0, sprite = 514, radius = 10.0 },

	DrugDealer        = { coords = vector3(-1172.02, -1571.98,
										   4.66), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 25.0 },
}

Config.Informant.Peds   = {
	{
		model      = "Dealer01SMY",
		Spawnpoint = { x = -163.8, y = -920.07, z = 29.25 }
	},
	-- {
	-- 	hash = -1773333796,
	-- 	Spawnpoint = {x = -163.8, y = -920.07, z = 29.25}
	-- }
}

Config.Informant.Uptime = 100000

Config.Informant.Blip   = {
	blip  = 133,
	scale = 1,
	color = 11,
	-- name = _U('informant')
	name  = 'Informant',
}
