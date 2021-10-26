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

RegisterCommand('chaos', function()
    TriggerServerEvent('admin:chaos')
end)

RegisterCommand('peace', function()
    TriggerServerEvent('admin:peace')
end)

RegisterNetEvent("admin:toggleChaos")
AddEventHandler("admin:toggleChaos", function(state)
    SetRiotModeEnabled(state)
    if state == true then
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    else
        StopAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    end
end)

RegisterNetEvent("admin:godmode")
AddEventHandler("admin:godmode", function()
    exports['mythic_notify']:SendAlert('success', 'God Mode Activated')
    SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
end)

RegisterNetEvent("admin:godmodeoff")
AddEventHandler("admin:godmodeoff", function()
    exports['mythic_notify']:SendAlert('error', 'God Mode Deactivated')
    SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
end)