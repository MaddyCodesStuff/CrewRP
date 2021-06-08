Citizen.CreateThread(function()
    local carbineRifle = GetHashKey('PICKUP_WEAPON_CARBINERIFLE')
    local pistol       = GetHashKey('PICKUP_WEAPON_PISTOL')
    local pumpShotgun  = GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN')
    local microSMG     = GetHashKey('PICKUP_WEAPON_MICROSMG')
    while true do
        Citizen.Wait(1)
        RemoveAllPickupsOfType(carbineRifle)
        RemoveAllPickupsOfType(pistol)
        RemoveAllPickupsOfType(pumpShotgun)
        RemoveAllPickupsOfType(microSMG)
    end
end)