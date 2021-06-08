-- Define the variable used to open/close the tab
local tabEnabled = false

function REQUEST_NUI_FOCUS(state)
    SendNUIMessage({ tabState = true, showTab = state })
end

RegisterNUICallback("tablet-bus", function(data, cb)
    cb('ok')
    local state = data.showState
    SetNuiFocus(state, state)
    tabEnabled = state
    if state then
        TriggerEvent('emote:do', 'tablet')
    else
        TriggerEvent('emote:cancel')
    end
end)

RegisterNUICallback('tablet-initialized', function(_, cb)
    cb('ok')
    REQUEST_NUI_FOCUS(false)
end)

RegisterNUICallback('mark-bill-paid', function(data, cb)
    cb('ok')
    TriggerServerEvent('esx_billing:markBillPaid', data.id)
end)

Citizen.CreateThread(function()
    while true do
        if not tabEnabled and IsControlJustPressed(0, 244) and GetLastInputMethod(0) then
            REQUEST_NUI_FOCUS(true)
        elseif tabEnabled then
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 47, true) -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
        end
        Citizen.Wait(1)
    end
end)

-- Show overdue fines button for PD
Citizen.CreateThread(function()
    while true do
        Wait(5000)
        TriggerEvent('esx_policejob:IsPlayerPolice', function(isPolice)
            SendNUIMessage({
                police_check = true,
                check = isPolice
            })
        end)
    end
end)

-- Send overdue bills to tab
RegisterNetEvent('tab:unpaidBills')
AddEventHandler('tab:unpaidBills', function(unpaidBills)
    SendNUIMessage({ bills = unpaidBills })
end)