Citizen.CreateThread(function()
    id = PlayerId()
    while true do
        Citizen.Wait(1)
        DisablePlayerVehicleRewards(id)
    end
end)
