ESX           = nil
Citizen.CreateThread( function() while ESX == nil do TriggerEvent("esx:getSharedObject",function(obj) ESX = obj end) Citizen.Wait(0) end end)

RegisterNetEvent('tcrp-crime:lowCopsAlert')
AddEventHandler('tcrp-crime:lowCopsAlert', function()
    TriggerEvent('tcrp:displayGeneral', 'Not enough cops to start the robbery! Try again later.')
end)