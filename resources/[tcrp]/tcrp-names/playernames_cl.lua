gamerTags = {}
name = false 

Citizen.CreateThread(function()
    while true do
        if name then
            for k, v in ipairs(GetActivePlayers()) do
                local otherPed = GetPlayerPed(v)
                    if #(GetEntityCoords(plyPed) - GetEntityCoords(otherPed)) < 500.00 then
                        gamerTags[v] = CreateFakeMpGamerTag(otherPed,
                                                            ('%s [%s]'):format(GetPlayerName(v), GetPlayerServerId(v)),
                                                            false, false, '', 0)
                    else
                        RemoveMpGamerTag(gamerTags[v])
                        gamerTags[v] = nil
                    end
            end
        else
            for k, v in ipairs(GetActivePlayers()) do
                RemoveMpGamerTag(gamerTags[v])
                gamerTags[v] = nil
            end
        end

        Citizen.Wait(0)
    end


end)


Citizen.CreateThread(function()
    while true do 
        Wait(0)
    if IsControlPressed(0, 170) then
        name = true

    else
        
        name = false

    end
    end 
end)

