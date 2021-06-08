ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('AS_SimpleGarage:VeranderSpawnStatus')
AddEventHandler('AS_SimpleGarage:VeranderSpawnStatus', function(plate, spawnstate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicles = getPlayerVehicles(xPlayer.getIdentifier())
	local spawnstate = spawnstate
	for _,v in pairs(vehicles) do
		MySQL.Sync.execute("UPDATE owned_vehicles SET spawnstate =@spawnstate WHERE plate=@plate",{['@spawnstate'] = spawnstate , ['@plate'] = plate})
		break		
	end
end)


RegisterServerEvent('AS_SimpleGarage:moveCars')
AddEventHandler('AS_SimpleGarage:moveCars', function(name, owner)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Sync.execute("UPDATE owned_vehicles SET impounded = 1, impoundprice = 1000, garage = 'BUS STATION (PUBLIC)' WHERE garage=@name AND owner = @owner",{['@name'] = name:gsub('%d+', '') , ['@owner'] = owner})
end)

function getPlayerVehicles(identifier)
	local vehicles = {}
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE type = 'car' AND owner=@identifier",{['@identifier'] = identifier})	
	for _,v in pairs(data) do
		local vehicle = json.decode(v.vehicle)
		table.insert(vehicles, {id = v.id, plate = v.plate})
	end
	return vehicles
end

RegisterServerEvent('AS_SimpleGarage:MoveToImpound')
AddEventHandler('AS_SimpleGarage:MoveToImpound', function(plate, spawnstate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicles = getPlayerVehicles(xPlayer.getIdentifier())
	local spawnstate = spawnstate
	for _,v in pairs(vehicles) do
		MySQL.Sync.execute("UPDATE owned_vehicles SET spawnstate =@spawnstate WHERE plate=@plate",{['@spawnstate'] = spawnstate , ['@plate'] = plate})
		break		
	end
end)



-- AddEventHandler('onMySQLReady', function()

-- 	MySQL.Sync.execute("UPDATE owned_vehicles SET spawnstate=true WHERE spawnstate=false", {})

-- end)

RegisterServerEvent('AS_SimpleGarage:storeLostVehicles')
AddEventHandler('AS_SimpleGarage:storeLostVehicles', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute("UPDATE owned_vehicles SET spawnstate=1 WHERE owner=@owner",
                        {
                            ['@owner']     = xPlayer.identifier
                        })

end)

ESX.RegisterServerCallback('AS_SimpleGarage:checkLocked',function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	local islocked = MySQL.Sync.fetchScalar("SELECT lockcheck AS  locked FROM owned_vehicles o WHERE  o.PLATE = @plate UNION SELECT locked FROM job_cars j WHERE j.plate = @plate", {['@plate'] = plate}) 

	
	if islocked == "no" or islocked == '1' then
		cb(false)
	elseif islocked == "yes" or islocked == '0' then
		cb(true)
	end
end)

ESX.RegisterServerCallback('AS_SimpleGarage:IsVehicleOwner',function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT o.owner, o.plate FROM owned_vehicles o  WHERE o.owner = @owner AND o.plate = @plate UNION SELECT j.owner, j.plate FROM job_cars j WHERE j.owner = @owner AND j.plate = @plate', {
		['@owner'] = xPlayer.identifier,
		['@plate'] = plate
	}, function (result)
		if result[1] then -- does the owner match?
			cb(true)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('AS_SimpleGarage:checkVehType',function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT type  FROM owned_vehicles o  WHERE o.owner = @owner AND o.plate = @plate', {
		['@owner'] = xPlayer.identifier,
		['@plate'] = plate
	}, function (result)
		for i, v in pairs(result) do
			
			cb(v["type"])
		end
		
	end)
	
end)

ESX.RegisterServerCallback('AS_SimpleGarage:printToCMD', function(source, name)
	
		print(name)
	
end)

ESX.RegisterServerCallback('AS_SimpleGarage:getOwnedProperties', function(source, cb, name)
    local _source    = source
	local xPlayer    = ESX.GetPlayerFromId(_source)
	
	
	MySQL.Async.fetchAll("SELECT o.name, o.owner FROM owned_properties o WHERE o.name like @name AND owner = @owner", {
		['@name'] = '%' .. name .. '%', 
		['@owner'] = xPlayer.identifier
	}, function (result)
		if result[1] then
			cb(true)
		else
			cb(false)
		end
	end)

end)

ESX.RegisterServerCallback('AS_SimpleGarage:getOwnedHouses', function(source, cb)
    local _source    = source
	local xPlayer    = ESX.GetPlayerFromId(_source)
	local houseTbl = {}
	
	MySQL.Async.fetchAll("SELECT DISTINCT h.name, h.garage_out, h.garage_spawn FROM housing h RIGHT OUTER JOIN owner_keys o ON o.owner = h.owner WHERE (h.owner = @identifier OR o.receiver = @identifier) UNION SELECT DISTINCT  h.name,  h.garage_out, h.garage_spawn FROM housing h LEFT OUTER JOIN owner_keys o ON o.owner = h.owner WHERE (h.owner = @identifier OR o.receiver = @identifier)", {
		['@identifier'] = xPlayer.identifier
	}, function (result)
		for i, v in pairs(result) do
			-- local vehicle = json.decode(v.vehicle)
			-- table.insert(vehicles, {id = v.id, plate = v.plate})
			local coordsIn = json.decode(v.garage_out)
			local coordsOut = json.decode(v.garage_spawn)
			table.insert(houseTbl, {gName = v.name , ["coords"] = { ["gIN"] = vector3(coordsIn["x"], coordsIn["y"], coordsIn["z"] + 1.0), ["gOut"] =  vector3(coordsOut["x"], coordsOut["y"], coordsOut["z"] + 1.3 ), ["heading"] = coordsOut["h"]}})
		end
		cb(houseTbl)
	end)
	

end)

RegisterCommand('givekeys', function(source, args)
	TriggerClientEvent('garage:giveKeys', source)
end)

RegisterCommand('dudewheresmycar', function(source, args)
	local _source    = source
	local xPlayer    = ESX.GetPlayerFromId(_source)
	local garages = {}
	
	MySQL.Async.fetchAll("SELECT DISTINCT garage FROM owned_vehicles  WHERE owner = @identifier and type = 'car'", {
		['@identifier'] = xPlayer.identifier
	}, function (result)
		for i, v in pairs(result) do
			table.insert(garages, v.garage)
		end
		TriggerClientEvent('garage:wheresMyCar', source, garages)
	end)
	
end)

RegisterServerEvent('AS_SimpleGarage:GiveKeysOwner')
AddEventHandler('AS_SimpleGarage:GiveKeysOwner', function(plate, newOwner)
	xPlayer = ESX.GetPlayerFromId(newOwner)
	MySQL.Sync.execute("UPDATE owned_vehicles SET owner = @newOwner WHERE plate = @plate", {['@newOwner'] = xPlayer.identifier , ['@plate'] = plate})
	TriggerClientEvent('mythic_notify:client:SendAlert', newOwner, { type = 'inform', text = 'Vehicle with plate '.. plate ..' given to you'})
end)

RegisterServerEvent('AS_SimpleGarage:addCarToDB')
AddEventHandler('AS_SimpleGarage:addCarToDB', function(plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Sync.execute("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)",
		{['@owner'] = xPlayer.identifier ,
		['@plate'] = plate.plate ,
		['@vehicle'] = json.encode(plate) })	

end)


RegisterServerEvent('AS_SimpleGarage:changeLockStatus')
AddEventHandler('AS_SimpleGarage:changeLockStatus', function(plate)

	local statusyes = "yes"
	local statusno = "no"
	local islocked = MySQL.Sync.fetchScalar("SELECT lockcheck AS  locked FROM owned_vehicles o WHERE  o.PLATE = @plate UNION SELECT locked FROM job_cars j WHERE j.plate = @plate", {['@plate'] = plate}) 
	
	if islocked == "no"  then
		MySQL.Sync.execute("UPDATE owned_vehicles SET lockcheck=@status WHERE plate=@plate",{['@status'] = statusyes , ['@plate'] = plate})	
	elseif islocked == "yes" then
		MySQL.Sync.execute("UPDATE owned_vehicles SET lockcheck=@status WHERE plate=@plate",{['@status'] = statusno , ['@plate'] = plate})	
	elseif islocked == "1" then
		MySQL.Sync.execute('UPDATE job_cars SET locked = @status WHERE plate = @plate', {
			['@status'] = '0',
			['@plate']  = plate
		})
	elseif islocked == '0' then
		MySQL.Sync.execute('UPDATE job_cars SET locked = @status WHERE plate = @plate', {
			['@status'] = '1',
			['@plate']  = plate
		})
	end

	local isLockedJobCars = MySQL.Sync.fetchScalar("SELECT locked FROM job_cars WHERE plate = @plate", {['@plate'] = plate}) 

	if isLockedJobCars == 0 then
		MySQL.Sync.execute('UPDATE `job_cars` SET locked = @status WHERE plate = @plate', {
			['@status'] = 1,
			['@plate']  = plate
		})	
	elseif isLockedJobCars == 1 then
		MySQL.Sync.execute('UPDATE `job_cars` SET locked = @status WHERE plate = @plate', {
			['@status'] = 0,
			['@plate']  = plate
		})	
	end
	
	
end)

RegisterServerEvent('AS_SimpleGarage:registerVehicle')
AddEventHandler('AS_SimpleGarage:registerVehicle', function(plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local status = "yes"
	MySQL.Sync.execute("UPDATE owned_vehicles SET registered=@status WHERE plate=@plate",{['@status'] = status , ['@plate'] = plate})
end)

ESX.RegisterServerCallback('AS_SimpleGarage:checkRegistered',function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isRegistered = MySQL.Sync.fetchScalar("SELECT registered FROM owned_vehicles WHERE type = 'car' AND plate = @plate", {['@plate'] = plate}) 
	
	if isRegistered == "no" then
		cb(false)
	elseif isRegistered == "yes" then
		cb(true)
	end
end)

ESX.RegisterServerCallback("garage:fetchPlayerVehicles", function(source, callback, garage)
	local player = ESX.GetPlayerFromId(source)

	if player then
		if garage:find("AIRPORT", 1, true) then
			local sqlQuery = [[
				SELECT
					plate, vehicle
				FROM
					owned_vehicles
				WHERE
					owner = @cid AND type = 'aircraft AND spawnstate = 1' 
			]]

			if garage then
				sqlQuery = [[
					SELECT
						plate, vehicle
					FROM
						owned_vehicles
					WHERE
						owner = @cid and garage = @garage and impounded = @impounded AND type = 'aircraft' AND spawnstate = 1
				]]
			end

			MySQL.Async.fetchAll(sqlQuery, {
				["@cid"] = player["identifier"],
				["@garage"] = garage,
				["@impounded"] = 'no'
			}, function(responses)
				local playerVehicles = {}

				for key, vehicleData in ipairs(responses) do
					table.insert(playerVehicles, {
						["plate"] = vehicleData["plate"],
						["props"] = json.decode(vehicleData["vehicle"])
					})
				end

				callback(playerVehicles)
			end)
		elseif garage:find("DOCK", 1, true) then
			
			local sqlQuery = [[
				SELECT
					plate, vehicle
				FROM
					owned_vehicles
				WHERE
					owner = @cid AND type = 'boat' AND spawnstate = 1
			]]

			if garage then
				sqlQuery = [[
					SELECT
						plate, vehicle
					FROM
						owned_vehicles
					WHERE
						owner = @cid and garage = @garage and impounded = @impounded AND type = 'boat' AND spawnstate = 1
				]]
			end

			MySQL.Async.fetchAll(sqlQuery, {
				["@cid"] = player["identifier"],
				["@garage"] = garage,
				["@impounded"] = 'no'
			}, function(responses)
				local playerVehicles = {}

				for key, vehicleData in ipairs(responses) do
					table.insert(playerVehicles, {
						["plate"] = vehicleData["plate"],
						["props"] = json.decode(vehicleData["vehicle"])
					})
				end

				callback(playerVehicles)
			end)
		else
			local sqlQuery = [[
					SELECT
						plate, vehicle
					FROM
						owned_vehicles
					WHERE
						owner = @cid AND type = 'car' AND spawnstate = 1
				]]
	
				if garage then
					sqlQuery = [[
						SELECT
							plate, vehicle
						FROM
							owned_vehicles
						WHERE
							owner = @cid and garage = @garage and impounded = @impounded AND type = 'car' AND spawnstate = 1
					]]
				end
	
				MySQL.Async.fetchAll(sqlQuery, {
					["@cid"] = player["identifier"],
					["@garage"] = garage,
					["@impounded"] = 'no'
				}, function(responses)
					local playerVehicles = {}
	
					for key, vehicleData in ipairs(responses) do
						table.insert(playerVehicles, {
							["plate"] = vehicleData["plate"],
							["props"] = json.decode(vehicleData["vehicle"])
						})
					end
	
					callback(playerVehicles)
				end)
		end
	else
		callback(false)
	end
end)


ESX.RegisterServerCallback("garage:validateVehicle", function(source, callback, vehicleProps, garage)
	local player = ESX.GetPlayerFromId(source)

	if player then
		if garage:find("AIRPORT", 1, true) then
			local sqlQuery = [[
				SELECT
					owner
				FROM
					owned_vehicles
				WHERE
					plate = @plate AND type = 'aircraft'
			]]

			MySQL.Async.fetchAll(sqlQuery, {
				["@plate"] = vehicleProps["plate"]
			}, function(responses)
				if responses[1] then
					UpdateGarage(vehicleProps, garage)

					callback(true)
				else
					callback(false)
				end
			end)
		elseif garage:find("DOCK", 1, true) then
			local sqlQuery = [[
				SELECT
					owner
				FROM
					owned_vehicles
				WHERE
					plate = @plate AND type = 'boat'
			]]

			MySQL.Async.fetchAll(sqlQuery, {
				["@plate"] = vehicleProps["plate"]
			}, function(responses)
				if responses[1] then
					UpdateGarage(vehicleProps, garage)

					callback(true)
				else
					callback(false)
				end
			end)
		else
			local sqlQuery = [[
				SELECT
					owner
				FROM
					owned_vehicles
				WHERE
					plate = @plate AND type = 'car'
			]]

			MySQL.Async.fetchAll(sqlQuery, {
				["@plate"] = vehicleProps["plate"]
			}, function(responses)
				if responses[1] then
					UpdateGarage(vehicleProps, garage)

					callback(true)
				else
					callback(false)
				end
			end)
		end
	else
		callback(false)
	end
end)

UpdateGarage = function(vehicleProps, newGarage)
	local sqlQuery = [[
		UPDATE
			owned_vehicles
		SET
			garage = @garage, vehicle = @newVehicle, spawnstate = @spawnstate
		WHERE
			plate = @plate
	]]

	MySQL.Async.execute(sqlQuery, {
		["@plate"] = vehicleProps["plate"],
		["@garage"] = newGarage,
		["@newVehicle"] = json.encode(vehicleProps),
		["@spawnstate"] = 1
	}, function(rowsChanged)
		if rowsChanged > 0 then
			
		end
	end)
end
