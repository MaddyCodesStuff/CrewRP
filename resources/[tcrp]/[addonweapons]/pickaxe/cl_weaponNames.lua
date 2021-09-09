AddTextEntry("WEAPON_PICKAXE", "Pickaxe")
Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_PICKAXE")
    local damage = 0.6
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)