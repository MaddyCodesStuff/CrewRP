AddTextEntry("WEAPON_SHOVEL", "Shovel")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_SHOVEL")
    local damage = 0.3
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)