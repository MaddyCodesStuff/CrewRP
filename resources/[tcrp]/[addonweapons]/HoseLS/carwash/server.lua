-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Pass vehicle dirt level over to server and then back to client (attempt to sync it)
-----------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('wash_car:sync')
AddEventHandler('wash_car:sync', function(vehicle, dirtLevel)

	local src = source
	local veh = vehicle
	local dirt = dirtLevel
	
	TriggerClientEvent('setDirt', source, veh, dirt)
end)