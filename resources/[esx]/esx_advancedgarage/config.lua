--[[
***** How to Setup a vehicle_names.lua for Custom Addon Vehicles *****
* Create a vehicle_names.lua & past the below Code
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--Example 1: AddTextEntry('SPAWN_NAME_HERE', 'VEHICLE_NAME_HERE')
	--Example 2: AddTextEntry('f350', '2013 Ford F350')
end)
]]

Config                           = {}
Config.Locale                    = 'en'

Config.KickPossibleCheaters      = false -- If true it will kick the player that tries store a vehicle that they changed the Hash or Plate.
Config.UseCustomKickMessage      = true -- If KickPossibleCheaters is true you can set a Custom Kick Message in the locales.

Config.UseDamageMult             = false -- If true it costs more to store a Broken Vehicle.
Config.DamageMult                = 5 -- Higher Number = Higher Repair Price.

Config.PoundPrice                = {
    car = 100,
    boat = 150,
    aircraft = 750,
}

Config.UseCarGarages             = true -- Allows use of Car Garages.
Config.UseBoatGarages            = true -- Allows use of Boat Garages.
Config.UseAircraftGarages        = true -- Allows use of Aircraft Garages.
Config.UsePrivateCarGarages      = true -- Allows use of Private Car Garages.
Config.UseJobCarGarages          = false -- Allows use of Job Garages.

Config.ShowGarageSpacer1         = true -- If true it shows Spacer 1 in the List.
Config.ShowGarageSpacer2         = false -- If true it shows Spacer 2 in the List | Don't use if spacer3 is set to true.
Config.ShowGarageSpacer3         = true -- If true it shows Spacer 3 in the List | Don't use if Spacer2 is set to true.

Config.ShowPoundSpacer2          = false -- If true it shows Spacer 2 in the List | Don't use if spacer3 is set to true.
Config.ShowPoundSpacer3          = true -- If true it shows Spacer 3 in the List | Don't use if Spacer2 is set to true.

Config.MarkerType                = 27
Config.DrawDistance              = 30.0
Config.SpawnMenuDistance         = 2.0
Config.DeleteMenuDistance        = 3.0
Config.DeleteBoatMenuDistance    = 8.0
Config.DeleteAirMenuDistance     = 8.0

Config.BlipGarage                = {
    Sprite  = 357,
    Color   = 39,
    Display = 2,
    Scale   = 0.8
}

Config.BlipGaragePrivate         = {
    Sprite  = 357,
    Color   = 53,
    Display = 2,
    Scale   = 0.8
}

Config.BlipBoatGarage            = {
    Sprite  = 356,
    Color   = 39,
    Display = 2,
    Scale   = 0.8
}

Config.BlipAirGarage             = {
    Sprite  = 359,
    Color   = 39,
    Display = 2,
    Scale   = 0.8
}

Config.BlipPound                 = {
    Sprite  = 369,
    Color   = 66,
    Display = 2,
    Scale   = 0.8
}

Config.BlipBoatPound              = {
    Sprite  = 371,
    Color   = 66,
    Display = 2,
    Scale   = 0.8
}

Config.BlipAirPound               = {
    Sprite  = 372,
    Color   = 66,
    Display = 2,
    Scale   = 0.8
}

Config.PointMarker               = {
    r = 0,
    g = 255,
    b = 0, -- Green Color
    x = 1.5,
    y = 1.5,
    z = 3.0 -- Standard Size Circle
}

Config.DeleteMarker              = {
    r = 255,
    g = 0,
    b = 0, -- Red Color
    x = 1.5,
    y = 1.5,
    z = 3.0 -- Big Size Circle
}

Config.PoundMarker               = {
    r = 0,
    g = 0,
    b = 100, -- Blue Color
    x = 1.5,
    y = 1.5,
    z = 3.0 -- Standard Size Circle
}

Config.JobPoundMarker            = {
    r = 255,
    g = 0,
    b = 0, -- Red Color
    x = 1.5,
    y = 1.5,
    z = 3.0 -- Standard Size Circle
}

-- Start of Cars

Config.CarGarages                = {
    -- Public Garages
    Garage_Sinner           = {
        GaragePoint = { x = 452.01, y = -1075.57, z = 28.21 },
        SpawnPoint  = { x = 453.06, y = -1066.12, z = 29.2, h = 85.75 },
        DeletePoint = { x = 464.83, y = -1076.49, z = 28.21 }
    },
    Garage_TextileCity      = {
        GaragePoint = { x = 430.82, y = -631.92, z = 27.5 },
        SpawnPoint  = { x = 425.02, y = -645.95, z = 28.5, h = 178.36 },
        DeletePoint = { x = 421.85, y = -638.0, z = 27.5 }
    },
    Garage_CentralLS        = {
        GaragePoint = { x = 278.07, y = -345.85, z = 43.92 },
        SpawnPoint  = { x = 275.02, y = -326.48, z = 44.92, h = 164.13 },
        DeletePoint = { x = 292.93, y = -333.61, z = 43.92 }
    },
    Garage_Sandy            = {
        GaragePoint = { x = 1737.59, y = 3710.2, z = 33.16 },
        SpawnPoint  = { x = 1737.84, y = 3719.28, z = 33.04, h = 21.22 },
        DeletePoint = { x = 1722.66, y = 3713.74, z = 33.25 }
    },
    Garage_Paleto           = {
        GaragePoint = { x = 105.359, y = 6613.586, z = 31.42 },
        SpawnPoint  = { x = 114.31, y = 6613.03, z = 30.7828, h = 226.76 },
        DeletePoint = { x = 116.57, y = 6621.32, z = 30.88 }
    },
    Garage_Prison           = {
        GaragePoint = { x = 1865.96, y = 2706.25, z = 44.95 },
        SpawnPoint  = { x = 1861.06, y = 2704.99, z = 45.95, h = 187.11 },
        DeletePoint = { x = 1862.01, y = 2715.51, z = 44.95 } -- z = 44.67
    },
    Garage_RaceTrack        = {
        GaragePoint = { x = 1212.32, y = 339.94, z = 80.99 },
        SpawnPoint  = { x = 1199.02, y = 330.92, z = 80.99, h = 144.86 },
        DeletePoint = { x = 1207.9, y = 343.8, z = 80.99 }
    },
    Garage_Vespucci         = {
        GaragePoint = { x = -1199.43, y = -1483.47, z = 3.40 },
        DeletePoint = { x = -1194.72, y = -1499.74, z = 3.38 },
        SpawnPoint  = { x = -1177.5, y = -1480.86, z = 3.93, h = 213.62 }
    },
    Garage_Chumash          = {
        GaragePoint = { x = -3143.8, y = 1051.23, z = 19.70 },
        DeletePoint = { x = -3153.57, y = 1062.19, z = 19.68 },
        SpawnPoint  = { x = -3149.92, y = 1059.77, z = 20.6, h = 338.54 },
    },
    Garage_Davis            = {
        GaragePoint = { x = 49.93, y = -1734.65, z = 28.3 },
        DeletePoint = { x = 33.82, y = -1727.7, z = 28.3 },
        SpawnPoint  = { x = 49.96, y = -1728.65, z = 29.3, h = 321.37 },
    },
    Garage_WVinewood        = {
        GaragePoint = { x = -570.39, y = 313.67, z = 83.49 },
        DeletePoint = { x = -560.99, y = 336.26, z = 83.42 },
        SpawnPoint  = { x = -566.73, y = 317.34, z = 84.4, h = 353.5 },
    },
    Garage_BaytreeCanyon     = {
        GaragePoint = { x = 287.66, y = 962.8, z = 210.7 },
        DeletePoint = { x = 284.4, y = 966.72, z = 210.5 },
        SpawnPoint  = { x = 283.76, y = 973.4, z = 211.0, h = 10.0 },
    },
    Garage_Grapeseed        = {
        GaragePoint = { x = 1691.01, y = 4785.0, z = 40.93 },
        DeletePoint = { x = 1690.71, y = 4774.18, z = 40.93 },
        SpawnPoint  = { x = 1691.18, y = 4795.78, z = 41.19, h = 139.75 },
    },
    Garage_PaletoForest     = {
        GaragePoint = { x = -769.22, y = 5593.27, z = 32.50 },
        DeletePoint = { x = -762.55, y = 5525.87, z = 32.50 },
        SpawnPoint  = { x = -778.82, y = 5575.7, z = 33.49, h = 181.52 },
    },
    Garage_PaletoTown     = {
        GaragePoint = { x = -341.04, y = 6240.33, z = 30.49 },
        DeletePoint = { x = -345.63, y = 6245.19, z = 30.49 },
        SpawnPoint  = { x = -339.37, y = 6248.04, z = 31.49, h = 315.0 },
    },

    -- Private garages 
    Garage_PorginiMansion   = {
        GaragePoint = { x = 1415.97, y = 1115.66, z = 113.87 },
        DeletePoint = { x = 1414.47, y = 1119.96, z = 113.87 },
        SpawnPoint  = { x = 1414.69, y = 1117.41, z = 114.13, h = 89.88 },
        Invisible   = true,
    },
    Garage_GroveStFam       = {
        GaragePoint = { x = 171.8, y = -1852.77, z = 24.25 },
        DeletePoint = { x = 167.49, y = -1857.64, z = 24.23 },
        SpawnPoint  = { x = 164.24, y = -1864.75, z = 24.08, h = 153.75 },
        Invisible   = true,
    },
    Garage_WastelanderRanch = {
        GaragePoint = { x = 2415.35, y = 5005.29, z = 46.68 },
        DeletePoint = { x = 2440.91, y = 5016.76, z = 46.6 },
        SpawnPoint  = { x = 2413.42, y = 4991.24, z = 46.26, h = 133.03 },
        Invisible   = true,
    },
    Garage_SSC              = {
        GaragePoint = { x = 1150.0, y = -1649.85, z = 36.45 },
        DeletePoint = { x = 1149.63, y = -1643.36, z = 36.33 },
        SpawnPoint  = { x = 1153.41, y = -1654.13, z = 36.54, h = 207.08 },
        Invisible   = true,
    },
    Garage_Handies          = {
        GaragePoint = { x = -471.18, y = -1714.28, z = 18.69 },
        DeletePoint = { x = -469.56, y = -1717.84, z = 18.69 },
        SpawnPoint  = { x = -465.79, y = -1719.12, z = 18.67, h = 290.31 },
        Invisible   = true,
    },
    Garage_Andy             = {
        GaragePoint = { x = -689.43, y = -881.77, z = 23.5 },
        DeletePoint = { x = -686.2, y = -885.25, z = 23.5 },
        SpawnPoint  = { x = -686.6, y = -878.85, z = 23.79, h = 269.02 },
        Invisible   = true,
    },
    Garage_Castillo         = {
        GaragePoint = { x = -1805.05, y = 400.69, z = 112.76 },
        DeletePoint = { x = -1794.96, y = 406.88, z = 113.39 },
        SpawnPoint  = { x = -1805.27, y = 398.12, z = 112.01, h = 104.99 },
        Invisible   = true
    }
}

Config.CarPounds                 = {
    Pound_LosSantos = {
        PoundPoint = { x = 408.61, y = -1625.47, z = 28.29 },
        SpawnPoint = { x = 405.64, y = -1643.4, z = 27.61, h = 229.54 }
    },
    Pound_Sandy     = {
        PoundPoint = { x = 1651.38, y = 3804.84, z = 37.65 },
        SpawnPoint = { x = 1627.84, y = 3788.45, z = 33.77, h = 308.53 }
    },
    Pound_Paleto    = {
        PoundPoint = { x = -234.82, y = 6198.65, z = 30.94 },
        SpawnPoint = { x = -230.08, y = 6190.24, z = 30.49, h = 140.24 }
    }
}

-- End of Cars
-- Start of Boats

Config.BoatGarages               = {
    Garage_VespucciMarina  = {
        GaragePoint = { x = -846.75, y = -1367.59, z = 0.61 },
        SpawnPoint  = { x = -860.19, y = -1372.01, z = -0.4, h = 199.12 },
        DeletePoint = { x = -854.09, y = -1371.05, z = 0.0 }
    },
    Garage_AlamoSea        = {
        GaragePoint = { x = 713.43, y = 4093.24, z = 33.73 },
        SpawnPoint  = { x = 701.68, y = 4095.94, z = 29.90, h = 180.0 },
        DeletePoint = { x = 701.38, y = 4109.38, z = 30.95 }
    },
    Garage_PaletoDock      = {
        GaragePoint = { x = -1611.99, y = 5262.4, z = 2.97 },
        SpawnPoint  = { x = -1593.17, y = 5244.06, z = -0.4, h = 22.96 },
        DeletePoint = { x = -1598.28, y = 5261.26, z = 0.0 }
    },
    Garage_SanChianskiDock = {
        GaragePoint = { x = 3852.49, y = 4462.99, z = 1.72 },
        SpawnPoint  = { x = 3856.19, y = 4471.7, z = -0.4, h = 274.08 },
        DeletePoint = { x = 3863.64, y = 4452.93, z = 0.0 }
    },
    Garage_BarbarenoDock   = {
        GaragePoint = { x = -3424.59, y = 980.97, z = 7.39 },
        SpawnPoint  = { x = -3418.0, y = 1009.0, z = -0.4, h = 90.0 },
        DeletePoint = { x = -3435.0, y = 995.35, z = 1.2 }
    },
}

Config.BoatPounds                = {
    Pound_LSDock     = {
        PoundPoint = { x = -738.67, y = -1400.43, z = 4.0 },
        SpawnPoint = { x = -738.33, y = -1381.51, z = 0.12, h = 137.85 }
    },
    Pound_SandyDock  = {
        PoundPoint = { x = 1299.36, y = 4217.93, z = 32.91 },
        SpawnPoint = { x = 1294.35, y = 4226.31, z = 29.86, h = 345.0 }
    },
    Pound_PaletoDock = {
        PoundPoint = { x = -270.2, y = 6642.43, z = 6.36 },
        SpawnPoint = { x = -290.38, y = 6638.54, z = -0.47477427124977, h = 130.0 }
    }
}

-- End of Boats
-- Start of Aircrafts

Config.AircraftGarages           = {
    Garage_LSAirport        = {
        GaragePoint = { x = -1617.14, y = -3145.52, z = 12.99 },
        SpawnPoint  = { x = -1657.99, y = -3134.38, z = 12.99, h = 330.11 },
        DeletePoint = { x = -1642.12, y = -3144.25, z = 12.99 }
    },
    Garage_SandyAirport     = {
        GaragePoint = { x = 1723.84, y = 3288.29, z = 40.16 },
        SpawnPoint  = { x = 1710.85, y = 3259.06, z = 40.69, h = 104.66 },
        DeletePoint = { x = 1711.31, y = 3255.77, z = 42 }
    },
    Garage_GrapeseedAirport = {
        GaragePoint = { x = 2152.83, y = 4797.03, z = 40.19 },
        SpawnPoint  = { x = 2122.72, y = 4804.85, z = 40.78, h = 115.04 },
        DeletePoint = { x = 2139.32, y = 4818.23, z = 40.3}
    },
}

Config.AircraftPounds            = {
    Pound_LSAirport     = {
        PoundPoint = { x = -1253.53, y = -3405.7, z = 13.94 },
        SpawnPoint = { x = -1272.27, y = -3382.46, z = 12.94, h = 330.25 }
    },
    Pound_SandyAirstrip = {
        PoundPoint = { x = 1747.43, y = 3296.16, z = 40.14 },
        SpawnPoint = { x = 1710.85, y = 3259.06, z = 40.69, h = 103.66 },
    },
}

-- End of Aircrafts
-- Start of Private Garages

Config.PrivateCarGarages         = {
    Garage_TheTahitian1      = {
        Private     = "TheTahitian1",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian2      = {
        Private     = "TheTahitian2",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian3      = {
        Private     = "TheTahitian3",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian4      = {
        Private     = "TheTahitian4",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian5      = {
        Private     = "TheTahitian5",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian6      = {
        Private     = "TheTahitian6",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian7      = {
        Private     = "TheTahitian7",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian8      = {
        Private     = "TheTahitian8",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian9      = {
        Private     = "TheTahitian9",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian10     = {
        Private     = "TheTahitian10",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian11     = {
        Private     = "TheTahitian11",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian12     = {
        Private     = "TheTahitian12",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian13     = {
        Private     = "TheTahitian13",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian14     = {
        Private     = "TheTahitian14",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian15     = {
        Private     = "TheTahitian15",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian16     = {
        Private     = "TheTahitian16",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian17     = {
        Private     = "TheTahitian17",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian18     = {
        Private     = "TheTahitian18",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian19     = {
        Private     = "TheTahitian19",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheTahitian20     = {
        Private     = "TheTahitian20",
        GaragePoint = { x = -29.06, y = -1513.62, z = 29.48 },
        SpawnPoint  = { x = -30.72, y = -1523.47, z = 29.28, h = 227.27 },
        DeletePoint = { x = -36.47, y = -1508.89, z = 29.8 }
    },
    Garage_TheCornerSuites1  = {
        Private     = "TheCornerSuites1",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites2  = {
        Private     = "TheCornerSuites2",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites3  = {
        Private     = "TheCornerSuites3",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites4  = {
        Private     = "TheCornerSuites4",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites5  = {
        Private     = "TheCornerSuites5",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites6  = {
        Private     = "TheCornerSuites6",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites7  = {
        Private     = "TheCornerSuites7",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites8  = {
        Private     = "TheCornerSuites8",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites9  = {
        Private     = "TheCornerSuites9",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites10 = {
        Private     = "TheCornerSuites10",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites11 = {
        Private     = "TheCornerSuites11",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites12 = {
        Private     = "TheCornerSuites12",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites13 = {
        Private     = "TheCornerSuites13",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites14 = {
        Private     = "TheCornerSuites14",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites15 = {
        Private     = "TheCornerSuites15",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites16 = {
        Private     = "TheCornerSuites16",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites17 = {
        Private     = "TheCornerSuites17",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites18 = {
        Private     = "TheCornerSuites18",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites19 = {
        Private     = "TheCornerSuites19",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_TheCornerSuites20 = {
        Private     = "TheCornerSuites20",
        GaragePoint = { x = -573.69, y = -821.6, z = 25.62 },
        SpawnPoint  = { x = -579.72, y = -824.44, z = 26.34, h = 158.77 },
        DeletePoint = { x = -580.52, y = -822.37, z = 25.4 }
    },
    Garage_EclipseTowers1    = {
        Private     = "EclipseTowers1",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers2    = {
        Private     = "EclipseTowers2",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers3    = {
        Private     = "EclipseTowers3",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers4    = {
        Private     = "EclipseTowers4",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers5    = {
        Private     = "EclipseTowers5",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers6    = {
        Private     = "EclipseTowers6",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers7    = {
        Private     = "EclipseTowers7",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers8    = {
        Private     = "EclipseTowers8",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers9    = {
        Private     = "EclipseTowers9",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_EclipseTowers10   = {
        Private     = "EclipseTowers10",
        GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
        SpawnPoint  = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
        DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    },
    Garage_TinselTowers1     = {
        Private     = "TinselTowers1",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers2     = {
        Private     = "TinselTowers2",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers3     = {
        Private     = "TinselTowers3",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers4     = {
        Private     = "TinselTowers4",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers5     = {
        Private     = "TinselTowers5",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers6     = {
        Private     = "TinselTowers6",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers7     = {
        Private     = "TinselTowers7",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers8     = {
        Private     = "TinselTowers8",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers9     = {
        Private     = "TinselTowers9",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_TinselTowers10    = {
        Private     = "TinselTowers10",
        GaragePoint = { x = -567.36, y = 59.87, z = 48.36 },
        SpawnPoint  = { x = -564.66, y = 56.71, z = 49.42, h = 256.6 },
        DeletePoint = { x = -569.28, y = 55.74, z = 48.21 }
    },
    Garage_HLMVinewood1      = {
        Private     = "HLMVinewood1",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood2      = {
        Private     = "HLMVinewood2",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood3      = {
        Private     = "HLMVinewood3",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood4      = {
        Private     = "HLMVinewood4",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood5      = {
        Private     = "HLMVinewood5",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood6      = {
        Private     = "HLMVinewood6",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood7      = {
        Private     = "HLMVinewood7",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood8      = {
        Private     = "HLMVinewood8",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood9      = {
        Private     = "HLMVinewood9",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMVinewood10     = {
        Private     = "HLMVinewood10",
        GaragePoint = { x = -562.34, y = 154.53, z = 62.9 },
        SpawnPoint  = { x = -562.46, y = 152.58, z = 63.67, h = 266.86 },
        DeletePoint = { x = -568.49, y = 152.08, z = 62.4 }
    },
    Garage_HLMLittleSeoul1   = {
        Private     = "HLMLittleSeoul1",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul2   = {
        Private     = "HLMLittleSeoul2",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul3   = {
        Private     = "HLMLittleSeoul3",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul4   = {
        Private     = "HLMLittleSeoul4",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul5   = {
        Private     = "HLMLittleSeoul5",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul6   = {
        Private     = "HLMLittleSeoul6",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul7   = {
        Private     = "HLMLittleSeoul7",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul8   = {
        Private     = "HLMLittleSeoul8",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul9   = {
        Private     = "HLMLittleSeoul9",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_HLMLittleSeoul10  = {
        Private     = "HLMLittleSeoul10",
        GaragePoint = { x = -721.46, y = -733.25, z = 26.08 },
        SpawnPoint  = { x = -672.91, y = -757.48, z = 34.38, h = 97.09 },
        DeletePoint = { x = -716.85, y = -744.05, z = 26.52 }
    },
    Garage_LeBurton1         = {
        Private     = "LeBurton1",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton2         = {
        Private     = "LeBurton2",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton3         = {
        Private     = "LeBurton3",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton4         = {
        Private     = "LeBurton4",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton5         = {
        Private     = "LeBurton5",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton6         = {
        Private     = "LeBurton6",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton7         = {
        Private     = "LeBurton7",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton8         = {
        Private     = "LeBurton8",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton9         = {
        Private     = "LeBurton9",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    Garage_LeBurton10        = {
        Private     = "LeBurton10",
        GaragePoint = { x = -435.98, y = -108.19, z = 38.86 },
        SpawnPoint  = { x = -437.25, y = -105.03, z = 39.34, h = 10.28 },
        DeletePoint = { x = -435.8, y = -102.55, z = 38.61 }
    },
    -- -- Maze Bank Building Garages
    -- Garage_MazeBankBuilding = {
    -- 	Private = "MazeBankBuilding",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_OldSpiceWarm = {
    -- 	Private = "OldSpiceWarm",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_OldSpiceClassical = {
    -- 	Private = "OldSpiceClassical",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_OldSpiceVintage = {
    -- 	Private = "OldSpiceVintage",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_ExecutiveRich = {
    -- 	Private = "ExecutiveRich",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_ExecutiveCool = {
    -- 	Private = "ExecutiveCool",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_ExecutiveContrast = {
    -- 	Private = "ExecutiveContrast",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_PowerBrokerIce = {
    -- 	Private = "PowerBrokerIce",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_PowerBrokerConservative = {
    -- 	Private = "PowerBrokerConservative",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- Garage_PowerBrokerPolished = {
    -- 	Private = "PowerBrokerPolished",
    -- 	GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
    -- 	SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
    -- 	DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
    -- },
    -- -- End of Maze Bank Building Garages
    -- -- Start of Lom Bank Garages
    -- Garage_LomBank = {
    -- 	Private = "LomBank",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBOldSpiceWarm = {
    -- 	Private = "LBOldSpiceWarm",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBOldSpiceClassical = {
    -- 	Private = "LBOldSpiceClassical",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBOldSpiceVintage = {
    -- 	Private = "LBOldSpiceVintage",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBExecutiveRich = {
    -- 	Private = "LBExecutiveRich",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBExecutiveCool = {
    -- 	Private = "LBExecutiveCool",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBExecutiveContrast = {
    -- 	Private = "LBExecutiveContrast",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBPowerBrokerIce = {
    -- 	Private = "LBPowerBrokerIce",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBPowerBrokerConservative = {
    -- 	Private = "LBPowerBrokerConservative",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- Garage_LBPowerBrokerPolished = {
    -- 	Private = "LBPowerBrokerPolished",
    -- 	GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
    -- 	SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
    -- 	DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
    -- },
    -- -- End of Lom Bank Garages
    -- -- Start of Maze Bank West Garages
    -- Garage_MazeBankWest = {
    -- 	Private = "MazeBankWest",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWOldSpiceWarm = {
    -- 	Private = "MBWOldSpiceWarm",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWOldSpiceClassical = {
    -- 	Private = "MBWOldSpiceClassical",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWOldSpiceVintage = {
    -- 	Private = "MBWOldSpiceVintage",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWExecutiveRich = {
    -- 	Private = "MBWExecutiveRich",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWExecutiveCool = {
    -- 	Private = "MBWExecutiveCool",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWExecutiveContrast = {
    -- 	Private = "MBWExecutiveContrast",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWPowerBrokerIce = {
    -- 	Private = "MBWPowerBrokerIce",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWPowerBrokerConvservative = {
    -- 	Private = "MBWPowerBrokerConvservative",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- Garage_MBWPowerBrokerPolished = {
    -- 	Private = "MBWPowerBrokerPolished",
    -- 	GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
    -- 	SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
    -- 	DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
    -- },
    -- -- End of Maze Bank West Garages
    -- -- Start of Intergrity Way Garages
    -- Garage_IntegrityWay = {
    -- 	Private = "IntegrityWay",
    -- 	GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
    -- 	SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
    -- 	DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
    -- },
    -- Garage_IntegrityWay28 = {
    -- 	Private = "IntegrityWay28",
    -- 	GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
    -- 	SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
    -- 	DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
    -- },
    -- Garage_IntegrityWay30 = {
    -- 	Private = "IntegrityWay30",
    -- 	GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
    -- 	SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
    -- 	DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
    -- },
    -- -- End of Intergrity Way Garages
    -- -- Start of Dell Perro Heights Garages
    -- Garage_DellPerroHeights = {
    -- 	Private = "DellPerroHeights",
    -- 	GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
    -- 	SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
    -- 	DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
    -- },
    -- Garage_DellPerroHeightst4 = {
    -- 	Private = "DellPerroHeightst4",
    -- 	GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
    -- 	SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
    -- 	DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
    -- },
    -- Garage_DellPerroHeightst7 = {
    -- 	Private = "DellPerroHeightst7",
    -- 	GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
    -- 	SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
    -- 	DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
    -- },
    -- -- End of Dell Perro Heights Garages
    -- -- Start of Milton Drive Garages
    -- Garage_MiltonDrive = {
    -- 	Private = "MiltonDrive",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Modern1Apartment = {
    -- 	Private = "Modern1Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Modern2Apartment = {
    -- 	Private = "Modern2Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Modern3Apartment = {
    -- 	Private = "Modern3Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Mody1Apartment = {
    -- 	Private = "Mody1Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Mody2Apartment = {
    -- 	Private = "Mody2Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Mody3Apartment = {
    -- 	Private = "Mody3Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Vibrant1Apartment = {
    -- 	Private = "Vibrant1Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Vibrant2Apartment = {
    -- 	Private = "Vibrant2Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Vibrant3Apartment = {
    -- 	Private = "Vibrant3Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Sharp1Apartment = {
    -- 	Private = "Sharp1Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Sharp2Apartment = {
    -- 	Private = "Sharp2Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Sharp3Apartment = {
    -- 	Private = "Sharp3Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Monochrome1Apartment = {
    -- 	Private = "Monochrome1Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Monochrome2Apartment = {
    -- 	Private = "Monochrome2Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Monochrome3Apartment = {
    -- 	Private = "Monochrome3Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Seductive1Apartment = {
    -- 	Private = "Seductive1Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Seductive2Apartment = {
    -- 	Private = "Seductive2Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Seductive3Apartment = {
    -- 	Private = "Seductive3Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Regal1Apartment = {
    -- 	Private = "Regal1Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Regal2Apartment = {
    -- 	Private = "Regal2Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Regal3Apartment = {
    -- 	Private = "Regal3Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Aqua1Apartment = {
    -- 	Private = "Aqua1Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Aqua2Apartment = {
    -- 	Private = "Aqua2Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- Garage_Aqua3Apartment = {
    -- 	Private = "Aqua3Apartment",
    -- 	GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
    -- 	SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
    -- 	DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
    -- },
    -- -- End of Milton Drive Garages
    -- -- Start of Single Garages
    -- Garage_RichardMajesticApt2 = {
    -- 	Private = "RichardMajesticApt2",
    -- 	GaragePoint = { x = -887.5, y = -349.58, z = 33.534 },
    -- 	SpawnPoint = { x = -886.03, y = -343.78, z = 33.534, h = 206.79 },
    -- 	DeletePoint = { x = -894.324, y = -349.326, z = 33.534 }
    -- },
    -- Garage_WildOatsDrive = {
    -- 	Private = "WildOatsDrive",
    -- 	GaragePoint = { x = -178.65, y = 503.45, z = 135.85 },
    -- 	SpawnPoint = { x = -189.98, y = 505.8, z = 133.48, h = 282.62 },
    -- 	DeletePoint = { x = -189.28, y = 500.56, z = 132.93 }
    -- },
    -- Garage_WhispymoundDrive = {
    -- 	Private = "WhispymoundDrive",
    -- 	GaragePoint = { x = 123.65, y = 565.75, z = 183.04 },
    -- 	SpawnPoint = { x = 130.11, y = 571.47, z = 182.42, h = 270.71 },
    -- 	DeletePoint = { x = 131.97, y = 566.77, z = 181.95 }
    -- },
    -- Garage_NorthConkerAvenue2044 = {
    -- 	Private = "NorthConkerAvenue2044",
    -- 	GaragePoint = { x = 348.18, y = 443.01, z = 146.7 },
    -- 	SpawnPoint = { x = 358.397, y = 437.064, z = 144.277, h = 285.911 },
    -- 	DeletePoint = { x = 351.383, y = 438.865, z = 145.66 }
    -- },
    -- Garage_NorthConkerAvenue2045 = {
    -- 	Private = "NorthConkerAvenue2045",
    -- 	GaragePoint = { x = 370.69, y = 430.76, z = 144.11 },
    -- 	SpawnPoint = { x = 392.88, y = 434.54, z = 142.17, h = 264.94 },
    -- 	DeletePoint = { x = 389.72, y = 429.95, z = 141.81 }
    -- },
    -- Garage_HillcrestAvenue2862 = {
    -- 	Private = "HillcrestAvenue2862",
    -- 	GaragePoint = { x = -688.71, y = 597.57, z = 142.64 },
    -- 	SpawnPoint = { x = -683.72, y = 609.88, z = 143.28, h = 338.06 },
    -- 	DeletePoint = { x = -685.259, y = 601.083, z = 142.365 }
    -- },
    -- Garage_HillcrestAvenue2868 = {
    -- 	Private = "HillcrestAvenue2868",
    -- 	GaragePoint = { x = -752.753, y = 624.901, z = 141.2 },
    -- 	SpawnPoint = { x = -749.32, y = 628.61, z = 141.48, h = 197.14 },
    -- 	DeletePoint = { x = -754.286, y = 631.581, z = 141.2 }
    -- },
    -- Garage_HillcrestAvenue2874 = {
    -- 	Private = "HillcrestAvenue2874",
    -- 	GaragePoint = { x = -859.01, y = 695.95, z = 147.93 },
    -- 	SpawnPoint = { x = -863.681, y = 698.72, z = 147.052, h = 341.77 },
    -- 	DeletePoint = { x = -855.66, y = 698.77, z = 147.81 }
    -- },
    -- Garage_MadWayneThunder = {
    -- 	Private = "MadWayneThunder",
    -- 	GaragePoint = { x = -1290.95, y = 454.52, z = 96.66 },
    -- 	SpawnPoint = { x = -1297.62, y = 459.28, z = 96.48, h = 285.652 },
    -- 	DeletePoint = { x = -1298.088, y = 468.952, z = 96.0 }
    -- },
    -- Garage_TinselTowersApt12 = {
    -- 	Private = "TinselTowersApt12",
    -- 	GaragePoint = { x = -616.74, y = 56.38, z = 42.736 },
    -- 	SpawnPoint = { x = -620.588, y = 60.102, z = 42.736, h = 109.316 },
    -- 	DeletePoint = { x = -621.128, y = 52.691, z = 42.735 }
    -- },
    -- -- End of Single Garages
    -- -- Start of VENT Custom Garages
    -- Garage_MedEndApartment1 = {
    -- 	Private = "MedEndApartment1",
    -- 	GaragePoint = { x = 240.23, y = 3102.84, z = 41.49 },
    -- 	SpawnPoint = { x = 233.58, y = 3094.29, z = 41.49, h = 93.91 },
    -- 	DeletePoint = { x = 237.52, y = 3112.63, z = 41.39 }
    -- },
    -- Garage_MedEndApartment2 = {
    -- 	Private = "MedEndApartment2",
    -- 	GaragePoint = { x = 246.08, y = 3174.63, z = 41.72 },
    -- 	SpawnPoint = { x = 234.15, y = 3164.37, z = 41.54, h = 102.03 },
    -- 	DeletePoint = { x = 240.72, y = 3165.53, z = 41.65 }
    -- },
    -- Garage_MedEndApartment3 = {
    -- 	Private = "MedEndApartment3",
    -- 	GaragePoint = { x = 984.92, y = 2668.95, z = 39.06 },
    -- 	SpawnPoint = { x = 993.96, y = 2672.68, z = 39.06, h = 0.61 },
    -- 	DeletePoint = { x = 994.04, y = 2662.1, z = 39.13 }
    -- },
    -- Garage_MedEndApartment4 = {
    -- 	Private = "MedEndApartment4",
    -- 	GaragePoint = { x = 196.49, y = 3027.48, z = 42.89 },
    -- 	SpawnPoint = { x = 203.1, y = 3039.47, z = 42.08, h = 271.3 },
    -- 	DeletePoint = { x = 192.24, y = 3037.95, z = 42.89 }
    -- },
    -- Garage_MedEndApartment5 = {
    -- 	Private = "MedEndApartment5",
    -- 	GaragePoint = { x = 1724.49, y = 4638.13, z = 42.31 },
    -- 	SpawnPoint = { x = 1723.98, y = 4630.19, z = 42.23, h = 117.88 },
    -- 	DeletePoint = { x = 1733.66, y = 4635.08, z = 42.24 }
    -- },
    -- Garage_MedEndApartment6 = {
    -- 	Private = "MedEndApartment6",
    -- 	GaragePoint = { x = 1670.76, y = 4740.99, z = 41.08 },
    -- 	SpawnPoint = { x = 1673.47, y = 4756.51, z = 40.91, h = 12.82 },
    -- 	DeletePoint = { x = 1668.46, y = 4750.83, z = 40.88 }
    -- },
    -- Garage_MedEndApartment7 = {
    -- 	Private = "MedEndApartment7",
    -- 	GaragePoint = { x = 15.24, y = 6573.38, z = 31.72 },
    -- 	SpawnPoint = { x = 16.77, y = 6581.68, z = 31.42, h = 222.6 },
    -- 	DeletePoint = { x = 10.45, y = 6588.04, z = 31.47 }
    -- },
    -- Garage_MedEndApartment8 = {
    -- 	Private = "MedEndApartment8",
    -- 	GaragePoint = { x = -374.73, y = 6187.06, z = 30.54 },
    -- 	SpawnPoint = { x = -377.97, y = 6183.73, z = 30.49, h = 223.71 },
    -- 	DeletePoint = { x = -383.31, y = 6188.85, z = 30.49 }
    -- },
    -- Garage_MedEndApartment9 = {
    -- 	Private = "MedEndApartment9",
    -- 	GaragePoint = { x = -24.6, y = 6605.99, z = 30.45 },
    -- 	SpawnPoint = { x = -16.0, y = 6607.74, z = 30.18, h = 35.31 },
    -- 	DeletePoint = { x = -9.36, y = 6598.86, z = 30.47 }
    -- },
    -- Garage_MedEndApartment10 = {
    -- 	Private = "MedEndApartment10",
    -- 	GaragePoint = { x = -365.18, y = 6323.95, z = 28.9 },
    -- 	SpawnPoint = { x = -359.49, y = 6327.41, z = 28.83, h = 218.58 },
    -- 	DeletePoint = { x = -353.47, y = 6334.57, z = 28.83 }
    -- }
    -- -- End of VENT Custom Garages
}

-- End of Private Garages