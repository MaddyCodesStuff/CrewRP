AddTextEntry("WEAPON_KITCHENKNIFE", "Kitchen Knife")
Citizen.CreateThread(function()
    local weapon = GetHashKey("WEAPON_KITCHENKNIFE")
    local damage = 0.8
    while true do
        SetWeaponDamageModifierThisFrame(weapon, damage)
        Citizen.Wait(0)
    end
end)