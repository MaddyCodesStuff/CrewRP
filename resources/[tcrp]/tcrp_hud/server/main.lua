ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('baseevents:enteringVehicle')
AddEventHandler('baseevents:enteringVehicle', function(currentVehicle, currentSeat, displayname, netId)
    TriggerClientEvent('disc-hud:EnteringVehicle', source, currentVehicle, currentSeat, displayname, netId)
end)

RegisterServerEvent('baseevents:enteringAborted')
AddEventHandler('baseevents:enteringAborted', function()
    TriggerClientEvent('disc-hud:EnteringVehicleAborted', source)
end)


RegisterServerEvent('baseevents:enteredVehicle')
AddEventHandler('baseevents:enteredVehicle', function(currentVehicle, currentSeat, displayname)
    TriggerClientEvent('disc-hud:EnteredVehicle', source, currentVehicle, currentSeat, displayname)
end)

RegisterServerEvent('baseevents:leftVehicle')
AddEventHandler('baseevents:leftVehicle', function(currentVehicle, currentSeat, displayname)
    TriggerClientEvent('disc-hud:LeftVehicle', source, currentVehicle, currentSeat, displayname)
end)

RegisterServerEvent('tcrp:textmessage')
AddEventHandler('tcrp:textmessage', function(sender)
    TriggerClientEvent('tcrp:displayTextMessage', source, sender)
end)

RegisterServerEvent('tcrp:phonecall')
AddEventHandler('tcrp:phonecall', function(sender)
    TriggerClientEvent('tcrp:displayPhoneCall', source, sender)
end)

RegisterServerEvent('tcrp:bankbnotif')
AddEventHandler('tcrp:bankbnotif', function(cash)
    TriggerClientEvent('tcrp:displayBank', source, cash)
end)

RegisterServerEvent('tcrp:generalnotif')
AddEventHandler('tcrp:generalnotif', function(message)
    TriggerClientEvent('tcrp:displayGeneral', source, message)
end)

ESX.RegisterServerCallback('disc-hud:getMoney', function(source, cb)
    local player = ESX.GetPlayerFromId(source)
    cb({
           cash = player.getMoney(),
           bank = player.getAccount('bank').money
       })
end)