AddTextEntry("WEAPON_CLEAVER", "Cleaver")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_CLEAVER")
    local damage = 0.7
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)