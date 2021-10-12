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

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions',
					 {
						 title    = _U('ambulance'),
						 align    = 'top-right',
						 elements = menuElements
					 }, function(data, menu)

				

			if data.current.value == 'citizen_interaction' then
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
		if part == 'Pharmacy' then
			CurrentAction     = part
			CurrentActionMsg  = _U('open_pharmacy')
			CurrentActionData = {}
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

				if CurrentAction == 'Pharmacy' then
					OpenPharmacyMenu()
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
							 { label = _U('pharmacy_take', 'Wheelchair'), value = 'wheelchair' },
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
