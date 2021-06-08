RegisterServerEvent('heli:togglecam')
AddEventHandler('heli:togglecam', function( camonoff)
	TriggerClientEvent('tcrphud:toggleHud', source, camonoff)
end)