AddTextEntry("WEAPON_ICICLE", "Icicle")
Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_ICICLE")
    local damage = 0.4
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)