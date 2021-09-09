AddTextEntry("WEAPON_BREACH", "Breach Hammer")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_BREACH")
    local damage = 0.3
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)
