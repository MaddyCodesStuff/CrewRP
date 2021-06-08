ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('newsCam', function(source)

    TriggerClientEvent("Cam:ToggleCam", source)

end)

ESX.RegisterUsableItem('newsBMic', function(source)

    TriggerClientEvent("Mic:ToggleBMic", source)

end)

ESX.RegisterUsableItem('newsMic', function(source)

    TriggerClientEvent("Mic:ToggleMic", source)

end)
