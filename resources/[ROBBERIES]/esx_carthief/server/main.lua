ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

local activity       = 0
local activitySource = 0
local cooldown       = 0

RegisterServerEvent('esx_carthief:pay')
AddEventHandler('esx_carthief:pay', function(payment)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--xPlayer.addAccountMoney('black_money',tonumber(payment))
	xPlayer.addMoney(tonumber(payment))
	TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source, { text = "Received $" .. payment .. "." })
	--Add cooldown
	cooldown = Config.CooldownMinutes * 60000
end)

RegisterServerEvent('esx_carthief:payDamaged')
AddEventHandler('esx_carthief:payDamaged', function(payment)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--xPlayer.addAccountMoney('black_money',tonumber(payment))
	xPlayer.addMoney(tonumber(payment))
	TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source,
					   { text = "Received $" .. payment .. ". For delivering a damaged vehicle." })
	--Add cooldown
	cooldown = Config.CooldownMinutes * 60000
end)

ESX.RegisterServerCallback('esx_carthief:anycops', function(source, cb)
	local anycops    = 0
	local playerList = ESX.GetPlayers()
	for i = 1, #playerList, 1 do
		local _source   = playerList[i]
		local xPlayer   = ESX.GetPlayerFromId(_source)
		local playerjob = xPlayer.job.name
		if playerjob == 'police' then
			anycops = anycops + 1
		end
	end
	cb(anycops)
end)

ESX.RegisterServerCallback('esx_carthief:isActive', function(source, cb)
	cb(activity, cooldown)
end)

RegisterServerEvent('esx_carthief:registerActivity')
AddEventHandler('esx_carthief:registerActivity', function(value)
	activity = value
	if value == 1 then
		activitySource = source
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i = 1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'journalist' then
				TriggerClientEvent('esx_carthief:setcopnotification', xPlayers[i])
			end
		end
	else
		activitySource = 0
	end
end)

RegisterServerEvent('esx_carthief:alertcops')
AddEventHandler('esx_carthief:alertcops', function(coords)
	local source   = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'journalist' then
			local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["text"] = "[PD] Car Boost", ["sprite"] = 161, ["color"] = 8, ["scale"] = 1.0, ["duration"] = Config.BlipUpdateTime}
			TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
		end
	end
end)

AddEventHandler('playerDropped', function()
	local _source = source
	if _source == activitySource then
		--Set activity to 0
		activity       = 0
		activitySource = 0
	end
end)

--Cooldown manager
AddEventHandler('onResourceStart', function(resource)
	while true do
		Wait(5000)
		if cooldown > 0 then
			cooldown = cooldown - 5000
		end
	end
end)
