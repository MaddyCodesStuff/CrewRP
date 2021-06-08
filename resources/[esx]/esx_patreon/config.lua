Config                     = {}

Config.DrawDistance        = 100.0
Config.MarkerType          = 27
Config.MarkerSize          = { x = 1.5, y = 1.5, z = 3.0 }
Config.MarkerColor         = { r = 128, g = 128, b = 255 }

Config.Locale              = 'en'

Config.PlateLetters        = 3
Config.PlateNumbers        = 3
Config.PlateUseSpace       = true

Config.Garage              = { x = -64.64, y = 77.32, z = 70.62 }

Config.CarReturner         = { x = -65.66, y = 81.5, z = 70.62 }

Config.CarSpawn            = { x = -70.93, y = 83.55, z = 71.0 }
Config.CarSpawnHeading     = 66.04

Config.PatreonEndpoint     = "https://www.patreon.com/api/oauth2/api/campaigns/3828164/pledges?include=patron.null"
Config.PatreonToken        = "bwRXSnnCF4_DQcHiaUMupoUBRU2Ae1nu3dWmbIzvAwA"
Config.PatreonPullInterval = 60 -- API pull time (secs)
Config.PatreonTiers        = {
    { -- Tip Jar
        amount = 200,
        cars   = 1
    },
    { -- Tip Jar
        amount = 250,
        cars   = 1
    },
    { -- Taco Bruh
        amount = 500,
        cars   = 2
    },
    { -- Taco Aficionado
        amount = 1000,
        cars   = 3
    },
    { -- Ultimate Rainbow Unicorn Club
        amount = 2500,
        cars   = 4
    },
    { -- New Tier
        amount = 3000,
        cars   = 4
    },
    { -- Baby Got Back
        amount = 4000,
        cars   = 99
    }
}