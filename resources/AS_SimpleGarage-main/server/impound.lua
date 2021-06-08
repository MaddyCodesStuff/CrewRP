ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('AS_SimpleGarage:ImpoundVoertuig')
AddEventHandler('AS_SimpleGarage:ImpoundVoertuig', function(plate, vehicleProps, price)
    local impound = "1"
	MySQL.Sync.execute("UPDATE owned_vehicles SET impounded=@impound WHERE plate=@plate",{['@impound'] = impound , ['@plate'] = plate})
	MySQL.Sync.execute("UPDATE owned_vehicles SET spawnstate=@spawnstate WHERE plate=@plate",{['@spawnstate'] = true , ['@plate'] = plate})
	MySQL.Sync.execute("UPDATE owned_vehicles SET vehicle=@newVehicle WHERE plate=@plate",{['@newVehicle'] = json.encode(vehicleProps) , ['@plate'] = plate})
	MySQL.Sync.execute("UPDATE owned_vehicles SET impoundprice=@impoundPrice WHERE plate=@plate",{['@impoundPrice'] = price , ['@plate'] = plate})
end)


RegisterServerEvent('AS_SimpleGarage:GiveMoney')
AddEventHandler('AS_SimpleGarage:GiveMoney', function(plate, vehicleProps, price, mech)
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = math.random(20,50)
	xPlayer.addMoney(money)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You received $'..money})
end)

RegisterServerEvent('AS_SimpleGarage:UitImpound')
AddEventHandler('AS_SimpleGarage:UitImpound', function(plate)
	local impound = "0"
	local impoundprice = "0"
	MySQL.Sync.execute("UPDATE owned_vehicles SET impounded=@impound WHERE plate=@plate",{['@impound'] = impound , ['@plate'] = plate})
	MySQL.Sync.execute("UPDATE owned_vehicles SET impoundprice=@impoundprice WHERE plate=@plate",{['@impoundprice'] = impoundprice , ['@plate'] = plate})	
end)

ESX.RegisterServerCallback('AS_SimpleGarage:isOwned', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('AS_SimpleGarage:checkMoney', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.get('bank') >= price then
		xPlayer.removeAccountMoney('bank', price)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback("AS_SimpleGarage:checkImpounded", function(source, callback, type)
	local player = ESX.GetPlayerFromId(source)

	if player then
		local sqlQuery = [[
			SELECT
				plate, vehicle, impoundprice
			FROM
				owned_vehicles
			WHERE
				owner = @cid and impounded = @impounded and type = @type
		]]

		MySQL.Async.fetchAll(sqlQuery, {
			["@cid"] = player["identifier"],
			["@impounded"] = '1',
			["@type"] = type
		}, function(responses)
			local playerVehicles = {}

			for key, vehicleData in ipairs(responses) do
				table.insert(playerVehicles, {
					["plate"] = vehicleData["plate"],
					["props"] = json.decode(vehicleData["vehicle"]),
					["impoundprice"] = vehicleData["impoundprice"]
				})
			end

			callback(playerVehicles)
		end)
	else
		callback(false)
	end
end)