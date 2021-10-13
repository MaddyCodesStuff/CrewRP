AddTextEntry("WEAPON_CRUTCH", "Crutch")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_CRUTCH")
    local damage = 0.3
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)
