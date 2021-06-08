ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

TriggerEvent('esx_phone:registerNumber', 'fireman', 'fire department alert', true, true)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'fireman')
	end
end)

local fireStarted     = false
local fireProbability = 0

local fires           = {}

Citizen.CreateThread(function()
	Citizen.Wait(1)

	fireProbability = Config.FireChance -- Defaults to 40%
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.CheckInterval)

		math.randomseed(os.time())

		local chance  = math.random(0, 100) -- Chance of fire, between 1 and 100%
		local firemen = GetFDOnline()

		if firemen > 5 then
			fireProbability = fireProbability + 25 -- Increase the chance of a fire to start by 25%
			if fireProbability > 100 then
				fireProbability = 100
			end
		end

		-- if firemen == 1 then
		-- 	fireProbability = fireProbability - 15 -- Increase the chance of a fire to start by 25%
		-- 	if fireProbability < 0 then
		-- 		fireProbability = 0
		-- 	end
		-- end

		if chance <= fireProbability and chance ~= 0 then
			if fireStarted then
				TriggerClientEvent('esx_fireman:stopFire', -1) -- Send the client even to stop the current fire
				fireStarted = false
				fires       = {}
				Citizen.Wait(15000)
				-- Do the logic here to determine what size fire to start
				-- Need to also pass the random coord to send to clients that come in after the fact
			end

			if firemen == 1 then
				-- Start random dumpster fire
				local coords   = Config.DumpsterFires[math.random(1, #Config.DumpsterFires)].coords
				local spread   = Config.MaxDumpsterFireSpread
				local numfires = math.random(1, Config.MaxDumpsterFires)

				for i = 1, numfires, 1 do
					if i == 1 then
						table.insert(fires, { spread = spread, coords = { x = coords.x, y = coords.y, z = coords.z } })
					else
						table.insert(fires,
									 { spread = spread, coords = { x = coords.x + math.random(1,
																							  5), y = coords.y + math.random(1,
																															 5), z = coords.z } })
					end
				end

				-- TriggerClientEvent('esx_fireman:startDumpsterFire',-1,fires)
				TriggerClientEvent('esx_fireman:startFire', -1, fires, 'dumpster')
				fireStarted = true
			elseif firemen == 2 or firemen == 3 then
				local coords   = Config.SmallFires[math.random(1, #Config.SmallFires)].coords
				local spread   = Config.MaxSmallFireSpread
				local numfires = math.random(1, Config.MaxSmallFires)

				for i = 1, numfires, 1 do
					if i == 1 then
						table.insert(fires, { spread = spread, coords = { x = coords.x, y = coords.y, z = coords.z } })
					else
						table.insert(fires,
									 { spread = spread, coords = { x = coords.x + math.random(1,
																							  5), y = coords.y + math.random(1,
																															 5), z = coords.z } })
					end
				end

				-- TriggerClientEvent('esx_fireman:startDumpsterFire',-1,fires)
				TriggerClientEvent('esx_fireman:startFire', -1, fires, 'small')
				fireStarted = true
			elseif firemen == 4 or firemen == 5 then
				local coords   = Config.MediumFires[math.random(1, #Config.MediumFires)].coords
				local spread   = Config.MaxMediumFireSpread
				local numfires = math.random(1, Config.MaxMedFires)

				-- Start random medium fire
				for i = 1, numfires, 1 do
					if i == 1 then
						table.insert(fires, { spread = spread, coords = { x = coords.x, y = coords.y, z = coords.z } })
					else
						table.insert(fires,
									 { spread = spread, coords = { x = coords.x + math.random(1,
																							  5), y = coords.y + math.random(1,
																															 5), z = coords.z } })
					end
				end

				-- TriggerClientEvent('esx_fireman:startDumpsterFire',-1,fires)
				TriggerClientEvent('esx_fireman:startFire', -1, fires, 'medium')
				fireStarted = true
			elseif firemen > 5 then
				local coords   = Config.LargeFires[math.random(1, #Config.LargeFires)].coords
				local spread   = Config.MaxLargeFireSpread
				local numfires = math.random(Config.MinLargeFires, Config.MaxLargeFires)

				-- Start random large fire
				for i = 1, numfires, 1 do
					if i == 1 then
						table.insert(fires, { spread = spread, coords = { x = coords.x, y = coords.y, z = coords.z } })
					else
						table.insert(fires,
									 { spread = spread, coords = { x = coords.x + math.random(1,
																							  5), y = coords.y + math.random(1,
																															 5), z = coords.z } })
					end
				end

				-- TriggerClientEvent('esx_fireman:startDumpsterFire',-1,fires)
				TriggerClientEvent('esx_fireman:startFire', -1, fires, 'large')
				fireStarted = true
			end
			fireProbability = Config.FireChance -- Reset the fire start chance to default

		else
			fireProbability = fireProbability + Config.FireChanceIncrease -- Defaults to +5%
		end
	end
end)

function GetFDOnline()
	local firemen = 0
	local players = ESX.GetPlayers()

	for i = 1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])

		if xPlayer.job.name == 'fireman' then
			firemen = firemen + 1
		end
	end

	return firemen
end

RegisterServerEvent('esx_fireman:giveWeapon')
AddEventHandler('esx_fireman:giveWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_fireman:removeWeapon')
AddEventHandler('esx_fireman:removeWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_fireman:giveItem')
AddEventHandler('esx_fireman:giveItem', function(itemName, itemCount)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local playerItem = xPlayer.getInventoryItem(itemName)

	if playerItem.limit == -1 or (playerItem.count + itemCount) < playerItem.limit then
		xPlayer.addInventoryItem(itemName, itemCount)
	end
end)
