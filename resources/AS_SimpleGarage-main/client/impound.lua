impounding = false

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.Impound.RetrieveLocation.x, Config.Impound.RetrieveLocation.y, Config.Impound.RetrieveLocation.z)
	SetBlipScale(blip, 1.0)
	SetBlipDisplay(blip, 4)
	SetBlipSprite(blip, 68)
	SetBlipColour(blip, 76)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Impound")
	EndTextCommandSetBlipName(blip)

	local blip2 = AddBlipForCoord(Config.Impound.RetrieveLocation2.x, Config.Impound.RetrieveLocation2.y, Config.Impound.RetrieveLocation2.z)
	SetBlipScale(blip2, 1.0)
	SetBlipDisplay(blip2, 4)
	SetBlipSprite(blip2, 68)
	SetBlipColour(blip2, 76)
	SetBlipAsShortRange(blip2, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Impound")
	EndTextCommandSetBlipName(blip2)

	local blip3 = AddBlipForCoord(Config.Impound.RetrieveLocation3.x, Config.Impound.RetrieveLocation3.y, Config.Impound.RetrieveLocation3.z)
	SetBlipScale(blip3, 1.0)
	SetBlipDisplay(blip3, 4)
	SetBlipSprite(blip3, 68)
	SetBlipColour(blip3, 76)
	SetBlipAsShortRange(blip3, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Impound")
	EndTextCommandSetBlipName(blip3)


	while true do
		Citizen.Wait(5)
		local pedcoords = GetEntityCoords(GetPlayerPed(-1))
		if(GetDistanceBetweenCoords(pedcoords, Config.Impound.RetrieveLocation.x, Config.Impound.RetrieveLocation.y, Config.Impound.RetrieveLocation.z, true) < 7.0) then
			DrawMarker(23, Config.Impound.RetrieveLocation.x, Config.Impound.RetrieveLocation.y, Config.Impound.RetrieveLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, false, false, false)
			Draw3DText(Config.Impound.RetrieveLocation.x, Config.Impound.RetrieveLocation.y, Config.Impound.RetrieveLocation.z -1.000, "Press E for your impounded vehicles", 4, 0.1, 0.1)
			-- if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
			-- 	DrawMarker(23, Config.Impound.StoreLocation.x, Config.Impound.StoreLocation.y, Config.Impound.StoreLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, true, false, false, false)
			-- 	Draw3DText(Config.Impound.StoreLocation.x, Config.Impound.StoreLocation.y, Config.Impound.StoreLocation.z -1.000, "Press E to impound the vehicle", 4, 0.1, 0.1)
			-- 	if(GetDistanceBetweenCoords(pedcoords, Config.Impound.StoreLocation.x, Config.Impound.StoreLocation.y, Config.Impound.StoreLocation.z, true) < 7.0) then
			-- 		if IsControlJustPressed(0, 38) then
			-- 			ImpoundVoertuig()
			-- 		end
			-- 	end
			-- end	
			if(GetDistanceBetweenCoords(pedcoords, Config.Impound.RetrieveLocation.x, Config.Impound.RetrieveLocation.y, Config.Impound.RetrieveLocation.z, true) < 2.0) then
				if IsControlJustPressed(0, 38) then				
					ImpoundedVoertuigenMenu()
				end
			end
			if IsControlJustPressed(1, 177) and not Menu.hidden then
				CloseMenu()
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			end
		end

		if(GetDistanceBetweenCoords(pedcoords, Config.Impound.StoreLocation.x, Config.Impound.StoreLocation.y,Config.Impound.StoreLocation.z, true) < 10.00) then
			if  ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
				DrawMarker(23, Config.Impound.StoreLocation.x, Config.Impound.StoreLocation.y, Config.Impound.StoreLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, true, false, false, false)
				Draw3DText(Config.Impound.StoreLocation.x, Config.Impound.StoreLocation.y, Config.Impound.StoreLocation.z -1.000, "Press E to impound the vehicle", 4, 0.1, 0.1)
				if(GetDistanceBetweenCoords(pedcoords, Config.Impound.StoreLocation.x, Config.Impound.StoreLocation.y, Config.Impound.StoreLocation.z, true) < 7.0) then
					if IsControlJustPressed(0, 38) then
						ImpoundVoertuig()
					end
				end
			end	
		end

		if(GetDistanceBetweenCoords(pedcoords, Config.Impound.RetrieveLocation2.x, Config.Impound.RetrieveLocation2.y, Config.Impound.RetrieveLocation2.z, true) < 18.0) then
			DrawMarker(23, Config.Impound.RetrieveLocation2.x, Config.Impound.RetrieveLocation2.y, Config.Impound.RetrieveLocation2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, false, false, false)
			Draw3DText(Config.Impound.RetrieveLocation2.x, Config.Impound.RetrieveLocation2.y, Config.Impound.RetrieveLocation2.z -1.000, "Press E for your impounded vehicles", 4, 0.1, 0.1)
			if  ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
				DrawMarker(23, Config.Impound.StoreLocation2.x, Config.Impound.StoreLocation2.y, Config.Impound.StoreLocation2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, true, false, false, false)
				Draw3DText(Config.Impound.StoreLocation2.x, Config.Impound.StoreLocation2.y, Config.Impound.StoreLocation2.z -1.000, "Press E to impound the vehicle", 4, 0.1, 0.1)
				if(GetDistanceBetweenCoords(pedcoords, Config.Impound.StoreLocation2.x, Config.Impound.StoreLocation2.y, Config.Impound.StoreLocation2.z, true) < 7.0) then
					if IsControlJustPressed(0, 38) then
						Impound2Voertuig()
					end
				end
			end	
			if(GetDistanceBetweenCoords(pedcoords, Config.Impound.RetrieveLocation2.x, Config.Impound.RetrieveLocation2.y, Config.Impound.RetrieveLocation2.z, true) < 2.0) then
				if IsControlJustPressed(0, 38) then				
					Impounded2VoertuigenMenu()
				end
			end
			if IsControlJustPressed(1, 177) and not Menu.hidden then
				CloseMenu()
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			end
		end
		if(GetDistanceBetweenCoords(pedcoords, Config.Impound.RetrieveLocation3.x, Config.Impound.RetrieveLocation3.y, Config.Impound.RetrieveLocation3.z, true) < 7.0) then
			DrawMarker(23, Config.Impound.RetrieveLocation3.x, Config.Impound.RetrieveLocation3.y, Config.Impound.RetrieveLocation3.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, false, false, false)
			Draw3DText(Config.Impound.RetrieveLocation3.x, Config.Impound.RetrieveLocation3.y, Config.Impound.RetrieveLocation3.z -1.000, "Press E for your impounded vehicles", 4, 0.1, 0.1)
			-- if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
			-- 	DrawMarker(23, Config.Impound.StoreLocation3.x, Config.Impound.StoreLocation3.y, Config.Impound.StoreLocation3.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, true, false, false, false)
			-- 	Draw3DText(Config.Impound.StoreLocation3.x, Config.Impound.StoreLocation3.y, Config.Impound.StoreLocation3.z -1.000, "Press E to impound the vehicle", 4, 0.1, 0.1)
			-- 	if(GetDistanceBetweenCoords(pedcoords, Config.Impound.StoreLocation3.x, Config.Impound.StoreLocation3.y, Config.Impound.StoreLocation3.z, true) < 7.0) then
			-- 		if IsControlJustPressed(0, 38) then
			-- 			Impound3Voertuig()
			-- 		end
			-- 	end
			-- end	
			if(GetDistanceBetweenCoords(pedcoords, Config.Impound.RetrieveLocation3.x, Config.Impound.RetrieveLocation3.y, Config.Impound.RetrieveLocation3.z, true) < 2.0) then
				if IsControlJustPressed(0, 38) then				
					Impounded3VoertuigenMenu()
				end
			end
			if IsControlJustPressed(1, 177) and not Menu.hidden then
				CloseMenu()
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			end
		end

		if(GetDistanceBetweenCoords(pedcoords, Config.Impound.StoreLocation3.x, Config.Impound.StoreLocation3.y,Config.Impound.StoreLocation3.z, true) < 7.00) then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
				DrawMarker(23, Config.Impound.StoreLocation3.x, Config.Impound.StoreLocation3.y, Config.Impound.StoreLocation3.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, true, false, false, false)
				Draw3DText(Config.Impound.StoreLocation3.x, Config.Impound.StoreLocation3.y, Config.Impound.StoreLocation3.z -1.000, "Press E to impound the vehicle", 4, 0.1, 0.1)
				if(GetDistanceBetweenCoords(pedcoords, Config.Impound.StoreLocation3.x, Config.Impound.StoreLocation3.y, Config.Impound.StoreLocation3.z, true) < 7.0) then
					if IsControlJustPressed(0, 38) then
						Impound3Voertuig()
					end
				end
			end	
		end


		if(GetDistanceBetweenCoords(pedcoords, Config.PlaneImpound.RetrieveLocation1.x, Config.PlaneImpound.RetrieveLocation1.y, Config.PlaneImpound.RetrieveLocation1.z, true) < 7.0) then
			DrawMarker(23, Config.PlaneImpound.RetrieveLocation1.x, Config.PlaneImpound.RetrieveLocation1.y, Config.PlaneImpound.RetrieveLocation1.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, false, false, false)
			Draw3DText(Config.PlaneImpound.RetrieveLocation1.x, Config.PlaneImpound.RetrieveLocation1.y, Config.PlaneImpound.RetrieveLocation1.z -1.000, "Press E for your impounded vehicles", 4, 0.1, 0.1)
				
			if(GetDistanceBetweenCoords(pedcoords, Config.PlaneImpound.RetrieveLocation1.x, Config.PlaneImpound.RetrieveLocation1.y, Config.PlaneImpound.RetrieveLocation1.z, true) < 2.0) then
				if IsControlJustPressed(0, 38) then				
					Impounded4VoertuigenMenu()
				end
			end
			if IsControlJustPressed(1, 177) and not Menu.hidden then
				CloseMenu()
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			end
		end

		if(GetDistanceBetweenCoords(pedcoords, Config.PlaneImpound.RetrieveLocation2.x, Config.PlaneImpound.RetrieveLocation2.y, Config.PlaneImpound.RetrieveLocation2.z, true) < 7.0) then
			DrawMarker(23, Config.PlaneImpound.RetrieveLocation2.x, Config.PlaneImpound.RetrieveLocation2.y, Config.PlaneImpound.RetrieveLocation2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, false, false, false)
			Draw3DText(Config.PlaneImpound.RetrieveLocation2.x, Config.PlaneImpound.RetrieveLocation2.y, Config.PlaneImpound.RetrieveLocation2.z -1.000, "Press E for your impounded vehicles", 4, 0.1, 0.1)
			
			if(GetDistanceBetweenCoords(pedcoords, Config.PlaneImpound.RetrieveLocation2.x, Config.PlaneImpound.RetrieveLocation2.y, Config.PlaneImpound.RetrieveLocation2.z, true) < 2.0) then
				if IsControlJustPressed(0, 38) then				
					Impounded5VoertuigenMenu()
				end
			end
			if IsControlJustPressed(1, 177) and not Menu.hidden then
				CloseMenu()
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			end
		end

		if(GetDistanceBetweenCoords(pedcoords, Config.BoatImpound.RetrieveLocation1.x, Config.BoatImpound.RetrieveLocation1.y, Config.BoatImpound.RetrieveLocation1.z, true) < 7.0) then
			DrawMarker(23, Config.BoatImpound.RetrieveLocation1.x, Config.BoatImpound.RetrieveLocation1.y, Config.BoatImpound.RetrieveLocation1.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, false, false, false)
			Draw3DText(Config.BoatImpound.RetrieveLocation1.x, Config.BoatImpound.RetrieveLocation1.y, Config.BoatImpound.RetrieveLocation1.z -1.000, "Press E for your impounded vehicles", 4, 0.1, 0.1)
			
			if(GetDistanceBetweenCoords(pedcoords, Config.BoatImpound.RetrieveLocation1.x, Config.BoatImpound.RetrieveLocation1.y, Config.BoatImpound.RetrieveLocation1.z, true) < 2.0) then
				if IsControlJustPressed(0, 38) then				
					Impounded6VoertuigenMenu()
				end
			end
			if IsControlJustPressed(1, 177) and not Menu.hidden then
				CloseMenu()
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			end
		end

		if(GetDistanceBetweenCoords(pedcoords, Config.BoatImpound.RetrieveLocation2.x, Config.BoatImpound.RetrieveLocation2.y, Config.BoatImpound.RetrieveLocation2.z, true) < 7.0) then
			DrawMarker(23, Config.BoatImpound.RetrieveLocation2.x, Config.BoatImpound.RetrieveLocation2.y, Config.BoatImpound.RetrieveLocation2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, false, false, false)
			Draw3DText(Config.BoatImpound.RetrieveLocation2.x, Config.BoatImpound.RetrieveLocation2.y, Config.BoatImpound.RetrieveLocation2.z -1.000, "Press E for your impounded vehicles", 4, 0.1, 0.1)
			
			if(GetDistanceBetweenCoords(pedcoords, Config.BoatImpound.RetrieveLocation2.x, Config.BoatImpound.RetrieveLocation2.y, Config.BoatImpound.RetrieveLocation2.z, true) < 2.0) then
				if IsControlJustPressed(0, 38) then				
					Impounded7VoertuigenMenu()
				end
			end
			if IsControlJustPressed(1, 177) and not Menu.hidden then
				CloseMenu()
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			end
		end

		if(GetDistanceBetweenCoords(pedcoords, Config.BoatImpound.RetrieveLocation3.x, Config.BoatImpound.RetrieveLocation3.y, Config.BoatImpound.RetrieveLocation3.z, true) < 7.0) then
			DrawMarker(23, Config.BoatImpound.RetrieveLocation3.x, Config.BoatImpound.RetrieveLocation3.y, Config.BoatImpound.RetrieveLocation3.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.ColorR, Config.ColorG, Config.ColorB, 255, false, true, 2, false, false, false)
			Draw3DText(Config.BoatImpound.RetrieveLocation3.x, Config.BoatImpound.RetrieveLocation3.y, Config.BoatImpound.RetrieveLocation3.z -1.000, "Press E for your impounded vehicles", 4, 0.1, 0.1)
			
			if(GetDistanceBetweenCoords(pedcoords, Config.BoatImpound.RetrieveLocation3.x, Config.BoatImpound.RetrieveLocation3.y, Config.BoatImpound.RetrieveLocation3.z, true) < 2.0) then
				if IsControlJustPressed(0, 38) then				
					Impounded8VoertuigenMenu()
				end
			end
			if IsControlJustPressed(1, 177) and not Menu.hidden then
				CloseMenu()
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			end
		end




	end
	Menu.renderGUI()
	Citizen.Wait(100)
end)

function ImpoundVoertuig()
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local vehicle = GetClosestVehicle(Config.Impound.StoreLocation.x, Config.Impound.StoreLocation.y, Config.Impound.StoreLocation.z,  7.0,  0,  71)
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		exports['mythic_notify']:SendAlert('inform', 'Get out of the vehicle')
	else
		if DoesEntityExist(vehicle) then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				exports['mythic_notify']:SendAlert('inform', 'Get out of the vehicle')
			else
				local vehicleProps = GetVehicleProperties(vehicle)
				local plate = vehicleProps.plate
				ESX.TriggerServerCallback('AS_SimpleGarage:isOwned', function(isPlateTaken)
					SetVehicleUndriveable(frontVehicle, false)
					if not isPlateTaken and not impounding then
						impounding = true
						StartImpoundAnimatie()
						Citizen.Wait(9400)
						Citizen.Wait(500)
						NetworkFadeOutEntity(vehicle, true, true)	
						Citizen.Wait(100)	
						TriggerServerEvent('AS_SimpleGarage:GiveMoney')
						ESX.Game.DeleteVehicle(vehicle)
						exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded')
						impounding = false
					elseif isPlateTaken == true and impounding == false then -- Vehicle has owner
						--KeyboardInput("Enter the fine amount between $ 250 and $ 2500", "", 4)
						local price = 100--tonumber(GetOnscreenKeyboardResult())
						if price ~= nil then
							--if price < 2501 and price > 249 then
								TriggerServerEvent('esx_vehiclelock:toggleLock', GetVehicleNumberPlateText(vehicle), 1)
								StartImpoundAnimatie()
								Citizen.Wait(9400)
								Citizen.Wait(500)
								SetVehicleFixed(vehicle)
        						SetVehicleDeformationFixed(vehicle)
								SetVehicleUndriveable(vehicle, false)
								vehicleProps = GetVehicleProperties(vehicle)
								NetworkFadeOutEntity(vehicle, true, true)
								TriggerServerEvent('AS_SimpleGarage:GiveMoney')
								TriggerServerEvent('AS_SimpleGarage:ImpoundVoertuig', plate, vehicleProps, price)
								Citizen.Wait(100)	
								ESX.Game.DeleteVehicle(vehicle)
								impounding = false
								exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded with a fine of: $'..price)
							--else
								--exports['mythic_notify']:SendAlert('inform', 'Fine amount is incorrect, please try again')
							--end
						else
							exports['mythic_notify']:SendAlert('inform', 'Fine amount not entered')
						end
					end
				end, plate)
			end
		else
			exports['mythic_notify']:SendAlert('inform', 'No vehicle found')
		end
	end
end

RegisterNetEvent('AS_SimpleGarage-main:ImpoundPolice')
AddEventHandler('AS_SimpleGarage-main:ImpoundPolice', function(vehicle)
    
	local vehicleProps = GetVehicleProperties(vehicle)
	local plate = vehicleProps.plate
	local price = 100
	ESX.TriggerServerCallback('AS_SimpleGarage:isOwned', function(isPlateTaken)
		SetVehicleUndriveable(vehicle, false)
		if isPlateTaken == false then
			StartImpoundAnimatie()
			Citizen.Wait(9400)
			Citizen.Wait(500)
			NetworkFadeOutEntity(vehicle, true, true)	
			Citizen.Wait(100)	
			ESX.Game.DeleteVehicle(vehicle)
			exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded')
		elseif isPlateTaken == true then -- Vehicle has owner
			--KeyboardInput("Enter the fine amount between $ 250 and $ 2500", "", 4)
			local price = 100--tonumber(GetOnscreenKeyboardResult())
			if price ~= nil then
				--if price < 2501 and price > 249 then
					TriggerServerEvent('esx_vehiclelock:toggleLock', GetVehicleNumberPlateText(vehicle), 1)
					StartImpoundAnimatie()
					Citizen.Wait(9400)
					Citizen.Wait(500)
					SetVehicleFixed(vehicle)
					SetVehicleDeformationFixed(vehicle)
					SetVehicleUndriveable(vehicle, false)
					vehicleProps = GetVehicleProperties(vehicle)
					NetworkFadeOutEntity(vehicle, true, true)
					TriggerServerEvent('AS_SimpleGarage:ImpoundVoertuig', plate, vehicleProps, price)
					Citizen.Wait(100)	
					ESX.Game.DeleteVehicle(vehicle)
					exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded with a fine of: $'..price)
				--else
					--exports['mythic_notify']:SendAlert('inform', 'Fine amount is incorrect, please try again')
				--end
			else
				exports['mythic_notify']:SendAlert('inform', 'Fine amount not entered')
			end
		end
	end, plate)
	-- StartImpoundAnimatie()
	-- Citizen.Wait(9400)
	-- Citizen.Wait(500)	
	-- NetworkFadeOutEntity(vehicle, true, true)
	-- TriggerServerEvent('AS_SimpleGarage:ImpoundVoertuig', plate, vehicleProps, price)
	-- Citizen.Wait(100)	
	-- ESX.Game.DeleteVehicle(vehicle)
	-- exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded with a fine of: $'..price)
end)


function Impound2Voertuig()
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local vehicle = GetClosestVehicle(Config.Impound.StoreLocation2.x, Config.Impound.StoreLocation2.y, Config.Impound.StoreLocation2.z,  7.0,  0,  71)
	if DoesEntityExist(vehicle) then
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			exports['mythic_notify']:SendAlert('inform', 'Get out of the vehicle')
		else
			local vehicleProps = GetVehicleProperties(vehicle)
			local plate = vehicleProps.plate
			ESX.TriggerServerCallback('AS_SimpleGarage:isOwned', function(isPlateTaken)
				if not isPlateTaken and not impounding then
					impounding = true
					StartImpoundAnimatie()
					Citizen.Wait(9400)
					Citizen.Wait(500)
					NetworkFadeOutEntity(vehicle, true, true)	
					Citizen.Wait(100)	
					TriggerServerEvent('AS_SimpleGarage:GiveMoney')
					ESX.Game.DeleteVehicle(vehicle)
					exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded')
					impounding = false
				elseif isPlateTaken and not impounding then -- Vehicle has owner
					--KeyboardInput("Enter the fine amount between $ 250 and $ 2500", "", 4)
					local price = 100--tonumber(GetOnscreenKeyboardResult())
					if price ~= nil then
						--if price < 2501 and price > 249 then
							TriggerServerEvent('esx_vehiclelock:toggleLock', GetVehicleNumberPlateText(vehicle), 1)
							StartImpoundAnimatie()
							Citizen.Wait(9400)
							Citizen.Wait(500)
							SetVehicleFixed(vehicle)
							SetVehicleDeformationFixed(vehicle)
							SetVehicleUndriveable(vehicle, false)
							vehicleProps = GetVehicleProperties(vehicle)
							NetworkFadeOutEntity(vehicle, true, true)
							TriggerServerEvent('AS_SimpleGarage:GiveMoney')
							TriggerServerEvent('AS_SimpleGarage:ImpoundVoertuig', plate, vehicleProps, price)
							Citizen.Wait(100)	
							ESX.Game.DeleteVehicle(vehicle)
							impounding = false
							exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded with a fine of: $'..price)
						--else
							--exports['mythic_notify']:SendAlert('inform', 'Fine amount is incorrect, please try again')
						--end
					else
						exports['mythic_notify']:SendAlert('inform', 'Fine amount not entered')
					end
				end
			end, plate)
		end
	else
		exports['mythic_notify']:SendAlert('inform', 'No vehicle found')
	end
end

function Impound3Voertuig()
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local vehicle = GetClosestVehicle(Config.Impound.StoreLocation3.x, Config.Impound.StoreLocation3.y, Config.Impound.StoreLocation3.z,  7.0,  0,  71)
	if DoesEntityExist(vehicle) then
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			exports['mythic_notify']:SendAlert('inform', 'Get out of the vehicle')
		else
			local vehicleProps = GetVehicleProperties(vehicle)
			local plate = vehicleProps.plate
			ESX.TriggerServerCallback('AS_SimpleGarage:isOwned', function(isPlateTaken)
				if not isPlateTaken and not impounding then
					impounding = true
					StartImpoundAnimatie()
					Citizen.Wait(9400)
					Citizen.Wait(500)
					NetworkFadeOutEntity(vehicle, true, true)	
					Citizen.Wait(100)	
					TriggerServerEvent('AS_SimpleGarage:GiveMoney')
					ESX.Game.DeleteVehicle(vehicle)
					exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded')
					impounding = false
				elseif isPlateTaken and not impounding then -- Vehicle has owner
					--KeyboardInput("Enter the fine amount between $ 250 and $ 2500", "", 4)
					local price = 100--tonumber(GetOnscreenKeyboardResult())
					if price ~= nil then
						--if price < 2501 and price > 249 then
							TriggerServerEvent('esx_vehiclelock:toggleLock', GetVehicleNumberPlateText(vehicle), 1)
							StartImpoundAnimatie()
							Citizen.Wait(9400)
							Citizen.Wait(500)
							SetVehicleFixed(vehicle)
							SetVehicleDeformationFixed(vehicle)
							SetVehicleUndriveable(vehicle, false)
							vehicleProps = GetVehicleProperties(vehicle)
							NetworkFadeOutEntity(vehicle, true, true)
							TriggerServerEvent('AS_SimpleGarage:GiveMoney')
							TriggerServerEvent('AS_SimpleGarage:ImpoundVoertuig', plate, vehicleProps, price)
							Citizen.Wait(100)	
							ESX.Game.DeleteVehicle(vehicle)
							impounding = false
							exports['mythic_notify']:SendAlert('inform', 'Vehicle impounded with a fine of: $'..price)
						--else
							--exports['mythic_notify']:SendAlert('inform', 'Fine amount is incorrect, please try again')
						--end
					else
						exports['mythic_notify']:SendAlert('inform', 'Fine amount not entered')
					end
				end
			end, plate)
		end
	else
		exports['mythic_notify']:SendAlert('inform', 'No vehicle found')
	end
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	-- TextEntry		-->	The Text above the typing field in the black square
	-- ExampleText		-->	An Example Text, what it should say in the typing field
	-- MaxStringLenght	-->	Maximum String Lenght

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	blockinput = true --Blocks new input while typing if **blockinput** is used

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	-- TextEntry		-->	The Text above the typing field in the black square
	-- ExampleText		-->	An Example Text, what it should say in the typing field
	-- MaxStringLenght	-->	Maximum String Lenght

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	blockinput = true --Blocks new input while typing if **blockinput** is used

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

function StartImpoundAnimatie()
	TriggerEvent("mythic_progbar:client:progress", {
        name = "ImpoundVoertuig",
        duration = 10000,
        label = "Impound vehicle...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
        },
        prop = {
			model = "p_amb_clipboard_01",
			bone = 18905,
			coords = { x = 0.10, y = 0.02, z = 0.08 },
			rotation = { x = -80.0, y = 0.0, z = 0.0 },
		},
		propTwo = {
			model = "prop_pencil_01",
			bone = 58866,
			coords = { x = 0.12, y = 0.0, z = 0.001 },
			rotation = { x = -150.0, y = 0.0, z = 0.0 },
		},
    }, function(status)
		if not status then
			local ped = GetPlayerPed(-1)
			ClearPedTasksImmediately(ped)
        end
    end)
end

function ImpoundedVoertuigenMenu()
	Menu.hidden = not Menu.hidden
	TriggerEvent("inmenu",true)
	ClearMenu()
	Citizen.Wait(5)
	MenuTitle = "Impound"
	Menu.addButton("VEHICLES IMPOUNDED","CloseMenu",nil)

	ESX.TriggerServerCallback("AS_SimpleGarage:checkImpounded", function(fetchedVehicles)
		for k, v in ipairs(fetchedVehicles) do
			if v then
				local vehicleProps = v["props"]
				local displaytext = GetDisplayNameFromVehicleModel(vehicleProps["model"])
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
				local vehicle = vehicleProps
				local impoundprice = v["impoundprice"]
				Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnImpoundedVehicle", v, "", " Outstanding debt: $" ..impoundprice.. "", "",nil)
			end
		end
	end, "car")
end

function Impounded2VoertuigenMenu()
	Menu.hidden = not Menu.hidden
	TriggerEvent("inmenu",true)
	ClearMenu()
	Citizen.Wait(5)
	MenuTitle = "Impound"
	Menu.addButton("VEHICLES IMPOUNDED","CloseMenu",nil)

	ESX.TriggerServerCallback("AS_SimpleGarage:checkImpounded", function(fetchedVehicles)
		for k, v in ipairs(fetchedVehicles) do
			if v then
				local vehicleProps = v["props"]
				local displaytext = GetDisplayNameFromVehicleModel(vehicleProps["model"])
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
				local vehicle = vehicleProps
				local impoundprice = v["impoundprice"]
				Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnImpoundedVehicle2", v, "", " Outstanding debt: $" ..impoundprice.. "", "",nil)
			end
		end
	end, "car")
end

function Impounded3VoertuigenMenu()
	Menu.hidden = not Menu.hidden
	TriggerEvent("inmenu",true)
	ClearMenu()
	Citizen.Wait(5)
	MenuTitle = "Impound"
	Menu.addButton("VEHICLES IMPOUNDED","CloseMenu",nil)

	ESX.TriggerServerCallback("AS_SimpleGarage:checkImpounded", function(fetchedVehicles)
		for k, v in ipairs(fetchedVehicles) do
			if v then
				local vehicleProps = v["props"]
				local displaytext = GetDisplayNameFromVehicleModel(vehicleProps["model"])
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
				local vehicle = vehicleProps
				local impoundprice = v["impoundprice"]
				Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnImpoundedVehicle3", v, "", " Outstanding debt: $" ..impoundprice.. "", "",nil)
			end
		end
	end, "car")
end

function Impounded4VoertuigenMenu()
	Menu.hidden = not Menu.hidden
	TriggerEvent("inmenu",true)
	ClearMenu()
	Citizen.Wait(5)
	MenuTitle = "Impound"
	Menu.addButton("VEHICLES IMPOUNDED","CloseMenu",nil)

	ESX.TriggerServerCallback("AS_SimpleGarage:checkImpounded", function(fetchedVehicles)
		for k, v in ipairs(fetchedVehicles) do
			if v then
				local vehicleProps = v["props"]
				local displaytext = GetDisplayNameFromVehicleModel(vehicleProps["model"])
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
				local vehicle = vehicleProps
				local impoundprice = v["impoundprice"]
				Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnImpoundedVehicle4", v, "", " Outstanding debt: $" ..impoundprice.. "", "",nil)
			end
		end
	end, "aircraft")
end

function Impounded5VoertuigenMenu()
	Menu.hidden = not Menu.hidden
	TriggerEvent("inmenu",true)
	ClearMenu()
	Citizen.Wait(5)
	MenuTitle = "Impound"
	Menu.addButton("VEHICLES IMPOUNDED","CloseMenu",nil)

	ESX.TriggerServerCallback("AS_SimpleGarage:checkImpounded", function(fetchedVehicles)
		for k, v in ipairs(fetchedVehicles) do
			if v then
				local vehicleProps = v["props"]
				local displaytext = GetDisplayNameFromVehicleModel(vehicleProps["model"])
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
				local vehicle = vehicleProps
				local impoundprice = v["impoundprice"]
				Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnImpoundedVehicle5", v, "", " Outstanding debt: $" ..impoundprice.. "", "",nil)
			end
		end
	end, "aircraft")
end

function Impounded6VoertuigenMenu()
	Menu.hidden = not Menu.hidden
	TriggerEvent("inmenu",true)
	ClearMenu()
	Citizen.Wait(5)
	MenuTitle = "Impound"
	Menu.addButton("VEHICLES IMPOUNDED","CloseMenu",nil)

	ESX.TriggerServerCallback("AS_SimpleGarage:checkImpounded", function(fetchedVehicles)
		for k, v in ipairs(fetchedVehicles) do
			if v then
				local vehicleProps = v["props"]
				local displaytext = GetDisplayNameFromVehicleModel(vehicleProps["model"])
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
				local vehicle = vehicleProps
				local impoundprice = v["impoundprice"]
				Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnImpoundedVehicle6", v, "", " Outstanding debt: $" ..impoundprice.. "", "",nil)
			end
		end
	end, "boat")
end

function Impounded7VoertuigenMenu()
	Menu.hidden = not Menu.hidden
	TriggerEvent("inmenu",true)
	ClearMenu()
	Citizen.Wait(5)
	MenuTitle = "Impound"
	Menu.addButton("VEHICLES IMPOUNDED","CloseMenu",nil)

	ESX.TriggerServerCallback("AS_SimpleGarage:checkImpounded", function(fetchedVehicles)
		for k, v in ipairs(fetchedVehicles) do
			if v then
				local vehicleProps = v["props"]
				local displaytext = GetDisplayNameFromVehicleModel(vehicleProps["model"])
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
				local vehicle = vehicleProps
				local impoundprice = v["impoundprice"]
				Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnImpoundedVehicle7", v, "", " Outstanding debt: $" ..impoundprice.. "", "",nil)
			end
		end
	end, "boat")
end

function Impounded8VoertuigenMenu()
	Menu.hidden = not Menu.hidden
	TriggerEvent("inmenu",true)
	ClearMenu()
	Citizen.Wait(5)
	MenuTitle = "Impound"
	Menu.addButton("VEHICLES IMPOUNDED","CloseMenu",nil)

	ESX.TriggerServerCallback("AS_SimpleGarage:checkImpounded", function(fetchedVehicles)
		for k, v in ipairs(fetchedVehicles) do
			if v then
				local vehicleProps = v["props"]
				local displaytext = GetDisplayNameFromVehicleModel(vehicleProps["model"])
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
				local vehicle = vehicleProps
				local impoundprice = v["impoundprice"]
				Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnImpoundedVehicle8", v, "", " Outstanding debt: $" ..impoundprice.. "", "",nil)
			end
		end
	end, "boat")
end


function SpawnImpoundedVehicle(v)
	local data = v["props"]
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.Impound.SpawnLocation

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint, 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Something is in the way')
		return
	end
	CloseMenu()
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				exports['mythic_notify']:SendAlert('inform', 'Vehicle is already in the world')
			end
		end
	end
	ESX.TriggerServerCallback('AS_SimpleGarage:checkMoney', function(EnoughMoney)
		if EnoughMoney == true then
			ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, 300.00, function(yourVehicle)
				SetVehicleProperties(yourVehicle, vehicleProps)
				NetworkFadeInEntity(yourVehicle, true, true)
				SetModelAsNoLongerNeeded(vehicleProps["model"])
				TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
				SetEntityAsMissionEntity(yourVehicle, true, true)    
				SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)
				TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
				local plate = vehicleProps.plate
				TriggerServerEvent('AS_SimpleGarage:UitImpound', plate)
				IsVehicleRegistered(plate)
				SetVehicleLockState(plate, yourVehicle)
		
				ClearMenu()
			end)
		elseif EnoughMoney == false then -- Owner has no money
			exports['mythic_notify']:SendAlert('inform', 'There is not enough in your bank account')
		end
	end, v["impoundprice"])
end

function SpawnImpoundedVehicle2(v)
	local data = v["props"]
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.Impound.SpawnLocation2

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint, 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Something is in the way')
		return
	end
	CloseMenu()
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				exports['mythic_notify']:SendAlert('inform', 'Vehicle is already in the world')
			end
		end
	end
	ESX.TriggerServerCallback('AS_SimpleGarage:checkMoney', function(EnoughMoney)
		if EnoughMoney == true then
			ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, 300.00, function(yourVehicle)
				SetVehicleProperties(yourVehicle, vehicleProps)
				NetworkFadeInEntity(yourVehicle, true, true)
				SetModelAsNoLongerNeeded(vehicleProps["model"])
				TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
				SetEntityAsMissionEntity(yourVehicle, true, true)    
				SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)
				TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
				local plate = vehicleProps.plate
				TriggerServerEvent('AS_SimpleGarage:UitImpound', plate)
				IsVehicleRegistered(plate)
				SetVehicleLockState(plate, yourVehicle)
		
				ClearMenu()
			end)
		elseif EnoughMoney == false then -- Owner has no money
			exports['mythic_notify']:SendAlert('inform', 'There is not enough in your bank account')
		end
	end, v["impoundprice"])
end

function SpawnImpoundedVehicle3(v)
	local data = v["props"]
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.Impound.SpawnLocation3

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint, 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Something is in the way')
		return
	end
	CloseMenu()
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				exports['mythic_notify']:SendAlert('inform', 'Vehicle is already in the world')
			end
		end
	end
	ESX.TriggerServerCallback('AS_SimpleGarage:checkMoney', function(EnoughMoney)
		if EnoughMoney == true then
			ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, 300.00, function(yourVehicle)
				SetVehicleProperties(yourVehicle, vehicleProps)
				NetworkFadeInEntity(yourVehicle, true, true)
				SetModelAsNoLongerNeeded(vehicleProps["model"])
				TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
				SetEntityAsMissionEntity(yourVehicle, true, true)    
				SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)
				TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
				local plate = vehicleProps.plate
				TriggerServerEvent('AS_SimpleGarage:UitImpound', plate)
				IsVehicleRegistered(plate)
				SetVehicleLockState(plate, yourVehicle)
		
				ClearMenu()
			end)
		elseif EnoughMoney == false then -- Owner has no money
			exports['mythic_notify']:SendAlert('inform', 'There is not enough in your bank account')
		end
	end, v["impoundprice"])
end

function SpawnImpoundedVehicle4(v)
	local data = v["props"]
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.PlaneImpound.SpawnLocation1

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint, 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Something is in the way')
		return
	end
	CloseMenu()
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				exports['mythic_notify']:SendAlert('inform', 'Vehicle is already in the world')
			end
		end
	end
	ESX.TriggerServerCallback('AS_SimpleGarage:checkMoney', function(EnoughMoney)
		if EnoughMoney == true then
			ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, 330.50, function(yourVehicle)
				SetVehicleProperties(yourVehicle, vehicleProps)
				NetworkFadeInEntity(yourVehicle, true, true)
				SetModelAsNoLongerNeeded(vehicleProps["model"])
				TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
				SetEntityAsMissionEntity(yourVehicle, true, true)    
				SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)
				TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
				local plate = vehicleProps.plate
				TriggerServerEvent('AS_SimpleGarage:UitImpound', plate)
				IsVehicleRegistered(plate)
				SetVehicleLockState(plate, yourVehicle)
		
				ClearMenu()
			end)
		elseif EnoughMoney == false then -- Owner has no money
			exports['mythic_notify']:SendAlert('inform', 'There is not enough in your bank account')
		end
	end, v["impoundprice"])
end

function SpawnImpoundedVehicle5(v)
	local data = v["props"]
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.PlaneImpound.SpawnLocation2

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint, 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Something is in the way')
		return
	end
	CloseMenu()
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				exports['mythic_notify']:SendAlert('inform', 'Vehicle is already in the world')
			end
		end
	end
	ESX.TriggerServerCallback('AS_SimpleGarage:checkMoney', function(EnoughMoney)
		if EnoughMoney == true then
			ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, 103.66, function(yourVehicle)
				SetVehicleProperties(yourVehicle, vehicleProps)
				NetworkFadeInEntity(yourVehicle, true, true)
				SetModelAsNoLongerNeeded(vehicleProps["model"])
				TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
				SetEntityAsMissionEntity(yourVehicle, true, true)    
				SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)
				TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
				local plate = vehicleProps.plate
				TriggerServerEvent('AS_SimpleGarage:UitImpound', plate)
				IsVehicleRegistered(plate)
				SetVehicleLockState(plate, yourVehicle)
		
				ClearMenu()
			end)
		elseif EnoughMoney == false then -- Owner has no money
			exports['mythic_notify']:SendAlert('inform', 'There is not enough in your bank account')
		end
	end, v["impoundprice"])
end

function SpawnImpoundedVehicle6(v)
	local data = v["props"]
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.BoatImpound.SpawnLocation1

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint, 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Something is in the way')
		return
	end
	CloseMenu()
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				exports['mythic_notify']:SendAlert('inform', 'Vehicle is already in the world')
			end
		end
	end
	ESX.TriggerServerCallback('AS_SimpleGarage:checkMoney', function(EnoughMoney)
		if EnoughMoney == true then
			ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, 137.85, function(yourVehicle)
				SetVehicleProperties(yourVehicle, vehicleProps)
				NetworkFadeInEntity(yourVehicle, true, true)
				SetModelAsNoLongerNeeded(vehicleProps["model"])
				TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
				SetEntityAsMissionEntity(yourVehicle, true, true)    
				SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)
				TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
				local plate = vehicleProps.plate
				TriggerServerEvent('AS_SimpleGarage:UitImpound', plate)
				IsVehicleRegistered(plate)
				SetVehicleLockState(plate, yourVehicle)
		
				ClearMenu()
			end)
		elseif EnoughMoney == false then -- Owner has no money
			exports['mythic_notify']:SendAlert('inform', 'There is not enough in your bank account')
		end
	end, v["impoundprice"])
end

function SpawnImpoundedVehicle7(v)
	local data = v["props"]
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.BoatImpound.SpawnLocation2

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint, 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Something is in the way')
		return
	end
	CloseMenu()
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				exports['mythic_notify']:SendAlert('inform', 'Vehicle is already in the world')
			end
		end
	end
	ESX.TriggerServerCallback('AS_SimpleGarage:checkMoney', function(EnoughMoney)
		if EnoughMoney == true then
			ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, 345.0, function(yourVehicle)
				SetVehicleProperties(yourVehicle, vehicleProps)
				NetworkFadeInEntity(yourVehicle, true, true)
				SetModelAsNoLongerNeeded(vehicleProps["model"])
				TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
				SetEntityAsMissionEntity(yourVehicle, true, true)    
				SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)
				TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
				local plate = vehicleProps.plate
				TriggerServerEvent('AS_SimpleGarage:UitImpound', plate)
				IsVehicleRegistered(plate)
				SetVehicleLockState(plate, yourVehicle)
		
				ClearMenu()
			end)
		elseif EnoughMoney == false then -- Owner has no money
			exports['mythic_notify']:SendAlert('inform', 'There is not enough in your bank account')
		end
	end, v["impoundprice"])
end

function SpawnImpoundedVehicle8(v)
	local data = v["props"]
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.BoatImpound.SpawnLocation3

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint, 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Something is in the way')
		return
	end
	CloseMenu()
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]

        if DoesEntityExist(vehicle) then
			if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
				exports['mythic_notify']:SendAlert('inform', 'Vehicle is already in the world')
			end
		end
	end
	ESX.TriggerServerCallback('AS_SimpleGarage:checkMoney', function(EnoughMoney)
		if EnoughMoney == true then
			ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, 130.0, function(yourVehicle)
				SetVehicleProperties(yourVehicle, vehicleProps)
				NetworkFadeInEntity(yourVehicle, true, true)
				SetModelAsNoLongerNeeded(vehicleProps["model"])
				TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
				SetEntityAsMissionEntity(yourVehicle, true, true)    
				SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)
				TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
				local plate = vehicleProps.plate
				TriggerServerEvent('AS_SimpleGarage:UitImpound', plate)
				IsVehicleRegistered(plate)
				SetVehicleLockState(plate, yourVehicle)
		
				ClearMenu()
			end)
		elseif EnoughMoney == false then -- Owner has no money
			exports['mythic_notify']:SendAlert('inform', 'There is not enough in your bank account')
		end
	end, v["impoundprice"])
end