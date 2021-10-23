RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = ESX.Game.GetClosestVehicle()
		print(vehicle)

		if DoesEntityExist(vehicle) then
			print('here')
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i = maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			print(freeSeat)

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
			end
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:OutVehicle')
AddEventHandler('esx_ambulancejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		print('not in a vehicle')
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

RegisterNetEvent('esx_ambulancejob:healLimbs')
AddEventHandler('esx_ambulancejob:healLimbs', function(closestPlayer)
	exports['mythic_progbar']:Progress({
										   name            = "firstaid_action",
										   duration        = 5000,
										   label           = "Using Medkit",
										   useWhileDead    = false,
										   canCancel       = true,
										   controlDisables = {
											   disableMovement    = false,
											   disableCarMovement = false,
											   disableMouse       = false,
											   disableCombat      = true,
										   },
										   animation       = {
											   animDict = "missheistdockssetup1clipboard@idle_a",
											   anim     = "idle_a",
											   flags    = 49,
										   },
										   prop            = {
											   model = "prop_ld_health_pack"
										   },
									   }, function(status)
		if not status then
			TriggerServerEvent('mythic_hospital:server:ResetLimbs',
							   GetPlayerServerId(closestPlayer))
			TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'Field treated limb injuries on ' .. GetPlayerName(closestPlayer) })
		end
	end)
end)

RegisterNetEvent('esx_ambulancejob:healBleed')
AddEventHandler('esx_ambulancejob:healBleed', function(closestPlayer)
	exports['mythic_progbar']:Progress({
										   name            = "firstaid_action",
										   duration        = 1500,
										   label           = "Packing Wounds",
										   useWhileDead    = false,
										   canCancel       = true,
										   controlDisables = {
											   disableMovement    = false,
											   disableCarMovement = false,
											   disableMouse       = false,
											   disableCombat      = true,
										   },
										   animation       = {
											   animDict = "missheistdockssetup1clipboard@idle_a",
											   anim     = "idle_a",
											   flags    = 49,
										   },
										   prop            = {
											   model = "prop_paper_bag_small",
										   }
									   }, function(status)
		if not status then
			TriggerServerEvent('mythic_hospital:server:RemoveBleed',
							   GetPlayerServerId(closestPlayer))
			TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'Field treated bleeding on ' .. GetPlayerName(closestPlayer) })
		end
	end)
end)

RegisterNetEvent('esx_ambulancejob:healRevive')
AddEventHandler('esx_ambulancejob:healRevive', function(closestPlayer)
	local closestPlayerPed = GetPlayerPed(closestPlayer)
	local playerPed = PlayerPedId()

	TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'Reviving ' .. GetPlayerName(closestPlayer) .. '...' })

	local playerPed = PlayerPedId()
	
	TriggerEvent('emote:do', 'medic')
	Citizen.Wait(10000)
	TriggerEvent('emote:cancel', true)
	TriggerServerEvent('esx_ambulancejob:revive',
					   GetPlayerServerId(closestPlayer))
	IsBusy = false
end)

RegisterNetEvent('esx_ambulancejob:healBig')
AddEventHandler('esx_ambulancejob:healBig', function(closestPlayer)
	local closestPlayerPed = GetPlayerPed(closestPlayer)
	local health           = GetEntityHealth(closestPlayerPed)

	if health > 0 then
		local playerPed = PlayerPedId()

		IsBusy          = true
		ESX.ShowNotification(_U('heal_inprogress'))
		exports['mythic_progbar']:Progress({
											   name            = "firstaid_action",
											   duration        = 5000,
											   label           = "Performing Field Treatment",
											   useWhileDead    = false,
											   canCancel       = true,
											   controlDisables = {
												   disableMovement    = false,
												   disableCarMovement = false,
												   disableMouse       = false,
												   disableCombat      = true,
											   },
											   animation       = {
												   animDict = "missheistdockssetup1clipboard@idle_a",
												   anim     = "idle_a",
												   flags    = 49,
											   },
											   prop            = {
												   model = "prop_stat_pack_01"
											   },
										   }, function(status)
			if not status then
				TriggerServerEvent('esx_ambulancejob:heal',
								   GetPlayerServerId(closestPlayer), 'big')
				TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'Treated ' .. GetPlayerName(closestPlayer) .. '...' })
			end
		end)
		IsBusy = false
	else
		TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('player_not_conscious') })
	end
end)
