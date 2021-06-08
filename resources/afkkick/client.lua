-- CONFIG --
local messageDisplaying = false

-- AFK Kick Time Limit (in seconds)
secondsUntilKick        = 1800

-- Warn players if 3/4 of the Time Limit ran up
kickWarning             = true

-- CODE --

Citizen.CreateThread(function()
    while true do
        Wait(1000)

        playerPed = GetPlayerPed(-1)
        if playerPed then
            currentPos = GetEntityCoords(playerPed, true)

            if currentPos == prevPos then
                if time > 0 then
                    if kickWarning and time == math.ceil(secondsUntilKick / 4) then
                        messageDisplaying = true
                    end

                    if messageDisplaying then
                        exports['mythic_notify']:PersistentHudText('start', 'afkmessage', 'inform',
                                                                   'You\'ll be kicked in ' .. time .. ' seconds for being AFK!',
                                                                   { ['background-color'] = 'red', ['color'] = 'white' })
                    end

                    time = time - 1
                else
                    TriggerServerEvent("kickForBeingAnAFKDouchebag")
                end
            else
                time = secondsUntilKick
                exports['mythic_notify']:PersistentHudText('end', 'afkmessage')
                messageDisplaying = false
            end

            prevPos = currentPos
        end
    end
end)
