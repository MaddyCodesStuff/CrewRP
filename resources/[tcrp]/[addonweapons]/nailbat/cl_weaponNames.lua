AddTextEntry("WEAPON_NAILBAT", "Nail Bat")
Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_NAILBAT")
    local damage = 0.5
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)