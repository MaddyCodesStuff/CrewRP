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
    TriggerEvent('chat:addSuggestion', '/notifyPD', 'Report Suspicious Activity at your Location', {
    })
    TriggerEvent('chat:addSuggestion', '/notifyFD', 'Report A Fire at Your Location', {
    })
    TriggerEvent('chat:addSuggestion', '/notifyEMS', 'Report a Medical Emergency at Your Location', {
    })
end)

RegisterCommand('help', function()
    TriggerEvent('tcrp-input:OpenInput', "Please provide a message with your ticket.", "longtext", 255, function(result)
        if result ~= nil or result ~= '' then
            TriggerServerEvent('tcrp-adminhelp:submit', result)
        end
    end)
end)

RegisterCommand('notifyPD', function()
    TriggerEvent('tcrp-input:OpenInput', "Please provide a message with your ticket.", "longtext", 255, function(result)
        if result ~= nil or result ~= '' then
            TriggerServerEvent('adminCmnd:notifyPD', result)
        end
    end)
end)

RegisterCommand('notifyFD', function()
    TriggerEvent('tcrp-input:OpenInput', "Please provide a message with your ticket.", "longtext", 255, function(result)
        if result ~= nil or result ~= '' then
            TriggerServerEvent('adminCmnd:notifyFD', result)
        end
    end)
end)

RegisterCommand('notifyEMS', function()
    TriggerEvent('tcrp-input:OpenInput', "Please provide a message with your ticket.", "longtext", 255, function(result)
        if result ~= nil or result ~= '' then
            TriggerServerEvent('adminCmnd:notifyEMS', result)
        end
    end)
end)

