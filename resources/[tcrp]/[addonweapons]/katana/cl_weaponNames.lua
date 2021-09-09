AddTextEntry("WEAPON_KATANA", "Katana")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_KATANA")
    local damage = 0.6
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)
