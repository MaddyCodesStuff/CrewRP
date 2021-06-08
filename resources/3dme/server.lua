RegisterCommand('me', function(source, args)
    local text = ''
    for i = 1, #args do
        text = text .. '  ' .. args[i]
    end
    text = text .. '  '
    TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
end)

RegisterNetEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text)
    TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
end)