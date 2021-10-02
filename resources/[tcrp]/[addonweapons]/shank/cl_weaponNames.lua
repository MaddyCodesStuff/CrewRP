AddTextEntry("WEAPON_SHANK", "Shank")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_SHANK")
    local damage = 0.4
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)