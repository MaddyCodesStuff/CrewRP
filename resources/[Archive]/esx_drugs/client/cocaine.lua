local spawnedCoca               = 0
local cocaPlants                = {}
local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CocaField.coords, true) < 50 then
			SpawnCocaPlants()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CocaineProcessing.coords, true) < 1 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('coca_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessCocaine()
						else
							OpenBuyLicenseMenu('coca_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'coca_processing')
				else
					ProcessCocaine()
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessCocaine()
	isProcessing = true

	ESX.ShowNotification(_U('coca_processingstarted'))
	TriggerServerEvent('esx_drugs:processCocaine')
	local timeLeft  = Config.Delays.CocaineProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.CocaineProcessing.coords,
									false) > 4 then
			ESX.ShowNotification(_U('coca_processingtoofar'))
			TriggerServerEvent('esx_drugs:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i = 1, #cocaPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(cocaPlants[i]), false) < 1 then
				nearbyObject, nearbyID = cocaPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('coca_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('esx_drugs:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)

						ESX.Game.DeleteObject(nearbyObject)

						table.remove(cocaPlants, nearbyID)
						spawnedCoca = spawnedCoca - 1

						TriggerServerEvent('esx_drugs:pickedUpCocaLeafs')
					else
						ESX.ShowNotification(_U('coca_inventoryfull'))
					end

					isPickingUp = false

				end, 'cocaleaf')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(cocaPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnCocaPlants()
	while spawnedCoca < 25 do
		Citizen.Wait(0)
		local cocaCoords = GenerateCocaCoords()

		ESX.Game.SpawnLocalObject('prop_plant_cane_01a', cocaCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(cocaPlants, obj)
			spawnedCoca = spawnedCoca + 1
		end)
	end
end

function ValidateCocaCoord(plantCoord)
	if spawnedCoca > 0 then
		local validate = true

		for k, v in pairs(cocaPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.CocaField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateCocaCoords()
	while true do
		Citizen.Wait(1)

		local cocaCoordX, cocaCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY   = math.random(-90, 90)

		cocaCoordX   = Config.CircleZones.CocaField.coords.x + modX
		cocaCoordY   = Config.CircleZones.CocaField.coords.y + modY

		local coordZ = GetCoordZ(cocaCoordX, cocaCoordY)
		local coord  = vector3(cocaCoordX, cocaCoordY, coordZ)

		if ValidateCocaCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end
