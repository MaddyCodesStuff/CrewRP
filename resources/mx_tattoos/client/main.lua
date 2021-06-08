AddEventHandler('skinchanger:modelLoaded', function()
    --Wait(5000)
    TriggerServerEvent("Mx :: GetTattoos")
end)

RegisterNetEvent("Mx :: TattoosGeted")
AddEventHandler("Mx :: TattoosGeted", function(tattoos)
    my_tattoos = tattoos
end)

-- RegisterKeyMapping to tweak Nui's options
RegisterCommand(''..'mx_tattoos_open', function()
    if not opened then
        local dist = next_dist
        if dist < (dist_ped / 2) then
            TriggerEvent("Mx :: OpenTattoos")
        end
    end
end, false)

RegisterCommand(''..'mx_tattoos_up', function()
    if opened then
        MoveNui("Up")
    end
end, false)

RegisterCommand(''..'mx_tattoos_down', function()
    if opened then
        MoveNui("Down")
    end
end, false)

RegisterCommand(''..'mx_tattoos_left', function()
    if opened then
        MoveNui("Left")
    end
end, false)

RegisterCommand(''..'mx_tattoos_right', function()
    if opened then
        MoveNui("Right")
    end
end, false)

RegisterCommand(''..'mx_tattoos_enter_mx', function()
    if opened then
        MoveNui("Enter")
    end
end, false)

RegisterCommand(''..'mx_tattoos_delete', function()
    if opened then
        MoveNui("Delete")
    end
end, false)

RegisterKeyMapping(''..'mx_tattoos_up', ''..'mx_tattoos_up', 'keyboard', 'up')
RegisterKeyMapping(''..'mx_tattoos_down', ''..'mx_tattoos_down', 'keyboard', 'down')
RegisterKeyMapping(''..'mx_tattoos_left', ''..'mx_tattoos_left', 'keyboard', 'left')
RegisterKeyMapping(''..'mx_tattoos_right', ''..'mx_tattoos_right', 'keyboard', 'right')
RegisterKeyMapping(''..'mx_tattoos_enter_mx', ''..'mx_tattoos_enter_mx', 'keyboard', 'return')
RegisterKeyMapping(''..'mx_tattoos_delete', ''..'mx_tattoos_delete', 'keyboard', 'delete')
RegisterKeyMapping(''..'mx_tattoos_open', ''..'mx_tattoos_open', 'keyboard', 'e')