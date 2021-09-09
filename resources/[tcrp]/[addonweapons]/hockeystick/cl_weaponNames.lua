AddTextEntry("WEAPON_HOCKEYSTICK", "Hockey Stick")

Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_HOCKEYSTICK")
    local damage = 0.3
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)
