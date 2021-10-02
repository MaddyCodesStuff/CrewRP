AddTextEntry("WEAPON_SLEDGEHAMMER", "Sledgehammer")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_SLEDGEHAMMER")
    local damage = 0.5
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)