local base_damage = Config.DefaultDamageModifier
local modifier = 1.0
local weapon = nil
local hasHolster = false

-- Default damage modifier
function getDefaultDamageModifier()
    return Config.DefaultDamageModifier
end

-- Check if belt weapon
function isBeltWeapon(weapon)
    for _, gun in ipairs(Config.BeltWeapons) do
        if gun == weapon then
            return true
        end
    end
    return false
end

-- Set Weapon damage
Citizen.CreateThread(function()
    while true do
        Wait(1)
        local totalModifier = base_damage * modifier
        if weapon and totalModifier ~= 1.0 then
            SetWeaponDamageModifierThisFrame(weapon, totalModifier)
        end
    end
end)

-- Determine weapon damage modifier
Citizen.CreateThread(function()
    while true do
        weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
        local weapon_type = GetWeapontypeGroup(weapon)
        local type_modifier = Config.AdditionalModifiers.groups[weapon_type] and Config.AdditionalModifiers.groups[weapon_type] or 1.0
        local weapon_modifier = Config.AdditionalModifiers.weapons[weapon] and Config.AdditionalModifiers.weapons[weapon] or 1.0
        modifier = type_modifier * weapon_modifier
        Wait(500)
    end
end)

-- Set stun time
Citizen.CreateThread(function()
    while true do
        SetPedMinGroundTimeForStungun(GetPlayerPed(-1), Config.StunTime)
        Wait(5000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                hasHolster = false
                for i = 1, #Config.maleShirtHolster, 1 do
                    if Config.maleShirtHolster[i] == tonumber(skin.tshirt_1) then
                        hasHolster = true
                    end
                end
                for i = 1, #Config.maleChainHolster, 1 do
                    if Config.maleChainHolster[i] == tonumber(skin.chain_1) then
                        hasHolster = true
                    end
                end
            elseif skin.sex == 1 then 
                hasHolster = false
                for i = 1, #Config.femaleShirtHolster, 1 do
                    if Config.femaleShirtHolster[i] == tonumber(skin.tshirt_1) then
                        hasHolster = true
                    end
                end
                for i = 1, #Config.femaleChainHolster, 1 do
                    if Config.femaleChainHolster[i] == tonumber(skin.chain_1) then
                        hasHolster = true
                    end
                end
            else
                hasHolster = false
            end
        end)
        Wait(10000)
    end
end)

-- Handle drawing weapons
Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        -- Catch weapon swap event
        if GetIsTaskActive(ped, 56) and not IsPedInAnyVehicle(ped, false) and GetPedParachuteState(ped) < 1 and not IsPedInParachuteFreeFall(ped) then
            local isSwitchingWeapon = true
            -- Handle weapon switching per-frame stuff
            Citizen.CreateThread(function ()
                while isSwitchingWeapon do
                    SetPedCanSwitchWeapon(ped, false)
                    DisableControlAction(0, 73, true) -- X
                    DisableControlAction(0, 25, true) -- Right Mouse
                    DisablePlayerFiring(ped, true)
                    HideHudComponentThisFrame(19)
                    HideHudComponentThisFrame(20)
                    Wait(0)
                end

                SetPedCanSwitchWeapon(ped, true)
            end)

            local weapon_to = GetSelectedPedWeapon(ped)
            local postWait = 1000
            SetCurrentPedWeapon(ped, weapon, true)

            -- Put weapon away
            if isBeltWeapon(weapon) then
                ClearPedTasks(ped)
                if hasHolster == true then
                    TriggerEvent('emote:do', 'reaching')
                    Wait(1000)
                    TriggerEvent('emote:cancel')
                else
                    TriggerEvent('emote:do', 'reaching3')
                    Wait(1500)
                end
            end

            SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)

            -- Grab weapon
            if isBeltWeapon(weapon_to) then
                ClearPedTasks(ped)
                if hasHolster == true then
                    postWait = 0
                    TriggerEvent('emote:do', 'reaching')
                    Wait(1000)
                else
                    postWait = 1500
                    TriggerEvent('emote:do', 'reaching2')
                    Wait(1500)
                end
            end

            SetCurrentPedWeapon(ped, weapon_to, true)
            Wait(postWait)
            TriggerEvent('emote:cancel')
            isSwitchingWeapon = false
        end
        Wait(0)
    end
end)

--Defines Weapon-Wheel Name for Weapon
Citizen.CreateThread(function()
    AddTextEntry('WT_HUNT_RIFLE', 'Hunting Rifle')
end)

-- Reset Weapon damage on death
AddEventHandler('esx:onPlayerDeath', function(reason)
    base_damage = getDefaultDamageModifier()
end)

-- Set damage modifier
RegisterNetEvent('tcrp-weapons:setDamageModifier')
AddEventHandler('tcrp-weapons:setDamageModifier', function(modifier)
    base_damage = modifier
end)

exports("getDefaultDamageModifier", getDefaultDamageModifier)