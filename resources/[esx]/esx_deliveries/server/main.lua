ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Register events

RegisterServerEvent('esx_deliveries:finishDelivery:server')
RegisterServerEvent('esx_deliveries:removeSafeMoney:server')

-- Finish delivery mission event

AddEventHandler('esx_deliveries:finishDelivery:server', function(deliveryType)
    local xPlayer = ESX.GetPlayerFromId(source)
	local deliveryMoney = 0
	for k, v in pairs(Config.Rewards) do
		if k == deliveryType then
			deliveryMoney = v
			break
		end
	end
	
    xPlayer.addMoney(deliveryMoney)
	TriggerClientEvent('esx:showNotification', source, ("Delivery Payment $") .. tostring(deliveryMoney))
end)

-- Remove safe deposit event (On start mission)

AddEventHandler('esx_deliveries:removeSafeMoney:server', function(deliveryType)
    local xPlayer = ESX.GetPlayerFromId(source)

		TriggerClientEvent('esx_deliveries:startJob:client', source, deliveryType)
end)
