local Keys                    = {
	["ESC"]       = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"]         = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"]       = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"]      = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"]  = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"]      = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"]      = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"]    = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local isDead                  = false
local playerInService         = false

local fireBlip                = nil
local fireBlips               = {}

local fires                   = {}
local particles               = {}

local fireCoords              = {}

local smallFires              = {}
local mediumFires             = {}
local largeFires              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end

	while PlayerData == nil do
		PlayerData = ESX.GetPlayerData()
		Citizen.Wait(500)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeSpecialContact', 'fireman')

		if Config.MaxInService ~= -1 then
			TriggerServerEvent('esx_service:disableService', 'fireman')
		end
	end
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'fireman',
		number     = 'fireman',
		base64Icon = 'data:image/png;base64,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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if type(PlayerData.job.name) == 'string' and PlayerData.job.name == 'ambulance' and PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.MaxInService ~= -1 and not playerInService then
			CancelEvent()
		end
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


-- Event to trigger the fire
RegisterNetEvent('esx_fireman:startFire')
AddEventHandler('esx_fireman:startFire', function(params, size)
	fireCoords  = {
		x = params[1].coords.x,
		y = params[1].coords.y,
		z = params[1].coords.z
	}

	-- Gave the fire some health, so that it takes longer to put out

	local alarm = Config.FireAlarms[size]
	for i = 1, #params, 1 do
		table.insert(fires,
					 StartScriptFire(params[i].coords.x, params[i].coords.y, params[i].coords.z, params[i].spread,
									 false))
		local particleDictionary  = "scr_trevor3"
		local particleDictionary2 = "scr_lamar1"

		RequestNamedPtfxAsset(particleDictionary)

		while not HasNamedPtfxAssetLoaded(particleDictionary) do
			Citizen.Wait(0)
		end

		Citizen.Wait(10)

		RequestNamedPtfxAsset(particleDictionary2)

		while not HasNamedPtfxAssetLoaded(particleDictionary2) do
			Citizen.Wait(0)
		end

		UseParticleFxAssetNextCall(particleDictionary2)
		UseParticleFxAssetNextCall(particleDictionary2)
		table.insert(particles,
					 StartParticleFxLoopedAtCoord('scr_env_agency3b_smoke', params[i].coords.x, params[i].coords.y,
												  params[i].coords.z + 0.4, 0, 0, 0, 1.0, 0, 0, 0, 0))
		table.insert(particles,
					 StartParticleFxLoopedAtCoord('scr_trev3_trailer_plume', params[i].coords.x, params[i].coords.y,
												  params[i].coords.z + 0.4, 0, 0, 0, 1.0, 0, 0, 0, 0))
	end

	if ESX.GetPlayerData().job.name == 'fireman' or exports['esx-radios'].isDedicatedDispatch() then
		streetName, road = GetStreetNameAtCoord(fireCoords.x, fireCoords.y, fireCoords.z)
		streetName       = GetStreetNameFromHashKey(streetName)
		TriggerEvent('esx_outlawalert:fireStartNotify', 'A ' .. alarm .. ' fire has been reported near ' .. streetName,
					 'Fire Report')
		TriggerEvent('esx_outlawalert:fireStartBlip', fireCoords, '[FD] ' .. alarm .. ' Fire')
	end
end)

-- Do a check to see if the fire is out in the fire area. If it is, remove the blip from the map

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if fires ~= nil then
			local v, fired = GetClosestFirePos(fireCoords.x, fireCoords.y, fireCoords.z)

			if v == false then
				RemoveBlip(fireBlip)

				for k, v in pairs(particles) do
					StopParticleFxLooped(v, true)
				end
			end
		end
	end
end)

-- When a stop fire trigger is called, stop the fire that is currently set
RegisterNetEvent('esx_fireman:stopFire')
AddEventHandler('esx_fireman:stopFire', function()
	if fires ~= nil then
		for k, v in pairs(fires) do
			RemoveScriptFire(v)
		end

		for k, v in pairs(particles) do
			StopParticleFxLooped(v, true)
		end

		fires     = {}
		particles = {}
	end

	for k, v in pairs(fireBlips) do
		RemoveBlip(v)
	end

	Citizen.Wait(3500)
	blips = {}
end)

-- Draw Markers

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if PlayerData.job ~= nil and PlayerData.job.name == 'fireman' then
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)

			for k, v in pairs(Config.FireStations) do
				for i = 1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z,
												true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0,
								   0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z,
								   Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true,
								   2, false, false, false, false)
					end
				end

				for i = 1, #v.Armories, 1 do
					if GetDistanceBetweenCoords(coords, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z,
												true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0,
								   0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z,
								   Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true,
								   2, false, false, false, false)
					end
				end

				if PlayerData.job.grade_name == 'boss' then
					for i = 1, #v.BossActions, 1 do
						if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords, v.BossActions[i].x,
																					  v.BossActions[i].y,
																					  v.BossActions[i].z,
																					  true) < Config.DrawDistance then
							DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z,
									   0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y,
									   Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g,
									   Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						end
					end
				end
			end
		end
	end
end)

-- Display blips
Citizen.CreateThread(function()
	for k, v in pairs(Config.FireStations) do
		local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

		SetBlipSprite(blip, v.Blip.Sprite)
		SetBlipDisplay(blip, 0)
		SetBlipScale(blip, v.Blip.Scale)
		SetBlipColour(blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)
		SetBlipPriority(blip, 10)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Fire Station")
		EndTextCommandSetBlipName(blip)
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

	while true do

		Citizen.Wait(10)

		if PlayerData.job ~= nil and PlayerData.job.name == 'fireman' then
			local playerPed      = PlayerPedId()
			local coords         = GetEntityCoords(playerPed)
			local isInMarker     = false
			local currentStation = nil
			local currentPart    = nil
			local currentPartNum = nil

			for k, v in pairs(Config.FireStations) do

				for i = 1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z,
												true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Cloakroom'
						currentPartNum = i
					end
				end

				for i = 1, #v.Armories, 1 do
					if GetDistanceBetweenCoords(coords, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z,
												true) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Armory'
						currentPartNum = i
					end
				end

				if PlayerData.job.grade_name == 'boss' then
					for i = 1, #v.BossActions, 1 do
						if GetDistanceBetweenCoords(coords, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z,
													true) < Config.MarkerSize.x then
							isInMarker     = true
							currentStation = k
							currentPart    = 'BossActions'
							currentPartNum = i
						end
					end
				end
			end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

				if
				(LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_fireman:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_fireman:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_fireman:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end
		else
			Citizen.Wait(500)
		end

	end
end)

function OpenFireActionsMenu()
	ESX.UI.Menu.CloseAll()

	local menuElements = {
		{ label = "Citizen Interaction", value = 'citizen_menu' },
		{ label = 'Clock Off', value = 'mobile_clockinoff' },
	}

	if (exports['esx-radios'].isDedicatedDispatch()) then
		table.insert(menuElements, { label = "PD Radio", value = 'pd_radio_menu' })
		table.insert(menuElements, { label = "EMS Radio", value = 'ems_radio_menu' })
		table.insert(menuElements, { label = "DOC Radio", value = 'doc_radio_menu' })
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fire_actions',
					 {
						 title    = 'Firefighter',
						 align    = 'top-right',
						 elements = menuElements
					 }, function(data, menu)

			if data.current.value == 'citizen_menu' then
				local elements = {
					{ label = "Revive player", value = 'revive' },
					{ label = "Perform Field Treatment", value = 'big' },
					{ label = "Field Treat Injuries", value = 'limbs' },
					{ label = "Field Treat Bleeding", value = 'bleed' },
					{ label = "Put in Vehicle", value = 'put_in_vehicle' },
					{ label = "Take out of Vehicle", value = 'put_out_vehicle' }
				}

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'ems_actions',
					{
						title    = 'EMS Menu',
						align    = 'top-right',
						elements = elements
					}, function(data2, menu2)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer ~= -1 and closestDistance <= 5.0 then
							local action = data2.current.value

							if action == 'put_out_vehicle' then
								TriggerServerEvent('esx_ambulancejob:OutVehicle', GetPlayerServerId(closestPlayer))
							elseif action == 'limbs' then
								TriggerEvent('esx_ambulancejob:healLimbs', closestPlayer)
							elseif action == 'bleed' then
								TriggerEvent('esx_ambulancejob:healBleed', closestPlayer)
							elseif action == 'revive' then
								TriggerEvent('esx_ambulancejob:healRevive', closestPlayer)
							elseif action == 'big' then
								TriggerEvent('esx_ambulancejob:healBig', closestPlayer)
							elseif action == 'put_in_vehicle' then
								TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
							end
						else
							TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'Nobody nearby' })
						end
					end, function(data2, menu2)
						menu2.close()
					end)
				elseif data.current.value == 'mobile_clockinoff' then
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_clockinoff',
								 {
									 title    = 'Mobile Clock Off',
									 align    = 'top-right',
									 elements = {
										{ label = 'Clock Off', value = 'clockinoff' }
	
									}
								}, function(data, menu)
	
							if data.current.value == 'clockinoff' then
								TriggerEvent('duty:onoff')
							end
					   end, function(data, menu)
						   menu.close()
				end)
			end

			if data.current.value == 'mutual_aid_menu' then
				local elements = {
					{ label = "Mutual Aid 1", value = 'mutual_aid_1' },
					{ label = "Mutual Aid 2", value = 'mutual_aid_2' },
					{ label = "Mutual Aid 3", value = 'mutual_aid_3' },
					{ label = "Mutual Aid 4", value = 'mutual_aid_4' },
				}

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'mutual_aid_menu',
					{
						title    = "Mutual Aid",
						align    = 'top-right',
						elements = elements
					}, function(data2, menu2)
						TriggerEvent("esx-radios:toggleRadioByName", data2.current.value)
					end, function(_, menu2)
						menu2.close()
					end)
			end

			if data.current.value == 'pd_radio_menu' then
				local elements = {
					{ label = "PD Radio 1", value = 'pd_radio_1' },
					{ label = "PD Radio 2", value = 'pd_radio_2' },
					{ label = "PD Radio 3", value = 'pd_radio_3' },
					{ label = "PD Radio 4", value = 'pd_radio_4' },
				}

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'pd_radio_menu',
					{
						title    = "PD Radio",
						align    = 'top-right',
						elements = elements
					}, function(data2, menu2)
						TriggerEvent("esx-radios:toggleRadioByName", data2.current.value)
					end, function(_, menu2)
						menu2.close()
					end)
			end

			if data.current.value == 'ems_radio_menu' then
				local elements = {
					{ label = "EMS Radio 1", value = 'ems_radio_1' },
					{ label = "EMS Radio 2", value = 'ems_radio_2' },
					{ label = "EMS Radio 3", value = 'ems_radio_3' },
					{ label = "EMS Radio 4", value = 'ems_radio_4' },
				}

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'ems_radio_menu',
					{
						title    = "EMS Radio",
						align    = 'top-right',
						elements = elements
					}, function(data2, menu2)
						TriggerEvent("esx-radios:toggleRadioByName", data2.current.value)
					end, function(_, menu2)
						menu2.close()
					end)
			end

			if data.current.value == 'fd_radio_menu' then
				local elements = {
					{ label = "FD Radio 1", value = 'fd_radio_1' },
					{ label = "FD Radio 2", value = 'fd_radio_2' },
					{ label = "FD Radio 3", value = 'fd_radio_3' },
					{ label = "FD Radio 4", value = 'fd_radio_4' },
				}

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'fd_radio_menu',
					{
						title    = "FD Radio",
						align    = 'top-right',
						elements = elements
					}, function(data2, menu2)
						TriggerEvent("esx-radios:toggleRadioByName", data2.current.value)
					end, function(_, menu2)
						menu2.close()
					end)
			end

			if data.current.value == 'dispatch_menu' then
				local elements = {
					{ label = "Regular Dispatch", value = 'dispatch_1' },
					{ label = "Dedicated Dispatch", value = 'dispatch_2' },
				}

				if (exports['esx-radios'].isDedicatedDispatch()) then
					elements = {
						{ label = "Dedicated Dispatch", value = 'dispatch_2' },
					}
				end

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'dispatch_menu',
					{
						title    = "Dispatch",
						align    = 'top-right',
						elements = elements
					}, function(data2, menu2)
						local action = data2.current.value
						menu2.close()
						if action == 'dispatch_1' then
							TriggerEvent("esx-radios:toggleRadioByName", 'dispatch')
						elseif action == 'dispatch_2' then
							TriggerEvent("esx-radios:toggleDedicatedDispatch");
							menu.close()
						end
					end, function(data2, menu2)
						menu2.close()
					end)
			end

			if data.current.value == 'doc_radio_menu' then
				local elements = {
					{ label = "DOC Radio 1", value = 'doc_radio_1' },
					{ label = "DOC Radio 2", value = 'doc_radio_2' },
					{ label = "DOC Radio 3", value = 'doc_radio_3' },
					{ label = "DOC Radio 4", value = 'doc_radio_4' },
				}

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'doc_radio_menu',
					{
						title    = "DOC Radio",
						align    = 'top-right',
						elements = elements
					}, function(data2, menu2)
						TriggerEvent("esx-radios:toggleRadioByName", data2.current.value)
					end, function(_, menu2)
						menu2.close()
					end)
			end

		end, function(data, menu)
			menu.close()
		end)
end

AddEventHandler('esx_fireman:hasEnteredMarker', function(station, part, partNum)

	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to open the cloak room'
		CurrentActionData = {}

	elseif part == 'Armory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to open the armory'
		CurrentActionData = { station = station }

	elseif part == 'BossActions' then

		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to open the boss menu'
		CurrentActionData = {}

	end
end)

AddEventHandler('esx_fireman:hasExitedMarker', function(station, part, partNum)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'fireman' then
				if CurrentAction == "menu_cloakroom" then
					OpenCloakroomMenu()
				end

				if CurrentAction == 'menu_armory' then
					OpenArmoryMenu(CurrentActionData.station)
				end

				if CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', 'fireman', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to open the boss menu'
						CurrentActionData = {}
					end, { wash = false }) -- disable washing money
				end

				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'fireman' then
			if Config.MaxInService == -1 then
				OpenFireActionsMenu()
			elseif playerInService then
				OpenFireActionsMenu()
			else
				ESX.ShowNotification('Too many people in service')
			end
		end
	end
end)

function OpenCloakroomMenu()
	local playerPed = PlayerPedId()

	local elements  = {
		{ label = 'Citizen Wear', value = 'citizen_wear' },
		{ label = 'Turn-in Wear', value = 'turnin_wear' },
		{ label = 'Turn-out Wear', value = 'turnout_wear' },
		{ label = 'Fire Jacket', value = 'fire_wear' },
		{ label = 'Long Sleeved Shirt', value = 'shirtlong_wear' },
		{ label = 'Short Sleeved Shirt', value = 'shirtshort_wear' },
		{ label = 'Formal Wear', value = 'formal_wear' },
		{ label = 'Supervisor Long Sleeved', value = 'supelong_wear' },
		{ label = 'Supervisor Short Sleeved', value = 'supeshort_wear' },
		{ label = 'Supervisor Formal', value = 'supeformal_wear' },
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = 'Cloakroom',
		align    = 'top-right',
		elements = elements,
	}, function(data, menu)
		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
			SetPedArmour(playerPed, 0)
			TriggerServerEvent('esx_fireman:removeWeapon', 'WEAPON_FIREEXTINGUISHER', 1000)
			TriggerServerEvent('esx_fireman:removeWeapon', 'WEAPON_FIRE_AXE', 1)
		elseif data.current.value == 'emt_wear' then
			setUniform(data.current.value, playerPed)
			SetPedArmour(playerPed, 0)
			TriggerServerEvent('esx_fireman:removeWeapon', 'WEAPON_FIREEXTINGUISHER', 1000)
			TriggerServerEvent('esx_fireman:removeWeapon', 'WEAPON_FIRE_AXE', 1)
		elseif data.current.value == 'diving_suit' then
			setUniform(data.current.value, playerPed)
			SetPedArmour(playerPed, 100)
			TriggerServerEvent('esx_fireman:giveItem', 'scuba', 1)
		else
			setUniform(data.current.value, playerPed)
			TriggerServerEvent('esx_fireman:giveWeapon', 'WEAPON_FIREEXTINGUISHER', 1000)
			TriggerServerEvent('esx_fireman:giveWeapon', 'WEAPON_FIRE_AXE', 1)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to open the cloakroom'
		CurrentActionData = {}
	end)
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
				SetPedArmour(playerPed, 200)
			else
				ESX.ShowNotification('No outfit found')
			end
		else
			if Config.Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
				SetPedArmour(playerPed, 200)
			else
				ESX.ShowNotification('No outfit found')
			end
		end
	end)
end

function OpenArmoryMenu(station)
	local elements = {}

	for i = 1, #Config.FireStations[station].AuthorizedWeapons, 1 do
		local weapon = Config.FireStations[station].AuthorizedWeapons[i]
		table.insert(elements, { label = ESX.GetWeaponLabel(weapon.name), value = weapon.name })
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
					 {
						 title    = 'Armory',
						 align    = 'top-right',
						 elements = elements
					 }, function(data, menu)
			local weapon = data.current.value
			TriggerServerEvent('esx_fireman:giveWeapon', weapon, 1000)
		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_armory'
			CurrentActionMsg  = "Press ~INPUT_CONTEXT~ to open the armory"
			CurrentActionData = { station = station }
		end)

end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if PlayerData.job and PlayerData.job.name ~= nil and PlayerData.job.name == 'fireman' then
			local coords  = GetEntityCoords(PlayerPedId())
			local vehicle = ESX.Game.GetClosestVehicle()
			if vehicle ~= nil and checkVehicleCanAccessInventory(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) and not IsPedInAnyVehicle(PlayerPedId()) then
				local vehicleCoords = GetEntityCoords(vehicle)

				if GetDistanceBetweenCoords(coords, vehicleCoords, true) < 3 then
					ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to access the Fire Truck")

					inFiretruckRange = true

					if IsControlJustPressed(0, Keys['E']) then
						openFireTruckMenu()
					end
				else
					inFiretruckRange = false
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if not inFiretruckRange and ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'firetruck_menu') then
			ESX.UI.Menu.Close('default', GetCurrentResourceName(), 'firetruck_menu')
		end
	end
end)

function openFireTruckMenu()

	local playerPed = PlayerPedId()

	local elements  = {
		{
			value = 'items',
			label = 'Items',
		},
		{
			value = 'remove_gear',
			label = 'Remove Turnout Gear',
		},
		{
			value = 'medic_bag',
			label = 'Grab Medic Bag',
		},
		{
			value = 'medic_bag_off',
			label = 'Return Medic Bag',
		},
		{
			value = 'add_gear',
			label = 'Turnout Gear',
		}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'firetruck_menu',
					 {
						 title    = 'Firetruck Inventory',
						 align    = 'top-right',
						 elements = elements
					 }, function(data, menu)
			if data.current.value == 'items' then
				local item_elements = {
					{
						value = 'medikit',
						label = 'Medical Kit'
					},
					{
						value = 'extinguisher',
						label = 'Fire Extinguisher'
					}
				}

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'firetruck_item_menu',
								 {
									 title    = 'Firetruck Item Menu',
									 align    = 'top-right',
									 elements = item_elements
								 }, function(data2, menu2)
						if data2.current.value == 'medikit' then
							TriggerServerEvent('esx_fireman:giveItem', 'medikit', 1)
						elseif data2.current.value == 'extinguisher' then
							TriggerServerEvent('esx_fireman:giveWeapon', 'WEAPON_FIREEXTINGUISHER', 1000)
							TriggerServerEvent('esx_fireman:giveWeapon', 'WEAPON_FIRE_AXE', 1)
						end
					end, function(data2, menu2)
						menu2.close()
					end)
			elseif data.current.value == 'add_gear' then
				setUniform('turnout_wear', playerPed)
				SetPedArmour(playerPed, 100)
			elseif data.current.value == 'medic_bag' then
				setUniform('medic_bag', playerPed)
			elseif data.current.value == 'medic_bag_off' then
				setUniform('medic_bag_off', playerPed)
			elseif data.current.value == 'remove_gear' then
				setUniform('turnin_wear', playerPed)
				SetPedArmour(playerPed, 0)
				TriggerServerEvent('esx_fireman:removeWeapon', 'WEAPON_FIREEXTINGUISHER', 1000)
				TriggerServerEvent('esx_fireman:removeWeapon', 'WEAPON_FIRE_AXE', 1)
			end
		end, function(data, menu)
			menu.close()
		end)
end

-- Function to see if the vehicle you are trying to use can access inventory.
function checkVehicleCanAccessInventory(vehicle)
	for i = 1, #Config.VehicleInventory, 1 do
		if string.upper(Config.VehicleInventory[i]) == string.upper(vehicle) then
			return true
		end
	end
end

function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end
