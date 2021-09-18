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

for _, v in ipairs(Config.SellLegal) do
	if v.onMap then
		local blip = AddBlipForCoord(v.pos)
		SetBlipSprite (blip, v.blip)
		SetBlipDisplay(blip, 0)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, v.colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.sellText1)
		EndTextCommandSetBlipName(blip)
	end
end
	
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		-- Legal Sell markers
		for k, v in ipairs(Config.SellLegal) do
			local dist = #(pedCoords - v.pos)
			if dist < 20 then
				DrawMarker(25, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				if dist < 3.0 then
					DisplayHelpText('Press ~INPUT_CONTEXT~ to Sell Fish')
					if IsControlJustReleased(0, Keys['E']) then
						TriggerServerEvent('fishing:startSelling', v.type)
					end
				end
			end
		end

		-- Illegal Sell markers
		for k, v in ipairs(Config.SellIllegal) do
			local dist = #(pedCoords - v.pos)
				if dist < 3.0 then
					DisplayHelpText('Press ~INPUT_CONTEXT~ to Sell Fish')
					if IsControlJustReleased(0, Keys['E']) then
						exports['mythic_progbar']:Progress({
							name            = "knocking_action",
							duration        = 20000,
							label           = "Striking a Deal",
							useWhileDead    = false,
							canCancel       = false,
							controlDisables = {
								disableMovement    = true,
								disableCarMovement = true,
								disableMouse       = false,
								disableCombat      = true,
							},
							animation       = {
								animDict = 'timetable@jimmy@doorknock@',
								anim = 'knockdoor_idle',
							}
						}, function(status)
						TriggerServerEvent('fishing:startSelling', v.type)
					end)
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
