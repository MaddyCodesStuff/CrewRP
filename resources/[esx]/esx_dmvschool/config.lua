Config                 = {}
Config.DrawDistance    = 100.0
Config.MaxErrors       = 5
Config.SpeedMultiplier = 2.23694
Config.Locale          = 'en'

Config.Prices          = {
	dmv         = 200,
	drive       = 500,
	drive_bike  = 300,
	drive_truck = 800
}

Config.VehicleModels   = {
	drive       = 'dmv-car',
	drive_bike  = 'dmv-bike',
	drive_truck = 'dmv-truck'
}

Config.SpeedLimits     = {
	residence = 50,
	town      = 50,
	freeway   = 80
}

Config.Zones           = {

	DMVSchool         = {
		Pos   = { x = 229.4, y = 372.76, z = 105.11 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos   = { x = 233.03, y = 385.58, z = 105.41, h = 76.68 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}

}

Config.CheckPoints     = {

	{ -- start at car park
		Pos    = { x = 216.71, y = 381.14, z = 104.98 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{ --other end of car park
		Pos    = { x = 184.16, y = 385.99, z = 106.86 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('reverse_spot'), 5000)
		end
	},

	{ -- Reverse into parking spot
		Pos    = { x = 190.18, y = 392.55, z = 106.5 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('good_lets_cont'), 5000)
		end
	},

	{ --Stop For Pedestrians
		Pos    = { x = 197.9, y = 376.27, z = 106.01 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_for_ped'), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(4000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_lets_cont'), 5000)
			end)
		end
	},
	--go to next point cross roads
	{
		Pos    = { x = 234.68, y = 346.98, z = 103.89 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
		end
	},
	-- stop for passing vehicle
	{
		Pos    = { x = 246.83, y = 429.91, z = 119.09 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('stop_for_passing'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(6000)
			FreezeEntityPosition(vehicle, false)
		end
	},
	-- turn right and follow the line
	{
		Pos    = { x = 286.24, y = 824.96, z = 190.45 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_look_left', Config.SpeedLimits['town']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(6000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_turn_right'), 5000)
			end)
		end
	},
	-- carry on past ranger station
	{
		Pos    = { x = 445.004, y = 876.780, z = 197.114 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
		end
	},
	-- take a left toward freeway
	{
		Pos    = { x = 1034.1, y = 501.89, z = 95.41 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
		end
	},
	-- stop and let traffic pass on freeway ramp
	{
		Pos    = { x = 1126.78, y = 391.28, z = 90.47 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('stop_for_passing'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(6000)
			FreezeEntityPosition(vehicle, false)
		end
	},
	-- fREEWAY CHANGE
	{
		Pos    = { x = 1198.255, y = 451.873, z = 87.051 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('freeway')

			DrawMissionText(_U('hway_time', Config.SpeedLimits['freeway']), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
	},
	-- top end of freeway
	{
		Pos    = { x = 2434.78, y = 2862.45, z = 48.05 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},
	-- Off ramp freeway
	{
		Pos    = { x = 1099.04, y = 440.37, z = 90.43 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')
			DrawMissionText(_U('in_town_speed', Config.SpeedLimits['town']), 5000)
		end
	},

	-- go to next point

	{
		Pos    = { x = 758.84, y = 184.68, z = 81.24 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	-- go to next point
	{
		Pos    = { x = 275.89, y = 337.65, z = 104.52 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	-- go to next point
	{
		Pos    = { x = 220.45, y = 375.33, z = 105.25 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},
	-- FINISHED
	{
		Pos    = { x = 236.809, y = 383.503, z = 105.225 },
		Action = function(playerPed, vehicle, setCurrentZoneType)
			ESX.Game.DeleteVehicle(vehicle)
		end
	}

}



----------------END-----------------------














--[[


Pos = {x = 533.93, y = 829.62, z = 199.48},


{
		Pos = {x = -453.790, y = -1444.726, z = 27.665},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('freeway')

			DrawMissionText(_U('hway_time', Config.SpeedLimits['freeway']), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
	},

	{
		Pos = {x = -463.237, y = -1592.178, z = 37.519},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -900.647, y = -1986.28, z = 26.109},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 1225.759, y = -1948.792, z = 38.718},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 1225.759, y = -1948.792, z = 38.718},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')
			DrawMissionText(_U('in_town_speed', Config.SpeedLimits['town']), 5000)
		end
	},

	]]--
