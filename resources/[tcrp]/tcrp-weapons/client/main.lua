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
        Citizen.Wait(1)
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
        Citizen.Wait(500)
    end
end)

-- Set stun time
Citizen.CreateThread(function()
    while true do
        SetPedMinGroundTimeForStungun(GetPlayerPed(-1), Config.StunTime)
        Citizen.Wait(5000)
    end
end)

function GetHolster()
    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
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
end
-- Handle drawing weapons
Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        -- Catch weapon swap event
        if IsPedSwappingWeapon(ped) and not IsPedInAnyVehicle(ped, false) and GetPedParachuteState(ped) < 1 and not IsPedInParachuteFreeFall(ped) then
            
            local isSwitchingWeapon = true
            local weapon_to = GetSelectedPedWeapon(ped)
            local postwait = 0
            GetHolster()
            -- Handle weapon switching per-frame stuff
            Citizen.CreateThread(function()
                while isSwitchingWeapon do
                    SetPedCanSwitchWeapon(ped, false)
                    DisableControlAction(0, 73, true) -- X
                    DisableControlAction(0, 25, true) -- Right Mouse
                    DisablePlayerFiring(ped, true)
                    HideHudComponentThisFrame(19)
                    HideHudComponentThisFrame(20)
                    Citizen.Wait(0)
                end
                SetPedCanSwitchWeapon(ped, true)
            end)
            SetCurrentPedWeapon(ped, weapon, true)

        
            if weapon ~= weapon_to then
                if weapon == GetHashKey('WEAPON_SWITCHBLADE') then
                    Citizen.Wait(800)
                    ClearPedTasks(ped)
                end
                -- Put weapon away
                if weapon ~= GetHashKey('WEAPON_UNARMED') and weapon_to == GetHashKey('WEAPON_UNARMED')  then  
                    

                    if isBeltWeapon(weapon) then
                        if weapon == GetHashKey('WEAPON_DOUBLEACTION') or GetHashKey('WEAPON_PDREVOLVER') then
                            Citizen.Wait(700)
                        end
                        ClearPedTasks(ped)
                        if hasHolster == true then
                            TriggerEvent('emote:do', 'reaching')
                            Citizen.Wait(500)
                        else
                            TriggerEvent('emote:do', 'reaching3')
                            Citizen.Wait(1400)
                        end
                    else
                        ClearPedTasks(ped)
                        TriggerEvent('emote:do', 'reaching3')
                        Citizen.Wait(1400)
                    end
                    TriggerEvent('emote:cancel')
                    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                end

                -- Grab weapon
                if isBeltWeapon(weapon_to) and weapon_to ~= GetHashKey('WEAPON_UNARMED') then
                    ClearPedTasks(ped)
                    if hasHolster == true then
                        TriggerEvent('emote:do', 'reaching')
                            Citizen.CreateThread(function()
                                Citizen.Wait(500)
                                SetCurrentPedWeapon(ped, weapon_to, true)
                            end)
                        postwait = 500
                        Citizen.Wait(700)
                    else
                        TriggerEvent('emote:do', 'reaching2')
                        postwait = 800
                        Citizen.Wait(1400)
                    end
                elseif weapon_to ~= GetHashKey('WEAPON_UNARMED') and weapon_to ~= GetHashKey('WEAPON_SWITCHBLADE') then
                    ClearPedTasks(ped)
                    TriggerEvent('emote:do', 'reaching2')
                    postwait = 1400
                    Citizen.Wait(1400)
                else
                    postwait = 1000
                end
            end
            SetCurrentPedWeapon(ped, weapon_to, true)
            TriggerEvent('emote:cancel')
            Citizen.Wait(postwait)  
            isSwitchingWeapon = false
        end
        Citizen.Wait(0)
    end
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

-- Melee Damage
Citizen.CreateThread(function()
    for k, v in pairs(Config.MeleeDamage) do
        SetWeaponDamageModifierThisFrame(GetHashKey(k), v)
        Citizen.Wait(0)
    end
end)

function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false

	repeat
		if not IsEntityDead(ped) then
			SetPedDropsWeaponsWhenDead(ped, false)
		end
		finished, ped = FindNextPed(handle)
	until not finished

	EndFindPed(handle)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetWeaponDrops()
	end
end)