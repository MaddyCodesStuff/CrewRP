dist_marker = 10000.0
next_marker = nil
next_dist = 1000.0
dist_ped = 2.0
ShopDelete = false

CreateThread(function()
    CreateIcons()
    while true do
        local pos = GetEntityCoords(PlayerPedId())
        local shortest_dist = 10000.0
        local store_found = false
        
        for i, k in pairs(tattoosShops) do
            dist_marker = #(pos - vec3(k.coords.x, k.coords.y, k.coords.z))
            if dist_marker < dist_ped and dist_marker < shortest_dist then

                if next_marker == nil then
                    EnableBlip()
                end

                next_marker = k
                next_dist = dist_marker
                shortest_dist = dist_marker   
                store_found = true
                ShopDelete = k.delete
            end
        end

        if not store_found then
            dist_marker = 10000.0
            next_marker = nil
            next_dist = 1000.0
        end
        Wait(1500)
    end
end)

function EnableBlip()
    CreateThread(function()
        while true do
            if IsPauseMenuActive() then
                CloseNuiTattos()
            elseif next_marker == nil then
                CloseNuiTattos()
                return 
            end

            local dist = next_dist
            if dist < dist_ped then
                if not opened then
                    DisplayHelpText(Texts.KeyNotifyOpenStore)
                end
                DrawMarker(27, next_marker.coords.x, next_marker.coords.y, next_marker.coords.z-0.9, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 0, 255, 0, 50, false, false, 2, "GolfPutting", nil, false)
            end
            Wait(0)
        end
    end)
end

-- Reset the tattoos if they disappear from the body
CreateThread(function()
    while true do
        if not opened then
            local ped = PlayerPedId()
            ClearPedDecorations(ped)
            for i, k in pairs(my_tattoos) do
                ApplyPedOverlay(ped, GetHashKey(k.dlc), GetHashKey(k.hash))
            end
        end
        Wait(5000)
    end
end)