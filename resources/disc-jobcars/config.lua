Config            = {}

Config.ClaimPrice = 0

Config.Markers = {
    color = {
        police = { r = 55, b = 255, g = 55 },
        ambulance = { r = 168, b = 155, g = 50 },
        fireman = { r = 255, b = 55, g = 55 },
        corrections = { r = 157, b = 157, g = 157 },
        parkranger = { r = 73, b = 84, g = 115 },
        cityclerk = { r = 64, g = 52, b = 235 },
        humane = { r = 64, g = 52, b = 235 },
    },
    types = {
        car = {
            marker = 36,
            dist = 5.0,
        },
        air = {
            marker = 34,
            dist = 5.0,
        },
        boat = {
            marker = 35,
            dist = 20.0,
        },
    }
}

Config.PDCars = {
    all = {
        { name = 'LSPD Buffalo', model = 'pd-buffalo', price = 0 },
        { name = 'LSPD Caddy', model = 'pd-caddy', price = 0 },
        { name = 'LSPD Caracara', model = 'emerg-cara', price = 0 },
        { name = 'LSPD Scorcher', model = 'pdscorcher', price = 0 },
        { name = 'LSPD Scout', model = 'intscout', price = 0 },
		{ name = 'Patrol Raiden', model = 'city-raiden', price = 0 },
        { name = 'County Enduro', model = 'county-dirt', price = 0 },
        { name = 'County Yosemite', model = 'county-yo', price = 0 },
        { name = 'Highway Dominator', model = 'hwy-dominator', price = 0 },
		{ name = 'Highway Hakuchou', model = 'hwy-hak', price = 0 },
        { name = 'Highway Soverign', model = 'hwy-moto', price = 0 },
        { name = 'Highway Coquette', model = 'hwy-coq', price = 0 },
        { name = 'TAC Granger', model = 'tac-granger', price = 0 },
        { name = 'TAC Insurgent', model = 'tac-insurgent', price = 0 },
		{ name = 'TAC Mesa', model = 'tac-mesa', price = 0 },
        { name = 'TAC Stockade', model = 'tac-riot', price = 0 },
        { name = 'Detective Buffalo', model = 'det-buffals', price = 0 },
        { name = 'Detective Dominator GTX', model = 'det-gtx', price = 0 },
		{ name = 'Detective Kuruma', model = 'det-kuruma', price = 0 },
		{ name = 'Detective Stanier', model = 'det-stanier', price = 0 },
        { name = 'Detective Scout', model = 'truscout', price = 0 },
        { name = 'Undercover Coquette', model = 'det-coq', price = 0 },
        { name = 'Undercover Jackal', model = 'det-jackal', price = 0 },
        { name = 'Undercover Panto', model = 'det-panto', price = 0 },
		{ name = 'Undercover Tailgater', model = 'det-tailgater', price = 0 },
    }
}

Config.FDCars = {
    all = {
        { name = 'LSFD Ambo', model = 'lsmd-ambo1', price = 0 },
        { name = 'LSFD Large Ambo', model = 'lsmd-bigambo', price = 0 },
        { name = 'LSFD Firetruck', model = 'lsmd-firetruk', price = 0 },
        { name = 'LSFD Hazard Truck', model = 'lsmd-truck', price = 0 },
        { name = 'LSFD Water Rescue', model = 'lsmd-utility', price = 0 },
        { name = 'LSFD Bison', model = 'lsmd-utility2', price = 0 },
        { name = 'LSFD Stair Truck', model = 'stairtruck', price = 0 },
    }
}

Config.MDCars = {
    all = {
        { name = 'LSMD Granger', model = 'lsmd-suv', price = 0 },
        { name = 'LSMD Ambo', model = 'lsmd-ambo1', price = 0 },
        { name = 'LSMD Large Ambo', model = 'lsmd-bigambo', price = 0 },
        { name = 'LSMD Vapid', model = 'lsmd-vanbo', price = 0 },
        { name = 'LSMD Doctor Vehicle', model = 'lsmd-docto', price = 0 },
        { name = 'LSMD Caracara', model = 'emerg-cara', price = 0 },
    }
}

Config.PDAir = {
    all = {
        { name = 'PD Mavrick', model = 'pd-mav', price = 0 },
        { name = 'SAHP Buzzard', model = 'hwy-buz', price = 0 },
    }
}

Config.MDAir = {
    all = {
        { name = 'LSMD Mavrick', model = 'pd-mav', price = 0 },
    }
}

Config.FDAir = {
    all = {
        { name = 'LSFD Mavrick', model = 'pd-mav', price = 0 },
    }
}

Config.PDBoats = {
    all = {
        { name = 'PD Dinghy', model = 'pd-dinghy', price = 0 },
        { name = 'BCSO Dodo', model = 'county-dodo', price = 0 },
    }
}

Config.MDBoats = {
    all = {
        { name = 'LSMD Dinghy', model = 'emerg-dinghy', price = 0 },
    }
}

Config.FDBoats = {
    all = {
        { name = 'LSFD Dinghy', model = 'emerg-dinghy', price = 0 },
        { name = 'LSFD Dodo', model = 'emerg-dodo', price = 0 },
    }
}

Config.FDLSIA = {
    all = {
        { name = 'LSFD Helicopter', model = 'pd-mav', price = 0 },
        { name = 'LSFD Dodo', model = 'emerg-dodo', price = 0 },
    }
}

Config.DOCCars = {
    all = {
        { name = 'Transport Van', model = 'doc-transport', price = 0 },
        { name = 'Prison Bus', model = 'doc-pbus', price = 0 },
        { name = 'Patrol', model = 'doc-patrol', price = 0 },
    }
}

Config.ParkRangerCars = {
    all = {
        { name = 'Rancher', model = 'park-ranch', price = 0 },
        { name = 'Benson', model = 'pr-benson', price = 0 },
        { name = 'Caracara', model = 'emerg-cara', price = 0 },
        { name = 'Enduro', model = 'county-dirt', price = 0 },
    }
}

Config.ClerkCars = {
    all = {
        { name = 'Records Transport', model = 'drd-records', price = 0 },
        { name = 'Patrol', model = 'drd-patrol', price = 0 },
    }
}

Config.HumaneCars = {
    all = {
        { name = 'Mule', model = 'mule2', price = 0 },
        { name = 'Van', model = 'burrito3', price = 0 },
    }
}


Config.Shops      = {
    -- Police

    -- PD Air
    {
        name       = 'MRPD Upper Air',
        job        = 'police',
        coords     = vector3(448.68, -981.2, 43.69),
        heading    = 0.0,
        shopCoords = vector3(452.0, -992.55, 43.69),
        type       = "air",
        cars       = Config.PDAir
    },
    {
        name       = 'MRPD Lower Air',
        job        = 'police',
        coords     = vector3(480.84, -982.26, 41.01),
        heading    = 0.0,
        shopCoords = vector3(483.53, -995.76, 41.01),
        type       = "air",
        cars       = Config.PDAir
    },
    {
        name       = 'Sandy Airstrip',
        job        = 'police',
        coords     = vector3(1770.23, 3239.52, 42.13),
        heading    = 290.0,
        shopCoords = vector3(1770.23, 3239.52, 42.13),
        type       = "air",
        cars       = Config.PDAir
    },    
    {
        name       = 'Paleto PD Air',
        job        = 'police',
        coords     = vector3(-475.18, 5988.43, 31.34),
        heading    = 0.0,
        shopCoords = vector3(-482.02, 5981.09, 31.31),
        type       = "air",
        cars       = Config.PDAir
    },
    {
        name       = 'Safehouse 1 Air',
        job        = 'police',
        coords     = vector3(-1391.74, -477.37, 91.25),
        heading    = 0.0,
        shopCoords = vector3(-1391.74, -477.37, 91.25),
        type       = "air",
        cars       = Config.PDAir
    },
    {
        name       = 'Safehouse 2 Air',
        job        = 'police',
        coords     = vector3(-1582.25, -569.47, 116.33),
        heading    = 0.0,
        shopCoords = vector3(-1582.25, -569.47, 116.33),
        type       = "air",
        cars       = Config.PDAir
    },
    {
        name       = 'Vinewood PD Air',
        job        = 'police',
        coords     = vector3(579.74, 12.36, 103.23),
        heading    = 358.74,
        shopCoords = vector3(579.74, 12.36, 103.23),
        type       = "air",
        cars       = Config.PDAir
    },
    {
        name       = 'Davis PD Air',
        job        = 'police',
        coords     = vector3(362.85, -1598.45, 36.95),
        heading    = 320.50,
        shopCoords = vector3(362.85, -1598.45, 36.95),
        type       = "air",
        cars       = Config.PDAir
    },
    {
        name       = 'Vespucci PD Air',
        job        = 'police',
        coords     = vector3(-1095.45, -835.17, 37.68),
        heading    = 308.18,
        shopCoords = vector3(-1095.45, -835.17, 37.68),
        type       = "air",
        cars       = Config.PDAir
    },

    -- PD Cars
    {
        name       = 'MRPD Parking Lot',
        job        = 'police',
        coords     = vector3(430.90, -990.43, 25.70),
        heading    = 180.0,
        shopCoords = vector3(457.58, -991.85, 25.70),
        type       = "car",
        cars       = Config.PDCars
    },
    {
        name       = 'Sandy PD Cars',
        job        = 'police',
        coords     = vector3(1864.54, 3699.81, 33.6),
        heading    = 215.0,
        shopCoords = vector3(1864.54, 3699.81, 33.6),
        type       = "car",
        cars       = Config.PDCars
    },
    {
        name       = 'Paleto PD Cars',
        job        = 'police',
        coords     = vector3(-462.84, 6018.89, 31.35),
        heading    = 315.0,
        shopCoords = vector3(-462.84, 6018.89, 31.35),
        type       = "car",
        cars       = Config.PDCars
    },
    {
        name       = 'Vinewood PD Cars',
        job        = 'police',
        coords     = vector3(529.86, -28.9, 70.63),
        heading    = 210.54,
        shopCoords = vector3(529.86, -28.9, 70.63),
        type       = "car",
        cars       = Config.PDCars
    },
    {
        name       = 'La Mesa PD Cars',
        job        = 'police',
        coords     = vector3(843.97, -1334.57, 26.1),
        heading    = 244.80,
        shopCoords = vector3(843.97, -1334.57, 26.1),
        type       = "car",
        cars       = Config.PDCars
    },
    {
        name       = 'Davis PD Cars',
        job        = 'police',
        coords     = vector3(391.06, -1610.69, 29.29),
        heading    = 229.42,
        shopCoords = vector3(391.06, -1610.69, 29.29),
        type       = "car",
        cars       = Config.PDCars
    },
    {
        name       = 'Vespucci PD Cars',
        job        = 'police',
        coords     = vector3(-1126.68, -840.59, 13.5),
        heading    = 129.18,
        shopCoords = vector3(-1126.68, -840.59, 13.5),
        type       = "car",
        cars       = Config.PDCars
    },
    {
        name       = 'Rockford PD Cars',
        job        = 'police',
        coords     = vector3(-556.25, -145.07, 38.18),
        heading    = 239.59,
        shopCoords = vector3(-556.25, -145.07, 38.18),
        type       = "car",
        cars       = Config.PDCars
    },

    --PD Boats
    {
        name       = 'Chumash PD Dock',
        job        = 'police',
        coords     = vector3(-3338.05, 952.41, 8.29),
        heading    = 95.0,
        shopCoords = vector3(-3338.05, 952.41, 8.29),
        type       = "boat",
        cars       = Config.PDBoats
    },
    {
        name       = 'Del Perro Pier PD Dock',
        job        = 'police',
        coords     = vector3(-1810.58, -1269.32, 8.62),
        heading    = 145.0,
        shopCoords = vector3(-1816.17, -1264.58, 8.62),
        type       = "boat",
        cars       = Config.PDBoats
    },
    {
        name       = 'Shank Street PD Dock',
        job        = 'police',
        coords     = vector3(-790.31, -1434.19, 2.4),
        heading    = 135.0,
        shopCoords = vector3(-790.31, -1434.19, 2.4),
        type       = "boat",
        cars       = Config.PDBoats
    },
    {
        name       = 'Sandy Shores PD Dock',
        job        = 'police',
        coords     = vector3(1583.85, 3926.66, 33.11),
        heading    = 15.0,
        shopCoords = vector3(1583.48, 3917.66, 33.11),
        type       = "boat",
        cars       = Config.PDBoats
    },
    {
        name       = 'Paleto Bay PD Dock',
        job        = 'police',
        coords     = vector3(-296.38, 6615.42, 4.1),
        heading    = 50.0,
        shopCoords = vector3(-296.38, 6615.42, 4.1),
        type       = "boat",
        cars       = Config.PDBoats
    },
    {
        name       = 'Catfish View PD Dock',
        job        = 'police',
        coords     = vector3(3864.87, 4469.84, 2.72),
        heading    = 268.0,
        shopCoords = vector3(3864.87, 4469.84, 2.72),
        type       = "boat",
        cars       = Config.PDBoats
    },
    {
        name       = 'Autopia Pkwy PD Dock',
        job        = 'police',
        coords     = vector3(64.53, -2256.33, 5.81),
        heading    = 175.0,
        shopCoords = vector3(64.53, -2256.33, 5.81),
        type       = "boat",
        cars       = Config.PDBoats
    },

    -- Ambulance
    {
        name       = 'Pillbox Air',
        job        = 'ambulance',
        coords     = vector3(349.69, -587.54, 74.16),
        heading    = 0.0,
        shopCoords = vector3(352.77, -595.66, 74.16),
        type       = "air",
        cars       = Config.MDAir
    },
    {
        name       = 'Pillbox Cars',
        job        = 'ambulance',
        coords     = vector3(338.09, -548.45, 28.74),
        heading    = 275.0,
        shopCoords = vector3(338.09, -548.45, 28.74),
        type       = "car",
        cars       = Config.MDCars
    },
    {
        name       = 'Morgue Cars',
        job        = 'ambulance',
        coords     = vector3(251.27, -1341.04, 31.94),
        heading    = 98.19,
        shopCoords = vector3(250.18, -1341.04, 31.94),
        type       = "car",
        cars       = Config.MDCars
    },
    {
        name       = 'Sandy MD Air',
        job        = 'ambulance',
        coords     = vector3(1770.25, 3239.73, 42.13),
        heading    = 0.0,
        shopCoords = vector3(1776.3, 3240.6, 42.23),
        type       = "air",
        cars       = Config.MDAir
    },
    {
        name       = 'Sandy MD Cars',
        job        = 'ambulance',
        coords     = vector3(1807.16, 3681.68, 34.5),
        heading    = 300.0,
        shopCoords = vector3(1807.16, 3681.68, 34.5),
        type       = "car",
        cars       = Config.MDCars
    },
    {
        name       = 'Paleto MD Air',
        job        = 'ambulance',
        coords     = vector3(-255.04, 6315.69, 39.66),
        heading    = 0.0,
        shopCoords = vector3(-249.96, 6322.0, 39.66),
        type       = "air",
        cars       = Config.MDAir
    },
    {
        name       = 'Paleto MD Cars',
        job        = 'ambulance',
        coords     = vector3(-262.86, 6339.03, 32.43),
        heading    = 135.0,
        shopCoords = vector3(-262.86, 6339.03, 32.43),
        type       = "car",
        cars       = Config.MDCars
    },
	{
        name       = 'Chumash MD Dock',
        job        = 'ambulance',
        coords     = vector3(-3338.05, 952.41, 8.29),
        heading    = 95.0,
        shopCoords = vector3(-3338.05, 952.41, 8.29),
        type       = "boat",
        cars       = Config.MDBoats
    },
    {
        name       = 'Del Perro Pier MD Dock',
        job        = 'ambulance',
        coords     = vector3(-1810.58, -1269.32, 8.62),
        heading    = 145.0,
        shopCoords = vector3(-1816.17, -1264.58, 8.62),
        type       = "boat",
        cars       = Config.MDBoats
    },
    {
        name       = 'Shank Street MD Dock',
        job        = 'ambulance',
        coords     = vector3(-790.31, -1434.19, 2.4),
        heading    = 135.0,
        shopCoords = vector3(-790.31, -1434.19, 2.4),
        type       = "boat",
        cars       = Config.MDBoats
    },
    {
        name       = 'Sandy Shores MD Dock',
        job        = 'ambulance',
        coords     = vector3(1583.85, 3926.66, 33.11),
        heading    = 15.0,
        shopCoords = vector3(1583.48, 3917.66, 33.11),
        type       = "boat",
        cars       = Config.MDBoats
    },
    {
        name       = 'Paleto Bay MD Dock',
        job        = 'ambulance',
        coords     = vector3(-296.38, 6615.42, 4.1),
        heading    = 50.0,
        shopCoords = vector3(-296.38, 6615.42, 4.1),
        type       = "boat",
        cars       = Config.MDBoats
    },
    {
        name       = 'Catfish View MD Dock',
        job        = 'ambulance',
        coords     = vector3(3864.87, 4469.84, 2.72),
        heading    = 268.0,
        shopCoords = vector3(3864.87, 4469.84, 2.72),
        type       = "boat",
        cars       = Config.MDBoats
    },
    {
        name       = 'Autopia Pkwy MD Dock',
        job        = 'ambulance',
        coords     = vector3(64.53, -2256.33, 5.81),
        heading    = 175.0,
        shopCoords = vector3(64.53, -2256.33, 5.81),
        type       = "boat",
        cars       = Config.MDBoats
    },

    -- Fire
    {
        name       = 'City FD Air',
        job        = 'fireman',
        coords     = vector3(1178.98, -1474.19, 39.12),
        heading    = 1.52,
        shopCoords = vector3(1178.98, -1474.19, 39.12),
        type       = "air",
        cars       = Config.FDAir
    },
    {
        name       = 'Davis FD Cars',
        job        = 'fireman',
        coords     = vector3(182.55, -1660.98, 29.8),
        heading    = 228.69,
        shopCoords = vector3(182.55, -1660.98, 29.8),
        type       = "car",
        cars       = Config.FDCars
    },
    {
        name       = 'Rockford FD Cars',
        job        = 'fireman',
        coords     = vector3(-642.38, -110.25, 37.94),
        heading    = 126.54,
        shopCoords = vector3(-642.38, -110.25, 37.94),
        type       = "car",
        cars       = Config.FDCars
    },
    {
        name       = 'Capital FD Cars',
        job        = 'fireman',
        coords     = vector3(1188.5, -1508, 34.28),
        heading    = 272.01,
        shopCoords = vector3(1188.5, -1508, 34.28),
        type       = "car",
        cars       = Config.FDCars
    },
    {
        name       = 'Sandy FD Air',
        job        = 'fireman',
        coords     = vector3(1770.25, 3239.73, 42.13),
        heading    = 0.0,
        shopCoords = vector3(1763.3, 3246.94, 41.76),
        type       = "air",
        cars       = Config.FDAir
    },
    {
        name       = 'Sandy FD Cars',
        job        = 'fireman',
        coords     = vector3(1711.3, 3594.92, 35.42),
        heading    = 216.55,
        shopCoords = vector3(1711.3, 3594.92, 35.42),
        type       = "car",
        cars       = Config.FDCars
    },
    {
        name       = 'Paleto FD',
        job        = 'fireman',
        coords     = vector3(-475.18, 5988.43, 31.34),
        heading    = 0.0,
        shopCoords = vector3(-482.02, 5981.09, 31.31),
        type       = "air",
        cars       = Config.FDAir
    },
    {
        name       = 'Paleto FD Cars',
        job        = 'fireman',
        coords     = vector3(-355.09, 6129.72, 31.44),
        heading    = 51.43,
        shopCoords = vector3(-355.09, 6129.72, 31.44),
        type       = "car",
        cars       = Config.FDCars
    },
    {
        name       = 'Chumash FD Dock',
        job        = 'fireman',
        coords     = vector3(-3338.05, 952.41, 8.29),
        heading    = 95.0,
        shopCoords = vector3(-3338.05, 952.41, 8.29),
        type       = "boat",
        cars       = Config.FDBoats
    },
    {
        name       = 'Del Perro Pier FD Dock',
        job        = 'fireman',
        coords     = vector3(-1810.58, -1269.32, 8.62),
        heading    = 145.0,
        shopCoords = vector3(-1816.17, -1264.58, 8.62),
        type       = "boat",
        cars       = Config.FDBoats
    },
    {
        name       = 'Shank Street FD Dock',
        job        = 'fireman',
        coords     = vector3(-790.31, -1434.19, 2.4),
        heading    = 135.0,
        shopCoords = vector3(-790.31, -1434.19, 2.4),
        type       = "boat",
        cars       = Config.FDBoats
    },
    {
        name       = 'Sandy Shores FD Dock',
        job        = 'fireman',
        coords     = vector3(1583.85, 3926.66, 33.11),
        heading    = 15.0,
        shopCoords = vector3(1583.48, 3917.66, 33.11),
        type       = "boat",
        cars       = Config.FDBoats
    },
    {
        name       = 'Paleto Bay FD Dock',
        job        = 'fireman',
        coords     = vector3(-296.38, 6615.42, 4.1),
        heading    = 50.0,
        shopCoords = vector3(-296.38, 6615.42, 4.1),
        type       = "boat",
        cars       = Config.FDBoats
    },
    {
        name       = 'Catfish View FD Dock',
        job        = 'fireman',
        coords     = vector3(3864.87, 4469.84, 2.72),
        heading    = 268.0,
        shopCoords = vector3(3864.87, 4469.84, 2.72),
        type       = "boat",
        cars       = Config.FDBoats
    },
    {
        name       = 'Autopia Pkwy FD Dock',
        job        = 'fireman',
        coords     = vector3(64.53, -2256.33, 5.81),
        heading    = 175.0,
        shopCoords = vector3(64.53, -2256.33, 5.81),
        type       = "boat",
        cars       = Config.FDBoats
    },
    {
        name       = 'LSIA FD Air Hanger',
        job        = 'fireman',
        coords     = vector3(-983.83, -2995.97, 14.26),
        heading    = 175.0,
        shopCoords = vector3(-983.83, -2995.97, 14.26),
        type       = "air",
        cars       = Config.FDLSIA
    },
    {
        name       = 'LSIA FD Chopper Pad',
        job        = 'fireman',
        coords     = vector3(-1177.68, -2846.77, 14.33),
        heading    = 0.0,
        shopCoords = vector3(-1177.68, -2846.77, 14.33),
        type       = "air",
        cars       = Config.FDAir
    },
    {
        name       = 'Sandy FD Air Hanger',
        job        = 'fireman',
        coords     = vector3(1711.78, 3256.34, 41.07),
        heading    = 0.0,
        shopCoords = vector3(1711.78, 3256.34, 41.07),
        type       = "air",
        cars       = Config.FDAir
    },

    -- DOC
    {
        name       = 'Bolingbroke Cars',
        job        = 'corrections',
        coords     = vector3(1796.58, 2633.37, 45.56),
        heading    = 175.0,
        shopCoords = vector3(1796.58, 2633.37, 45.56),
        type       = "car",
        cars       = Config.DOCCars
    },

    -- Park Rangers
    {
        name       = 'Vinewood Hills Cars',
        job        = 'parkranger',
        coords     = vector3(370.83, 779.75, 185.35),
        heading    = 247.0,
        shopCoords = vector3(370.83, 779.75, 185.35),
        type       = "car",
        cars       = Config.ParkRangerCars
    },

    -- City Clerks
    {
        name       = 'Records Office Cars',
        job        = 'cityclerk',
        coords     = vector3(2501.38, -313.21, 92.96),
        heading    = 136.86,
        shopCoords = vector3(2501.38, -313.21, 92.96),
        type       = "car",
        cars       = Config.ClerkCars
    },
    {
        name       = 'City Hall Cars',
        job        = 'cityclerk',
        coords     = vector3(-516.53, -293.51, 36.0),
        heading    = 21.85,
        shopCoords = vector3(-516.53, -293.51, 36.0),
        type       = "car",
        cars       = Config.ClerkCars
    },
    --Humane Job
    {
        name       = 'Humane Vehicles',
        job        = 'humane',
        coords     = vector3(3638.80, 3770.78, 28.76),
        heading    = 110.09,
        shopCoords = vector3(3638.80, 3770.78, 28.76),
        type       = "car",
        cars       = Config.HumaneCars
    },
}