local showCounters  = true
local counts        = nil

RegisterCommand('counters', function()
    showCounters = not showCounters

    if showCounters then
        ShowUI()
    else
        HideUI()
    end
end)

RegisterNetEvent('counters:updateUI')
AddEventHandler('counters:updateUI', function(xPlayers)
    counts = {}
    for k, v in pairs(xPlayers) do
        counts[k] = v
    end

    UpdateUI()
end)

function UpdateUI()
    -- Update the counter UI
    SendNUIMessage({
                       action = 'update',
                       counts = counts,
                   })
end

function ShowUI()
    SendNUIMessage({
                      action = 'showui'
                  })
end

function HideUI()
    SendNUIMessage({
                        action = 'hideui'
                   })
end

-- Actually show the hud
Citizen.CreateThread(function()
    Citizen.Wait(0)

    if Config.EnableHud and showCounters then
        while counts == nil do
            Wait(1000)
        end
        ShowUI()
    end
end)