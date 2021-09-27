AddTextEntry("WEAPON_FIRE_AXE", "Fire Axe")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_FIREAXE")
    local damage = 0.5
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)
