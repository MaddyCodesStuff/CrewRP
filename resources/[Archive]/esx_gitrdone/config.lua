--[[
ORIGINAL CODE BY ESX-ORG / ESX_POLICEJOB
EDITS BY CHIP W
]]

Config                        = {}

Config.DrawDistance           = 100.0
Config.MarkerType             = 1
Config.MarkerSize             = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor            = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement = true
Config.EnableESXIdentity      = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds  = false -- turn this on if you want custom peds

Config.EnableJobBlip          = true -- enable blips for colleagues, requires esx_society

Config.MaxInService           = 5
Config.Locale                 = 'en'

Config.GitrdoneStations       = {

    GitrDoneYard = {

        Blip        = {
            Coords  = vector3(1226.1, 1862.5, 87.3),
            Sprite  = 477,
            Display = 4,
            Scale   = 1.0,
            Colour  = 81
        },

        Cloakrooms  = {
            vector3(1219.0, 1848.6, 79.0)
        },

        Vehicles    = {
            {
                Spawner     = vector3(1209.6, 1826.2, 79.2),
                InsideShop  = vector3(1245.5, 1817.1, 80.8),
                SpawnPoints = {
                    { coords = vector3(1207.8, 1814.3, 78.3), heading = 28.0, radius = 6.0 },
                    { coords = vector3(1222.8, 1824.8, 78.9), heading = 28.0, radius = 6.0 }
                }
            }
        },

        BossActions = {
            vector3(1212.8, 1842.7, 78.9)
        }

    }

}

Config.AuthorizedVehicles     = {
    Shared   = {
    },

    laborer  = {
    },

    operator = {
        {
            model = 'boxville',
            label = 'Medium Duty Work Van',
            price = 10000
        },
        {
            model = 'tiptruck2',
            label = 'Light Duty Dump Truck',
            price = 10000
        },
        {
            model = 'rubble',
            label = 'Medium Duty Dump Truck',
            price = 15000
        },
        {
            model = 'utillitruck',
            label = 'Skylift Truck',
            price = 15000
        },
        {
            model = 'utillitruck2',
            label = 'Material Hauler Truck',
            price = 15000
        },
        {
            model = 'mixer2',
            label = 'Cement Mixer Truck',
            price = 15000
        },
        {
            model = 'forklift',
            label = 'Forklift',
            price = 5000
        },
        {
            model = 'bulldozer',
            label = 'Bulldozer',
            price = 15000
        }
    },

    foreman  = {
        {
            model = 'burrito',
            label = 'Light Duty Work Van',
            price = 10000
        },
        {
            model = 'bison3',
            label = 'Light Duty Work Truck',
            price = 10000
        },
        {
            model = 'boxville',
            label = 'Medium Duty Work Van',
            price = 10000
        },
        {
            model = 'tiptruck2',
            label = 'Light Duty Dump Truck',
            price = 10000
        },
        {
            model = 'rubble',
            label = 'Medium Duty Dump Truck',
            price = 15000
        },
        {
            model = 'utillitruck',
            label = 'Skylift Truck',
            price = 15000
        },
        {
            model = 'utillitruck2',
            label = 'Material Hauler Truck',
            price = 15000
        },
        {
            model = 'mixer2',
            label = 'Cement Mixer Truck',
            price = 15000
        },
        {
            model = 'forklift',
            label = 'Forklift',
            price = 5000
        },
        {
            model = 'bulldozer',
            label = 'Bulldozer',
            price = 15000
        }
    },

    boss     = {
        {
            model = 'burrito',
            label = 'Light Duty Work Van',
            price = 10000
        },
        {
            model = 'bison3',
            label = 'Light Duty Work Truck',
            price = 10000
        },
        {
            model = 'boxville',
            label = 'Medium Duty Work Van',
            price = 10000
        },
        {
            model = 'tiptruck2',
            label = 'Light Duty Dump Truck',
            price = 10000
        },
        {
            model = 'rubble',
            label = 'Medium Duty Dump Truck',
            price = 15000
        },
        {
            model = 'dump',
            label = 'Heavy Duty Dump Truck',
            price = 30000
        },
        {
            model = 'utillitruck',
            label = 'Skylift Truck',
            price = 15000
        },
        {
            model = 'utillitruck2',
            label = 'Material Hauler Truck',
            price = 15000
        },
        {
            model = 'mixer2',
            label = 'Cement Mixer Truck',
            price = 15000
        },
        {
            model = 'forklift',
            label = 'Forklift',
            price = 5000
        },
        {
            model = 'bulldozer',
            label = 'Bulldozer',
            price = 15000
        },
        {
            model = 'packer',
            label = 'Semi Truck',
            price = 10000
        },
        {
            model = 'trflat',
            label = 'Flatbed Trailer',
            price = 10000
        }
    }
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms               = {
    laborer_wear  = {
        male   = {
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['helmet_1'] = 25, ['helmet_2'] = 0,
            ['bproof_1'] = 3, ['bproof_2'] = 3
        },
        female = {
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['helmet_1'] = 25, ['helmet_2'] = 0,
            ['bproof_1'] = 3, ['bproof_2'] = 3
        }
    },
    operator_wear = {
        male   = {
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['helmet_1'] = 25, ['helmet_2'] = 0,
            ['bproof_1'] = 3, ['bproof_2'] = 3
        },
        female = {
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['helmet_1'] = 25, ['helmet_2'] = 0,
            ['bproof_1'] = 3, ['bproof_2'] = 3
        }
    },
    foreman_wear  = {
        male   = {
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['helmet_1'] = 25, ['helmet_2'] = 1,
            ['bproof_1'] = 3, ['bproof_2'] = 3
        },
        female = {
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['helmet_1'] = 25, ['helmet_2'] = 1,
            ['bproof_1'] = 3, ['bproof_2'] = 3
        }
    },
    boss_wear     = {
        male   = {
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['helmet_1'] = 25, ['helmet_2'] = 2,
            ['bproof_1'] = 3, ['bproof_2'] = 3
        },
        female = {
            ['shoes_1']  = 24, ['shoes_2'] = 0,
            ['helmet_1'] = 25, ['helmet_2'] = 2,
            ['bproof_1'] = 3, ['bproof_2'] = 3
        }
    }

}
