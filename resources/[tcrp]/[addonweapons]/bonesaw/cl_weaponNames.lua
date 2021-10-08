AddTextEntry("WEAPON_BONESAW", "Bonesaw")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_BONESAW")
    local damage = 0.3
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)