Config                    = {}

Config.Locale             = 'en'

-- Set the time (in minutes) during the player is outlaw
Config.Timer              = 1

-- Set if show alert when player use gun
Config.GunshotAlert       = true

-- Set if show when player do carjacking
Config.CarJackingAlert    = false

-- Set if show when player fight in melee
Config.MeleeAlert         = false

-- In seconds
Config.BlipGunTime        = 120

-- Blip radius, in float value!
Config.BlipGunRadius      = 35.0

-- In seconds
Config.BlipMeleeTime      = 7

-- Blip radius, in float value!
Config.BlipMeleeRadius    = 50.0

-- EMS In seconds
Config.BlipEMSTime        = 120

-- Fire In seconds
Config.BlipFireTime       = 120

-- In seconds
Config.BlipJackingTime    = 10

-- Blip radius, in float value!
Config.BlipJackingRadius  = 50.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave  = true

-- Jobs in this table are considered as cops
Config.WhitelistedCops    = {
    'police',
    'journalist',
}

Config.WhitelistedWeapons = {
    'WEAPON_STUNGUN',
    'WEAPON_FLAREGUN',
    'WEAPON_FLARE',
    'WEAPON_SNOWBALL',
    'WEAPON_FIREWORK',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_STICKYBOMB',
    "WEAPON_SMOKEGRENADE",
    "WEAPON_BALL",
}

Config.GunshotAlertDelay  = 10
