AddTextEntry("WEAPON_UNICORN", "Hobby Horse")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_UNICORN")
    local damage = 0.2
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)