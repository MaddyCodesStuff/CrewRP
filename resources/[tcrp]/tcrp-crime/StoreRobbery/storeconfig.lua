Config = {}
Config.RegisterDials = 1
Config.SafeDials = 1
Config.StorePDRequirement = 1
Config.HighValueChance = 0.3
Config.MediumValueItemDrops = 3
Config.StorePayout = { 

    register = {

        min = 3000,
        max = 4000
    
    },
    safe = {
        min = 2000,
        max = 3000
    },
    lootpool = {
        ProgressionItems = {
            BankAccessCard = {name = "bankcard", dropchance = 0.1},
        },
        HighValueItems = {
            MoneyRoll = {name = "smallmoneyroll", dropchance = 0.6},
            Rolex = {name = "rolex", dropchance = 0.3},
            Baseball = {name = "baseball", dropchance = 0.1},
        },
        MediumValueItems = {
        wallet = { name = "wallet", dropchance = 0.3},
        watch = { name = "watch", dropchance = 0.3},
        camera = { name = "camera", dropchance = 0.1},
        fakeid = { name = "fakeid", dropchance = 0.1},
        sunglasses = { name = "sunglasses", dropchance = 0.1}
        }
    }
}

Config.Stores = {
    clinton = {
        registercoords = {
            x = 372.97,
            y = 328.58,
            z = 103.57
        },
        safecoords = {

            x = 377.98,
            y = 333.02,
            z = 103.57

        },
        robDistance = 1,
        safeCancelDistance = 15, 
        name = "Clinton Ave 24/7",
        type = "store",
        cooldown = false,
        saferobbable = false
    }
}
