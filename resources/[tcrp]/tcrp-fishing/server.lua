ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('fish', function(source)
	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "fish")		
		xPlayer.removeInventoryItem('fish', 1)
		TriggerClientEvent('fishing:message', _source, "You attach the fish onto your fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "You dont have a fishing rod")
	end
end)

ESX.RegisterUsableItem('fishbait', function(source)
	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "fishbait")		
		xPlayer.removeInventoryItem('fishbait', 1)
		TriggerClientEvent('fishing:message', _source, "You attach the fish bait onto your fishing rod")		
	else
		TriggerClientEvent('fishing:message', _source, "You dont have a fishing rod")
	end	
end)

ESX.RegisterUsableItem('fishingrod', function(source)
	local _source = source
	TriggerClientEvent('fishing:fishstart', _source)
end)

-- Start catching shit			
RegisterNetEvent('fishing:catch')
AddEventHandler('fishing:catch', function(bait, playerCoords)
	local _source = source
	local weight = 2
	local item
	local model 
	local label
	local rnd = math.random(1,100)
	--rnd = 55 --for testing
	local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
	local endangered = false

	if bait == "none" then
		item = 'fish'
		model = 'A_C_fish'
		label = 'fish'
		if rnd >= 70 then
			weight = math.random(2,4)
		else
			weight = math.random(1,2)
		end
	end
	if bait == "fishbait" then
		item = 'fish'
		model = 'A_C_fish'
		label = 'fish'
		if rnd >= 75 then
			weight = math.random(4,11)
		else
			weight = math.random(3,6)
		end
	end
	if bait == "fish" then
		weight = 1 
		if rnd >= 55 and rnd <= 69 then --turtle
			item = 'turtle'
			label = 'turtle'
			if rnd >= 55 and rnd <= 61 then
				endangered = true
			end			
		elseif rnd >= 70 and rnd <= 79 then --stingray
			item = 'stingray'
			model = 'A_C_stingray'
			label = 'stingray'
			if rnd >= 70 and rnd <= 74 then
				endangered = true
			end
		elseif rnd >= 80 and rnd <= 89 then --tiger shark
			item = 'sharktiger'
			model = 'A_C_sharktiger'
			label = 'tiger shark'
			if rnd >= 80 and rnd <= 84 then
				endangered = true
			end
		else --fish
			item = 'fish'
			model = 'A_C_fish'
			label = 'fish'
			weight = math.random(1,2)
		end
	end
	if rnd >= 90 and rnd <= 100 and item ~= 'fish' then
		TriggerClientEvent('fishing:setbait', _source, "none")
		TriggerClientEvent('fishing:message', _source, "It was huge and broke your fishing rod!")
		TriggerClientEvent('fishing:break', _source)
		xPlayer.removeInventoryItem('fishingrod', 1)
	elseif item then
		TriggerClientEvent('fishing:setbait', _source, "none")
		local inventoryItem = xPlayer.getInventoryItem(item)
		if (inventoryItem.count + weight) > inventoryItem.limit then
			TriggerClientEvent('fishing:message', _source, "You cant hold more " .. label)
		else
			if weight > 1 then 
				TriggerClientEvent('fishing:message', _source, "You caught a " .. label .. ": "  .. weight .. "kg")
			else
				TriggerClientEvent('fishing:message', _source, "You caught a " .. label)
			end
			if model then
				TriggerClientEvent('fishing:spawnPed', _source, model)
			end
			xPlayer.addInventoryItem(item, weight)
		end
	end
	if endangered then
		for i = 1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer and xPlayer.job and xPlayer.job.name == 'police' or xPlayer.job.name == 'parkranger' then
				local blip = {["x"] = playerCoords.x, ["y"] = playerCoords.y, ["z"] = playerCoords.z, ["longrange"] = true, ["text"] = "[PD] Suspicious Activity", ["sprite"] = 404, ["color"] = 1, ["scale"] = 1.5, ["duration"] = 120}
				TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
								{ text = 'Suspicious Activity Reported in the Area'})
				TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
			end
		end	
	end
end)

RegisterServerEvent("fishing:RentBoat")
AddEventHandler("fishing:RentBoat", function(price, model, xyz, h)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		TriggerClientEvent('fishing:RentBoat', _source, model, xyz, h)
	else
		TriggerClientEvent('esx:showNotification', source, 'You do not have enough money.')
	end
end)

RegisterServerEvent('fishing:startSelling')
AddEventHandler('fishing:startSelling', function(item)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local types = {"fish"}
	if item == "illegal" then
		types = {
			"sharktiger",
			"stingray",
			"turtle"
		}
	end
	for i = 1, #types do
		local type = types[i]
		local quantity = xPlayer.getInventoryItem(type).count
		if quantity >= 1 then
			local payment = math.random(Config.prices[type].min, Config.prices[type].max) * quantity
			xPlayer.addMoney(payment)
			xPlayer.removeInventoryItem(type, quantity)
			TriggerClientEvent('esx:showNotification', source, 'You sold ' .. quantity .. ' ' .. type .. ' for $' .. payment)	
		end
	end
end)
