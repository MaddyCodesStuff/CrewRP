AddTextEntry("WEAPON_SCREWDRIVER", "Screwdriver")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_SCREWDRIVER")
    local damage = 0.5
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)