Config = {}

Config.DefaultDamageModifier = 1.0
Config.StunTime = 5000

--[[
    These stack. IE if you have a group apply a modifier of 0.5 and a specific weapon
    apply a modifer of 0.5, the total modifier will be 0.25.
]]
Config.AdditionalModifiers = {
    groups = {
    },
    weapons = {
    },
}

-- Weapons to pull from belt
Config.BeltWeapons = {
    GetHashKey('WEAPON_PISTOL'),
    GetHashKey('WEAPON_PISTOL_MK2'),
    GetHashKey('WEAPON_SNSPISTOL'),
    GetHashKey('WEAPON_SNSPISTOL_MK2'),
    GetHashKey('WEAPON_MACHINEPISTOL'),
    GetHashKey('WEAPON_MINISMG'),
    GetHashKey('WEAPON_COMBATPISTOL'),
    GetHashKey('WEAPON_APPISTOL'),
    GetHashKey('WEAPON_HEAVYPISTOL'),
    GetHashKey('WEAPON_STUNGUN'),
    GetHashKey('WEAPON_PISTOL50'),
    GetHashKey('WEAPON_VINTAGEPISTOL'),
    GetHashKey('WEAPON_REVOLVER'),
    GetHashKey('WEAPON_REVOLVER_MK2'),
    GetHashKey('WEAPON_MARKSMANPISTOL'),
    GetHashKey('WEAPON_CERAMICPISTOL'),
    GetHashKey('WEAPON_NAVYREVOLVER'),
    GetHashKey('WEAPON_MICROSMG'),
}