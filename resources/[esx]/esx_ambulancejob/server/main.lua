ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'ambulance', Config.MaxInService)
end

RegisterServerEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'police' or xPlayer.job.name == 'fireman' or xPlayer.job.name == 'corrections' then
		TriggerClientEvent('esx_ambulancejob:revive', target)
	else
		print(('esx_ambulancejob: %s attempted to revive!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_ambulancejob:OutVehicle')
AddEventHandler('esx_ambulancejob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'fireman' then
		TriggerClientEvent('esx_ambulancejob:OutVehicle', target)
	else
		print(('esx_policejob: %s attempted to drag out from vehicle (not ems)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(target, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'fireman' then
		TriggerClientEvent('esx_ambulancejob:heal', target, type)
	else
		print(('esx_ambulancejob: %s attempted to heal!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'fireman' then
		TriggerClientEvent('esx_ambulancejob:putInVehicle', target)
	else
		print(('esx_ambulancejob: %s attempted to put in vehicle!'):format(xPlayer.identifier))
	end
end)

TriggerEvent('esx_phone:registerNumber', 'ambulance', "311 (LSMD)", true, true)

TriggerEvent('esx_society:registerSociety', 'ambulance', 'Ambulance', 'society_ambulance', 'society_ambulance',
			 'society_ambulance', { type = 'public' })

ESX.RegisterServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.RemoveCashAfterRPDeath then
		if xPlayer.getMoney() > 0 then
			xPlayer.removeMoney(xPlayer.getMoney())
		end

		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.setAccountMoney('black_money', 0)
		end
	end

	if Config.RemoveItemsAfterRPDeath then
		for i = 1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
	end

	local playerLoadout = {}
	if Config.RemoveWeaponsAfterRPDeath then
		for i = 1, #xPlayer.loadout, 1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	else
		-- save weapons & restore em' since spawnmanager removes them
		for i = 1, #xPlayer.loadout, 1 do
			table.insert(playerLoadout, xPlayer.loadout[i])
		end

		-- give back wepaons after a couple of seconds
		Citizen.CreateThread(function()
			Citizen.Wait(5000)
			for i = 1, #playerLoadout, 1 do
				if playerLoadout[i].label ~= nil then
					xPlayer.addWeapon(playerLoadout[i].name, playerLoadout[i].ammo)
				end
			end
		end)
	end

	cb()
end)

if Config.EarlyRespawnFine then
	ESX.RegisterServerCallback('esx_ambulancejob:checkBalance', function(source, cb)
		local xPlayer     = ESX.GetPlayerFromId(source)
		local bankBalance = xPlayer.getAccount('bank').money

		cb(bankBalance >= Config.EarlyRespawnFineAmount)
	end)

	RegisterServerEvent('esx_ambulancejob:payFine')
	AddEventHandler('esx_ambulancejob:payFine', function()
		local xPlayer    = ESX.GetPlayerFromId(source)
		local fineAmount = Config.EarlyRespawnFineAmount

		TriggerClientEvent('esx:showNotification', xPlayer.source,
						   _U('respawn_bleedout_fine_msg', ESX.Math.GroupDigits(fineAmount)))
		xPlayer.removeAccountMoney('bank', fineAmount)
	end)
end

ESX.RegisterServerCallback('esx_ambulancejob:getItemAmount', function(source, cb, item)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

ESX.RegisterServerCallback('esx_ambulancejob:buyJobVehicle', function(source, cb, vehicleProps, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price   = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

	-- vehicle model not found
	if price == 0 then
		print(('esx_ambulancejob: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
		cb(false)
	end

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, storage) VALUES (@owner, @vehicle, @plate, @type, @job, @stored)',
							{
								['@owner']   = xPlayer.identifier,
								['@vehicle'] = json.encode(vehicleProps),
								['@plate']   = vehicleProps.plate,
								['@type']    = type,
								['@job']     = xPlayer.job.name,
								['@stored']  = true
							}, function(rowsChanged)
				cb(true)
			end)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:storeNearbyVehicle', function(source, cb, nearbyVehicles)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundPlate, foundNum

	for k, v in ipairs(nearbyVehicles) do
		local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND job = @job',
										   {
											   ['@owner'] = xPlayer.identifier,
											   ['@plate'] = v.plate,
											   ['@job']   = xPlayer.job.name
										   })

		if result[1] then
			foundPlate, foundNum = result[1].plate, k
			break
		end
	end

	if not foundPlate then
		cb(false)
	else
		MySQL.Async.execute('UPDATE owned_vehicles SET storage = true WHERE owner = @owner AND plate = @plate AND job = @job',
							{
								['@owner'] = xPlayer.identifier,
								['@plate'] = foundPlate,
								['@job']   = xPlayer.job.name
							}, function(rowsChanged)
				if rowsChanged == 0 then
					print(('esx_ambulancejob: %s has exploited the garage!'):format(xPlayer.identifier))
					cb(false)
				else
					cb(true, foundNum)
				end
			end)
	end

end)

function getPriceFromHash(hashKey, jobGrade, type)
	if type == 'helicopter' then
		local vehicles = Config.AuthorizedHelicopters[jobGrade]

		for k, v in ipairs(vehicles) do
			if GetHashKey(v.model) == hashKey then
				return v.price
			end
		end
	elseif type == 'car' then
		local vehicles = Config.AuthorizedVehicles[jobGrade]

		for k, v in ipairs(vehicles) do
			if GetHashKey(v.model) == hashKey then
				return v.price
			end
		end
	end

	return 0
end

RegisterServerEvent('esx_ambulancejob:removeItem')
AddEventHandler('esx_ambulancejob:removeItem', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem(item, 1)

	if item == 'bandage' then
		TriggerClientEvent('esx:showNotification', _source, _U('used_bandage'))
	elseif item == 'medikit' then
		TriggerClientEvent('esx:showNotification', _source, _U('used_medikit'))
	end
end)

RegisterServerEvent('esx_ambulancejob:giveItem')
AddEventHandler('esx_ambulancejob:giveItem', function(itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name ~= 'ambulance' then
		print(('esx_ambulancejob: %s attempted to spawn in an item!'):format(xPlayer.identifier))
		return
	elseif (xPlayer.job.grade_name ~= 'physician' and xPlayer.job.grade_name ~= 'sp' and xPlayer.job.grade_name ~= 'gp' and xPlayer.job.grade_name ~= 'studentsurgeon' and
		xPlayer.job.grade_name ~= 'surgeon' and xPlayer.job.grade_name ~= 'chiefsurgery' and xPlayer.job.grade_name ~= 'cmo' and xPlayer.job.grade_name ~= 'boss') and
		(itemName == 'morphine' or itemName == 'vicodin' or itemName == 'hydrocodone') then
		TriggerClientEvent('esx:showNotification', source, 'You Do Not Have a Key for The Drug Locker')
		print(('esx_ambulancejob: %s attempted to spawn in an item!'):format(xPlayer.identifier))
		return
	elseif (itemName ~= 'bodyarmor_3' and itemName ~= 'tylenol' and itemName ~= 'scuba' and itemName ~= 'medikit' and itemName ~= 'bandage' and itemName ~= 'gauze' and itemName ~= 'firstaid' and itemName ~= 'morphine' and itemName ~= 'vicodin' and itemName ~= 'hydrocodone' and itemName ~= 'medkit' and itemName ~= 'wheelchair') then
		print(('esx_ambulancejob: %s attempted to spawn in an item!'):format(xPlayer.identifier))
		return
	end

	local xItem = xPlayer.getInventoryItem(itemName)
	local count = 1

	print(itemName)

	print(xItem.limit)
	if xItem.limit ~= -1 then
		count = xItem.limit - xItem.count
	end

	if xItem.count < xItem.limit then
		xPlayer.addInventoryItem(itemName, count)
		TriggerClientEvent('esx:showNotification', source, 'Given ' .. count .. 'x ' .. xItem.label)
	else
		TriggerClientEvent('esx:showNotification', source, _U('max_item'))
	end
end)

TriggerEvent('es:addGroupCommand', 'revive', 'admin', function(source, args, user)
	if args[1] ~= nil then
		if GetPlayerName(tonumber(args[1])) ~= nil then
			print(('esx_ambulancejob: %s used admin revive'):format(GetPlayerIdentifiers(source)[1]))
			TriggerClientEvent('esx_ambulancejob:revive', tonumber(args[1]))
		end
	else
		TriggerClientEvent('esx_ambulancejob:revive', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, { help = _U('revive_help'), params = { { name = 'id' } } })

ESX.RegisterUsableItem('medikit', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('medikit', 1)

	TriggerClientEvent('esx_ambulancejob:heal', _source, 'big')
	TriggerClientEvent('esx:showNotification', _source, _U('used_medikit'))
end)

ESX.RegisterUsableItem('bandage', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('bandage', 1)

	TriggerClientEvent('esx_ambulancejob:heal', _source, 'small')
	TriggerClientEvent('esx:showNotification', _source, _U('used_bandage'))
end)

ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchScalar('SELECT is_dead FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(isDead)
		if isDead then
			print(('esx_ambulancejob: %s attempted combat logging!'):format(identifier))
		end

		cb(isDead)
	end)
end)

RegisterServerEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(isDead)
	local identifier = GetPlayerIdentifiers(source)[1]

	MySQL.Sync.execute('UPDATE users SET is_dead = @isDead WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@isDead']     = isDead
	})
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_ambulancejob:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'ambulance')
	end
end)

RegisterServerEvent('esx_ambulancejob:spawned')
AddEventHandler('esx_ambulancejob:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'ambulance' then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_ambulancejob:updateBlip', -1)
		TriggerEvent('eblips:add', { name = GetPlayerName(_source), src = _source, color = 1 })
	end
end)

RegisterServerEvent('esx_ambulancejob:forceBlip')
AddEventHandler('esx_ambulancejob:forceBlip', function()
	TriggerClientEvent('esx_ambulancejob:updateBlip', -1)
end)

AddEventHandler('playerDropped', function()
	-- Save the source in case we lose it (which happens a lot)
	local _source = source

	-- Did the player ever join?
	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)

		-- Is it worth telling all clients to refresh?
		if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'ambulance' then
			Citizen.Wait(5000)
			TriggerClientEvent('esx_ambulancejob:updateBlip', -1)
		end
	end
end)
