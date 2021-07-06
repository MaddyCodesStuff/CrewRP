local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local IsBusy                                             = false
local spawnedVehicles, isInShopMenu                      = {}, false
local playerInService                                    = false
local blipsAmbulance                                     = {}

function OpenAmbulanceActionsMenu()
	local elements = {
		{ label = _U('cloakroom'), value = 'cloakroom' }
	}

	if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, { label = _U('boss_actions'), value = 'boss_actions' })
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions',
					 {
						 title    = _U('ambulance'),
						 align    = 'top-right',
						 elements = elements
					 }, function(data, menu)
			if data.current.value == 'cloakroom' then
				OpenCloakroomMenu()
			elseif data.current.value == 'boss_actions' then
				TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
					menu.close()
					CurrentAction     = 'menu_boss_actions'
					CurrentActionMsg  = _U('open_bossmenu')
					CurrentActionData = {}
				end, { wash = false }) -- disable washing money
			end
		end, function(data, menu)
			menu.close()
		end)
end

function OpenMobileAmbulanceActionsMenu()

	ESX.UI.Menu.CloseAll()

	local menuElements = {
		{ label = _U('ems_menu'), value = 'citizen_interaction' },
		{ label = 'Clock Off', value = 'mobile_clockinoff' },
	}

	if (exports['esx-radios'].isDedicatedDispatch()) then
		table.insert(menuElements, { label = "PD Radio", value = 'pd_radio_menu' })
		table.insert(menuElements, { label = "FD Radio", value = 'fd_radio_menu' })
		table.insert(menuElements, { label = "DOC Radio", value = 'doc_radio_menu' })
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions',
					 {
						 title    = _U('ambulance'),
						 align    = 'top-right',
						 elements = menuElements
					 }, function(data, menu)

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

			if data.current.value == 'spawn_menu' then
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_menu',
								 {
									 title    = _U('spawn_menu_title'),
									 align    = 'top-right',
									 elements = {
										 { label = _U('spawn_wheelchair'), value = 'spawn_wheelchair' },
										 { label = _U('despawn_wheelchair'), value = 'despawn_wheelchair' },
									 }
								 }, function(data, menu)

						if data.current.value == 'spawn_wheelchair' then
							TriggerEvent('qalle-wheelchair:spawnChair')
						elseif data.current.value == 'despawn_wheelchair' then
							TriggerEvent('qalle-wheelchair:despawnChair')
						end
					end, function(data, menu)
						menu.close()
					end)
			elseif data.current.value == 'citizen_interaction' then
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
								 {
									 title    = _U('ems_menu_title'),
									 align    = 'top-right',
									 elements = {
										 { label = _U('ems_menu_revive'), value = 'revive' },
										 { label = _U('ems_menu_big'), value = 'big' },
										 { label = _U('ems_menu_limbs'), value = 'limbs' },
										 { label = _U('ems_menu_bleed'), value = 'bleed' },
										 { label = _U('ems_menu_putincar'), value = 'put_in_vehicle' },
										 { label = _U('ems_menu_putoutcar'), value = 'put_out_vehicle' }
									 }
								 }, function(data, menu)
						if IsBusy then
							return
						end

						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

						if closestPlayer == -1 or closestDistance > 5.0 then
							ESX.ShowNotification(_U('no_players'))
						else
							if data.current.value == 'put_out_vehicle' then
								TriggerServerEvent('esx_ambulancejob:OutVehicle', GetPlayerServerId(closestPlayer))
							elseif data.current.value == 'limbs' then
								TriggerEvent('esx_ambulancejob:healLimbs', closestPlayer)
							elseif data.current.value == 'bleed' then
								TriggerEvent('esx_ambulancejob:healBleed', closestPlayer)
							elseif data.current.value == 'revive' then
								TriggerEvent('esx_ambulancejob:healRevive', closestPlayer)
							elseif data.current.value == 'big' then
								TriggerEvent('esx_ambulancejob:healBig', closestPlayer)
							elseif data.current.value == 'put_in_vehicle' then
								TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
							end
						end
					end, function(data, menu)
						menu.close()
					end
				)
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

		end, function(data, menu)
			menu.close()
		end
	)
end

function FastTravel(coords, heading)
	TeleportFadeEffect(PlayerPedId(), coords, heading)
end

function TeleportFadeEffect(entity, coords, heading)
	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end

		ESX.Game.Teleport(entity, coords, function()
			DoScreenFadeIn(800)

			if heading then
				SetEntityHeading(entity, heading)
			end
		end)
	end)
end

-- Draw markers
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then

			local playerPed                       = PlayerPedId()
			local coords                          = GetEntityCoords(playerPed)

			local canSleep, isInMarker, hasExited = true, false, false
			local currentHospital, currentPart, currentPartNum

			for k, v in pairs(Config.Hospitals) do
				-- Pharmacies
				for i = 1, #v.Pharmacies, 1 do
					if GetDistanceBetweenCoords(coords, v.Pharmacies[i].x, v.Pharmacies[i].y, v.Pharmacies[i].z,
												true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Pharmacies[i].x, v.Pharmacies[i].y, v.Pharmacies[i].z, 0.0, 0.0,
								   0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z,
								   Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true,
								   2, false, false, false, false)
						canSleep                                                 = false

						isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Pharmacy', k
					end
				end

				for i = 1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z,
												true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0,
								   0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z,
								   Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true,
								   2, false, false, false, false)
					end
				end

				for i = 1, #v.Vehicles, 1 do
					if GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y,
												v.Vehicles[i].Spawner.z, true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y,
								   v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x,
								   Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g,
								   Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i = 1, #v.Helicopters, 1 do
					if GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y,
												v.Helicopters[i].Spawner.z, true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y,
								   v.Helicopters[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x,
								   Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g,
								   Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i = 1, #v.VehicleDeleters, 1 do
					if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y,
												v.VehicleDeleters[i].z, true) < Config.DrawDistance then
						DrawMarker(Config.MarkerType, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y,
								   v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x,
								   Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g,
								   Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' then
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
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(10)

		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then

			local playerPed       = PlayerPedId()
			local coords          = GetEntityCoords(playerPed)
			local isInMarker      = false
			local currentHospital = nil
			local currentPart     = nil
			local currentPartNum  = nil

			for k, v in pairs(Config.Hospitals) do

				for i = 1, #v.Cloakrooms, 1 do
					if GetDistanceBetweenCoords(coords, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z,
												true) < Config.MarkerSize.x then
						isInMarker      = true
						currentHospital = k
						currentPart     = 'Cloakroom'
						currentPartNum  = i
					end
				end

				for i = 1, #v.Pharmacies, 1 do
					if GetDistanceBetweenCoords(coords, v.Pharmacies[i].x, v.Pharmacies[i].y, v.Pharmacies[i].z,
												true) < Config.MarkerSize.x then
						isInMarker      = true
						currentHospital = k
						currentPart     = 'Pharmacy'
						currentPartNum  = i
					end
				end

				for i = 1, #v.Vehicles, 1 do
					if GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y,
												v.Vehicles[i].Spawner.z, true) < Config.MarkerSize.x then
						isInMarker      = true
						currentHospital = k
						currentPart     = 'VehicleSpawner'
						currentPartNum  = i
					end
				end

				for i = 1, #v.Helicopters, 1 do
					if GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y,
												v.Helicopters[i].Spawner.z, true) < Config.MarkerSize.x then
						isInMarker      = true
						currentHospital = k
						currentPart     = 'HelicopterSpawner'
						currentPartNum  = i
					end
				end

				for i = 1, #v.VehicleDeleters, 1 do
					if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y,
												v.VehicleDeleters[i].z, true) < Config.MarkerSize.x then
						isInMarker      = true
						currentHospital = k
						currentPart     = 'VehicleDeleter'
						currentPartNum  = i
					end
				end

				if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' then
					for i = 1, #v.BossActions, 1 do
						if GetDistanceBetweenCoords(coords, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z,
													true) < Config.MarkerSize.x then
							isInMarker      = true
							currentHospital = k
							currentPart     = 'BossActions'
							currentPartNum  = i
						end
					end
				end
			end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
				(LastHospital ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastHospital            = currentHospital
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentHospital, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(hospital, part, partNum)
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
		if part == 'AmbulanceActions' then
			CurrentAction     = part
			CurrentActionMsg  = _U('actions_prompt')
			CurrentActionData = {}
		elseif part == 'Pharmacy' then
			CurrentAction     = part
			CurrentActionMsg  = _U('open_pharmacy')
			CurrentActionData = {}
		elseif part == 'VehicleSpawner' then
			CurrentAction     = part
			CurrentActionMsg  = _U('garage_prompt')
			CurrentActionData = { hospital = hospital, partNum = partNum }
		elseif part == 'VehicleDeleter' then
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)

			if IsPedInAnyVehicle(playerPed, false) then

				local vehicle = GetVehiclePedIsIn(playerPed, false)

				if DoesEntityExist(vehicle) then
					CurrentAction     = 'delete_vehicle'
					CurrentActionMsg  = _U('store_vehicle')
					CurrentActionData = { vehicle = vehicle }
				end

			end
		elseif part == 'HelicopterSpawner' then
			CurrentAction     = part
			CurrentActionMsg  = _U('helicopter_prompt')
			CurrentActionData = { hospital = hospital, partNum = partNum }
		elseif part == 'FastTravelsPrompt' then
			local travelItem  = Config.Hospitals[hospital][part][partNum]

			CurrentAction     = part
			CurrentActionMsg  = travelItem.Prompt
			CurrentActionData = { to = travelItem.To.coords, heading = travelItem.To.heading }
		elseif part == 'Cloakroom' then
			print('Cloakroom')
			CurrentAction     = 'menu_cloakroom'
			CurrentActionMsg  = _U('open_cloackroom')
			CurrentActionData = {}
		elseif part == 'BossActions' then
			CurrentAction     = 'menu_boss_actions'
			CurrentActionMsg  = _U('open_bossmenu')
			CurrentActionData = {}
		end
	end
end)

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0,
									 Keys['E']) and ESX.PlayerData ~= nil and ESX.PlayerData.job.name == 'ambulance' then

				if CurrentAction == 'AmbulanceActions' then
					OpenAmbulanceActionsMenu()
				elseif CurrentAction == 'Pharmacy' then
					OpenPharmacyMenu()
				elseif CurrentAction == 'VehicleSpawner' then
					OpenVehicleSpawnerMenu(CurrentActionData.hospital, CurrentActionData.partNum)
				elseif CurrentAction == 'delete_vehicle' then
					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleInGarage', 'ambulance', vehicleProps)
					end
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'Helicopters' then
					OpenHelicopterSpawnerMenu(CurrentActionData.hospital, CurrentActionData.partNum)
				elseif CurrentAction == 'FastTravelsPrompt' then
					FastTravel(CurrentActionData.to, CurrentActionData.heading)
				elseif CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, { wash = false }) -- disable washing money
				end

				CurrentAction = nil

			end

		elseif ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' and not IsDead then
			if IsControlJustReleased(0, Keys['F6']) then
				OpenMobileAmbulanceActionsMenu()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function OpenCloakroomMenu()
	local playerPed = PlayerPedId()
	local grade     = ESX.PlayerData.job.grade_name

	local elements  = {
		{ label = _U('citizen_wear'), value = 'citizen_wear' },
		{ label = _U('bagoff_wear'), value = 'bagoff_wear' },
		{ label = _U('hartoff_wear'), value = 'hartoff_wear' },
		{ label = _U('stethoscope_wear'), value = 'stethoscope_wear' },
		{ label = _U('bagclosed_wear'), value = 'bagclosed_wear' },
		{ label = _U('bagopen_wear'), value = 'bagopen_wear' },
		{ label = _U('hart_wear'), value = 'hart_wear' },
		{ label = _U('greens_wear'), value = 'greens_wear' },
		{ label = _U('greens2_wear'), value = 'greens2_wear' },
		{ label = _U('blues_wear'), value = 'blues_wear' },
		{ label = _U('blues2_wear'), value = 'blues2_wear' },
		{ label = _U('docwhite_wear'), value = 'docwhite_wear' },
		{ label = _U('docwhite2_wear'), value = 'docwhite2_wear' },
		{ label = _U('docblue_wear'), value = 'docblue_wear' },
		{ label = _U('docblue2_wear'), value = 'docblue2_wear' },
		{ label = _U('docgreen_wear'), value = 'docgreen_wear' },
		{ label = _U('docgreen2_wear'), value = 'docgreen2_wear' },
		{ label = _U('formal_wear'), value = 'formal_wear' },
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
					 {
						 title    = _U('cloakroom'),
						 align    = 'top-right',
						 elements = elements
					 }, function(data, menu)

			cleanPlayer(playerPed)

			if
			data.current.value == 'citizen_wear' or
				data.current.value == 'greens_wear' or
				data.current.value == 'greens2_wear' or
				data.current.value == 'blues_wear' or
				data.current.value == 'blues2_wear' or
				data.current.value == 'docwhite_wear' or
				data.current.value == 'docwhite2_wear' or
				data.current.value == 'docblue_wear' or
				data.current.value == 'docblue2_wear' or
				data.current.value == 'docgreen_wear' or
				data.current.value == 'docgreen2_wear' or
				data.current.value == 'formal_wear' or
				data.current.value == 'hart_wear' or
				data.current.value == 'hartoff_wear' or
				data.current.value == 'bagopen_wear' or
				data.current.value == 'bagclosed_wear' or
				data.current.value == 'bagoff_wear' or
				data.current.value == 'stethoscope_wear'
			then
				setUniform(data.current.value, playerPed)
			end

			if data.current.value == 'citizen_wear' then

				if Config.EnableNonFreemodePeds then
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						local isMale = skin.sex == 0

						TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
							ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
								TriggerEvent('skinchanger:loadSkin', skin)
								TriggerEvent('esx:restoreLoadout')
							end)
						end)

					end)
				else
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)
				end

				if data.current.value == 'citizen_wear' then

					if Config.EnableNonFreemodePeds then
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
							local isMale = skin.sex == 0

							TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
								ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
									TriggerEvent('skinchanger:loadSkin', skin)
									TriggerEvent('esx:restoreLoadout')
								end)
							end)

						end)
					else
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)
					end

					if Config.MaxInService ~= -1 then

						ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
							if isInService then

								playerInService    = false

								local notification = {
									title    = _U('service_anonunce'),
									subject  = '',
									msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
									iconType = 1
								}

								TriggerServerEvent('esx_service:notifyAllInService', notification, 'ambulance')

								TriggerServerEvent('esx_service:disableService', 'ambulance')
								TriggerEvent('esx_ambulancejob:updateBlip')
								ESX.ShowNotification(_U('service_out'))
							end
						end, 'ambulance')
					end

				end

				if Config.MaxInService ~= -1 and data.current.value ~= 'citizen_wear' then
					local serviceOk = 'waiting'

					ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
						if not isInService then

							ESX.TriggerServerCallback('esx_service:enableService',
													  function(canTakeService, maxInService, inServiceCount)
														  if not canTakeService then
															  ESX.ShowNotification(_U('service_max', inServiceCount,
																					  maxInService))
														  else

															  serviceOk          = true
															  playerInService    = true

															  local notification = {
																  title    = _U('service_anonunce'),
																  subject  = '',
																  msg      = _U('service_in_announce',
																				GetPlayerName(PlayerId())),
																  iconType = 1
															  }

															  TriggerServerEvent('esx_service:notifyAllInService',
																				 notification, 'ambulance')
															  TriggerEvent('esx_ambulancejob:updateBlip')
															  ESX.ShowNotification(_U('service_in'))
														  end
													  end, 'ambulance')

						else
							serviceOk = true
						end
					end, 'ambulance')

					while type(serviceOk) == 'string' do
						Citizen.Wait(5)
					end

					-- if we couldn't enter service don't let the player get changed
					if not serviceOk then
						return
					end
				end

				if
				data.current.value == 'student_wear' or
					data.current.value == 'probation_wear' or
					data.current.value == 'npa_wear' or
					data.current.value == 'lpn_wear' or
					data.current.value == 'medic_wear' or
					data.current.value == 'aprn_wear' or
					data.current.value == 'headnurse_wear' or
					data.current.value == 'chiefmedic_wear' or
					data.current.value == 'gp_wear' or
					data.current.value == 'sp_wear' or
					data.current.value == 'physician_wear' or
					data.current.value == 'studentsurgeon_wear' or
					data.current.value == 'surgeon_wear' or
					data.current.value == 'boss_wear' or
					data.current.value == 'chiefsurgery_wear' or
					data.current.value == 'cmo_wear'
				then
					setUniform(data.current.value, playerPed)
				end

				if data.current.value == 'freemode_ped' then
					local modelHash = ''

					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						if skin.sex == 0 then
							modelHash = GetHashKey(data.current.maleModel)
						else
							modelHash = GetHashKey(data.current.femaleModel)
						end

						ESX.Streaming.RequestModel(modelHash, function()
							SetPlayerModel(PlayerId(), modelHash)
							SetModelAsNoLongerNeeded(modelHash)

							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end

			end
		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_cloakroom'
			CurrentActionMsg  = _U('open_cloackroom')
			CurrentActionData = {}
		end)
end

-- function OpenCloakroomMenu()
-- 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
-- 	{
-- 		title		= _U('cloakroom'),
-- 		align		= 'top-right',
-- 		elements = {
-- 			{label = _U('citizen_wear'), value = 'citizen_wear'},
-- 			{label = _U('student_wear'), value = 'student_wear'},
-- 			{label = _U('probation_wear'), value = 'probation_wear'},
-- 			{label = _U('npa_wear'), value = 'npa_wear'},
-- 			{label = _U('lpn_wear'), value = 'lpn_wear'},
-- 			{label = _U('medic_wear'), value = 'medic_wear'},
-- 			{label = _U('aprn_wear'), value = 'aprn_wear'},
-- 			{label = _U('headnurse_wear'), value = 'headnurse_wear'},
-- 			{label = _U('chiefmedic_wear'), value = 'chiefmedic_wear'},
-- 			{label = _U('gp_wear'), value = 'gp_wear'},
-- 			{label = _U('sp_wear'), value = 'sp_wear'},
-- 			{label = _U('physician_wear'), value = 'physician_wear'},
-- 			{label = _U('studentsurgeon_wear'), value = 'studentsurgeon_wear'},
-- 			{label = _U('surgeon_wear'), value = 'surgeon_wear'},
-- 			{label = _U('chiefsurgery_wear'), value = 'chiefsurgery_wear'},
-- 			{label = _U('cmo_wear'), value = 'cmo_wear'},
-- 			{label = _U('boss_wear'), value = 'boss_wear'},
-- 		}
-- 	}, function(data, menu)
-- 		if data.current.value == 'citizen_wear' then
-- 			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
-- 				TriggerEvent('skinchanger:loadSkin', skin)
-- 			end)
-- 		elseif data.current.value == 'ambulance_wear' then
-- 			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
-- 				if skin.sex == 0 then
-- 					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
-- 				else
-- 					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
-- 				end
-- 			end)
-- 		end

-- 		menu.close()
-- 	end, function(data, menu)
-- 		menu.close()
-- 	end)
-- end

function OpenVehicleSpawnerMenu(hospital, partNum)

	ESX.UI.Menu.CloseAll()

	if Config.EnableSocietyOwnedVehicles then
		local elements = {}

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage',
								  function(garageVehicles)
									  for i = 1, #garageVehicles, 1 do
										  table.insert(elements, {
											  label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. '[' .. garageVehicles[i].plate .. ']',
											  value = garageVehicles[i]
										  })
									  end

									  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
													   {
														   title    = _U('vehicle_menu'),
														   align    = 'top-right',
														   elements = elements
													   },
													   function(data, menu)
														   menu.close()

														   local vehicleProps                = data.current.value
														   local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(hospital,
																															 partNum)

														   if foundSpawnPoint then
															   ESX.Game.SpawnVehicle(vehicleProps.model, spawnPoint,
																					 spawnPoint.heading,
																					 function(vehicle)
																						 ESX.Game.SetVehicleProperties(vehicle,
																													   vehicleProps)
																						 TaskWarpPedIntoVehicle(PlayerPedId(),
																												vehicle,
																												-1)
																					 end)

															   TriggerServerEvent('esx_society:removeVehicleFromGarage',
																				  'ambulance', vehicleProps)
														   end
													   end,
													   function(data, menu)
														   menu.close()

														   CurrentAction     = 'menu_vehicle_spawner'
														   CurrentActionMsg  = _U('vehicle_spawner')
														   CurrentActionData = { hospital = hospital, partNum = partNum }
													   end)

								  end, 'ambulance')
	else
		local elements       = {}

		local sharedVehicles = Config.AuthorizedVehicles.Shared
		for i = 1, #sharedVehicles, 1 do
			table.insert(elements, { label = sharedVehicles[i].label, model = sharedVehicles[i].model })
		end

		-- local authorizedVehicles = Config.AuthorizedVehicles[ESX.PlayerData.job.grade_name]
		-- for i=1, #authorizedVehicles, 1 do
		-- 	table.insert(elements, { label = authorizedVehicles[i].label, model = authorizedVehicles[i].model})
		-- end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
						 {
							 title    = _U('vehicle_menu'),
							 align    = 'top-right',
							 elements = elements
						 }, function(data, menu)
				menu.close()

				local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(hospital, partNum)

				if foundSpawnPoint then
					if Config.MaxInService == -1 then
						ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
							TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
							SetVehicleMaxMods(vehicle)
							PlaceObjectOnGroundProperly(vehicle)
						end)
					else
						ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
							TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
							SetVehicleMaxMods(vehicle)
							PlaceObjectOnGroundProperly(vehicle)
						end)
						-- ESX.TriggerServerCallback('esx_service:isInService', function(isInService)

						-- 	if isInService then
						-- 		ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
						-- 			TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
						-- 			SetVehicleMaxMods(vehicle)
						-- 		end)
						-- 	else
						-- 		ESX.ShowNotification(_U('service_not'))
						-- 	end

						-- end, 'ambulance')
					end
				end

			end, function(data, menu)
				menu.close()

				CurrentAction     = 'menu_vehicle_spawner'
				CurrentActionMsg  = _U('vehicle_spawner')
				CurrentActionData = { station = station, partNum = partNum }
			end)

	end

end

function StoreNearbyVehicle(playerCoords)
	local vehicles, vehiclePlates = ESX.Game.GetVehiclesInArea(playerCoords, 30.0), {}

	if #vehicles > 0 then
		for k, v in ipairs(vehicles) do

			-- Make sure the vehicle we're saving is empty, or else it wont be deleted
			if GetVehicleNumberOfPassengers(v) == 0 and IsVehicleSeatFree(v, -1) then
				table.insert(vehiclePlates, {
					vehicle = v,
					plate   = ESX.Math.Trim(GetVehicleNumberPlateText(v))
				})
			end
		end
	else
		ESX.ShowNotification(_U('garage_store_nearby'))
		return
	end

	ESX.TriggerServerCallback('esx_ambulancejob:storeNearbyVehicle', function(storeSuccess, foundNum)
		if storeSuccess then
			local vehicleId = vehiclePlates[foundNum]
			local attempts  = 0
			ESX.Game.DeleteVehicle(vehicleId.vehicle)
			IsBusy = true

			Citizen.CreateThread(function()
				while IsBusy do
					Citizen.Wait(0)
					drawLoadingText(_U('garage_storing'), 255, 255, 255, 255)
				end
			end)

			-- Workaround for vehicle not deleting when other players are near it.
			while DoesEntityExist(vehicleId.vehicle) do
				Citizen.Wait(500)
				attempts = attempts + 1

				-- Give up
				if attempts > 30 then
					break
				end

				vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 30.0)
				if #vehicles > 0 then
					for k, v in ipairs(vehicles) do
						if ESX.Math.Trim(GetVehicleNumberPlateText(v)) == vehicleId.plate then
							ESX.Game.DeleteVehicle(v)
							break
						end
					end
				end
			end

			IsBusy = false
			ESX.ShowNotification(_U('garage_has_stored'))
		else
			ESX.ShowNotification(_U('garage_has_notstored'))
		end
	end, vehiclePlates)
end

function GetAvailableVehicleSpawnPoint(hospital, partNum)
	local spawnPoints            = Config.Hospitals[hospital].Vehicles[partNum].SpawnPoints
	local found, foundSpawnPoint = false, nil

	for i = 1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i], spawnPoints[i].radius) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('garage_blocked'))
		return false
	end
end

function OpenHelicopterSpawnerMenu(hospital, partNum)
	local playerCoords = GetEntityCoords(PlayerPedId())
	local elements     = {
		{ label = _U('helicopter_garage'), action = 'garage' },
		{ label = _U('helicopter_store'), action = 'store_garage' },
		{ label = _U('helicopter_buy'), action = 'buy_helicopter' }
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'helicopter_spawner', {
		title    = _U('helicopter_title'),
		align    = 'top-right',
		elements = elements
	}, function(data, menu)

		if data.current.action == 'buy_helicopter' then
			local shopCoords            = Config.Hospitals[hospital].Helicopters[partNum].InsideShop
			local shopElements          = {}

			local authorizedHelicopters = Config.AuthorizedHelicopters[ESX.PlayerData.job.grade_name]

			if #authorizedHelicopters > 0 then
				for k, helicopter in ipairs(authorizedHelicopters) do
					table.insert(shopElements, {
						label = ('%s - <span style="color:green;">%s</span>'):format(helicopter.label,
																					 _U('shop_item',
																						ESX.Math.GroupDigits(helicopter.price))),
						name  = helicopter.label,
						model = helicopter.model,
						price = helicopter.price,
						type  = 'helicopter'
					})
				end
			else
				ESX.ShowNotification(_U('helicopter_notauthorized'))
				return
			end

			OpenShopMenu(shopElements, playerCoords, shopCoords)
		elseif data.current.action == 'garage' then
			local garage = {}

			ESX.TriggerServerCallback('esx_vehicleshop:retrieveJobVehicles', function(jobVehicles)
				if #jobVehicles > 0 then
					for k, v in ipairs(jobVehicles) do
						local props       = json.decode(v.vehicle)
						local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(props.model))
						local label       = ('%s - <span style="color:darkgoldenrod;">%s</span>: '):format(vehicleName,
																										   props.plate)

						if v.stored then
							label = label .. ('<span style="color:green;">%s</span>'):format(_U('garage_stored'))
						else
							label = label .. ('<span style="color:darkred;">%s</span>'):format(_U('garage_notstored'))
						end

						table.insert(garage, {
							label        = label,
							stored       = v.stored,
							model        = props.model,
							vehicleProps = props
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'helicopter_garage', {
						title    = _U('helicopter_garage_title'),
						align    = 'top-right',
						elements = garage
					}, function(data2, menu2)
						if data2.current.stored then
							local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(hospital, 'Helicopters',
																						 partNum)

							if foundSpawn then
								menu2.close()

								ESX.Game.SpawnVehicle(data2.current.model, spawnPoint.coords, spawnPoint.heading,
													  function(vehicle)
														  ESX.Game.SetVehicleProperties(vehicle,
																						data2.current.vehicleProps)

														  TriggerServerEvent('esx_vehicleshop:setJobVehicleState',
																			 data2.current.vehicleProps.plate, false)
														  ESX.ShowNotification(_U('garage_released'))
													  end)
							end
						else
							ESX.ShowNotification(_U('garage_notavailable'))
						end
					end, function(data2, menu2)
						menu2.close()
					end)

				else
					ESX.ShowNotification(_U('garage_empty'))
				end
			end, 'helicopter')

		elseif data.current.action == 'store_garage' then
			StoreNearbyVehicle(playerCoords)
		end

	end, function(data, menu)
		menu.close()
	end)

end

function OpenShopMenu(elements, restoreCoords, shopCoords)
	local playerPed = PlayerPedId()
	isInShopMenu    = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
		title    = _U('vehicleshop_title'),
		align    = 'top-right',
		elements = elements
	}, function(data, menu)

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop_confirm',
						 {
							 title    = _U('vehicleshop_confirm', data.current.name, data.current.price),
							 align    = 'top-right',
							 elements = {
								 { label = _U('confirm_no'), value = 'no' },
								 { label = _U('confirm_yes'), value = 'yes' }
							 }
						 }, function(data2, menu2)

				if data2.current.value == 'yes' then
					local newPlate = exports['esx_vehicleshop']:GeneratePlate()
					local vehicle  = GetVehiclePedIsIn(playerPed, false)
					local props    = ESX.Game.GetVehicleProperties(vehicle)
					props.plate    = newPlate

					ESX.TriggerServerCallback('esx_ambulancejob:buyJobVehicle', function(bought)
						if bought then
							ESX.ShowNotification(_U('vehicleshop_bought', data.current.name,
													ESX.Math.GroupDigits(data.current.price)))

							isInShopMenu = false
							ESX.UI.Menu.CloseAll()

							DeleteSpawnedVehicles()
							FreezeEntityPosition(playerPed, false)
							SetEntityVisible(playerPed, true)

							ESX.Game.Teleport(playerPed, restoreCoords)
						else
							ESX.ShowNotification(_U('vehicleshop_money'))
							menu2.close()
						end
					end, props, data.current.type)
				else
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)

	end, function(data, menu)
		isInShopMenu = false
		ESX.UI.Menu.CloseAll()

		DeleteSpawnedVehicles()
		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)

		ESX.Game.Teleport(playerPed, restoreCoords)
	end, function(data, menu)
		DeleteSpawnedVehicles()

		WaitForVehicleToLoad(data.current.model)
		ESX.Game.SpawnLocalVehicle(data.current.model, shopCoords, 0.0, function(vehicle)
			table.insert(spawnedVehicles, vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
		end)
	end)

	WaitForVehicleToLoad(elements[1].model)
	ESX.Game.SpawnLocalVehicle(elements[1].model, shopCoords, 0.0, function(vehicle)
		table.insert(spawnedVehicles, vehicle)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		FreezeEntityPosition(vehicle, true)
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isInShopMenu then
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)

function DeleteSpawnedVehicles()
	while #spawnedVehicles > 0 do
		local vehicle = spawnedVehicles[1]
		ESX.Game.DeleteVehicle(vehicle)
		table.remove(spawnedVehicles, 1)
	end
end

function WaitForVehicleToLoad(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)

			DisableControlAction(0, Keys['TOP'], true)
			DisableControlAction(0, Keys['DOWN'], true)
			DisableControlAction(0, Keys['LEFT'], true)
			DisableControlAction(0, Keys['RIGHT'], true)
			DisableControlAction(0, 176, true) -- ENTER key
			DisableControlAction(0, Keys['BACKSPACE'], true)

			drawLoadingText(_U('vehicleshop_awaiting_model'), 255, 255, 255, 255)
		end
	end
end

function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy',
					 {
						 title    = _U('pharmacy_menu_title'),
						 align    = 'top-right',
						 elements = {
							 { label = _U('pharmacy_take', _U('medikit')), value = 'medikit' },
							 { label = _U('pharmacy_take', _U('bandage')), value = 'bandage' },
							 { label = _U('pharmacy_take', _U('gauze')), value = 'gauze' },
							 { label = _U('pharmacy_take', _U('medkit')), value = 'medkit' },
							 { label = _U('pharmacy_take', _U('first_aid')), value = 'firstaid' },
							 { label = _U('pharmacy_take', _U('morphine')), value = 'morphine' },
							 { label = _U('pharmacy_take', _U('vicodin')), value = 'vicodin' },
							 { label = _U('pharmacy_take', _U('hydrocodone')), value = 'hydrocodone' },
							 { label = _U('pharmacy_take', 'Tylenol'), value = 'tylenol' },
							 { label = _U('pharmacy_take', 'Body Armor'), value = 'bodyarmor_3' },
							 { label = _U('pharmacy_take', 'Scuba Gear'), value = 'scuba' },
						 }
					 }, function(data, menu)
			TriggerServerEvent('esx_ambulancejob:giveItem', data.current.value)
		end, function(data, menu)
			menu.close()
		end)
end

function WarpPedInClosestVehicle(ped)
	local coords            = GetEntityCoords(ped)

	local vehicle, distance = ESX.Game.GetClosestVehicle(coords)

	if distance ~= -1 and distance <= 5.0 then
		local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

		for i = maxSeats - 1, 0, -1 do
			if IsVehicleSeatFree(vehicle, i) then
				freeSeat = i
				break
			end
		end

		if freeSeat then
			TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
		end
	else
		ESX.ShowNotification(_U('no_vehicles'))
	end
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health    = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	ESX.ShowNotification(_U('healed'))
end)

function cleanPlayer(playerPed)
	--	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		else
			if Config.Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
end

RegisterNetEvent('esx_ambulancejob:updateBlip')
AddEventHandler('esx_ambulancejob:updateBlip', function()

	-- Refresh all blips
	for k, existingBlip in pairs(blipsAmbulance) do
		RemoveBlip(existingBlip)
	end

	-- Clean the blip table
	blipsAmbulance = {}

	-- Enable blip?
	if Config.MaxInService ~= -1 and not playerInService then
		return
	end

	if not Config.EnableJobBlip then
		return
	end

	-- Is the player a cop? In that case show all the blips for other cops
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i = 1, #players, 1 do
				if players[i].job.name == 'ambulance' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlip(id)
					end
				end
			end
		end)
	end

end)
