Citizen.CreateThread(function()
    RequestAnimDict('random@mugging3')
    while not HasAnimDictLoaded('random@mugging3') do
        Citizen.Wait(100)
    end
end)

RegisterCommand('handsup', function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then
        Citizen.Wait(25)
        TaskPlayAnim(ped, "random@mugging3", "handsup_standing_base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        SetCurrentPedWeapon(ped, 0xA2719263, true)
    end
end)    

RegisterKeyMapping('handsup', "Put Hands Up", 'keyboard', 'X')