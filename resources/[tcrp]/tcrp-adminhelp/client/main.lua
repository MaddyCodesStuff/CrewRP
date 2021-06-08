ESX = nil

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('playerSpawned', function()
    TriggerEvent('chat:addSuggestion', '/help', 'Submit an in-game ticket to request an admin.', {
    })
end)

RegisterCommand('help', function()
    TriggerEvent('tcrp-input:OpenInput', "Please provide a message with your ticket.", "longtext", 255, function(result)
        if result ~= nil or result ~= '' then
            TriggerServerEvent('tcrp-adminhelp:submit', result)
        end
    end)
end)