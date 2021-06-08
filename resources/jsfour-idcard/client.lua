local open = false

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function(data, type)
    open = true
    SendNUIMessage({
                       action = "open",
                       array  = data,
                       type   = type
                   })
end)

-- Close ID card
RegisterNetEvent('jsfour-idcard:close')
AddEventHandler('jsfour-idcard:close', function()
    open = false
    SendNUIMessage({
        action = "close"
    })
end)

-- Key events
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
            TriggerEvent('jsfour-idcard:close')
        end
    end
end)