AddTextEntry("WEAPON_TOILETBRUSH", "Toilet Brush")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_TOILETBRUSH")
    local damage = 0.05
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)