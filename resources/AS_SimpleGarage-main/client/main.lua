local PlayerData = {}
cachedData = {}
local markerON = false
local neonenabled = true

ESX = nil
local currentVehicle = nil
local userProperties          = {}
local privateBlips            = {}
local privProp				  = {}
local privPropDet             = {}
local privOwned				  = {}
local garageBlip              = {}
local allBlips				  = {}
local privBlips				  = {}
local housingGarage 		  = {}
local lastGarage 			  = {}
local allGarages 			  =	{}
local firstRun = false




Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
	
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent('AS_SimpleGarage:storeLostVehicles')
end)

RegisterNetEvent('garage:wheresMyCar')
AddEventHandler('garage:wheresMyCar', function(garages)
	local phoneNr = "Garages"
	local msg = "You have cars stored in the following garages:           ---    "
	for i, v in pairs(garages) do 
		msg = msg .. "[" .. v .. "]    ---    "
	end
	SendNUIMessage({ event = 'newMessage', message = msg })
	local text = '~o~New message from ~g~' .. phoneNr
	-- SetNotificationTextEntry("STRING")
	-- AddTextComponentString(text)
	TriggerServerEvent('tcrp:textmessage', phoneNr);
	--DrawNotification(false, false)
	-- exports['notif']:SendNotification({
	-- 	text = text,
	-- 	type = 'bottomLeft',
	-- 	timeout = 6000,
	-- })
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	Citizen.Wait(300)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	Citizen.Wait(300)
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	TriggerServerEvent('gcPhone:sendMessage', phoneNr, msg)
end)

RegisterNetEvent('garage:giveKeys')
AddEventHandler('garage:giveKeys', function()
	local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)
	local ClosestVeh = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if ClosestVeh ~= 0 then
		local vehicleProps  = ESX.Game.GetVehicleProperties(ClosestVeh)
		local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(ClosestVeh), 1)
		if IsPedInAnyVehicle(ped) == false then

			if distanceToVeh <= 10 and closestDistance <= 5 and closestDistance > 0 then
				ESX.TriggerServerCallback('AS_SimpleGarage:IsVehicleOwner', function(isOwner)
					if isOwner == true then
						TriggerServerEvent('AS_SimpleGarage:GiveKeysOwner', vehicleProps.plate, GetPlayerServerId(closestPlayer))
						--exports['mythic_notify']:SendAlert('inform', 'Keys given to: ' .. GetPlayerName(closestPlayer), 5000, { ['background-color'] = Config.ColorHex, ['color'] = '#ffffff' })
						exports['mythic_notify']:SendAlert('inform','Vehicle with plate '.. vehicleProps.plate ..' given to '.. GetPlayerName(closestPlayer))
					else
						exports['mythic_notify']:SendAlert('inform', 'You do not have keys to this vehicle')
					end
				end, vehicleProps.plate)
			else
				exports['mythic_notify']:SendAlert('inform','There is no one around you to give keys to')
			end
		end
	else
		exports['mythic_notify']:SendAlert('inform','There no cars near you.')
	end
end)




Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, Config.LockKey) then
			LockVehicle()
		end
	end
end)


function LockVehicle()
	local ped = GetPlayerPed(-1)
	local coords = GetEntityCoords(ped)
	--local ClosestVeh = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	local ClosestVeh  = ESX.Game.GetClosestVehicle(coords)
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(ClosestVeh), 1)
	if IsPedInAnyVehicle(ped) then
		local playerVeh = GetVehiclePedIsIn(ped, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(playerVeh)
		ESX.TriggerServerCallback('AS_SimpleGarage:IsVehicleOwner', function(isOwner)
			if isOwner == true then
				ESX.TriggerServerCallback('AS_SimpleGarage:checkLocked', function(islocked)
					if islocked == false then
						SetVehicleDoorsLocked(playerVeh, 2)
						TriggerServerEvent("AS_SimpleGarage:changeLockStatus", vehicleProps.plate)
						exports['mythic_notify']:SendAlert('inform', 'Vehicle Locked')
						PlayVehicleDoorOpenSound(playerVeh, 0)
					elseif islocked == true then
						SetVehicleDoorsLocked(playerVeh, 1)
						TriggerServerEvent("AS_SimpleGarage:changeLockStatus", vehicleProps.plate)
						exports['mythic_notify']:SendAlert('inform', 'Vehicle Unlocked')
						PlayVehicleDoorOpenSound(playerVeh, 0)
					end
				end, vehicleProps.plate)
			else
				--TriggerServerEvent("AS_SimpleGarage:addCarToDB", vehicleProps)
				exports['mythic_notify']:SendAlert('inform', 'This vehicle does not belong to you')
			end
		end, vehicleProps.plate)
	end

	if distanceToVeh <= 10 and not IsPedInAnyVehicle(ped) then
		local vehicleProps  = ESX.Game.GetVehicleProperties(ClosestVeh)
		ESX.TriggerServerCallback('AS_SimpleGarage:IsVehicleOwner', function(isOwner)
			if isOwner == true then
				ESX.TriggerServerCallback('AS_SimpleGarage:checkLocked', function(islocked)
					if islocked == false then
						local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, -5.0)
						local micspawned = CreateObject(GetHashKey("p_car_keys_01"), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
						local netid = ObjToNet(micspawned)
						SetNetworkIdExistsOnAllMachines(netid, true)
						NetworkSetNetworkIdDynamic(netid, true)
						SetNetworkIdCanMigrate(netid, false)
						AttachEntityToEntity(micspawned, ped, GetPedBoneIndex(ped, 28422), 0.055, 0.05, -0.09, 240.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
						PlayAnimation(PlayerPedId(), "anim@mp_player_intmenu@key_fob@", "fob_click", {
							["speed"] = 8.0,
							["speedMultiplier"] = 8.0,
							["duration"] = 1820,
							["flag"] = 49,
							["playbackRate"] = false
						})
						Citizen.Wait(400)
						SetVehicleDoorsLocked(ClosestVeh, 2)
						TriggerServerEvent("AS_SimpleGarage:changeLockStatus", vehicleProps.plate)
						exports['mythic_notify']:SendAlert('inform', 'Vehicle locked')
						SetVehicleLights(ClosestVeh, 2)
						PlayVehicleDoorOpenSound(ClosestVeh, 0)
						Citizen.Wait(400)
						SetVehicleLights(ClosestVeh, 0)
						Citizen.Wait(400)
						SetVehicleLights(ClosestVeh, 2)
						Citizen.Wait(400)
						SetVehicleLights(ClosestVeh, 0)
						ClearPedSecondaryTask(ped)
						DetachEntity(NetToObj(netid), 1, 1)
						DeleteEntity(NetToObj(netid))	
					elseif islocked == true then
						local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, -5.0)
						local micspawned = CreateObject(GetHashKey("p_car_keys_01"), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
						local netid = ObjToNet(micspawned)
						SetNetworkIdExistsOnAllMachines(netid, true)
						NetworkSetNetworkIdDynamic(netid, true)
						SetNetworkIdCanMigrate(netid, false)
						AttachEntityToEntity(micspawned, ped, GetPedBoneIndex(ped, 28422), 0.055, 0.05, 0.0, 240.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
						PlayAnimation(PlayerPedId(), "anim@mp_player_intmenu@key_fob@", "fob_click", {
							["speed"] = 8.0,
							["speedMultiplier"] = 8.0,
							["duration"] = 1820,
							["flag"] = 49,
							["playbackRate"] = false
						})
						Citizen.Wait(400)
						SetVehicleDoorsLocked(ClosestVeh, 1)
						TriggerServerEvent("AS_SimpleGarage:changeLockStatus", vehicleProps.plate)
						exports['mythic_notify']:SendAlert('inform', 'Vehicle Unlocked')
						SetVehicleLights(ClosestVeh, 2)
						PlayVehicleDoorOpenSound(ClosestVeh, 0)
						Citizen.Wait(400)
						SetVehicleLights(ClosestVeh, 0)
						Citizen.Wait(400)
						SetVehicleLights(ClosestVeh, 2)
						Citizen.Wait(400)
						SetVehicleLights(ClosestVeh, 0)		
						ClearPedSecondaryTask(ped)
						DetachEntity(NetToObj(netid), 1, 1)
						DeleteEntity(NetToObj(netid))		
					end
				end, vehicleProps.plate)
			end
		end, vehicleProps.plate)
	end
	Citizen.Wait(1000)
end

function PlayAnimation(ped, dict, anim, settings)
	if dict then
        Citizen.CreateThread(function()
            RequestAnimDict(dict)

            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(100)
            end

            if settings == nil then
                TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
            else 
                local speed = 1.0
                local speedMultiplier = -1.0
                local duration = 1.0
                local flag = 0
                local playbackRate = 0

                if settings["speed"] then
                    speed = settings["speed"]
                end

                if settings["speedMultiplier"] then
                    speedMultiplier = settings["speedMultiplier"]
                end

                if settings["duration"] then
                    duration = settings["duration"]
                end

                if settings["flag"] then
                    flag = settings["flag"]
                end

                if settings["playbackRate"] then
                    playbackRate = settings["playbackRate"]
                end

                TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
            end
      
            RemoveAnimDict(dict)
		end)
	else
		TaskStartScenarioInPlace(ped, anim, 0, false)
	end
end




------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------PUBLIC GARAGE-----------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------



Citizen.CreateThread(function()
	while true do

		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
	
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(10)
		end
		Citizen.Wait(1)
		privOwned = {}
		

		local CanDraw = function(action)
			if action == "vehicle" then
				if IsPedInAnyVehicle(PlayerPedId()) then
					local vehicle = GetVehiclePedIsIn(PlayerPedId())

					if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
						return true
					else
						return false
					end
				else
					return false
				end
			end

			return true
		end

		local GetDisplayText = function(action, garage)
			if not Config.Labels[action] then Config.Labels[action] = action end
				local ped = GetPlayerPed(-1)
				local veh = GetVehiclePedIsIn(ped, false)
				local model = GetEntityModel(veh)
				local displaytext = GetDisplayNameFromVehicleModel(model)
				local name = GetLabelText(displaytext)
				if (name == "NULL") then
					vehicleLabel = displaytext
				else
					vehicleLabel = name
				end
			return string.format(Config.Labels[action], action == "vehicle" and vehicleLabel or garage)
		end

		ESX.TriggerServerCallback('AS_SimpleGarage:getOwnedHouses', function(garages)
			for i, v in pairs(garages) do
				
				local garageBlip = AddBlipForCoord(v["coords"]["gIN"])

				SetBlipSprite(garageBlip, 357)
				SetBlipDisplay(garageBlip, 4)
				SetBlipScale (garageBlip, 0.8)

				SetBlipAsShortRange(garageBlip, true)
				BeginTextCommandSetBlipName("STRING")
				--table.insert(privProp, garage)
				AddTextComponentString("Private Garage")
				SetBlipColour(garageBlip, 69)
				table.insert(privateBlips, garageBlip)
				EndTextCommandSetBlipName(garageBlip)
			
				table.insert(housingGarage, v["gName"])
				table.insert(allGarages, v)
			end
			lastGarage = garages
		end)

		for garage, garageData in pairs(Config.Garages) do
			if garage:find("(PUBLIC)", 1, true)then
				local garageBlip = AddBlipForCoord(garageData["positions"]["menu"]["position"])
				BeginTextCommandSetBlipName("STRING")
				if garage:find("AIRPORT", 1, true) then
					SetBlipSprite(garageBlip, 359)
					SetBlipColour(garageBlip, 46)
					AddTextComponentString("Public Air Garage")
				elseif garage:find("DOCK", 1, true) then
					SetBlipSprite(garageBlip, 356)
					SetBlipColour(garageBlip, 49)
					AddTextComponentString("Public Boat Garage")
				else
					SetBlipSprite(garageBlip, 357)
					SetBlipColour(garageBlip, 67)
					AddTextComponentString("Public Garage")
				end
				
				SetBlipDisplay(garageBlip, 4)
				SetBlipScale (garageBlip, 0.8)

				SetBlipAsShortRange(garageBlip, true)

				EndTextCommandSetBlipName(garageBlip)

			elseif garage:find("PRIVATE", 1, true)then
				Citizen.Wait(50)
			else
				
				ESX.TriggerServerCallback('AS_SimpleGarage:getOwnedProperties', function(properties)
					if properties == true then
						local garageBlip = AddBlipForCoord(garageData["positions"]["menu"]["position"])

						SetBlipSprite(garageBlip, 357)
						SetBlipDisplay(garageBlip, 4)
						SetBlipScale (garageBlip, 0.8)

						SetBlipAsShortRange(garageBlip, true)
						BeginTextCommandSetBlipName("STRING")
						--table.insert(privProp, garage)
						AddTextComponentString("Private Garage")
						SetBlipColour(garageBlip, 69)
						table.insert(privateBlips, garageBlip)
						EndTextCommandSetBlipName(garageBlip)
						table.insert(privOwned, garage)
						--table.insert(allGarages, {name = garage, pos = garageData["positions"]["menu"]["position"]})
					end
				end,
				garage)
				
			end
			
		

		end

		while true do
			local sleepThread = 500

			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)

			for garage, garageData in pairs(Config.Garages) do
				if has_value(privOwned, garage) or garage:find("(PUBLIC)", 1, true) or garage:find("PRIVATE", 1, true) then
					for action, actionData in pairs(garageData["positions"]) do
						local dstCheck = #(pedCoords - actionData["position"])
						

						if dstCheck <= 10.0 then
							sleepThread = 5

							local draw = CanDraw(action)

							if draw then
								local markerSize = action == "vehicle" and 5.0 or 1.5
								

								if dstCheck <= markerSize - 0.1 then
									local usable, displayText = not DoesCamExist(cachedData["cam"]), GetDisplayText(action, garage)

									ESX.ShowHelpNotification(usable and displayText or "")

									if IsControlJustPressed(1, 177) and not Menu.hidden then
										CloseMenu()
										HandleCamera(cachedData["currentGarage"])
										PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
									end
									if Menu.hidden then

									end
									if usable then
										if IsControlJustPressed(0, 38) and Menu.hidden then
											cachedData["currentGarage"] = garage
											
											HandleAction(action)
										end
									end
								end

								DrawScriptMarker({
									["type"] = Config.Type,
									["pos"] = actionData["position"] - vector3(0.0, 0.0, 0.985),
									["sizeX"] = markerSize,
									["sizeY"] = markerSize,
									["sizeZ"] = markerSize,
									["r"] = Config.ColorR,
									["g"] = Config.ColorG,
									["b"] = Config.ColorB
								})
							end
						end
					end
				end
			end

			for garage, garageData in pairs(allGarages) do
				for action, actionData in pairs(garageData["coords"]) do
					cachedData["spawn"] = actionData
					if action == "heading" then
						cachedData["heading"] = garageData["heading"]
					end
					local dstCheck = #(pedCoords - actionData)
					if dstCheck <= 10.0 then
						sleepThread = 5

						if action == "gOut" then
							action = "vehicle"
							cachedData["spawn"] = actionData
						elseif action == "gIN" then
							action = "menu"
						else
							cachedData["heading"] = garageData["heading"]
						end
						local draw = CanDraw(action)

						if draw then
							local markerSize = action == "vehicle" and 5.0 or 1.5

							if dstCheck <= markerSize - 0.1 then
								local usable, displayText = not DoesCamExist(cachedData["cam"]), GetDisplayText(action, garageData["gName"])

								ESX.ShowHelpNotification( displayText or "")

								if IsControlJustPressed(1, 177) and not Menu.hidden then
									CloseMenu()
									--HandleCamera(cachedData["currentGarage"])
									PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								end
								if Menu.hidden then

								end
								if usable then
									if IsControlJustPressed(0, 38) and Menu.hidden then
										
										cachedData["currentGarage"] = garageData["gName"]
										
										HandleAction(action)
									end
								end
								
							end

							if action == "vehicle" then
								DrawScriptMarker({
									["type"] = 36,
									["pos"] = actionData - vector3(0.0, 0.0, 0.985),
									["sizeX"] = 0.5,
									["sizeY"] = 0.5,
									["sizeZ"] = 0.5,
									["r"] = Config.ColorR,
									["g"] = Config.ColorG,
									["b"] = Config.ColorB
								})
							else
								DrawScriptMarker({
									["type"] = Config.Type,
									["pos"] = actionData - vector3(0.0, 0.0, 0.985),
									["sizeX"] = markerSize,
									["sizeY"] = markerSize,
									["sizeZ"] = markerSize,
									["r"] = Config.ColorR,
									["g"] = Config.ColorG,
									["b"] = Config.ColorB
								})
							end
						end
					end
					
				end
			end


			Menu.renderGUI()
			Citizen.Wait(5)
		end
		Citizen.Wait(100)
	end
end)



function ownedProp(set, key)
	return set[key] ~= nil
end

function has_value (tab, val)
    for index, value in pairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end


RegisterNetEvent('AS_SimpleGarage-main:checkGarages')
AddEventHandler('AS_SimpleGarage-main:checkGarages', function(player, garage)
	ESX.TriggerServerEvent('AS_SimpleGarage:checkGaragesServer', garage)
end)

RegisterNetEvent('AS_SimpleGarage:moveOwnwedCars')
AddEventHandler('AS_SimpleGarage:moveOwnwedCars', function(name, owner)
	TriggerServerEvent('AS_SimpleGarage:moveCars', name, owner)
end)


RegisterNetEvent('AS_SimpleGarage-main:updateOwnedProperties')
AddEventHandler('AS_SimpleGarage-main:updateOwnedProperties', function()
	allGarages = {}
	privPropDet = {}
	housingGarage = {}
	for _, blip in pairs(privateBlips) do
        RemoveBlip(blip)
    end

    privateBlips = {}
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	Citizen.Wait(1)

	ESX.TriggerServerCallback('AS_SimpleGarage:getOwnedHouses', function(garages)
		for i, v in pairs(garages) do
			local garageBlip = AddBlipForCoord(v["coords"]["gIN"])

			SetBlipSprite(garageBlip, 357)
			SetBlipDisplay(garageBlip, 4)
			SetBlipScale (garageBlip, 0.8)

			SetBlipAsShortRange(garageBlip, true)
			BeginTextCommandSetBlipName("STRING")
			--table.insert(privProp, garage)
			AddTextComponentString("Private Garage")
			SetBlipColour(garageBlip, 69)
			table.insert(privateBlips, garageBlip)
			EndTextCommandSetBlipName(garageBlip)
		
			table.insert(housingGarage, v["gName"])
			table.insert(allGarages, v)
		end
		lastGarage = garages
	end)

	for garage, garageData in pairs(Config.Garages) do
		if garage:find("(PUBLIC)", 1, true)then
			Citizen.Wait(50)

		elseif garage:find("PRIVATE", 1, true)then
			Citizen.Wait(50)
		else
			
			ESX.TriggerServerCallback('AS_SimpleGarage:getOwnedProperties', function(properties)
				if properties == true then
					local garageBlip = AddBlipForCoord(garageData["positions"]["menu"]["position"])

					SetBlipSprite(garageBlip, 357)
					SetBlipDisplay(garageBlip, 4)
					SetBlipScale (garageBlip, 0.8)

					SetBlipAsShortRange(garageBlip, true)
					BeginTextCommandSetBlipName("STRING")
					--table.insert(privProp, garage)
					AddTextComponentString("Private Garage")
					SetBlipColour(garageBlip, 69)
					table.insert(privateBlips, garageBlip)
					EndTextCommandSetBlipName(garageBlip)
					table.insert(privOwned, garage)
					--table.insert(allGarages, {name = garage, pos = garageData["positions"]["menu"]["position"]})
				end
			end,
			garage)
			
		end
		
	

	end
	

	Citizen.Wait(100)
end)

function DrawScriptMarker(markerData)
	DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["sizeX"] or 1.0, markerData["sizeY"] or 1.0, markerData["sizeZ"] or 1.0, markerData["r"] or 1.0, markerData["g"] or 1.0, markerData["b"] or 1.0, 100, false, true, 2, false, false, false, false)
end

function HandleAction(action)
	if action == "menu" then
		OpenPublicGarageMenu()
		Menu.hidden = not Menu.hidden
		TriggerEvent("inmenu",true)
    elseif action == "vehicle" then
        SaveVehicle()
    end
end


function SpawnLocalVehicle(data)
	local vehicleProps = data
    if not vehicleProps.model then
        vehicleProps = data[1]
    end
	local spawnpoint = Config.Garages[cachedData["currentGarage"]]["positions"]["vehicle"]

	WaitForModel(vehicleProps["model"])

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint["position"], 3.0) then 
		exports['mythic_notify']:SendAlert('inform', 'Spawn location blocked')
		return
	end
	
	if not IsModelValid(vehicleProps["model"]) then
		return
	end

	ESX.Game.SpawnLocalVehicle(vehicleProps["model"], spawnpoint["position"], spawnpoint["heading"], function(yourVehicle)
		cachedData["vehicle"] = yourVehicle

		SetVehicleProperties(yourVehicle, vehicleProps)
		SetVehicleLights(yourVehicle, 2)
		SetModelAsNoLongerNeeded(vehicleProps["model"])
	end)
end

function GetSpawnCoords(currentGarage)
	
	for i, v in pairs(lastGarage) do 
		if v["gName"] == cachedData["currentGarage"] then
			return v["coords"]["gOut"]
		end
		
	end
end

function GetSpawnHead(currentGarage)
	
	for i, v in pairs(lastGarage) do 
		if v["gName"] == cachedData["currentGarage"] then

			return v["coords"]["heading"]
		end
		
	end
end

function SpawnVehicle(data)
	local vehicleProps = data
	local currentGarage = cachedData["currentGarage"]
    if not vehicleProps.model then
        vehicleProps = data[1]
	end
	if has_value(housingGarage, currentGarage) then

		
		local spawnpoint = GetSpawnCoords(currentGarage)
		local heading = GetSpawnHead(currentGarage)
		-- WaitForModel(vehicleProps["model"])

		-- if DoesEntityExist(cachedData["vehicle"]) then
		-- 	DeleteEntity(cachedData["vehicle"])
		-- end
		
		-- if not ESX.Game.IsSpawnPointClear(spawnpoint["position"], 3.0) then 
		-- 	exports['mythic_notify']:SendAlert('inform', 'Spawn location blocked', 5000, { ['background-color'] = Config.ColorHex, ['color'] = '#ffffff' })
		-- 	return
		-- end
		CloseMenu()
		local gameVehicles = ESX.Game.GetVehicles()

		for i = 1, #gameVehicles do
			local vehicle = gameVehicles[i]

			if DoesEntityExist(vehicle) then
				if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
					exports['mythic_notify']:SendAlert('inform', 'Vehicle is not in a garage')
					return HandleCamera(cachedData["currentGarage"])
				end
			end
		end

		ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint, heading, function(yourVehicle)
			SetVehicleProperties(yourVehicle, vehicleProps)
			NetworkFadeInEntity(yourVehicle, true, true)
			SetModelAsNoLongerNeeded(vehicleProps["model"])
			TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
			SetEntityAsMissionEntity(yourVehicle, true, true)    
			SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)     
			TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
			local plate = vehicleProps.plate
			IsVehicleRegistered(plate)
			SetVehicleLockState(plate, yourVehicle)

			HandleCamera(cachedData["currentGarage"])
			ClearMenu()
		end)
	else
		local spawnpoint = Config.Garages[cachedData["currentGarage"]]["positions"]["vehicle"]
	

		WaitForModel(vehicleProps["model"])

		if DoesEntityExist(cachedData["vehicle"]) then
			DeleteEntity(cachedData["vehicle"])
		end
		
		if not ESX.Game.IsSpawnPointClear(spawnpoint["position"], 3.0) then 
			exports['mythic_notify']:SendAlert('inform', 'Spawn location blocked')
			return
		end
		CloseMenu()
		local gameVehicles = ESX.Game.GetVehicles()

		for i = 1, #gameVehicles do
			local vehicle = gameVehicles[i]

			if DoesEntityExist(vehicle) then
				if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(vehicleProps["plate"]) then
					exports['mythic_notify']:SendAlert('inform', 'Vehicle is not in a garage')
					return HandleCamera(cachedData["currentGarage"])
				end
			end
		end

		ESX.Game.SpawnVehicle(vehicleProps["model"], spawnpoint["position"], spawnpoint["heading"], function(yourVehicle)
			SetVehicleProperties(yourVehicle, vehicleProps)
			NetworkFadeInEntity(yourVehicle, true, true)
			SetModelAsNoLongerNeeded(vehicleProps["model"])
			TaskWarpPedIntoVehicle(PlayerPedId(), yourVehicle, -1)
			SetEntityAsMissionEntity(yourVehicle, true, true)    
			SetVehicleHasBeenOwnedByPlayer(yourVehicle, true)     
			TriggerServerEvent('AS_SimpleGarage:VeranderSpawnStatus', vehicleProps.plate, false)
			local plate = vehicleProps.plate
			IsVehicleRegistered(plate)
			SetVehicleLockState(plate, yourVehicle)

			HandleCamera(cachedData["currentGarage"])
			ClearMenu()
		end)
	end
end



function IsVehicleRegistered(plate)
	ESX.TriggerServerCallback('AS_SimpleGarage:checkRegistered', function(isregistered)
		if isregistered == true then
			exports['mythic_notify']:SendAlert('inform', _U('Vehicle_Registered'))
		elseif isregistered == false then
			exports['mythic_notify']:SendAlert('inform', _U('Vehicle_notRegistered'))
		end
	end, plate)
end

function SetVehicleLockState(plate, yourVehicle)
	ESX.TriggerServerCallback('AS_SimpleGarage:checkLocked', function(islockeded)
		if islockeded == false then
			SetVehicleDoorsLocked(yourVehicle, 1)
		elseif islockeded == true then
			SetVehicleDoorsLocked(yourVehicle, 2)
		end
	end, plate)
end

function IsVehicleImpounded(plate)
	ESX.TriggerServerCallback('AS_SimpleGarage:checkImpounded', function(isImpounded)	
		if isImpounded == true then
			exports['mythic_notify']:SendAlert('inform', _U('menu_Impounded'))
		end
	end, plate)
end

function SaveVehicle()
    local vehicle = GetVehiclePedIsUsing(PlayerPedId())	

	if DoesEntityExist(vehicle) then
		local vehicleProps = GetVehicleProperties(vehicle)
		ESX.TriggerServerCallback('AS_SimpleGarage:IsVehicleOwner', function(isOwner)
			if isOwner == true then
				ESX.TriggerServerCallback("garage:validateVehicle", function(valid)
					if valid then
						TaskLeaveVehicle(PlayerPedId(), vehicle, 0)	
						while IsPedInVehicle(PlayerPedId(), vehicle, true) do
							Citizen.Wait(0)
						end	
						Citizen.Wait(500)	
						NetworkFadeOutEntity(vehicle, true, true)	
						Citizen.Wait(50)	
						ESX.Game.DeleteVehicle(vehicle)
						exports['mythic_notify']:SendAlert('inform', 'Vehicle Stored')
					else
						exports['mythic_notify']:SendAlert('inform', 'Vehicle does not belong to you')
					end
				end, vehicleProps, cachedData["currentGarage"])
			else
				exports['mythic_notify']:SendAlert('inform', 'You do not have keys for this vehicle')
			end
		end, vehicleProps.plate)	
	end
end

function OpenPublicGarageMenu()
	local currentGarage = cachedData["currentGarage"]
    if not currentGarage then return end

	HandleCamera(currentGarage, true)

	
	ClearMenu()
	MenuTitle = "Garage"
	Menu.addButton("GARAGE " ..currentGarage,"CloseMenu",nil) 


	ESX.TriggerServerCallback("garage:fetchPlayerVehicles", function(fetchedVehicles)

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
				if has_value(housingGarage, currentGarage) then
					Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnVehicle", {vehicle}, "", " Health : " .. round(vehicle["engineHealth"]) /10 .. "%", " Fuel : " .. round(vehicle["fuelLevel"]) .. "%")					
				else
					Menu.addButton("" ..(vehicle["plate"]).." | "..vehicleLabel, "SpawnVehicle", {vehicle}, "", " Health : " .. round(vehicle["engineHealth"]) /10 .. "%", " Fuel : " .. round(vehicle["fuelLevel"]) .. "%","SpawnLocalVehicle")
				end
			end
		end
	end, currentGarage)

end



function HandleCamera(garage, toggle)
	
	if has_value(housingGarage, cachedData["currentGarage"]) then
		Citizen.Wait(50)
	else
		if not garage then return; end
		local Camerapos = Config.Garages[garage]["camera"]

		if not Camerapos then return end

		if not toggle then
			if cachedData["cam"] then
				DestroyCam(cachedData["cam"])
			end
			
			if DoesEntityExist(cachedData["vehicle"]) then
				DeleteEntity(cachedData["vehicle"])
			end

			RenderScriptCams(0, 1, 750, 1, 0)

			return
		end

		if cachedData["cam"] then
			DestroyCam(cachedData["cam"])
		end

		cachedData["cam"] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

		SetCamCoord(cachedData["cam"], Camerapos["x"], Camerapos["y"], Camerapos["z"])
		SetCamRot(cachedData["cam"], Camerapos["rotationX"], Camerapos["rotationY"], Camerapos["rotationZ"])
		SetCamActive(cachedData["cam"], true)

		RenderScriptCams(1, 1, 750, 1, 1)

		Citizen.Wait(500)
	end

end

function WaitForModel(model)
    local DrawScreenText = function(text, red, green, blue, alpha)
        SetTextFont(4)
        SetTextScale(0.0, 0.5)
        SetTextColour(red, green, blue, alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(true)
    
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(0.5, 0.5)
    end

    if not IsModelValid(model) then
		return exports['mythic_notify']:SendAlert('inform', 'This model no longer exists, file a support ticket')
    end

	if not HasModelLoaded(model) then
		RequestModel(model)
	end
	
	while not HasModelLoaded(model) do
		Citizen.Wait(0)

		DrawScreenText("Loading Vehicle ", 255, 255, 255, 150)
	end
end

function SetVehicleProperties(vehicle, vehicleProps)
    ESX.Game.SetVehicleProperties(vehicle, vehicleProps)

    SetVehicleEngineHealth(vehicle, vehicleProps["engineHealth"] and vehicleProps["engineHealth"] + 0.0 or 1000.0)
    SetVehicleBodyHealth(vehicle, vehicleProps["bodyHealth"] and vehicleProps["bodyHealth"] + 0.0 or 1000.0)
	SetVehicleFuelLevel(vehicle, vehicleProps["fuelLevel"] and vehicleProps["fuelLevel"] + 0.0 or 1000.0)
	DecorSetFloat(vehicle, "_FUEL_LEVEL", vehicleProps["fuelLevel"] and vehicleProps["fuelLevel"] + 0.0 or 1000.0)
	

    if vehicleProps["windows"] then
        for windowId = 1, 13, 1 do
            if vehicleProps["windows"][windowId] == false then
                SmashVehicleWindow(vehicle, windowId)
            end
        end
    end

    if vehicleProps["tyres"] then
        for tyreId = 1, 7, 1 do
            if vehicleProps["tyres"][tyreId] ~= false then
                SetVehicleTyreBurst(vehicle, tyreId, true, 1000)
            end
        end
    end

    if vehicleProps["doors"] then
        for doorId = 0, 5, 1 do
            if vehicleProps["doors"][doorId] ~= false then
                SetVehicleDoorBroken(vehicle, doorId - 1, true)
            end
        end
    end
end

function GetVehicleProperties(vehicle)
    if DoesEntityExist(vehicle) then
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

        vehicleProps["tyres"] = {}
        vehicleProps["windows"] = {}
        vehicleProps["doors"] = {}

        for id = 1, 7 do
            local tyreId = IsVehicleTyreBurst(vehicle, id, false)
        
            if tyreId then
                vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = tyreId
        
                if tyreId == false then
                    tyreId = IsVehicleTyreBurst(vehicle, id, true)
                    vehicleProps["tyres"][ #vehicleProps["tyres"]] = tyreId
                end
            else
                vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = false
            end
        end

        -- for id = 0, 13, 1 do
        --     if id ~= 9 and id ~= 8 then    
        --         local windowId = IsVehicleWindowIntact(vehicle, id)

        --         if windowId ~= nil then
        --             vehicleProps["windows"][#vehicleProps["windows"] + 1] = windowId
        --         else
        --             vehicleProps["windows"][#vehicleProps["windows"] + 1] = true
        --         end
        --     end
        -- end
        
        for id = 0, 5 do
            local doorId = IsVehicleDoorDamaged(vehicle, id)
        
            if doorId then
                vehicleProps["doors"][#vehicleProps["doors"] + 1] = doorId
            else
                vehicleProps["doors"][#vehicleProps["doors"] + 1] = false
            end
        end

        vehicleProps["engineHealth"] = GetVehicleEngineHealth(vehicle)
        vehicleProps["bodyHealth"] = GetVehicleBodyHealth(vehicle)
        vehicleProps["fuelLevel"] = GetVehicleFuelLevel(vehicle)

        return vehicleProps
    end
end

function round(n)
    if not n then return 0; end
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

function CloseMenu()
	HandleCamera(currentGarage, false)
	TriggerEvent("inmenu",false)
	Menu.hidden = true
	HandleCamera(cachedData["currentGarage"])
end

--------------------------------------------------------------------------------------------------------------
-----------------------------     QUICKMENU                   ------------------------------------------------
--------------------------------------------------------------------------------------------------------------

RegisterNetEvent("AS_SimpleGarage:lock")
AddEventHandler("AS_SimpleGarage:lock", function()
	LockVehicle()
end)

RegisterNetEvent("AS_SimpleGarage:engine")
AddEventHandler("AS_SimpleGarage:engine", function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end)

RegisterNetEvent("AS_SimpleGarage:neon")
AddEventHandler("AS_SimpleGarage:neon", function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		if neonenabled == false then
			SetVehicleNeonLightEnabled(vehicle, 0, true)
			SetVehicleNeonLightEnabled(vehicle, 1, true)
			SetVehicleNeonLightEnabled(vehicle, 2, true)
			SetVehicleNeonLightEnabled(vehicle, 3, true)
			neonenabled = true
		elseif neonenabled == true then
			SetVehicleNeonLightEnabled(vehicle, 0, false)
			SetVehicleNeonLightEnabled(vehicle, 1, false)
			SetVehicleNeonLightEnabled(vehicle, 2, false)
			SetVehicleNeonLightEnabled(vehicle, 3, false)
			neonenabled = false
		end
    end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
	local scale = (1/dist)*20
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov   
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(250, 250, 250, 255)		-- You can change the text color here
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end