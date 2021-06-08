ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

-- Binoculars
ESX.RegisterUsableItem('binoculars', function(source)
	TriggerClientEvent('esx_gadgets:useBinoculars', source)
end)

-- Parachute
ESX.RegisterUsableItem('parachute', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('parachute', 1)
	TriggerClientEvent('esx_gadgets:useParachute', source)
	TriggerClientEvent('esx:showNotification', source, "Parachute Equipped!")
end)

-- Scuba gear
ESX.RegisterUsableItem('scuba', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('scuba', 1)
	TriggerClientEvent('esx_gadgets:useScuba', source)
end)

-- Night vision goggles
ESX.RegisterUsableItem('nightvision', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent('esx_gadgets:useNightVision', source)
end)

-- Thermal goggles
ESX.RegisterUsableItem('thermalvision', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
					   { text = 'Your Thermal Goggles are broken. Unable to use.' })
end)
