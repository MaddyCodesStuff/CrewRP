blackouts = {
    700,
    1500,
    2300,
}

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(60000)
        curtime        = tonumber(os.date("%H%M"))

        local blackout = -1
        for _, v in ipairs(blackouts) do
            if curtime < v then
                --print("Selected: " .. tostring(v))
                blackout = v
                break
            end
        end

        if blackout > -1 then
            if (blackout - curtime) <= 15 then
                remaining = blackout - curtime
                msg       = "Blackout Warning: approximately " .. remaining .. " minutes"
                print(msg)
                TriggerClientEvent("pNotify:SendNotification", -1,
                                   { layout = "topCenter", type = "alert", text = msg, timeout = 20000 })
            end
        end
    end

end)


