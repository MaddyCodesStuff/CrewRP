AddTextEntry("WEAPON_BAGUETTE", "Baguette")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_BAGUETTE")
    local damage = 0.05
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)