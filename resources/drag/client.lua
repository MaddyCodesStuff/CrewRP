local Drag = {
    Distance = 3,
    Dragging = false,
    Dragger  = -1,
    Dragged  = false,
}

function Drag:GetPlayers()
    local Players = {}

    for Index = 0, 255 do
        if NetworkIsPlayerActive(Index) then
            table.insert(Players, Index)
        end
    end

    return Players
end

function Drag:GetClosestPlayer()
    local Players         = self:GetPlayers()
    local ClosestDistance = -1
    local ClosestPlayer   = -1
    local PlayerPed       = PlayerPedId()
    local PlayerPosition  = GetEntityCoords(PlayerPed, false)

    for Index = 1, #Players do
        local TargetPed = GetPlayerPed(Players[Index])
        if PlayerPed ~= TargetPed then
            local TargetCoords = GetEntityCoords(TargetPed, false)
            local Distance     = #(PlayerPosition - TargetCoords)

            if ClosestDistance == -1 or ClosestDistance > Distance then
                ClosestPlayer   = Players[Index]
                ClosestDistance = Distance
            end
        end
    end

    return ClosestPlayer, ClosestDistance
end

RegisterNetEvent("Drag")
AddEventHandler("Drag", function(Dragger)
    Drag.Dragging = not Drag.Dragging
    Drag.Dragger  = Dragger
end)

RegisterCommand("drag", function(source, args, fullCommand)
    local Player, Distance = Drag:GetClosestPlayer()

    if Distance ~= -1 and Distance < Drag.Distance then
        TriggerServerEvent("Drag", GetPlayerServerId(Player))
    else
        TriggerEvent("chat:addMessage", {
            color     = { 255, 0, 0 },
            multiline = true,
            args      = { "Drag", "Please get closer to the target!" },
        })
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if NetworkIsSessionStarted() then
            TriggerEvent("chat:addSuggestion", "/drag", "Toggle drag the closest player")
            return
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Drag.Dragging then
            local PlayerPed = PlayerPedId()

            Drag.Dragged    = true
            -- offset y some to make it less butt-fucky
            AttachEntityToEntity(PlayerPed, GetPlayerPed(GetPlayerFromServerId(Drag.Dragger)), 4103, 11816, 0.48, 0.30,
                                 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        else
            if Drag.Dragged then
                local PlayerPed = PlayerPedId()

                if not IsPedInParachuteFreeFall(PlayerPed) then
                    Drag.Dragged = false
                    DetachEntity(PlayerPed, true, false)
                end
            end
        end
    end
end)