Config           = {}
Config.Locale    = 'en'
Config.Cooldown  = 3600 -- How many seconds
Config.Hacktime  = 30 -- In seconds
Config.Torchtime = 20 -- In seconds

Banks            = {
    ["fleeca"]        = {
        blipposition         = { ['x'] = 149.94, y = -1040.09, z = 29.19 },
        position             = { ['x'] = 148.91908752441, ['y'] = -1050.7448242188, ['z'] = 29.36802482605 }, -- position of robbery, when you have tu use the item "blowtorch"
        hackposition         = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 }, -- position where you have to do hack with the minigame to open a door
        --hackteleport = { ['x'] = 148.79908752441, ['y'] = -1045.5748242188, ['z'] = 29.36802482605 }, -- ignore this
        reward               = { min = 15000, max = 20000 },
        nameofbank           = "Fleeca Bank (Vespucci)", --Visual Name that will be the site
        lastrobbed           = 0, -- DONT TOUCH THIS variable used to make a delay to robb other time
        doortype             = 'v_ilev_gb_vauldr', -- Name or ID of the gameobject that will be rotate to make the open efect, you can check what id or name you need here: https://objects.gt-mp.net/ if you dont find it, contact with you developer, he will know how to get it in game
        timetotorch          = 90000, -- In milliseconds
        timetohack           = 10000, -- In milliseconds
        yaw                  = 70,
        NumberOfCopsRequired = 4,
    },
    ["fleeca2"]       = {
        blipposition         = { ['x'] = -2963.05, y = 482.89, z = 15.52 },
        position             = { ['x'] = -2954.2874804688, ['y'] = 486.14476367188, ['z'] = 15.697026252747 }, --2957.6674804688
        hackposition         = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
        reward               = { min = 15000, max = 20000 },
        nameofbank           = "Fleeca Bank (Great Ocean)",
        lastrobbed           = 0,
        doortype             = 'hei_prop_heist_sec_door',
        timetotorch          = 90000, -- In milliseconds
        timetohack           = 10000, -- In milliseconds
        yaw                  = 70,
        NumberOfCopsRequired = 4,
    },
    ["fleeca3"]       = {
        blipposition         = { ['x'] = 1175.21, y = 2706.37, z = 37.91 },
        position             = { ['x'] = 1173.19, ['y'] = 2716.36, ['z'] = 37.90 }, --2957.6674804688
        hackposition         = { ['x'] = 1176.28, ['y'] = 2711.76, ['z'] = 37.90 },
        reward               = { min = 15000, max = 20000 },
        nameofbank           = "Fleeca Bank (Route 68)",
        lastrobbed           = 0,
        doortype             = 'v_ilev_gb_vauldr',
        timetotorch          = 90000, -- In milliseconds
        timetohack           = 10000, -- In milliseconds
        yaw                  = 360,
        NumberOfCopsRequired = 4,
    },
    ["fleeca4"]       = {
        blipposition         = { ['x'] = -1212.91, y = -330.53, z = 37.59 },
        position             = { ['x'] = -1206.88, ['y'] = -338.33, ['z'] = 37.76 }, --2957.6674804688
        hackposition         = { ['x'] = -1211.26, ['y'] = -335.67, ['z'] = 37.76 },
        reward               = { min = 15000, max = 20000 },
        nameofbank           = "Fleeca Bank (Rockford Hills)",
        lastrobbed           = 0,
        doortype             = 'v_ilev_gb_vauldr',
        timetotorch          = 90000, -- In milliseconds
        timetohack           = 10000, -- In milliseconds
        yaw                  = 200,
        NumberOfCopsRequired = 4,
    },
    ["fleeca5"]       = {
        blipposition         = { ['x'] = 314.23, y = -278.61, z = 53.99 },
        position             = { ['x'] = 312.72, ['y'] = -288.47, ['z'] = 54.14 }, --2957.6674804688
        hackposition         = { ['x'] = 311.0, ['y'] = -283.08, ['z'] = 54.14 },
        reward               = { min = 15000, max = 20000 },
        nameofbank           = "Fleeca Bank (Hawick Ave., Alta)",
        lastrobbed           = 0,
        doortype             = 'v_ilev_gb_vauldr',
        timetotorch          = 90000, -- In milliseconds
        timetohack           = 10000, -- In milliseconds
        yaw                  = 150,
        NumberOfCopsRequired = 4,
    },
    ["fleeca6"]       = {
        blipposition         = { ['x'] = -341.23, y = -48.99, z = 49.04 },
        position             = { ['x'] = -353.62, ['y'] = -57.85, ['z'] = 49.01 }, --2957.6674804688
        hackposition         = { ['x'] = -353.55, ['y'] = -54.14, ['z'] = 49.04 },
        reward               = { min = 15000, max = 20000 },
        nameofbank           = "Fleeca Bank (Hawick Ave., Eastborne)",
        lastrobbed           = 0,
        doortype             = 'v_ilev_gb_vauldr',
        timetotorch          = 90000, -- In milliseconds
        timetohack           = 10000, -- In milliseconds
        yaw                  = 150,
        NumberOfCopsRequired = 4,
    },
    ["blainecounty"]  = {
        blipposition         = { ['x'] = -113.32, y = 6469.75, z = 31.45 },
        hackposition         = { x = -105.32, y = 6471.56, z = 31.63 },
        position             = { ['x'] = -103.67, ['y'] = 6477.61, ['z'] = 31.63 },
        bombposition         = { x = -106.43, y = 6474.8, z = 31.63 },
        reward               = { min = 35000, max = 45000 },
        nameofbank           = "Blaine County Savings",
        bombdoortype         = 'v_ilev_cbankvaulgate02',
        doortype             = 'v_ilev_cbankvauldoor01',
        lastrobbed           = 0,
        timetotorch          = 300000, -- In milliseconds
        timetohack           = 10000,
        yaw                  = 135,
        NumberOfCopsRequired = 5,
    },
    ["PrincipalBank"] = {
        blipposition         = { ['x'] = 246.27, y = 222.52, z = 105.29 },
        position             = { ['x'] = 264.99899291992, ['y'] = 213.50576782227, ['z'] = 101.68346405029 },
        hackposition         = { ['x'] = 261.49499291992, ['y'] = 223.06776782227, ['z'] = 106.28346405029 },
        bombposition         = { ['x'] = 254.12199291992, ['y'] = 225.50576782227, ['z'] = 101.87346405029 }, -- if this var is set will appear a site to plant a bomb which will open the door defined at var "bombdoortype"
        reward               = { min = 45000, max = 60000 },
        nameofbank           = "Pacific Standard Bank",
        lastrobbed           = 0,
        bombdoortype         = 'v_ilev_bk_vaultdoor', -- If this var is set you will need set the var "bombposition" to work properly , you can find the name or id here: https://objects.gt-mp.net/  if you dont find it, contact with your devs
        doortype             = 'hei_v_ilev_bk_gate2_pris',
        timetotorch          = 300000, -- In milliseconds
        timetohack           = 10000, -- In milliseconds
        yaw                  = 70,
        NumberOfCopsRequired = 5,
    },

}

