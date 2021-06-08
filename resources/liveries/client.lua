RegisterCommand('livery', function(source, args, rawCommand)

    local Veh    = GetVehiclePedIsIn(GetPlayerPed(-1))
    local livery = tonumber(args[1])

    SetVehicleLivery(Veh, livery) --CHANGE livery(id)
    drawNotification("Vehicle Livery ~r~" .. livery .. "~s~ loaded!")

end)

function drawNotification(Notification)

    SetNotificationTextEntry('STRING')
    AddTextComponentString(Notification)
    DrawNotification(false, false)

end
