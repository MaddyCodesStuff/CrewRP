Citizen.CreateThread(function()

    me = PlayerId() -- reducing overhead

    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(me) ~= 0 then
            SetPlayerWantedLevel(me, 0, false)
            SetPlayerWantedLevelNow(me, false)
        end
    end
end)