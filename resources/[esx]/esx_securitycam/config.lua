Config               = {}
Config.DrawDistance  = 20.0
Config.HideRadar     = false -- Hide HUD?
Config.AnimTime      = 60 -- Animation for the hacking in seconds. 60 = 1 minute / 60 seconds!

Config.Locale        = 'en'
Config.pNotify       = true -- Only enable this if you have pNotify (https://github.com/Nick78111/pNotify)
Config.Hacking       = true -- Only enable if you have mhacking (https://github.com/GHMatti/FiveM-Scripts/tree/master/mhacking)

-- Connect to the cameras
-- Place: In the polices armory room
Config.Zones         = {
    Cameras = {
        Pos   = { x = 459.78, y = -988.7, z = 23.91 },
        Size  = { x = 1.7, y = 1.7, z = 0.5 },
        Color = { r = 26, g = 55, b = 186 },
        Type  = 27,
    }
}

-- Keep these the same
-- Place: Behind the polices desk in the policestation
-- Screenshot: https://i.imgur.com/f5WNrRj.jpg
Config.HackingPolice = {
    HackingPolice = {
        Pos   = { x = 465.87, y = -975.65, z = 23.91 },
        Size  = { x = 1.7, y = 1.7, z = 0.5 },
        Color = { r = 26, g = 55, b = 186 },
        Type  = 27,
    }
}

Config.UnHackPolice  = {
    UnHackPolice = {
        Pos   = { x = 465.87, y = -975.65, z = 23.91 },
        Size  = { x = 1.7, y = 1.7, z = 0.5 },
        Color = { r = 26, g = 55, b = 186 },
        Type  = 27,
    }
}

-- Keep these the same
-- Place: Down at the bank vault
-- Screenshot: https://i.imgur.com/nvcFUhu.jpg
Config.HackingBank   = {
    HackingBank = {
        Pos   = { x = 264.87, y = 219.93, z = 100.68 },
        Size  = { x = 1.7, y = 1.7, z = 0.5 },
        Color = { r = 26, g = 55, b = 186 },
        Type  = 27,
    }
}

Config.UnHackBank    = {
    UnHackBank = {
        Pos   = { x = 264.87, y = 219.93, z = 100.68 },
        Size  = { x = 1.7, y = 1.7, z = 0.5 },
        Color = { r = 26, g = 55, b = 186 },
        Type  = 27,
    }
}

-- Cameras. You could add more cameras for other banks, apartments, houses, buildings etc. (Remember the "," after each row, but not on the last row)
Config.Locations     = {
    {
        -- Pacific Standard Bank Camera Group
        bankCamLabel        = {
            label = _U('pacific_standard_bank')
        },
        bankCameras         = { -- label, camera position (x,y,z), r = camera angles, camrotate = can the camera Pan?
            { label = _U('bcam'), x = 232.86, y = 221.46, z = 107.83, r = { x = -25.0, y = 0.0, z = -140.91 }, canRotate = true },
            { label = _U('bcam2'), x = 257.45, y = 210.07, z = 109.08, r = { x = -25.0, y = 0.0, z = 28.05 }, canRotate = true },
            { label = _U('bcam3'), x = 261.50, y = 218.08, z = 107.95, r = { x = -25.0, y = 0.0, z = -149.49 }, canRotate = true },
            { label = _U('bcam4'), x = 241.64, y = 233.83, z = 111.48, r = { x = -35.0, y = 0.0, z = 120.46 }, canRotate = true },
            { label = _U('bcam5'), x = 269.66, y = 223.67, z = 113.23, r = { x = -30.0, y = 0.0, z = 111.29 }, canRotate = true },
            { label = _U('bcam6'), x = 261.98, y = 217.92, z = 113.25, r = { x = -40.0, y = 0.0, z = -159.49 }, canRotate = true },
            { label = _U('bcam7'), x = 258.44, y = 204.97, z = 113.25, r = { x = -30.0, y = 0.0, z = 10.50 }, canRotate = true },
            { label = _U('bcam8'), x = 235.53, y = 227.37, z = 113.23, r = { x = -35.0, y = 0.0, z = -160.29 }, canRotate = true },
            { label = _U('bcam9'), x = 254.72, y = 206.06, z = 113.28, r = { x = -35.0, y = 0.0, z = 44.70 }, canRotate = true },
            { label = _U('bcam10'), x = 269.89, y = 223.76, z = 106.48, r = { x = -35.0, y = 0.0, z = 112.62 }, canRotate = true },
            { label = _U('bcam11'), x = 252.27, y = 225.52, z = 103.99, r = { x = -35.0, y = 0.0, z = -74.87 }, canRotate = true },
            { label = _U('bcam12'), x = 251.65, y = 218.66, z = 104.50, r = { x = -28.0, y = 0.0, z = -20.0 }, canRotate = true },
        },

        -- Cameras as MRPD
        policeCamLabel      = {
            label = _U('police_station')
        },
        policeCameras       = {
            { label = "MRPD 1",   x = 442.590, y = -978.310, z = 32.50,  r = { x = -10.1, y = 0, z = 115.51  }, canRotate = true },
            { label = "MRPD 2",    x = 464.51, y = -986.16, z = 28.24,  r = { x = -11.2, y = 0, z = 277.06  }, canRotate = true },
            { label = "MRPD 3",    x = 433.910, y = -977.660, z = 32.250,  r = { x = 0, y = 0, z = 102.01  }, canRotate = true },
            { label = "MRPD 4",    x = 467.500, y = -1021.220, z = 30.130,  r = { x = 0, y = 0, z = 270.01  }, canRotate = true },
            { label = "MRPD 5",    x = 471.740, y = -989.990, z = 27.240,  r = { x = 0, y = 0, z = 263.77  }, canRotate = true },
            { label = "BSCO 1",    x = 1850.71, y = 3681.77, z = 31.25,  r = { x = 0, y = 0, z = 297.00 }, canRotate = true },
            { label = "BSCO 2",    x = 1850.980, y = 3682.08, z = 35.250,  r = { x = 0, y = 0, z = 348.03 }, canRotate = true },
            { label = "SAHP 1",    x = -447.410, y = 6007.160, z = 33.500,  r = { x = 0, y = 0, z = 353 }, canRotate = true },
            { label = "SAHP 2",    x = -439.630, y = 5994.020, z = 33.000,  r = { x = 0, y = 0, z = 181.04 }, canRotate = true },
            { label = "SAHP 3",    x = -435.730, y = 5996.970, z = 33.000,  r = { x = 0, y = 0, z = 274.69 }, canRotate = true },
        },

        -- 24/7 Convenience Store Cameras
        storeCamLabel       = {
            label = '24/7 Supermarket' -- 24/7 Convenience
        },
        storeCameras        = {
            { label = "Vinewood", x = 373.80, y = 331.05, z = 105.0, r = { x = -25.0, y = 0.0, z = 200.0 }, canRotate = false },
            { label = "Innocence Blvd", x = 24.45, y = -1342.25, z = 31.0, r = { x = -25.0, y = 0.0, z = 210.0 }, canRotate = false },
            { label = "Ineseno Rd", x = -3043.75, y = 582.99, z = 9.5, r = { x = -28.0, y = 0.0, z = 330.0 }, canRotate = false },
            { label = "Barbareno Rd Chumash", x = -3247.05, y = 1000.38, z = 15.0, r = { x = -28.0, y = 0.0, z = 300.0 }, canRotate = false },
            { label = "68 West", x = 549.66, y = 2666.61, z = 44.0, r = { x = -28.0, y = 0.0, z = 40.0 }, canRotate = false },
            { label = "Palomino Freeway", x = 2552.40, y = 381.20, z = 110.0, r = { x = -28.0, y = 0.0, z = 300.0 }, canRotate = false },
            { label = "Senora Freeway", x = 2673.58, y = 3281.85, z = 57.0, r = { x = -28.0, y = 0.0, z = 280.0 }, canRotate = false },
            { label = "Niland Ave", x = 1957.71, y = 3744.28, z = 34.0, r = { x = -28.0, y = 0.0, z = 250.0 }, canRotate = false },
            { label = "Mount Chiliad", x = 1730.09, y = 6419.63, z = 37.0, r = { x = -28.0, y = 0.0, z = 190.0 }, canRotate = false },
            { label = "Paleto Bay", x = 163.45, y = 6644.76, z = 33.0, r = { x = -28.0, y = 0.0, z = 190.0 }, canRotate = false },
        },

        --Robs Liquor Stores
        store2CamLabel      = {
            label = 'Robs Liquour' -- Rbs Liquor
        },
        store2Cameras       = {
            { label = "Murrieta Heights", x = 1133.22, y = -979.14, z = 48.5, r = { x = -28.0, y = 0.0, z = 230.0 }, canRotate = false },
            { label = "San Andreas Ave", x = -1224.42, y = -910.82, z = 14.0, r = { x = -28.0, y = 0.0, z = 340.0 }, canRotate = false },
            { label = "Prosperity", x = -1483.36, y = -379.98, z = 42.0, r = { x = -28.0, y = 0.0, z = 80.0 }, canRotate = false },
            { label = "Banham Canyom GOH", x = -2965.96, y = 387.47, z = 17.0, r = { x = -28.0, y = 0.0, z = 40.0 }, canRotate = false },
            { label = "68 East", x = 1169.39, y = 2711.55, z = 40.0, r = { x = -28.0, y = 0.0, z = 130.0 }, canRotate = false },
            { label = "Del Vecchio Liquor", x = -163.52, y = 6323.57, z = 33.0, r = { x = -10.0, y = 0.0, z = -100.0 }, canRotate = false },
            { label = "Bayview Lodge General Store", x = -677.85, y = 5842.57, z = 18.73, r = { x = -28.0, y = 0.0, z = -180.0 }, canRotate = false },
        },

        -- Blaine County Savings and Vangelico Jewelry
        store3CamLabel      = {
            label = 'Blaine County Savings'
        },
        store3Cameras       = {
            { label = "Lobby 1", x = -115.37, y = 6472.3, z = 33.0, r = { x = -15.0, y = 0.0, z = 180.0 }, canRotate = true },
            { label = "Lobby 2", x = -108.37, y = 6463.4, z = 33.0, r = { x = -20.0, y = 0.0, z = 0.0 }, canRotate = true },
            { label = "Vault", x = -107.44, y = 6475.91, z = 33.0, r = { x = -20.0, y = 0.0, z = 180.0 }, canRotate = true },
            { label = "Outside", x = -103.24, y = 6451.59, z = 33.11, r = { x = -20.0, y = 0.0, z = 62.15 }, canRotate = true },
        },

        -- Fleeca Banks
        store4CamLabel      = {
            label = 'Fleeca Banks'
        },
        store4Cameras       = {
            { label = "Rockford Hills 1", x = -1209.33, y = -329.2, z = 38.7, r = { x = -15.0, y = 0.0, z = 90.0 }, canRotate = true },
            { label = "Rockford Hills 2", x = -1216.64, y = -335.44, z = 38.7, r = { x = -20.0, y = 0.0, z = 0.0 }, canRotate = true },
            { label = "Great Ocean 1", x = -2962.24, y = 486.62, z = 16.9, r = { x = -15.0, y = 0.0, z = 90.0 }, canRotate = true },
            { label = "Great Ocean 2", x = -2960.0, y = 477.0, z = 16.9, r = { x = -20.0, y = 0.0, z = 0.0 }, canRotate = true },
            { label = "Route 68 1", x = 1171.44, y = 2706.96, z = 39.1, r = { x = -20.0, y = 0.0, z = -120.0 }, canRotate = true },
            { label = "Route 68 2", x = 1180.73, y = 2709.58, z = 39.1, r = { x = -20.0, y = 0.0, z = 90.0 }, canRotate = true },
            { label = "Hawick Ave 1", x = 317.61, y = -280.55, z = 55.2, r = { x = -20.0, y = 0.0, z = 45.0 }, canRotate = true },
            { label = "Hawick Ave 2", x = 307.93, y = -278.67, z = 55.2, r = { x = -20.0, y = 0.0, z = 180.0 }, canRotate = true },
            { label = "Hawick Ave 3", x = -347.82, y = -51.06, z = 50.50, r = { x = -20.0, y = 0.0, z = 29.08 }, canRotate = true },
            { label = "Hawick Ave 4", x = -357.02, y = -50.07, z = 50.20, r = { x = -20.0, y = 0.0, z = 180.0 }, canRotate = true },
            { label = "Vespucci Blvd 1", x = 153.15, y = -1042.1, z = 30.4, r = { x = -20.0, y = 0.0, z = 45.0 }, canRotate = true },
            { label = "Vespucci Blvd 2", x = 143.64, y = -1041.23, z = 30.4, r = { x = -20.0, y = 0.0, z = 180.0 }, canRotate = true },
        },

        -- Paleto Yacht
        PaletoYachtCamLabel = {
            label = 'Paleto Yacht'
        },
        PaletoYachtCameras  = {
            { label = "Stern", x = -1364.89, y = 6734.74, z = 5.00, r = { x = -20.0, y = 0.0, z = 250.0 }, canRotate = true },
            { label = "Engine Room 1", x = -1376.73, y = 6738.57, z = 4.10, r = { x = -20.0, y = 0.0, z = 70.0 }, canRotate = false },
            { label = "Engine Room 2", x = -1376.73, y = 6738.57, z = 4.10, r = { x = -40.0, y = 0.0, z = 250.0 }, canRotate = false },
            { label = "Hot Tub Deck", x = -1381.33, y = 6740.05, z = 7.88, r = { x = -20.0, y = 0.0, z = 250.0 }, canRotate = false },
            { label = "Helipad Deck", x = -1399.09, y = 6745.82, z = 13.91, r = { x = -10.0, y = 0.0, z = 250.0 }, canRotate = false },
            { label = "Starboard Camera 1", x = -1423.64, y = 6760.60, z = 7.00, r = { x = -10.0, y = 0.0, z = 250.0 }, canRotate = false },
            { label = "Port Camera 1", x = -1427.87, y = 6748.11, z = 7.00, r = { x = -10.0, y = 0.0, z = 295.0 }, canRotate = false },
            { label = "Hallway Cam - Bedrooms", x = -1445.5, y = 6753.93, z = 7.00, r = { x = -10.0, y = 0.0, z = 270.0 }, canRotate = false },
            { label = "Hallway Cam - Statue", x = -1449.61, y = 6763.06, z = 7.00, r = { x = -20.0, y = 00.0, z = 120.0 }, canRotate = false },
            { label = "Bridge Camera 1", x = -1426.59, y = 6754.77, z = 14.00, r = { x = -20.0, y = 0.0, z = 250.0 }, canRotate = true },
            { label = "Mast Camera", x = -1420.50, y = 6753.00, z = 27.0, r = { x = -30.0, y = 0.0, z = 245.0 }, canRotate = true },
        },

        -- LTD's
        LTDCamLabel = {
            label = 'LTD'
        },
        LTDCameras = {
            { label = "Grapeseed", x = 1701.36, y = 4919.52, z = 44.0, r = {x = -28.0, y = 0.0, z = 20.0}, canRotate = false }, -- LTD
            { label = "North Rockford Dr", x = -1822.66, y = 797.82, z = 140.0, r = {x = -28.0, y = 0.0, z = 180.0}, canRotate = false }, -- LTD
            { label = "Grove St", x = -43.15, y = -1755.09, z = 31.0, r = {x = -25.0, y = 0.0, z = 90.0}, canRotate = false }, -- LTD
            { label = "Mirror Park", x = 1164.91, y = -317.88, z = 71.0, r = {x = -28.0, y = 0.0, z = 140.0}, canRotate = false }, -- LTD
            { label = "Little Seoul", x = -704.89, y = -908.96, z = 21.01, r = {x = -28.0, y = 0.0, z = 133.12}, canRotate = false }, -- LTD
        },
        -- Impound Lot
        ImpoundCamLabel = {
            label = 'Impound'
        },
        ImpoundCameras = {
            { label = "Back Exit", x = 964.15, y = -2987.08, z = -36.7, r = {x = -20.02, y = 0.0, z = 139.12}, canRotate = false }, -- Impound
            { label = "Front", x = 1004.51, y = -2997.55, z = -36.79, r = {x = -10.01, y = 0.0, z = 90.01}, canRotate = false }, -- Impound
            { label = "Inside", x = 958.2, y = -2999.55, z = -38.18, r = {x = -10.01, y = 0.0, z = 234.95 }, canRotate = false }, -- Impound
            { label = "Garage Door", x = 981.85, y = -2987.5, z = -34.67, r = {x = -30.01, y = 0.0, z = 144.61}, canRotate = false }, -- Impound
            { label = "Outside", x = 1016.99, y = -2531.81, z = 34.21, r = {x = -30.01, y = 0.0, z = 34.53}, canRotate = false }, -- Impound
        },
         -- Jewelry Store
         JewelryCamLabel = {
            label = 'Vangelico Jewelry'
        },
        JewelryCameras = {
            { label = "Vangelico Jewlery Back", x = -620.19, y = -224.62, z = 39.86, r = { x = -20.0, y = 0.0, z = 145.07 }, canRotate = true },
            { label = "Vangelico Jewlery", x = -627.98, y = -239.91, z = 40.11, r = { x = -20.0, y = 0.0, z = -10.01 }, canRotate = false },
            { label = "Vangelico Front", x = -627.16, y = -229.56, z = 40.11, r = { x = -20.0, y = 0.0, z = 192.86 }, canRotate = false },
            { label = "Outside", x = -641.17, y = -247.91, z = 40.11, r = { x = -20.0, y = 0.0, z = -10.01 }, canRotate = false },
        },
    }
}
