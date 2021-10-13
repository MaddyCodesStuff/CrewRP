AddTextEntry("WEAPON_BROOM", "Broom")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_BROOM")
    local damage = 0.3
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)