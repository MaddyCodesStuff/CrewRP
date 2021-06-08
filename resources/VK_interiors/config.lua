INTERIORS = {

    -- [1] = {id = 1, x = 311.21099853516, y = -599.30438232422, z = 43.291831970215,  name = "To Hospital", destination = {2}},
    -- [2] = {id = 2, x = 338.70248413086, y= -583.84881591797, z = 74.165573120117,  name = "To Roof", destination = {1}},

    -- FIB
    [4]  = { id = 4, x = 138.18788146973, y = -764.86633300781, z = 45.75199508667, name = "Exit FBI", destination = { 5 } },
    [5]  = { id = 5, x = 136.36924743652, y = -749.36987304688, z = 258.15179443359, name = "Enter FBI", destination = { 4 } },

    -- FIB GARAGE
    [6]  = { id = 6, x = 142.06883239746, y = -768.97241210938, z = 45.752010345459, h = 72.884956359863, name = "FIB Building", destination = { 7 } },
    [7]  = { id = 7, x = 176.67442321777, y = -728.77349853516, z = 39.403667449951, h = 248.2452545166, name = "Garage", destination = { 6 } },

    -- Psychiatrist
    [16] = { id = 16, x = -1898.3725585938, y = -572.23272705078, z = 11.844171524048, name = "Exit Office", destination = { 17 } },
    [17] = { id = 17, x = -1902.0192871094, y = -572.36346435547, z = 19.097213745117, name = "Enter Office", destination = { 16 } },

    -- New
    [18] = { id = 18, x = 3562.8259277344, y = 3690.3332519531, z = 28.121658325195, name = "Enter Business", destination = { 19 } },
    [19] = { id = 19, x = 3526.3579101563, y = 3673.7409667969, z = 28.121139526367, name = "Exit Business", destination = { 18 } },

    -- Vanilla Unicorn
    [26] = { id = 26, x = 102.23, y = -1296.03, z = 28.76, name = "Backstage", destination = { 27 } },
    [27] = { id = 27, x = 126.08, y = -1279.21, z = 29.27, name = "Behind Bar/DJ", destination = { 26 } },

    -- Morgue (from Pillbox lower)

    -- [28] = {id = 28, x = 286.22784423828, y = -1350.8328857422, z = 24.534637451172, name = "Enter Morgue", destination = {29}},
    -- [29] = {id = 29, x = 312.56564331055, y = -567.48803710938, z = 28.788503646851, name = "Exit Morgue", destination = {28}},

    -- [30] = {id = 30, x = 316.85174560546, y = -583.66271972656, z = 43.28173828125, name = "Exit Forensics", destination = {31}},
    -- [31] = {id = 31, x = 251.5129699707, y = -1367.7235107422, z = 39.53438949585, name = "Enter Forensics", destination = {30}},

    -- Psychiatrist (Balcony)

    [32] = { id = 32, x = -1911.2969970704, y = -574.46405029296, z = 19.097213745118, name = "Balcony", destination = { 33 } },
    [33] = { id = 33, x = -1913.4349365234, y = -574.26361083984, z = 19.096912384034, name = "Balcony", destination = { 32 } },

    [34] = { id = 34, x = 1088.68, y = -3187.73, z = -38.99, name = "Chemicals Lab", destination = { 35 } },
    [35] = { id = 35, x = 3.35, y = -1215.1, z = 26.4, name = "Overpass", destination = { 34 } },

    -- Pillbox

    -- [34] = {id=34, x = 337.50061035156, y = -594.17211914062, z = 28.791482925416, name = "Emergency", destination = {35}}, -- Downstairs
    -- [35] = {id=35, x = 309.75064086914, y = -602.7748413086, z = 43.29183959961, name = "Walk-In", destination = {34}}, -- Upstairs

    -- Coroner
    -- [36] = {id = 36, x = 259.40463256836, y = -1357.0032958984, z = 30.751746368408, name = "Exit", destination = {37}},
    -- [37] = {id = 37, x = 238.21975708008, y = -1358.7827148438, z = 29.757993087768, name = "Entrance", destination = {36}},

    -- PillBox
    -- [1] = {id = 1, x = 360.08847045898, y = -585.16223144531, z = 28.820465087891,  name = "Exit EMS", destination = {2}},
    -- [2] = {id = 2, x = 299.21420288086, y = -599.0825805664, z = 43.292072296142,  name = "Enter EMS", destination = {1}},

    -- [20] = {id = 20, x = 310.33755493164, y = -599.03839111328, z = 43.291820526123,  name = "To Hospital", destination = {21}},
    -- [21] = {id = 21, x = 317.98727416992, y = -557.70751953125, z = 28.743770599365,  name = "Vehicle Pool", destination = {20}},

    -- [28] = {id = 28, x = 333.91555786132, y = -571.02917480468, z = 43.317348480224, name = "Exit Morgue", destination = {29}},
    -- [29] = {id = 29, x = 249.43144226074, y = -1369.1413574218, z = 24.537788391114, name = "Enter Morgue", destination = {28}},

    --Doomsday Bunker
    [38] = { id = 38, x = -2051.7819824219, y = 3237.2001953125, z = 31.501216888428, name = "Doomsday Elevator", destination = { 39 } },
    [39] = { id = 39, x = 460.54199218, y = 4815.76953125, z = -59.000339508057, name = "Doomsday Facility", destination = { 38 } },

    --Mine Shaft Bunker
    [40] = { id = 40, x = -422.71166992188, y = 2065.0231933594, z = 119.9135055542, name = "Mine Shaft", destination = { 41 } },
    [41] = { id = 41, x = 895.68225097656, y = -3245.6447753906, z = -98.250122070312, name = "Humane Labs 3C", destination = { 40 } },

    --IAA Bunker
    [42] = { id = 42, x = 1013.4406738281, y = 2905.2666015625, z = 41.371246337891, name = "Sandy Mineshaft", destination = { 43 } },
    [43] = { id = 43, x = 2151.1369628906, y = 2921.3303222656, z = -61.901874542236, name = "IAA Bunker", destination = { 42 } },

    --IAA Databank
    [44] = { id = 44, x = 2475.8815917969, y = -384.158203125, z = 94.400459289551, name = "IAA Building", destination = { 45 } },
    [45] = { id = 45, x = 2154.7507324219, y = 2920.9653320312, z = -81.075492858887, name = "IAA Databank", destination = { 44 } },

    --Smuggler's Run Hangar
    [46] = { id = 46, x = -1152.7679443359, y = -3411.3513183594, z = 13.94505405426, name = "LSIA", destination = { 47 } },
    [47] = { id = 47, x = -1267.0618896484, y = -3049.0576171875, z = -48.49002456665, name = "Hangar", destination = { 46 } },

    --MC Clubhouse
    [48] = { id = 48, x = 180.44293212891, y = 2793.3100585938, z = 45.655178070068, name = "Cement Warehouse", destination = { 49 } },
    [49] = { id = 49, x = 1120.9810791016, y = -3152.4792480469, z = -37.06275177002, name = "MC Clubhouse", destination = { 48 } },

    --Warehouse
    [50] = { id = 50, x = 2889.9790039062, y = 4391.6020507812, z = 50.335781097412, name = "Union Road", destination = { 51 } },
    [51] = { id = 51, x = 997.25457763672, y = -3200.7729492188, z = -36.393714904785, name = "Empty Warehouse", destination = { 50 } },

    --Weed Warehouse
    [52] = { id = 52, x = -1724.60302273438, y = 234.35597229004, z = 58.471702575684, name = "Univeristy", destination = { 53 } },
    [53] = { id = 53, x = 1066.1577148438, y = -3183.4577636719, z = -39.163551330566, name = "Grow Room", destination = { 52 } },

    --Money Washing Warehouse
    [54] = { id = 54, x = -1320.5550537109, y = -1167.4138183594, z = 4.8467106819153, name = "Vespucci", destination = { 55 } },
    [55] = { id = 55, x = 1138.1810302734, y = -3198.9992675781, z = -39.665721893311, name = "Laundromat", destination = { 54 } },

    --Office Space
    [56] = { id = 56, x = -696.32061767578, y = -1386.6899414062, z = 5.4952774047852, name = "Marina", destination = { 57 } },
    [57] = { id = 57, x = 1173.6955566406, y = -3196.5874023438, z = -39.007968902588, name = "Marina Office", destination = { 56 } },

    --Medium Warehouse
    [58] = { id = 58, x = 387.474945506836, y = 3584.8908691406, z = 33.292236328125, name = "Marina Dr", destination = { 59 } },
    [59] = { id = 59, x = 1048.4837646484, y = -3097.11547851566, z = -38.999950408936, name = "Warehouse", destination = { 58 } },

    --Large Warehouse
    [60] = { id = 60, x = -1098.9284667969, y = -2137.5815429688, z = 13.398830413818, name = "Exit", destination = { 61 } },
    [61] = { id = 61, x = 992.68634033203, y = -3097.7756347656, z = -38.99585723877, name = "Shipping Warehouse", destination = { 60 } },

    --Casino Vault
    --[62] = { id = 62, x = 2502.32421875, y = -229.24325561523, z = -60.308536529541, name = "Exit", destination = { 63 } },
    --[63] = { id = 63, x = 2550.044921875, y = -269.42706298828, z = -58.722988128662, name = "Casino Vault", destination = { 62 } },

    --Casino Lobby
    --[64] = { id = 64, x = 935.92541503906, y = 46.968280792236, z = 81.095771789551, name = "Exit", destination = { 65 } },
    --[65] = { id = 65, x = 2468.9311523438, y =-287.68231201172, z = -58.267486572266, name = "Casino Lobby", destination = { 64 } },
    
}
