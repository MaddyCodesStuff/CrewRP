RegisterNetEvent('mythic_notify:client:SendAlert')
AddEventHandler('mythic_notify:client:SendAlert', function(data)
    SendAlert(data.type, data.text, data.length, data.style)
end)

RegisterNetEvent('mythic_notify:client:SendCopAlert')
AddEventHandler('mythic_notify:client:SendCopAlert', function(data)
    SendAlert('cop', data.text, 15000, data.style, data.title)
end)

RegisterNetEvent('mythic_notify:client:SendEMSAlert')
AddEventHandler('mythic_notify:client:SendEMSAlert', function(data)
    SendAlert('ems', data.text, 15000, data.style, data.title)
end)

RegisterNetEvent('mythic_notify:client:SendFireAlert')
AddEventHandler('mythic_notify:client:SendFireAlert', function(data)
    SendAlert('fire', data.text, 15000, data.style, data.title)
end)

RegisterNetEvent('mythic_notify:client:SendSuccessAlert')
AddEventHandler('mythic_notify:client:SendSuccessAlert', function(data)
    SendAlert('success', data.text, 15000, data.style, data.title)
end)

RegisterNetEvent('mythic_notify:client:SendErrorAlert')
AddEventHandler('mythic_notify:client:SendErrorAlert', function(data)
    SendAlert('error', data.text, 15000, data.style, data.title)
end)

RegisterNetEvent('mythic_notify:client:PersistentAlert')
AddEventHandler('mythic_notify:client:PersistentAlert', function(data)
    PersistentAlert(data.action, data.id, data.type, data.text, data.style)
end)

RegisterNetEvent('mythic_notify:client:SendEatAlert')
AddEventHandler('mythic_notify:client:SendEatAlert', function(data)
    SendAlert('inform', 'Ate ' .. data, 10000)
end)

RegisterNetEvent('mythic_notify:client:SendDrinkAlert')
AddEventHandler('mythic_notify:client:SendDrinkAlert', function(data)
    SendAlert('inform', 'Drank ' .. data, 10000)
end)

function SendAlert(type, text, length, style, title)
    SendNUIMessage({
                       type   = type,
                       text   = text,
                       length = length,
                       style  = style,
                       title  = title
                   })
end

function PersistentAlert(action, id, type, text, style)
    if action:upper() == 'START' then
        SendNUIMessage({
                           persist = action,
                           id      = id,
                           type    = type,
                           text    = text,
                           style   = style
                       })
    elseif action:upper() == 'END' then
        SendNUIMessage({
                           persist = action,
                           id      = id
                       })
    end
end