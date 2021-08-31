AddTextEntry("WEAPON_PIPE", "Pipe")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_PIPE")
    local damage = 0.5
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)