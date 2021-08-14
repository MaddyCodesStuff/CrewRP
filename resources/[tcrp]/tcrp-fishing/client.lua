ESX = nil
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if ESX ~= nil then
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local Keys = {
	["1"] = 185, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["E"] = 38, ["X"] = 73
}

local fishing = false
local lastInput = 0
local pause = false
local pausetimer = 0
local correct = 0
local veh = nil
local bait = "none"

for _, v in ipairs(Config.Sell) do
	if v.onMap then
		local blip = AddBlipForCoord(v.pos)
		SetBlipSprite (blip, v.blip)
		SetBlipDisplay(blip, 0)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, v.colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.sellText)
		EndTextCommandSetBlipName(blip)
	end
end
			
for _, info in pairs(Config.MarkerZones) do
	info.blip = AddBlipForCoord(info.Marker)
	SetBlipSprite(info.blip, 17)
	SetBlipDisplay(info.blip, 0)
	SetBlipScale(info.blip, 0.8)
	SetBlipColour(info.blip, 74)
	SetBlipAsShortRange(info.blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Boat Rental")
	EndTextCommandSetBlipName(info.blip)
end
	
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		-- Rental Markers
		for k, v in pairs(Config.MarkerZones) do
			local dist = #(pedCoords - v.Marker)
			if dist < 50.0 then
				DrawMarker(1, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 255, 0, 100, 0, 0, 0, 0)
				if dist <= 1.40 then
					DisplayHelpText('Press ~INPUT_CONTEXT~ to rent a boat')
					
					if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
						OpenBoatsMenu(v.Spawn, v.SpawnHeading)
					end 
				elseif dist < 1.45 then
					ESX.UI.Menu.CloseAll()
				end	
			end
			dist = #(pedCoords - v.Return)
			if dist < 100.0 and IsPedInAnyVehicle(ped) then
				DrawMarker(1, v.Return, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if dist < 5.0 then
					if DoesEntityExist(veh) and GetVehiclePedIsIn(ped) == veh then
						DisplayHelpText('Press ~INPUT_CONTEXT~ to return the boat')
						if IsControlJustReleased(0, Keys['E']) then
							SetEntityAsMissionEntity(veh)
							DeleteEntity(veh)
							TriggerServerEvent("deleteThisEntity", NetworkGetNetworkIdFromEntity(veh))
							SetEntityCoords(ped, v.Marker)
						end
					else
						DisplayHelpText('This is not a rented vehicle')
					end
				end
			end
		end

		-- Sell markers
		for k, v in ipairs(Config.Sell) do
			local dist = #(pedCoords - v.pos)
			if dist < 50.0 then
				DrawMarker(25, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				if dist < 3.0 then
					DisplayHelpText('Press ~INPUT_CONTEXT~ to Sell Fish')
					if IsControlJustReleased(0, Keys['E']) then
						TriggerServerEvent('fishing:startSelling', v.type)
					end
				end
			end
		end
    end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
	while true do
		Wait(1200)
		if pause and fishing then
			pausetimer = pausetimer + 1
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if fishing then
			local ped = GetPlayerPed(-1)
			local playerCoords = GetEntityCoords(ped)
				if IsControlJustReleased(0, Keys[tostring(1)]) then
					input = 1
			   	end
			-- Stops the player from cancelling the task by getting out a weapon
			if IsPedUsingScenario(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING") then
				BlockWeaponWheelThisFrame()
			end
			
			if IsControlJustReleased(0, Keys['X']) then
				fishing = false
				ESX.ShowNotification("Stopped fishing")
				TriggerEvent("fishing:break")
			end

			if fishing then
				playerPed = PlayerPedId()
				local pos = GetEntityCoords(playerPed)
				if GetWaterHeight(pos.x, pos.y, pos.z-0.1, pos.z-1.0) or GetWaterHeightNoWaves(pos.x, pos.y, pos.z-0.1, pos.z-1.0) then
					-- Nothing
				else
					fishing = false
					ESX.ShowNotification("Stopped fishing")
					TriggerEvent("fishing:break")
				end
				if IsEntityDead(playerPed) or IsPedSwimmingUnderWater(playerPed) then
					ESX.ShowNotification("Stopped fishing")
					TriggerEvent("fishing:break")
				end
			end
			
			if pausetimer > 3 then
				input = 99
			end
			
			if pause and input ~= 0 then
				pause = false
				if input == correct then
					TriggerServerEvent('fishing:catch', bait, playerCoords)
				else
					ESX.ShowNotification("Fish got free")
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = math.random(Config.FishTime.a , Config.FishTime.b)
		Citizen.Wait(wait)
		if fishing then
			pause = true
			correct = 1
			ESX.ShowNotification("Fish is taking the bait\nPress F to catch it")
			input = 0
			pausetimer = 2
		end	
	end
end)

RegisterNetEvent('fishing:message')
AddEventHandler('fishing:message', function(message)
	ESX.ShowNotification(message)
end)

RegisterNetEvent('fishing:break')
AddEventHandler('fishing:break', function()
	fishing = false
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('fishing:spawnPed')
AddEventHandler('fishing:spawnPed', function(model)
	RequestTheModel(model)
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, GetHashKey(model), pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(GetHashKey(model))
	Wait(10000)
    DeletePed(ped)
end)

RegisterNetEvent('fishing:setbait')
AddEventHandler('fishing:setbait', function(bool)
	bait = bool
end)

RegisterNetEvent('fishing:fishstart')
AddEventHandler('fishing:fishstart', function()
	playerPed = PlayerPedId()
	local pos = GetEntityCoords(PlayerPedId())
	if IsPedInAnyVehicle(playerPed) then
		ESX.ShowNotification("You can not fish from a vehicle")
	else
		if GetWaterHeight(pos.x, pos.y, pos.z-0.5, pos.z-1.5) then
			ESX.ShowNotification("Fishing started\nPress X to stop fishing")
			TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
			fishing = true
			print("fishing has started")
		else
			ESX.ShowNotification("You need to go further away from the shore")
		end
	end
end, false)

RegisterNetEvent('fishing:RentBoat')
AddEventHandler('fishing:RentBoat', function(model, xyz, h)
	RequestTheModel(model)
	veh = CreateVehicle(model, xyz, h, true, false)
	while not DoesEntityExist(veh) do
		Citizen.Wait(10)
	end
	TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
	DecorSetInt(veh, "ControlCar", 1)
	ESX.ShowNotification("You have paid a $" .. Config.RentalPrice .. " rental fee.")
	SetVehicleFuelLevel(veh, 100.0)
    DecorSetFloat(veh, "_FUEL_LEVEL",  GetVehicleFuelLevel(veh))
	SetModelAsNoLongerNeeded(model)
end)

function OpenBoatsMenu(xyz, h)
	local ped = PlayerPedId()
	PlayerData = ESX.GetPlayerData()
	local elements = {}

	for k, v in ipairs(Config.RentalBoats) do
		table.insert(elements, {
			label = ('%s - $%s'):format(GetLabelText(GetDisplayNameFromVehicleModel(v)), ESX.Math.GroupDigits(Config.RentalPrice)),
			value = v
		})
	end
	
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = 'Rent a boat',
		align    = 'top-right',
		elements = elements,
    },
	
	function(data, menu)
		local model = data.current.value
		ESX.UI.Menu.CloseAll()
		TriggerServerEvent("fishing:RentBoat", Config.RentalPrice, model, xyz, h)
    end,
	function(data, menu)
		menu.close()
		end
	)
end

function RequestTheModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

RegisterCommand("fish", function(source)
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
    fishing = true
end)
