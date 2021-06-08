local loaded = false
Citizen.CreateThread(function()
    Wait(1000)
    TriggerServerEvent('bobo:test')
    while loaded == false do
        Citizen.Wait(0)
    end
    if loaded == true then
        RequestIpl("bobo_prison_lobby_milo_")
        lobby = GetInteriorAtCoords(1838.2038574219, 2580.0715332031, 45.897499084473)
        ActivateInteriorEntitySet(lobby, "shell")
        ActivateInteriorEntitySet(lobby, "bobo_prison_lobby_shell")
        RefreshInterior(lobby)
        -- Load the prison
        RequestIpl("bobo_prison_milo_")
        main = GetInteriorAtCoords(1775.86400000, 2580.69300000, 48.49454000)
        ActivateInteriorEntitySet(main, "shell")
        ActivateInteriorEntitySet(main, "bobo_prison_shell")
        RefreshInterior(main)
    end
end)

RegisterNetEvent("bobo:testClient")
AddEventHandler("bobo:testClient", function(state)
    loaded = state
end)


-- Delete the NPC's in the prison
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1772.5219726563, 2483.5825195313,
                                    45.598968505859, true) < 80 then
            ClearAreaOfPeds(1772.5219726563, 2483.5825195313, 45.598968505859, 58.0, 0)
        end
    end
end)

-- Delete the NPC's in the lobby
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1838.1147460938, 2585.341796875, 45.891925811768,
                                    true) < 80 then
            ClearAreaOfPeds(1838.1147460938, 2585.341796875, 45.891925811768, 58.0, 0)
        end
    end
end)
