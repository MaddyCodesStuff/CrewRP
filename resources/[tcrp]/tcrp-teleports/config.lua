Config              = {}

Config.DrawDistance = 3

Config.Elevators    = {
    -- Pillbox elevators
    { -- Pillbox Upper 1
        name    = "Pillbox Top Floor",
        Pos     = { x = 331.72, y = -595.43, z = 43.28 }, -- Position of the text to show up
        options = {
            {
                label = "Roof",
                name  = "roof",
                pos   = { x = 338.88, y = -583.86, z = 74.16 }, -- Position to take you to
            },
            {
                label = "Downstairs",
                name  = "Downstairs",
                pos   = { x = 339.63, y = -595.67, z = 28.79 }, -- Position to take you to
            },
        },
    },
    { -- Pillbox Upper 2
        name    = "Pillbox Top Floor",
        Pos     = { x = 329.84, y = -601.07, z = 43.28 }, -- Position of the text to show up
        options = {
            {
                label = "Roof",
                name  = "roof",
                pos   = { x = 338.88, y = -583.86, z = 74.16 }, -- Position to take you to
            },
            {
                label = "Downstairs",
                name  = "Downstairs",
                pos   = { x = 339.27, y = -595.59, z = 28.82 }, -- Position to take you to
            },
        },
    },
    { -- Pillbox Upper 3
        name    = "Pillbox Top Floor",
        Pos     = { x = 327.29, y = -603.41, z = 43.28 }, -- Position of the text to show up
        options = {
            {
                label = "Roof",
                name  = "roof",
                pos   = { x = 338.88, y = -583.86, z = 74.16 }, -- Position to take you to
            },
            {
                label = "Downstairs",
                name  = "Downstairs",
                pos   = { x = 339.27, y = -595.59, z = 28.82 }, -- Position to take you to
            },
        },
    },
    { -- Morgue Out->In
        name    = "City Morgue",
        Pos     = { x = 240.69, y = -1379.3, z = 33.74 }, -- Position of the text to show up
        options = {
            {
                label = "Morgue",
                name  = "morgue",
                pos   = { x = 275.75, y = -1361.34, z = 24.34 }, -- Position to take you to
                heading = 51.55,
            },
        },
    },
    { -- Morgue In->Out
    name    = "City Morgue",
    Pos     = { x = 275.75, y = -1361.34, z = 24.34 }, -- Position of the text to show up
    options = {
        {
            label = "Outside",
            name  = "outside",
            pos   = { x = 240.69, y = -1379.3, z = 33.74 }, -- Position to take you to
            heading = 140.71,
        },
    },
},
    { -- Roof
        name    = "Pillbox Roof",
        Pos     = { x = 340.26, y = -584.37, z = 74.16 }, -- Position of the text to show up
        options = {
            {
                label = "Main Floor",
                name  = "upperfloor",
                pos   = { x = 331.72, y = -595.43, z = 43.28 }, -- Position to take you to
            },
        },
    },
    { -- Roof
        name    = "Pillbox Bottom Entrance",
        Pos     = { x = 339.27, y = -595.59, z = 28.82 }, -- Position of the text to show up
        options = {
            {
                label = "Main Floor",
                name  = "upperfloor",
                pos   = { x = 331.72, y = -595.43, z = 43.28 }, -- Position to take you to
            },
        },
    },
    { -- Safehouse Roof Entrance.
        name    = "roofaccess",
        Pos     = { x = -1570.25, y = -576.4, z = 114.45 }, -- Position of the text to show up
        options = {
            {
                label = "Safe House",
                name  = "safehouse",
                pos   = { x = -773.95, y = 342.03, z = 195.69 }, -- Position to take you to
            },
        },
    },
    { -- Safehouse
        name    = "safehouse",
        Pos     = { x = -773.95, y = 342.03, z = 196.69 }, -- Position of the text to show up
        options = {
            {
                label = "Roof Access",
                name  = "roofaccess",
                pos   = { x = -1570.25, y = -576.4, z = 113.45 }, -- Position to take you to
            },
        },
    },

    { -- Safehouse2 Roof Entrance.
        name    = "roofaccess2",
        Pos     = { x = -1369.48, y = -472.03, z = 84.45 }, -- Position of the text to show up
        options = {
            {
                label = "Safe House",
                name  = "safehouse2",
                pos   = { x = -787.08, y = 315.74, z = 186.91, h = 267.9 }, -- Position to take you to
            },
        },
    },
    { -- Safehouse2
        name    = "safehouse2",
        Pos     = { x = -787.08, y = 315.74, z = 187.91 }, -- Position of the text to show up
        options = {
            {
                label = "Roof Access",
                name  = "roofaccess2",
                pos   = { x = -1369.48, y = -472.03, z = 83.45, h = 295.91 }, -- Position to take you to
            },
        },
    },
    { -- Andy's Gang Garage Inside
        name    = "The Den1",
        Pos     = { x = 997.44, y = -3158.1, z = -38.91 },
        options = {
            {
                label   = "Outside",
                name    = "The Den",
                pos     = { x = -689.93, y = -893.08, z = 24.5, h = 275 },
                heading = 263.69,
            },
        },
    },
    { -- Andy's Gang Garage Outside
        name    = "The Den",
        Pos     = { x = -689.93, y = -893.08, z = 24.5 },
        options = {
            {
                label   = "Inside",
                name    = "The Den1",
                pos     = { x = 997.44, y = -3158.1, z = -38.91, h = 275 },
                heading = 272.18,
            },
        },
    },

    
    { -- Galaxy Outside
        name    = "Galaxy Outside",
        Pos     = { x = -121.16, y = -1258.5, z = 29.31 },
        options = {
            {
                label   = "Inside",
                name    = "Galaxy Out",
                pos     = { x = -1569.6, y = -3017.39, z = -74.41, h = 0 },
                heading = 0.00,
            },
        },
    },
    { -- Galaxy Inside
    name    = "Galaxy Inside",
    Pos     = { x = -1569.6, y = -3017.39, z = -74.41 },
    options = {
         {
            label   = "Outside",
            name    = "Galaxy In",
            pos     = { x = -121.16, y = -1258.5, z = 29.31, h = 270 },
            heading = 270.01,
         },
     },
    },
    { -- Galaxy Receptionist In
    name    = "Galaxy Receptionist",
    Pos     = { x = -1581.63, y = -3006.45, z = -76.00 },
    options = {
         {
            label   = "Recpetion In",
            name    = "Reception In",
            pos     = { x = -1572.83, y = -3014.53, z = -74.41, h = 121 },
            heading = 270.01,
         },
     },
    },
    { -- Galaxy Receptionist Out
    name    = "Galaxy Reception Out",
    Pos     = { x = -1572.83, y = -3014.53, z = -74.41 },
    options = {
         {
            label   = "Recpetion Out",
            name    = "Reception Out",
            pos     = { x = -1581.93, y = -3006.65, z = -76.01, h = 121 },
            heading = 90.01,

         }, 
     },
    },
    { -- Galaxy Shady Garage Out
    name    = "Galaxy Garage Out",
    Pos     = { x = -1640.05, y = -3013.54, z = -78.14 },
    options = {
         {
            label   = "Garage Out",
            name    = "Garage Out",
            pos     = { x = -164.57, y = -1296.31, z = 31.05, h = 121 },
            heading = 179.99,
         }, 
     },
    },
    { -- Galaxy Shady Garage in
    name    = "Galaxy Garage In",
    Pos     = { x = -164.57, y = -1296.31, z = 31.05 },
    options = {
         {
            label   = "Garage Out",
            name    = "Garage Out",
            pos     = { x = -1640.05, y = -3013.54, z = -78.14, h = 121 },
            heading = 0,
         }, 
     },
    },
    { -- Maze Garage Out
    name    = "Maze Garage Out",
    Pos     = { x = -83.87, y = -824.04, z = 222.01 },
    options = {
         {
            label   = "Maze Garage Out",
            name    = "MGarage Out",
            pos     = { x = -84.13, y = -821.53, z = 36.03, h = 121 },
            heading = 344.81,
         }, 
     },
    },
    { -- Maze Garage In
    name    = "Maze Garage In",
    Pos     = { x = -84.13, y = -821.53, z = 36.03 },
    options = {
         {
            label   = "Maze Garage In",
            name    = "MGarage In",
            pos     = { x = -83.87, y = -824.04, z =  222.01, h = 121 },
            heading = 49.51,
         }, 
     },
    },
    { -- FIB Garage Out
    name    = "FIB Garage",
    Pos     = { x = 142.06, y = -768.97, z = 45.75},
    options = {
         {
            label   = "FIB Out",
            name    = "FIB Out",
            pos     = { x = 176.8, y = -728.77349853516, z = 39.403667449951, h = 248.2452545166 },
            heading = 248.2452545166,
         }, 
     },
    },
    { -- FIB Garage
    name    = "FIB Backdoor",
    Pos     = { x = 176.69, y = -728.77, z = 39.40},
    options = {
         {
            label   = "FIB In",
            name    = "FIB In",
            pos     = { x = 142.06, y = -768.97, z = 45.75, h = 248.2452545166 },
            heading = 65.87,
         }, 
     },
    },

    { -- FIB Elevator Up
    name    = "FIB Elevator",
    Pos     = { x = 138.13, y = -765.05, z = 45.75},
    options = {
         {
            label   = "Top Floor",
            name    = "Top Floor",
            pos     = { x = 156.77, y = -757.56, z = 258.15, h = 248.2452545166 },
            heading = 152.89,
         }, 
     },
    },

    { -- FIB Elevator Down
    name    = "FIB Elevator Down",
    Pos     = { x = 156.77, y = -757.56, z = 258.15},
    options = {
         {
            label   = "Main Floor",
            name    = "Main Floor",
            pos     = { x = 138.13, y = -765.05, z = 45.75, h = 248.2452545166 },
            heading = 152.89,
         }, 
     },
    },

    { -- Psychiatrist In
    name    = "Psychiatrist Office",
    Pos     = { x = -1898.49, y = -572.37, z = 11.84},
    options = {
         {
            label   = "Enter Office",
            name    = "Enter Office",
            pos     = { x = -1902.12, y = -572.42, z = 19.10, h = 248.2452545166 },
            heading = 138.15,
         }, 
     },
    },

    { -- Psychiatrist Out
    name    = "Psychiatrist Office",
    Pos     = { x = -1902.12, y = -572.42, z = 19.10},
    options = {
         {
            label   = "Enter Office",
            name    = "Enter Office",
            pos     = { x = -1898.49, y = -572.37, z = 11.84, h = 248.2452545166 },
            heading = 229.24,
         }, 
     },
    },

    { -- Psychiatrist Balcony
    name    = "Balcony",
    Pos     = { x = -1911.19, y = -574.39, z = 19.10},
    options = {
         {
            label   = "Balcony Out",
            name    = "Balcony Out",
            pos     = { x = -1913.45, y = -574.21, z = 19.1, h = 248.2452545166 },
            heading = 141.52,
         }, 
     },
    },

    { -- Psychiatrist Balcony
    name    = "Balcony",
    Pos     = { x = -1913.45, y = -574.21, z = 19.10},
    options = {
         {
            label   = "Balcony In",
            name    = "Balcony In",
            pos     = { x = -1911.19, y = -574.39, z = 19.1, h = 248.2452545166 },
            heading = 319.68,
         }, 
     },
    },

    { -- Humane Elevator
    name    = "Humane Elevator",
    Pos     = { x = 3562.87, y = 3690.34, z = 28.12},
    options = {
         {
            label   = "Bottom Floor",
            name    = "Bottom Floor",
            pos     = { x = 3540.73, y = 3675.69, z = 20.99, h = 248.2452545166 },
            heading = 165.77,
         }, 
     },
    },

    { -- Humane Elevator
    name    = "Humane Elevator",
    Pos     = { x = 3540.73, y = 3675.69, z = 20.99},
    options = {
         {
            label   = "Floor Up",
            name    = "Floor Up",
            pos     = { x = 3562.87, y = 3690.34, z = 28.12, h = 248.2452545166 },
            heading = 258.49,
         }, 
     },
    },

    { -- Doomsday Bunker Down
    name    = "IAA Research Bunker",
    Pos     = { x = -2051.63, y = 3237.13, z = 31.5},
    options = {
         {
            label   = "Down",
            name    = "Down",
            pos     = { x = 469.5, y = 4782.48, z = -58.99, h = 248.2452545166 },
            heading = 185.26,
         }, 
     },
    },

    { -- Doomsday Bunker Up
    name    = "IAA Research Bunker",
    Pos     = { x = 469.5, y = 4782.48, z = -58.99},
    options = {
         {
            label   = "Up",
            name    = "Up",
            pos     = { x = -2051.63, y = 3237.13, z = 31.5, h = 248.2452545166 },
            heading = 59.48,
         }, 
     },
    },

    { -- Doomsday Bunker Garage Down
    name    = "IAA Garage Access",
    Pos     = { x = -2034.08, y = 3229.31, z = 32.81},
    options = {
         {
            label   = "Down",
            name    = "Down",
            pos     = { x = 481.99, y = 4813.68, z = -58.38, h = 248.2452545166 },
            heading = 194.66,
         }, 
     },
    },

    { -- Doomsday Bunker Garage Up
    name    = "IAA Garage Access",
    Pos     = { x = 481.99, y = 4813.68, z = -58.38},
    options = {
         {
            label   = "Up",
            name    = "Up",
            pos     = { x = -2034.08, y = 3229.31, z = 32.81, h = 248.2452545166 },
            heading = 59.48,
         }, 
     },
    },

    { -- Mine Shaft Bunker Entrance
    name    = "Humane Labs 3C",
    Pos     = { x = -422.65, y = 2065.08, z = 119.88},
    options = {
         {
            label   = "Enter Bunker",
            name    = "Enter Bunker",
            pos     = { x = 895.74, y = -3245.59, z = -98.25, h = 248.2452545166 },
            heading = 94.64,
         }, 
     },
    },

    { -- Mine Shaft Bunker Exit
    name    = "Mine Shaft",
    Pos     = { x = 895.74, y = -3245.59, z = -98.25},
    options = {
         {
            label   = "Enter Bunker",
            name    = "Enter Bunker",
            pos     = { x = -422.65, y = 2065.08, z = 119.88, h = 248.2452545166 },
            heading = 98.94,
         }, 
     },
    },

    { -- Sandy Mineshaft Entrance
    name    = "Mysterious Locked Door",
    Pos     = { x = 1013.61, y = 2905.35, z = 41.38},
    options = {
         {
            label   = "Enter Door",
            name    = "Enter Door",
            pos     = { x = 2150.91, y = 2921.32, z = -61.9, h = 248.2452545166 },
            heading = 90.36,
         }, 
     },
    },

    { -- Sandy Mineshaft Exit
    name    = "Sandy Mineshaft",
    Pos     = { x = 2150.91, y = 2921.32, z = -61.9},
    options = {
         {
            label   = "Exit To Sandy",
            name    = "Exit To Sandy",
            pos     = { x = 1013.61, y = 2905.35, z = 41.38, h = 248.2452545166 },
            heading = 282.9,
         }, 
     },
    },

    { -- IAA Databank
    name    = "IAA Databank",
    Pos     = { x = 2476.03, y = -384.1, z = 94.4},
    options = {
         {
            label   = "Enter Databank",
            name    = "Enter Databank",
            pos     = { x = 2154.75, y = 2920.97, z = -81.08, h = 248.2452545166 },
            heading = 281.84,
         }, 
     },
    },

    { -- IAA Databank
    name    = "IAA Databank",
    Pos     = { x = 2154.75, y = 2920.97, z = -81.08},
    options = {
         {
            label   = "Exit Databank",
            name    = "Exit Databank",
            pos     = { x = 2476.03, y = -384.1, z = 94.4, h = 248.2452545166 },
            heading = 266.81,
         }, 
     },
    },

    { -- LSIA Hangar Enter
    name    = "Hangar",
    Pos     = { x = -1150.96, y = -3408.19, z = 13.95},
    options = {
         {
            label   = "Enter Hangar",
            name    = "Enter Hangar",
            pos     = { x = -1267.13, y = -3045.63, z = -48.49, h = 248.2452545166 },
            heading = 0.56,
         }, 
     },
    },

    { -- LSIA Hangar Exit
    name    = "Hangar",
    Pos     = { x = -1267.13, y = -3045.63, z = -48.49},
    options = {
         {
            label   = "Exit Hangar",
            name    = "Exit Hangar",
            pos     = { x = -1150.96, y = -3408.19, z = 13.95, h = 248.2452545166 },
            heading = 328.12,
         }, 
     },
    },

    { -- MC Clubhouse Enter
    name    = "Fallen Saints Clubhouse",
    Pos     = { x = 180.84, y = 2793.35, z = 45.66},
    options = {
         {
            label   = "Enter Clubhouse",
            name    = "Enter Clubhouse",
            pos     = { x = 1120.98, y = -3152.29, z = -37.06, h = 248.2452545166 },
            heading = 0,
         }, 
     },
    },

    { -- MC Clubhouse Exit
    name    = "Fallen Saints Clubhouse",
    Pos     = { x = 1120.98, y = -3152.29, z = -37.06},
    options = {
         {
            label   = "Exit Clubhouse",
            name    = "Exit Clubhouse",
            pos     = { x = 180.84, y = 2793.35, z = 45.66, h = 248.2452545166 },
            heading = 266.31,
         }, 
     },
    },

    { -- MC Clubhouse Garage Enter
    name    = "Clubhouse Garage Enter",
    Pos     = { x = 189.35, y = 2787.1, z = 45.6},
    options = {
         {
            label   = "Enter Clubhouse",
            name    = "Enter Clubhouse",
            pos     = { x = 1109.26, y = -3163.88, z = -37.52, h = 248.2452545166 },
            heading = 357.48,
         }, 
     },
    },

    { -- MC Clubhouse Garage Exit
    name    = "Clubhouse Garage Exit",
    Pos     = { x = 1109.26, y = -3163.88, z = -37.52},
    options = {
         {
            label   = "Exit Clubhouse",
            name    = "Exit Clubhouse",
            pos     = { x = 189.35, y = 2787.1, z = 45.6, h = 248.2452545166 },
            heading = 276.39,
         }, 
     },
    },

    { -- Small Empty Warehouse Enter
    name    = "Empty Warehouse",
    Pos     = { x = 2890.16, y = 4391.55, z = 50.34},
    options = {
         {
            label   = "Enter Warehouse",
            name    = "Enter Warehouse",
            pos     = { x = 997.35, y = -3200.62, z = -36.39, h = 248.2452545166 },
            heading = 273.53,
         }, 
     },
    },

    { -- Small Empty Warehouse Exit
    name    = "Empty Warehouse",
    Pos     = { x = 997.35, y = -3200.62, z = -36.39},
    options = {
         {
            label   = "Exit Warehouse",
            name    = "Exit Warehouse",
            pos     = { x = 2890.16, y = 4391.55, z = 50.34, h = 248.2452545166 },
            heading = 292.43,
         }, 
     },
    },

    { -- Small Empty Warehouse Garage Exit
    name    = "Warehouse Garage",
    Pos     = { x = 1003.62, y = -3200.48, z = -38.99},
    options = {
         {
            label   = "Exit Warehouse",
            name    = "Exit Warehouse",
            pos     = { x = 2887.63, y = 4383.15, z = 50.3, h = 248.2452545166 },
            heading = 205.66,
         }, 
     },
    },

    { -- Small Empty Warehouse Garage Enter
    name    = "Warehouse Garage",
    Pos     = { x = 2887.63, y = 4383.15, z = 50.3},
    options = {
         {
            label   = "Exit Warehouse",
            name    = "Exit Warehouse",
            pos     = { x = 1003.62, y = -3200.48, z = -38.99, h = 248.2452545166 },
            heading = 0,
         }, 
     },
    },

    { -- Small Empty Warehouse Garage Enter
    name    = "Warehouse Garage",
    Pos     = { x = 2887.63, y = 4383.15, z = 50.3},
    options = {
         {
            label   = "Exit Warehouse",
            name    = "Exit Warehouse",
            pos     = { x = 1003.62, y = -3200.48, z = -38.99, h = 248.2452545166 },
            heading = 0,
         }, 
     },
    },

    { -- Weed Warehouse Enter
    name    = "Grow Room",
    Pos     = { x = -1724.86, y = 234.63, z = 58.47},
    options = {
         {
            label   = "Enter Grow Room",
            name    = "Enter Grow Room",
            pos     = { x = 1066.04, y = -3183.31, z = -39.16, h = 248.2452545166 },
            heading = 94.38,
         }, 
     },
    },

    { -- Weed Warehouse Exit
    name    = "Grow Room",
    Pos     = { x = 1066.04, y = -3183.31, z = -39.16},
    options = {
         {
            label   = "Exit Grow Room",
            name    = "Exit Grow Room",
            pos     = { x = -1724.86, y = 234.63, z = 58.47, h = 248.2452545166 },
            heading = 24.84,
         }, 
     },
    },

    { -- Money Washing Warehouse In
    name    = "Shady Unlocked Door",
    Pos     = { x = -1320.72, y = -1167.22, z = 4.85},
    options = {
         {
            label   = "Enter Laundromat",
            name    = "Enter Laundromat",
            pos     = { x = 1138.18, y = -3199.01, z = -39.67, h = 248.2452545166 },
            heading = 0,
         }, 
     },
    },

    { -- Money Washing Warehouse Out
    name    = "Shady Unlocked Door",
    Pos     = { x = 1138.18, y = -3199.01, z = -39.67},
    options = {
         {
            label   = "Exit Laundromat",
            name    = "Exit Laundromat",
            pos     = { x = -1320.72, y = -1167.22, z = 4.85, h = 248.2452545166 },
            heading = 89.45,
         }, 
     },
    },

    { -- Marina Office In
    name    = "Marina Office",
    Pos     = { x = -696.37, y = -1386.65, z = 5.5},
    options = {
         {
            label   = "Enter Office",
            name    = "Enter Office",
            pos     = { x = 1173.71, y = -3196.6, z = -39.01, h = 248.2452545166 },
            heading = 90.01,
         }, 
     },
    },

    { -- Marina Office Out
    name    = "Marina Office",
    Pos     = { x = 1173.71, y = -3196.6, z = -39.01},
    options = {
         {
            label   = "Enter Office",
            name    = "Enter Office",
            pos     = { x = -696.37, y = -1386.65, z = 5.5, h = 248.2452545166 },
            heading = 47.99,
         }, 
     },
    },

    { -- Medium Warehouse In
    name    = "Sandy Warehouse In",
    Pos     = { x = 387.59, y = 3584.98, z = 33.29},
    options = {
         {
            label   = "Enter Warehouse",
            name    = "Enter Warehouse",
            pos     = { x = 1048.4837646484, y = -3097.11547851566, z = -38.999950408936, },
            heading = 270.01,
         }, 
     },
    },

    { -- Medium Warehouse Out
    name    = "Warehouse Medium Out",
    Pos     = { x = 1048.48, y = -3097.11, z = -39.0},
    options = {
         {
            label   = "Exit Warehouse",
            name    = "Exit Warehouse",
            pos     = { x = 387.59, y = 3584.98, z = 33.29, h = 248.2452545166 },
            heading = 0,
         }, 
     },
    },

    { -- Large Warehouse In
    name    = "Eastern European Warehouse",
    Pos     = { x = -1098.76, y = -2137.69, z = 13.4},
    options = {
         {
            label   = "Enter Warehouse",
            name    = "Enter Warehouse",
            pos     = { x = 992.68634033203, y = -3097.7756347656, z = -38.9958,},
            heading = 275.57,
         }, 
     },
    },

    { -- Large Warehouse Out
    name    = "Eastern European Warehouse",
    Pos     = { x = 992.68634033203, y = -3097.7756347656, z = -38.9958},
    options = {
         {
            label   = "Exit Warehouse",
            name    = "Exit Warehouse",
            pos     = { x = -1098.9284667969, y = -2137.58154, z = 13.398, },
            heading = 227.11,
         }, 
     },
    },

    { -- Large Warehouse Garage Out 
    name    = "Big Warehouse Out",
    Pos     = { x = 1023.55, y = -3101.41, z = -38.9958},
    options = {
         {
            label   = "Exit Warehouse",
            name    = "Exit Warehouse",
            pos     = { x = -1155.77, y = -2173.76, z = 13.22, },
            heading = 131.96,
         }, 
     },
    },

    { -- Large Warehouse Garage In
    name    = "Big Warehouse In",
    Pos     = { x = -1155.77, y = -2173.76, z = 13.22},
    options = {
         {
            label   = "Enter Warehouse",
            name    = "Enter Warehouse",
            pos     = { x = 1023.55, y = -3101.41, z = -38.9958, },
            heading = 84.99,
         }, 
     },
    },
    { -- Drug Lab (Used to be underpass druglab) IN
    name    = "Mysterious Door",
    Pos     = { x = 1644.14, y = 4857.89, z = 42.01},
    options = {
         {
            label   = "Enter Door",
            name    = "Enter Door",
            pos     = { x = 1088.68, y = -3187.73, z = -38.99, },
            heading = 173.31,
         }, 
     },
    },

    { -- Drug Lab (Used to be underpass druglab) Out
    name    = "Mysterious Door",
    Pos     = { x = 1088.68, y = -3187.73, z = -38.99},
    options = {
         {
            label   = "Exit Door",
            name    = "Exit Door",
            pos     = { x = 1644.14, y = 4857.89, z = 42.01 },
            heading = 96.04,
         }, 
     },
    },

    { -- Dark Wolves Garage TP In
    name    = "The Den Garage",
    Pos     = { x = -687.81, y = -884.98, z = 24.5},
    options = {
         {
            label   = "Enter Garage Door",
            name    = "Enter Garage Door",
            pos     = { x = 1000.1, y = -3164.46, z = -38.91 },
            heading = 270.84,
         }, 
     },
    },

    { -- Dark Wolves Garage TP Out
    name    = "The Den Garage",
    Pos     = { x = 1000.1, y = -3164.46, z = -38.91},
    options = {
         {
            label   = "Enter Garage Door",
            name    = "Enter Garage Door",
            pos     = { x = -687.81, y = -884.98, z = 24.5 },
            heading = 270.84,
         }, 
     },
    },

    { -- Union Depository In
    name    = "Union Depository",
    Pos     = { x = 10.46, y = -671.14, z = 33.45},
    options = {
         {
            label   = "Elevator Down",
            name    = "Elevator Down",
            pos     = { x = -0.19, y = -705.82, z = 16.13 },
            heading = 341.29,
         }, 
     },
    },

    { -- Union Depository In
    name    = "Union Depository",
    Pos     = { x = -0.19, y = -705.82, z = 16.13},
    options = {
         {
            label   = "Elevator Up",
            name    = "Elevator Up",
            pos     = { x = 10.46, y = -671.14, z = 33.45 },
            heading = 341.29,
         }, 
     },
    },

    { -- Union Depository Explosive Exit
    name    = "Explosive Exit",
    Pos     = { x = 6.39, y = -659.09, z = 16.13},
    options = {
         {
            label   = "Exit",
            name    = "Exit",
            pos     = { x = 7.12, y = 654.84, z = 16 },
            heading = 342.29,
         }, 
     },
    },

    { -- Movie Set Building Out
    name    = "Executive Office",
    Pos     = { x = -1002.86, y = -477.85, z = 50.03},
    options = {
         {
            label   = "Exit Office",
            name    = "Exit Office",
            pos     = { x = -1007.62, y = -487.02, z = 39.97 },
            heading = 119.87,
         }, 
     },
    },

    { -- Movie Set Building In
    name    = "Executive Office",
    Pos     = { x = -1007.62, y = -487.02, z = 39.97},
    options = {
         {
            label   = "Enter Office",
            name    = "Enter Office",
            pos     = { x = -1002.86, y = -477.85, z = 50.03 },
            heading = 119.87,
         }, 
     },
    },

    { -- Arcadius Garage Elevator
    name    = "Arcadius Business Center",
    Pos     = { x = -144.14, y = -576.48, z = 32.42},
    options = {
         {
            label   = "Enter Car Garage",
            name    = "Enter Car Garage",
            pos     = { x = -191.0133, y = -579.1428, z = 135.20 },
            heading = 67.7,
         }, 
         {
            label = "Enter Mech Garage",
            name  = "Enter Mech Garage",
            pos   = { x = -141.35, y = -590.21, z = 167.11 }, -- Position to take you to
            heading = 129.71,
        },
     },
    },

    { -- Arcadius Garage Elevator Mech Exit
    name    = "Arcadius Business Center",
    Pos     = { x = -141.35, y = -590.21, z = 167.0},
    options = {
         {
            label   = "Enter Car Garage",
            name    = "Enter Car Garage",
            pos     = { x = -191.0133, y = -579.1428, z = 135.20 },
            heading = 67.7,
         }, 
         {
            label = "Exit Mech Garage",
            name  = "Exit Mech Garage",
            pos   = { x = -144.14, y = -576.48, z = 32.42 }, -- Position to take you to
            heading = 159.13,
        },
     },
    },

    { -- Arcadius Garage Elevator Garage Exit
    name    = "Arcadius Business Center",
    Pos     = { x = -191.0133, y = -579.1428, z = 135.20},
    options = {
         {
            label   = "Exit Car Garage",
            name    = "Exit Car Garage",
            pos     = { x = -144.14, y = -576.48, z = 32.42 },
            heading = 159.13,
         }, 
         {
            label = "Enter Mech Garage",
            name  = "Enter Garage",
            pos   = { x = -141.35, y = -590.21, z = 167.11 }, -- Position to take you to
            heading = 129.71,
        },
     },
    },

    { -- Arcadius Garage Small Elevator Exit 2
    name    = "Arcadius Business Center",
    Pos     = { x = -198.04, y = -580.62, z = 136.10},
    options = {
         {
            label   = "Exit To Garage",
            name    = "Exit To Garage",
            pos     = { x = -144.14, y = -576.48, z = 32.42 },
            heading = 159.13,
         }, 
         {
            label = "Enter Mech Garage",
            name  = "Enter Garage",
            pos   = { x = -138.23, y = -592.99, z = 167.11 }, -- Position to take you to
            heading = 39.26,
        },
        {
            label = "Exit To Office",
            name  = "Exit To OFfice",
            pos   = { x = -141.18, y = -620.93, z = 168.82 }, -- Position to take you to
            heading = 272.96,
        },
     },
    },

    { -- Arcadius Garage Small Elevator Enter
    name    = "Arcadius Business Center",
    Pos     = { x = -141.28, y = -620.9, z = 168.82},
    options = {
         {
            label   = "Exit To Garage",
            name    = "Exit To Garage",
            pos     = { x = -144.14, y = -576.48, z = 32.42 },
            heading = 159.13,
         }, 
         {
            label = "Enter Mech Garage",
            name  = "Enter Garage",
            pos   = { x = -138.23, y = -592.99, z = 167.11 }, -- Position to take you to
            heading = 38.38,
        },
        {
            label = "Enter Car Garage",
            name  = "Enter Car Garage",
            pos   = { x = -198.04, y = -580.62, z = 136.10 }, -- Position to take you to
            heading = 272.96,
        },
     },
    },

    { -- Arcadius Garage Small Elevator Enter 2
    name    = "Arcadius Business Center",
    Pos     = { x = -138.23, y = -592.99, z = 167.11},
    options = {
         {
            label   = "Exit To Garage",
            name    = "Exit To Garage",
            pos     = { x = -144.14, y = -576.48, z = 32.42 },
            heading = 159.13,
         }, 
         {
            label = "Exit To Office",
            name  = "Exit To Office",
            pos   = { x = -141.18, y = -620.93, z = 168.82 }, -- Position to take you to
            heading = 271.91,
        },
        {
            label = "Enter Car Garage",
            name  = "Enter Car Garage",
            pos   = { x = -198.04, y = -580.62, z = 136.10 }, -- Position to take you to
            heading = 272.96,
        },
     },
    },

    { -- Small Garage Out
    name    = "Shady Garage",
    Pos     = { x = 173.09, y = -1005.43, z = -99.01},
    options = {
         {
            label   = "Exit Garage",
            name    = "Exit Garage",
            pos     = { x = 7.82, y = -1405.58, z = 29.27 },
            heading = 85.85,
         }, 
     },
    },

    { -- Small Garage In
    name    = "Shady Garage",
    Pos     = { x = 10.18, y = -1405.65, z = 29.28},
    options = {
         {
            label   = "Enter Garage",
            name    = "Enter Garage",
            pos     = { x = 173.09, y = -1005.43, z = -99.01 },
            heading = 358.63,
         }, 
     },
    },

    { -- Small Garage In Doorway
    name    = "Shady Garage",
    Pos     = { x = -1.13, y = -1400.41, z = 29.27},
    options = {
         {
            label   = "Enter Doorway",
            name    = "Enter Doorway",
            pos     = { x = 179.08, y = -1000.71, z = -99.01 },
            heading = 181.52,
         }, 
     },
    },

    { -- Small Garage Out Doorway
    name    = "Shady Garage",
    Pos     = { x = 179.08, y = -1000.71, z = -99.01},
    options = {
         {
            label   = "Exit Doorway",
            name    = "Exit Doorway",
            pos     = { x = -1.13, y = -1400.41, z = 29.27 },
            heading = 86.08,
         }, 
     },
    },

    { -- Medium Garage Enter
    name    = "Underground Garage",
    Pos     = { x = -1031.55, y = -410.74, z = 33.27},
    options = {
         {
            label   = "Enter Garage",
            name    = "Enter Garage",
            pos     = { x = 194.51, y = -1004.5, z = -99.01 },
            heading = 359.61,
         }, 
     },
    },

    { -- Medium Garage Exit
    name    = "Underground Garage",
    Pos     = { x = 201.99, y = -1005.37, z = -99.01},
    options = {
         {
            label   = "Exit Garage",
            name    = "Exit Garage",
            pos     = { x = -1039.36, y = -412.64, z = 33.28 },
            heading = 24.03,
         }, 
     },
    },

    { -- Large Garage Enter
    name    = "High End Garage",
    Pos     = { x = -767.72, y = -196.057, z = 35.35},
    options = {
         {
            label   = "Enter Garage",
            name    = "Enter Garage",
            pos     = { x = 232.01, y = -1003.89, z = -99.01 },
            heading = 354.85,
         }, 
     },
    },

    { -- Large Garage Exit
    name    = "High End Garage",
    Pos     = { x = 224.51, y = -1004.87, z = -99.01},
    options = {
         {
            label   = "Exit Garage",
            name    = "Exit Garage",
            pos     = { x = -778.56, y = -185.02, z = 36.38 },
            heading = 115.01,
         }, 
     },
    },
    { -- Vinewood PD Ground Floor
    name    = "Vinewood PD",
    Pos     = { x = 535.71, y = -21.71, z = 70.62},
    options = {
         {
            label   = "Roof",
            name    = "Roof",
            pos     = { x = 566.58, y = 4.93, z = 102.23 },
            heading = 271.211,
         }, 
     },
    },

    { -- Vinewood PD Roof
    name    = "Vinewood PD Roof",
    Pos     = { x = 565.95, y = 4.84, z = 103.23},
    options = {
         {
            label   = "Ground Floor",
            name    = "Ground Floor",
            pos     = { x = 535.31, y = -21.91, z = 69.62 },
            heading = 121.79,
         }, 
     },
    },
    { -- Vespucci PD Ground Floor
    name    = "Vespucci PD",
    Pos     = { x = -1125.48, y = -832.92, z = 13.36 },
    options = {
         {
            label   = "Roof",
            name    = "Roof",
            pos     = { x = -1106.90, y = -832.86, z = 36.67 },
            heading = 219.43,
         }, 
     },
    },

    { -- Vespucci PD Roof
    name    = "Vespucci PD Roof",
    Pos     = { x = -1106.92, y = -832.74, z = 37.67},
    options = {
         {
            label   = "Ground Floor",
            name    = "Ground Floor",
            pos     = { x = -1125.41, y = -833.21, z = 12.36 },
            heading = 136.89,
         }, 
     },
    },
    { -- Davis PD Ground Floor
    name    = "Davis PD",
    Pos     = { x = 369.69, y = -1607.18, z = 29.29 },
    options = {
         {
            label   = "Roof",
            name    = "Roof",
            pos     = { x = 377.93, y = -1601.16, z = 35.94 },
            heading = 50.26,
         }, 
     },
    },

    { -- Davis PD Roof
    name    = "Davis PD Roof",
    Pos     = { x = 378.68, y = -1601.62, z = 36.94},
    options = {
         {
            label   = "Ground Floor",
            name    = "Ground Floor",
            pos     = { x = 370.40, y = -1607.51, z = 28.29 },
            heading = 228.44,
         }, 
     },
    },
    { -- Bahama Outside 
    name    = "Bahama Mamas Front",
    Pos     = { x = -1389.37, y = -592.17, z = 30.32 },
    options = {
         {
            label   = "Bar",
            name    = "Bar",
            pos     = { x = -1385.45, y = -606.67, z = 29.32 },
            heading = 122.41,
         }, 
     },
    },

    { -- Bahama Behind
    name    = "Bahama Mamas Bar",
    Pos     = { x = -1385.11, y = -606.48, z = 30.32 },
    options = {
         {
            label   = "Front Door",
            name    = "Front Door",
            pos     = { x = -1389.57, y = -591.71, z = 29.32 },
            heading = 33.47,
         }, 
     },
    },
    { -- Power St. Rooftop Up
    name    = "Power St. Rooftop Up",
    Pos     = { x = 197.07, y = -268.65, z = 49.98, h = 248.71 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 183.16, y = -263.11, z = 62.14, h = 68.82 }, -- exit
            heading = 68.82,
        },
    },
    },
    { -- Power St. Rooftop Down
    name    = "Power St. Rooftop Down",
    Pos     = { x = 183.16, y = -263.11, z = 62.14, h = 68.82 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 197.07, y = -268.65, z = 49.98, h = 248.71 },
            heading = 248.71,
        },
    },
    },
    { -- Clappers Rooftop Up
    name    = "Clappers Up",
    Pos     = { x = 412.54, y = 151.52, z = 103.21, h = 159.62 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 446.71, y = 193.66, z = 159.81, h = 69.62 }, -- exit
            heading = 69.62,
        },
    },
    },
    { -- Clappers Rooftop Down
    name    = "Clappers Down",
    Pos     = { x = 446.71, y = 193.66, z = 159.81, h = 69.62 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 412.54, y = 151.52, z = 103.21, h = 159.62 },
            heading = 166.13,
        },
    },
    },
    { -- Vinewood Plaza Rooftop Up
    name    = "Vinewood Plaza Up",
    Pos     = { x = 555.05, y = 151.58, z = 99.26, h = 72.86 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 569.94, y = 160.35, z = 157.23, h = 251.18 }, -- exit
            heading = 251.18,
        },
    },
    },
    { -- Vinewood Plaza Rooftop Down
    name    = "Vinewood Plaza Down",
    Pos     = { x = 569.94, y = 160.35, z = 157.23, h = 251.18 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 555.05, y = 151.58, z = 99.26, h = 72.86 },
            heading = 72.86,
        },
    },
    },
    { -- CNT Building Rooftop Up
    name    = "CNT Building Up",
    Pos     = { x = 751.03, y = 223.39, z = 87.42, h = 148.33 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 756.21, y = 229.92, z = 146.12, h = 242.08 }, -- exit
            heading = 242.08,
        },
    },
    },
    { -- CNT Building Rooftop Down
    name    = "CNT Building Down",
    Pos     = { x = 756.21, y = 229.92, z = 146.12, h = 242.08 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 751.03, y = 223.39, z = 87.42, h = 148.33 },
            heading = 148.33,
        },
    },
    },
    { -- Doppler Theatre Rooftop Up
    name    = "Doppler Theatre Up",
    Pos     = { x = 340.17, y = 178.84, z = 103.03, h = 162.93 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 354.64, y = 188.25, z = 127.76, h = 163.32 }, -- exit
            heading = 163.32,
        },
    },
    },
    { -- Doppler Theatre Rooftop Down
    name    = "Doppler Theatre Down",
    Pos     = { x = 354.64, y = 188.25, z = 127.76, h = 163.32 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 340.17, y = 178.84, z = 103.03, h = 162.93 },
            heading = 162.93,
        },
    },
    },
    { -- Whirligig Rooftop Up
    name    = "Whirligig Up",
    Pos     = { x = 298.96, y = 136.57, z = 104.11, h = 157.85 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 304.66, y = 122.4, z = 145.17, h = 164.68 }, -- exit
            heading = 163.32,
        },
    },
    },
    { -- Whirligig Rooftop Down
    name    = "Whirligig Down",
    Pos     = { x = 304.66, y = 122.4, z = 145.17, h = 164.68 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 298.96, y = 136.57, z = 104.11, h = 157.85 },
            heading = 347.94,
        },
    },
    },
    { -- Fashion Vinewood Rooftop Up
    name    = "Fashion Vinewood Up",
    Pos     = { x = 172.38, y = 183.07, z = 105.73, h = 336.17 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 161.74, y = 160.58, z = 123.95, h = 155.8 }, -- exit
            heading = 155.08,
        },
    },
    },
    { -- Fashion Vinewood Rooftop Down
    name    = "Fashion Vinewood Down",
    Pos     = { x = 161.74, y = 160.58, z = 123.95, h = 155.8 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 172.38, y = 183.07, z = 105.73, h = 336.17 },
            heading = 336.17,
        },
    },
    },
    { -- Designer Slave Rooftop Up
    name    = "Designer Slave Up",
    Pos     = { x = 176.83, y = 228.31, z = 106.02, h = 158.86 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 195.3, y = 272.13, z = 141.43, h = 157.8 }, -- exit
            heading = 157.8,
        },
    },
    },
    { -- Designer Slave Rooftop Down
    name    = "Designer Slave Down",
    Pos     = { x = 195.3, y = 272.13, z = 141.43, h = 157.8 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 176.83, y = 228.31, z = 106.02, h = 158.86 },
            heading = 158.86,
        },
    },
    },
    { -- GoPostal Rooftop Up
    name    = "GoPostal Up",
    Pos     = { x = 78.89, y = 112.42, z = 81.17, h = 159.17 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 96.97, y = 105.98, z = 88.87, h = 162.97 }, -- exit
            heading = 162.8,
        },
    },
    },
    { -- GoPostal Rooftop Down
    name    = "GoPostal Down",
    Pos     = { x = 96.97, y = 105.98, z = 88.87, h = 162.97 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 78.89, y = 112.42, z = 81.17, h = 159.17 },
            heading = 159.17,
        },
    },
    },
    { -- GoPostal Rooftop Up
    name    = "GoPostal Up",
    Pos     = { x = 82.45, y = 111.33, z = 96.43, h = 159.8 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 106.92, y = 109.19, z = 109.42, h = 161.43 }, -- exit
            heading = 162.8,
        },
    },
    },
    { -- GoPostal Rooftop Down
    name    = "GoPostal Down",
    Pos     = { x = 106.92, y = 109.19, z = 109.42, h = 161.43 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 82.45, y = 111.33, z = 96.43, h = 159.8 },
            heading = 159.8,
        },
    },
    },
    { -- Callisto Apartments Rooftop Up
    name    = "Callisto Apartments Up",
    Pos     = { x = 388.73, y = -0.6, z = 91.49, h = 60.29 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 420.17, y = -15.87, z = 152.96, h = 243.23 }, -- exit
            heading = 243.23,
        },
    },
    },
    { -- Callisto Apartments Rooftop Down
    name    = "Callisto Apartments Down",
    Pos     = { x = 420.17, y = -15.87, z = 152.96, h = 243.23 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 388.73, y = -0.6, z = 91.49, h = 60.29 },
            heading = 60.29,
        },
    },
    },
    { -- Jazz Desserts Rooftop Up
    name    = "Jazz Desserts Up",
    Pos     = { x = 502.02, y = 112.61, z = 96.64, h = 157.9 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 497.86, y = 129.73, z = 131.61, h = 161.79 }, -- exit
            heading = 161.79,
        },
    },
    },
    { -- Jazz Desserts Rooftop Down
    name    = "Jazz Desserts Down",
    Pos     = { x = 497.86, y = 129.73, z = 131.61, h = 161.79 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 502.02, y = 112.61, z = 96.64, h = 157.9 },
            heading = 157.9,
        },
    },
    },
    { -- Elgin House Rooftop Up
    name    = "Elgin House Up",
    Pos     = { x = -59.49, y = 185.48, z = 87.4, h = 39.1 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -62.47, y = 179.06, z = 141.18, h = 124.01 }, -- exit
            heading = 124.01,
        },
    },
    },
    { -- Elgin House Rooftop Down
    name    = "Elgin House Down",
    Pos     = { x = -62.47, y = 179.06, z = 141.18, h = 124.01 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -59.49, y = 185.48, z = 87.4, h = 39.1 },
            heading = 39.1,
        },
    },
    },
    { -- Elgin House Rooftop Up
    name    = "Elgin House Up",
    Pos     = { x = -70.99, y = 142.29, z = 81.7, h = 36.86 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -72.19, y = 137.27, z = 127.68, h = 36.1 }, -- exit
            heading = 36.1,
        },
    },
    },
    { -- Elgin House Rooftop Down
    name    = "Elgin House Down",
    Pos     = { x = -72.19, y = 137.27, z = 127.68, h = 36.1 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -70.99, y = 142.29, z = 81.7, h = 36.86 },
            heading = 36.86,
        },
    },
    },
    { -- Elgin House Rooftop Up
    name    = "Elgin House Up",
    Pos     = { x = -46.74, y = 146.53, z = 127.68, h = 33.58 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -55.79, y = 176.46, z = 141.18, h = 38.31 }, -- exit
            heading = 38.31,
        },
    },
    },
    { -- Elgin House Rooftop Down
    name    = "Elgin House Down",
    Pos     = { x = -55.79, y = 176.46, z = 141.18, h = 38.31 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -46.74, y = 146.53, z = 127.68, h = 33.58 },
            heading = 33.56,
        },
    },
    },
    { -- Haute Restaurant Rooftop Up
    name    = "Haute Restaurant Up",
    Pos     = { x = -41.21, y = 228.06, z = 107.97, h = 82.44 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -32.3, y = 229.07, z = 115.05, h = 170.85 }, -- exit
            heading = 170.85,
        },
    },
    },
    { -- Haute Restaurant Rooftop Down
    name    = "Haute Restaurant Down",
    Pos     = { x = -32.3, y = 229.07, z = 115.05, h = 170.85 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -41.21, y = 228.06, z = 107.97, h = 82.44 },
            heading = 82.44,
        },
    },
    },
    { -- Gentry Manor Rooftop Up
    name    = "Gentry Manor Up",
    Pos     = { x = -98.37, y = 367.32, z = 113.27, h = 154.63 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -107.7, y = 380.61, z = 142.68, h = 153.73}, -- exit
            heading = 153.73,
        },
    },
    },
    { -- Gentry Manor Rooftop Down
    name    = "Gentry Manor Down",
    Pos     = { x = -107.7, y = 380.61, z = 142.68, h = 153.73},
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -98.37, y = 367.32, z = 113.27, h = 154.63 },
            heading = 154.63,
        },
    },
    },
    { -- Gentry Manor Rooftop Up
    name    = "Gentry Manor Up",
    Pos     = { x = -60.39, y = 360.21, z = 113.06, h = 243.46 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -84.23, y = 326.65, z = 142.6, h = 153.35}, -- exit
            heading = 153.35,
        },
    },
    },
    { -- Gentry Manor Rooftop Down
    name    = "Gentry Manor Down",
    Pos     = { x = -84.23, y = 326.65, z = 142.6, h = 153.35},
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -60.39, y = 360.21, z = 113.06, h = 243.46 },
            heading = 243.46,
        },
    },
    },
    { -- Gentry Manor Rooftop Up
    name    = "Gentry Manor Up",
    Pos     = { x = -92.7, y = 330.51, z = 142.6, h = 153.98 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -87.88, y = 317.31, z = 136.86, h = 151.18 }, -- exit
            heading = 151.35,
        },
    },
    },
    { -- Gentry Manor Rooftop Down
    name    = "Gentry Manor Down",
    Pos     = { x = -87.88, y = 317.31, z = 136.86, h = 151.18, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -92.7, y = 330.51, z = 142.6, h = 153.98 },
            heading = 153.98,
        },
    },
    },
    { -- Hardcore Comics Rooftop Up
    name    = "Hardcore Comics Up",
    Pos     = { x = -143.62, y = 229.75, z = 94.94, h = 0.96 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -159.99, y = 212.94, z = 102.39, h = 180.45, }, -- exit
            heading = 180.45,
        },
    },
    },
    { -- Hardcore Comics Rooftop Down
    name    = "Hardcore Comics Down",
    Pos     = { x = -159.99, y = 212.94, z = 102.39, h = 180.45, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -143.62, y = 229.75, z = 94.94, h = 0.96 },
            heading = 0.96,
        },
    },
    },
    { -- For Rent Office Rooftop Up
    name    = "For Rent Office Up",
    Pos     = { x = -285.17, y = 281.43, z = 89.89, h = 181.98 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -271.77, y = 289.29, z = 104.98, h = 183.18, }, -- exit
            heading = 183.18,
        },
    },
    },
    { -- For Rent Office Rooftop Down
    name    = "For Rent Office Down",
    Pos     = { x = -271.77, y = 289.29, z = 104.98, h = 183.18, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -285.17, y = 281.43, z = 89.89, h = 181.98 },
            heading = 181.98,
        },
    },
    },
    { -- The Lust Drop Rooftop Up
    name    = "The Lust Drop Up",
    Pos     = { x = -556.83, y = 199.47, z = 75.31, h = 271.72 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -562.54, y = 194.73, z = 85.83, h = 92.09, }, -- exit
            heading = 92.09,
        },
    },
    },
    { -- The Lust Drop Rooftop Down
    name    = "The Lust Drop Down",
    Pos     = { x = -562.54, y = 194.73, z = 85.83, h = 92.09, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -556.83, y = 199.47, z = 75.31, h = 271.72 },
            heading = 271.72,
        },
    },
    },
    { -- Large Office Rooftop Up
    name    = "Large Office Up",
    Pos     = { x = -685.91, y = 223.47, z = 81.96, h = 27.53 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -693.61, y = 212.09, z = 137.53, h = 294.31, }, -- exit
            heading = 294.31,
        },
    },
    },
    { -- Large Office Rooftop Down
    name    = "Large Office Down",
    Pos     = { x = -693.61, y = 212.09, z = 137.53, h = 294.31, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -685.91, y = 223.47, z = 81.96, h = 27.53 },
            heading = 27.53,
        },
    },
    },
    { -- Schlongberg Sachs Rooftop Up
    name    = "Schlongberg Sachs Up",
    Pos     = { x = -742.88, y = 246.56, z = 77.33, h = 200.29 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -730.75, y = 265.74, z = 132.3, h = 281.01, }, -- exit
            heading = 281.01,
        },
    },
    },
    { -- Schlongberg Sachs Rooftop Down
    name    = "Schlongberg Sachs Down",
    Pos     = { x = -730.75, y = 265.74, z = 132.3, h = 281.01, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -742.88, y = 246.56, z = 77.33, h = 200.29 },
            heading = 200.29,
        },
    },
    },
    { -- Eclipse Tower Rooftop Up
    name    = "Eclipse Tower Up",
    Pos     = { x = -770.64, y = 319.64, z = 85.66, h = 176.87 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -801.79, y = 334.63, z = 230.64, h = 269.73, }, -- exit
            heading = 269.73,
        },
    },
    },
    { -- Eclipse Tower Rooftop Down
    name    = "Eclipse Tower Down",
    Pos     = { x = -801.79, y = 334.63, z = 230.64, h = 269.73, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -770.64, y = 319.64, z = 85.66, h = 176.87 },
            heading = 176.87,
        },
    },
    },
    { -- HLM Vinewood Rooftop Up
    name    = "HLM Vinewood Up",
    Pos     = { x = -569.59, y = 169.63, z = 66.57, h = 272.15 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -576.02, y = 168.74, z = 82.13, h = 93.05, }, -- exit
            heading = 93.05,
        },
    },
    },
    { -- HLM Vinewood Rooftop Down
    name    = "HLM Vinewood Down",
    Pos     = { x = -576.02, y = 168.74, z = 82.13, h = 93.05, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -569.59, y = 169.63, z = 66.57, h = 272.15 },
            heading = 272.15,
        },
    },
    },
    { -- Tinsel Towers Rooftop Up
    name    = "Tinsel Towers Up",
    Pos     = { x = -614.63, y = 46.09, z = 43.59, h = 178.06 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -577.53, y = 59.47, z = 116.54, h = 90.69, }, -- exit
            heading = 90.69,
        },
    },
    },
    { -- Tinsel Towers Rooftop Down
    name    = "Tinsel Towers Down",
    Pos     = { x = -577.53, y = 59.47, z = 116.54, h = 90.69, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -614.63, y = 46.09, z = 43.59, h = 178.06 },
            heading = 178.06,
        },
    },
    },
    { -- The Epsilon Program Rooftop Up
    name    = "The Epsilon Program Up",
    Pos     = { x = -698.79, y = 47.18, z = 44.03, h = 204.49 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -701.71, y = 65.3, z = 69.69, h = 294.96, }, -- exit
            heading = 294.95,
        },
    },
    },
    { -- The Epsilon Program Rooftop Down
    name    = "The Epsilon Program Down",
    Pos     = { x = -701.71, y = 65.3, z = 69.69, h = 294.96, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -698.79, y = 47.18, z = 44.03, h = 204.49 },
            heading = 204.49,
        },
    },
    },
    { -- West Hawick Fleeca Rooftop Up
    name    = "West Hawick Fleeca Up",
    Pos     = { x = -348.71, y = -46.99, z = 54.52, h = 342.04 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -354.45, y = -45.52, z = 90.91, h = 342.34, }, -- exit
            heading = 342.34,
        },
    },
    },
    { -- West Hawick Fleeca Rooftop Down
    name    = "West Hawick Fleeca Down",
    Pos     = { x = -354.45, y = -45.52, z = 90.91, h = 342.34, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -348.71, y = -46.99, z = 54.52, h = 342.04 },
            heading = 342.04,
        },
    },
    },
    { -- Harper Unit for Clinical Psychology Rooftop Up
    name    = "Harper Unit for Clinical Psychology Up",
    Pos     = { x = -365.63, y = -355.74, z = 31.56, h = 251.86 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -379.86, y = -350.31, z = 70.97, h = 73.3, }, -- exit
            heading = 73.3,
        },
    },
    },
    { -- Harper Unit for Clinical Psychology Rooftop Down
    name    = "Harper Unit for Clinical Psychology Down",
    Pos     = { x = -379.86, y = -350.31, z = 70.97, h = 73.3, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -365.63, y = -355.74, z = 31.56, h = 251.86 },
            heading = 251.86,
        },
    },
    },
    { -- Harper Unit for Clinical Psychology Rooftop Up
    name    = "Harper Unit for Clinical Psychology Up",
    Pos     = { x = -417.58, y = -330.7, z = 42.38, h = 87.35 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -404.41, y = -347.53, z = 70.97, h = 311.67, }, -- exit
            heading = 311.67,
        },
    },
    },
    { -- Harper Unit for Clinical Psychology Rooftop Down
    name    = "Harper Unit for Clinical Psychology Down",
    Pos     = { x = -404.41, y = -347.53, z = 70.97, h = 311.67, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -417.58, y = -330.7, z = 42.38, h = 87.35 },
            heading = 87.35,
        },
    },
    },
    { -- Mount Zonah Rooftop Up
    name    = "Mount Zonah Up",
    Pos     = { x = -468.66, y = -280.15, z = 35.62, h = 19.72 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -443.9, y = -332.64, z = 78.17, h = 353.84, }, -- exit
            heading = 353.84,
        },
    },
    },
    { -- Mount Zonah Rooftop Down
    name    = "Mount Zonah Down",
    Pos     = { x = -443.9, y = -332.64, z = 78.17, h = 353.84, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -468.66, y = -280.15, z = 35.62, h = 19.72 },
            heading = 19.72,
        },
    },
    },
    { -- Mount Zonah Rooftop Up
    name    = "Mount Zonah Up",
    Pos     = { x = -504.9, y = -294.44, z = 35.44, h = 23.25 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -499.68, y = -324.82, z = 73.17, h = 351.21, }, -- exit
            heading = 351.21,
        },
    },
    },
    { -- Mount Zonah Rooftop Down
    name    = "Mount Zonah Down",
    Pos     = { x = -499.68, y = -324.82, z = 73.17, h = 351.21, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -504.9, y = -294.44, z = 35.44, h = 23.25 },
            heading = 23.25,
        },
    },
    },
    { -- Leopolds Rooftop Up
    name    = "Leopolds Up",
    Pos     = { x = -683.56, y = -383.45, z = 34.52, h = 337.65 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -699.1, y = -392.86, z = 59.21, h = 358.96, }, -- exit
            heading = 358.96,
        },
    },
    },
    { -- Leopolds Rooftop Down
    name    = "Leopolds Down",
    Pos     = { x = -699.1, y = -392.86, z = 59.21, h = 358.96, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -683.56, y = -383.45, z = 34.52, h = 337.65 },
            heading = 337.65,
        },
    },
    },
    { -- International Online University Rooftop Up
    name    = "International Online University Up",
    Pos     = { x = -841.62, y = -334.51, z = 38.68, h = 295.62 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -852.85, y = -342.08, z = 79.07, h = 27.8, }, -- exit
            heading = 27.8,
        },
    },
    },
    { -- International Online University Rooftop Down
    name    = "International Online University Down",
    Pos     = { x = -852.85, y = -342.08, z = 79.07, h = 27.8, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -841.62, y = -334.51, z = 38.68, h = 295.62 },
            heading = 295.62,
        },
    },
    },
    { -- Richards Majestic Rooftop Up
    name    = "Richards Majestic Up",
    Pos     = { x = -933.41, y = -384.07, z = 38.98, h = 120.94 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -902.95, y = -369.8, z = 136.28, h = 118.71, }, -- exit
            heading = 118.71,
        },
    },
    },
    { -- Richards Majestic Rooftop Down
    name    = "Richards Majestic Down",
    Pos     = { x = -902.95, y = -369.8, z = 136.28, h = 118.71, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -933.41, y = -384.07, z = 38.98, h = 120.94 },
            heading = 120.94,
        },
    },
    },
    { -- Weazel Plaza Apartments Rooftop Up
    name    = "Weazel Plaza Apartments Up",
    Pos     = { x = -906.46, y = -451.46, z = 39.61, h = 295.01 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -908.83, y = -445.06, z = 168.12, h = 116.71, }, -- exit
            heading = 116.71,
        },
    },
    },
    { -- Weazel Plaza Apartments Rooftop Down
    name    = "Weazel Plaza Apartments Down",
    Pos     = { x = -908.83, y = -445.06, z = 168.12, h = 116.71, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -906.46, y = -451.46, z = 39.61, h = 295.01 },
            heading = 116.42
        },
    },
    },
    { -- Bawsaq Rooftop Up
    name    = "Bawsaq Up",
    Pos     = { x = -1001.48, y = -414.16, z = 39.62, h = 297.14 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -908.83, y = -445.06, z = 168.12, h = 116.71, }, -- exit
            heading = 116.71,
        },
    },
    },
    { -- Bawsaq Rooftop Down
    name    = "Bawsaq Down",
    Pos     = { x = -1023.81, y = -433.1, z = 77.37, h = 120.08, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1001.48, y = -414.16, z = 39.62, h = 297.14 },
            heading = 297.01,
        },
    },
    },
    { -- Jonny Tung Rooftop Up
    name    = "Jonny Tung Up",
    Pos     = { x = -931.57, y = -215.76, z = 38.55, h = 83.73 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -912.79, y = -210.15, z = 83.33, h = 345.53, }, -- exit
            heading = 345.53,
        },
    },
    },
    { -- Jonny Tung Rooftop Down
    name    = "Jonny Tung Down",
    Pos     = { x = -912.79, y = -210.15, z = 83.33, h = 345.53, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -931.57, y = -215.76, z = 38.55, h = 83.73 },
            heading = 83.73,
        },
    },
    },
    { -- Marathon Dorset Corner Rooftop Up
    name    = "Marathon Dorset Corner Up",
    Pos     = { x = -942.7, y = -278.48, z = 39.55, h = 294.84 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -953.35, y = -281.16, z = 81.45, h = 209.6, }, -- exit
            heading = 209.6,
        },
    },
    },
    { -- Marathon Dorset Corner Rooftop Down
    name    = "Marathon Dorset Corner Down",
    Pos     = { x = -953.35, y = -281.16, z = 81.45, h = 209.6, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -942.7, y = -278.48, z = 39.55, h = 294.84 },
            heading = 294.84,
        },
    },
    },
    { -- Akan Records Rooftop Up
    name    = "Akan Records Up",
    Pos     = { x = -1016.27, y = -265.54, z = 39.04, h = 54.84 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1000.07, y = -275.82, z = 50.54, h = 241.06, }, -- exit
            heading = 241.06,
        },
    },
    },
    { -- Akan Records Rooftop Down
    name    = "Akan Records Down",
    Pos     = { x = -1000.07, y = -275.82, z = 50.54, h = 241.06, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1016.27, y = -265.54, z = 39.04, h = 54.84 },
            heading = 54.84,
        },
    },
    },
    { -- The Archipalego Rooftop Up
    name    = "The Archipalego Up",
    Pos     = { x = -1097.5, y = -325.02, z = 37.84, h = 352.6 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1113.09, y = -334.14, z = 50.04, h = 85.5, }, -- exit
            heading = 87.59,
        },
    },
    },
    { -- The Archipalego Rooftop Down
    name    = "The Archipalego Down",
    Pos     = { x = -1113.09, y = -334.14, z = 50.04, h = 85.5, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1097.5, y = -325.02, z = 37.84, h = 352.6 },
            heading = 352.6,
        },
    },
    },
    { -- The Archipalego Rooftop Up
    name    = "The Archipalego Up",
    Pos     = { x = -1098.26, y = -346.49, z = 37.8, h = 177.09 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1113.66, y = -337.23, z = 50.02, h = 85.5, }, -- exit
            heading = 82.94,
        },
    },
    },
    { -- The Archipalego Rooftop Down
    name    = "The Archipalego Down",
    Pos     = { x = -1113.66, y = -337.23, z = 50.02, h = 85.5, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1098.26, y = -346.49, z = 37.8, h = 177.09 },
            heading = 177.09,
        },
    },
    },
    { -- LifeInvader Rooftop Up
    name    = "LifeInvader Up",
    Pos     = { x = -1065.71, y = -246.56, z = 39.73, h = 25.77 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1072.57, y = -246.61, z = 54.01, h = 297.39, }, -- exit
            heading = 297.39,
        },
    },
    },
    { -- LifeInvader Rooftop Down
    name    = "LifeInvader Down",
    Pos     = { x = -1072.57, y = -246.61, z = 54.01, h = 297.39, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1065.71, y = -246.56, z = 39.73, h = 25.77 },
            heading = 25.77,
        },
    },
    },
    { -- Lifeinvader Elevator
    name    = "Lifeinvader Elevator",
    Pos     = { x = -1076.86, y = -253.65, z = 37.76, h = 25.14 }, -- enter
    options = {
        {
            label   = "Floor 2",
            name    = "Floor 2",
            pos     = { x = -1077.09, y = -253.26, z = 44.02, h = 28.65, }, -- exit
            heading = 28.65,
        },
    },
    },
    { -- Lifeinvader Elevator
    name    = "Lifeinvader Elevator",
    Pos     = { x = -1077.09, y = -253.26, z = 44.02, h = 28.65, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1076.86, y = -253.65, z = 37.76, h = 25.14 },
            heading = 25.14,
        },
    },
    },
    { -- Spanish Apartment Rooftop Up
    name    = "Spanish Apartment Up",
    Pos     = { x = -142.37, y = 62.27, z = 70.84, h = 351.61 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -141.95, y = 38.38, z = 81.58, h = 353.89, }, -- exit
            heading = 353.89,
        },
    },
    },
    { -- Spanish Apartment Rooftop Down
    name    = "Spanish Apartment Down",
    Pos     = { x = -141.95, y = 38.38, z = 81.58, h = 353.89, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -142.37, y = 62.27, z = 70.84, h = 351.61 },
            heading = 351.61,
        },
    },
    },
    { -- Meteor Hotel Rooftop Up
    name    = "Meteor Hotel Up",
    Pos     = { x = 418.52, y = -207.65, z = 59.84, h = 162.1 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 419.35, y = -193.24, z = 74.26, h = 339.74, }, -- exit
            heading = 339.74,
        },
    },
    },
    { -- Meteor Hotel Rooftop Down
    name    = "Meteor Hotel Down",
    Pos     = { x = 419.35, y = -193.24, z = 74.26, h = 339.74, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 418.52, y = -207.65, z = 59.84, h = 162.1 },
            heading = 162.1,
        },
    },
    },
    { -- Meteor Hotel Rooftop Up
    name    = "Meteor Hotel Up",
    Pos     = { x = 415.01, y = -217.3, z = 59.94, h = 338.8 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 406.2, y = -228.76, z = 74.25, h = 157.57, }, -- exit
            heading = 157.57,
        },
    },
    },
    { -- Meteor Hotel Rooftop Down
    name    = "Meteor Hotel Down",
    Pos     = { x = 406.2, y = -228.76, z = 74.25, h = 157.57, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 415.01, y = -217.3, z = 59.94, h = 338.8 },
            heading = 338.8,
        },
    },
    },
    { -- Power St. Apartment Rooftop Up
    name    = "Power St. Apartment Up",
    Pos     = { x = 292.59, y = -162.59, z = 64.62, h = 66.97 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 292.58, y = -151.78, z = 81.03, h = 338.5, }, -- exit
            heading = 338.5,
        },
    },
    },
    { -- Power St. Apartment Rooftop Down
    name    = "Power St. Apartment Down",
    Pos     = { x = 292.58, y = -151.78, z = 81.03, h = 338.5, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 292.59, y = -162.59, z = 64.62, h = 66.97 },
            heading = 66.97,
        },
    },
    },
    { -- Colorful Spanish Ave. Rooftop Up
    name    = "Colorful Spanish Ave. Up",
    Pos     = { x = 315.35, y = -127.92, z = 69.62, h = 348.85 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 318.37, y = -136.24, z = 88.32, h = 338.5, }, -- exit
            heading = 338.5,
        },
    },
    },
    { -- Colorful Spanish Ave. Rooftop Down
    name    = "Colorful Spanish Ave. Down",
    Pos     = { x = 318.37, y = -136.24, z = 88.32, h = 338.5, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 315.35, y = -127.92, z = 69.62, h = 348.85 },
            heading = 348.85,
        },
    },
    },
    { -- Occupation Ave. Apartment Rooftop Up
    name    = "Occupation Ave. Apartment Up",
    Pos     = { x = -85.75, y = -281.65, z = 45.55, h = 345.73 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -80.83, y = -283.99, z = 63.07, h = 344.72, }, -- exit
            heading = 344.72,
        },
    },
    },
    { -- Occupation Ave. Apartment Rooftop Down
    name    = "Occupation Ave. Apartment Down",
    Pos     = { x = -80.83, y = -283.99, z = 63.07, h = 344.72, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -85.75, y = -281.65, z = 45.55, h = 345.73 },
            heading = 345.73,
        },
    },
    },
    { -- Spanish Ave Parkpartment Rooftop Up
    name    = "Spanish Ave Parkpartment Up",
    Pos     = { x = -194.59, y = 141.18, z = 70.32, h = 157.65 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -180.19, y = 165.75, z = 84.62, h = 251.92, }, -- exit
            heading = 251.92,
        },
    },
    },
    { -- Spanish Ave Parkpartment Rooftop Down
    name    = "Spanish Ave Parkpartment Down",
    Pos     = { x = -180.19, y = 165.75, z = 84.62, h = 251.92, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -194.59, y = 141.18, z = 70.32, h = 157.65 },
            heading = 157.65,
        },
    },
    },
    { -- Spanish Ave U Shaped Apt. Rooftop Up
    name    = "Spanish Ave U Shaped Apt. Up",
    Pos     = { x = -150.07, y = 123.66, z = 70.23, h = 152.53 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -158.55, y = 135.52, z = 85.44, h = 71.93, }, -- exit
            heading = 71.93,
        },
    },
    },
    { -- Spanish Ave U Shaped Apt. Rooftop Down
    name    = "Spanish Ave U Shaped Apt. Down",
    Pos     = { x = -158.55, y = 135.52, z = 85.44, h = 71.93, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -150.07, y = 123.66, z = 70.23, h = 152.53 },
            heading = 152.53,
        },
    },
    },
    { -- San Vitus Apartment Rooftop Up
    name    = "San Vitus Apartment Up",
    Pos     = { x = -195.91, y = 186.77, z = 80.5, h = 95.03 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -188.83, y = 192.25, z = 92.32, h = 89.83, }, -- exit
            heading = 89.83,
        },
    },
    },
    { -- San Vitus Apartment Rooftop Down
    name    = "San Vitus Apartment Down",
    Pos     = { x = -188.83, y = 192.25, z = 92.32, h = 89.83, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -195.91, y = 186.77, z = 80.5, h = 95.03 },
            heading = 95.03,
        },
    },
    },
    { -- Eclipse Lodge Rooftop Up
    name    = "Eclipse Lodge Up",
    Pos     = { x = -273.81, y = 28.25, z = 54.75, h = 254.19 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -288.63, y = 36.49, z = 75.94, h = 162.22, }, -- exit
            heading = 162.22,
        },
    },
    },
    { -- Eclipse Lodge Rooftop Down
    name    = "Eclipse Lodge Down",
    Pos     = { x = -288.63, y = 36.49, z = 75.94, h = 162.22, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -273.81, y = 28.25, z = 54.75, h = 254.19 },
            heading = 254.19,
        },
    },
    },
    { -- Eclipse Lodge Rooftop Up
    name    = "Eclipse Lodge Up",
    Pos     = { x = -276.11, y = 31.16, z = 69.88, h = 162.04 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -280.83, y = 31.94, z = 75.94, h = 71.22, }, -- exit
            heading = 71.22,
        },
    },
    },
    { -- Eclipse Lodge Rooftop Down
    name    = "Eclipse Lodge Down",
    Pos     = { x = -280.83, y = 31.94, z = 75.94, h = 71.22, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -276.11, y = 31.16, z = 69.88, h = 162.04 },
            heading = 162.04,
        },
    },
    },
    { -- Eclipse Lodge Rooftop Up
    name    = "Eclipse Lodge Up",
    Pos     = { x = -312.46, y = -1.05, z = 63.26, h = 68.36 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -311.6, y = 3.87, z = 69.32, h = 343.83, }, -- exit
            heading = 343.83,
        },
    },
    },
    { -- Eclipse Lodge Rooftop Down
    name    = "Eclipse Lodge Down",
    Pos     = { x = -311.6, y = 3.87, z = 69.32, h = 343.83, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -312.46, y = -1.05, z = 63.26, h = 68.36 },
            heading = 68.36,
        },
    },
    },
    { -- Pill Pharm Rooftop Up
    name    = "Pill Pharm Up",
    Pos     = { x = -437.32, y = -437.33, z = 32.86, h = 261.57 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -427.28, y = -439.31, z = 51.57, h = 40.32, }, -- exit
            heading = 40.32,
        },
    },
    },
    { -- Pill Pharm Rooftop Down
    name    = "Pill Pharm Down",
    Pos     = { x = -427.28, y = -439.31, z = 51.57, h = 40.32, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -437.32, y = -437.33, z = 32.86, h = 261.57 },
            heading = 261.57,
        },
    },
    },
    { -- Weazel Dorset Rooftop Up
    name    = "Weazel Dorset Up",
    Pos     = { x = -486.2, y = -400.75, z = 34.55, h = 351.48 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -491.32, y = -416.51, z = 57.45, h = 218.6, }, -- exit
            heading = 218.6,
        },
    },
    },
    { -- Weazel Dorset Rooftop Down
    name    = "Weazel Dorset Down",
    Pos     = { x = -491.32, y = -416.51, z = 57.45, h = 218.6, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -486.2, y = -400.75, z = 34.55, h = 351.48 },
            heading = 351.48,
        },
    },
    },
    { -- Snr. Muffin Rooftop Up
    name    = "Snr. Muffin Up",
    Pos     = { x = -526.81, y = -679.56, z = 33.67, h = 44.46 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -511.49, y = -695.05, z = 44.03, h = 88.57, }, -- exit
            heading = 88.57,
        },
    },
    },
    { -- Snr. Muffin Rooftop Down
    name    = "Snr. Muffin Down",
    Pos     = { x = -511.49, y = -695.05, z = 44.03, h = 88.57, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -526.81, y = -679.56, z = 33.67, h = 44.46 },
            heading = 44.46,
        },
    },
    },
    { -- 7302 San Andreas Ave. Rooftop Up
    name    = "7302 San Andreas Ave. Up",
    Pos     = { x = -470.67, y = -679.11, z = 32.71, h = 358.92 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -467.48, y = -680.79, z = 81.19, h = 1.23, }, -- exit
            heading = 1.23,
        },
    },
    },
    { -- 7302 San Andreas Ave. Rooftop Down
    name    = "7302 San Andreas Ave. Down",
    Pos     = { x = -467.48, y = -680.79, z = 81.19, h = 1.23, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -470.67, y = -679.11, z = 32.71, h = 358.92 },
            heading = 358.92,
        },
    },
    },
    { -- Big San Andreas Ave. Office Rooftop Up
    name    = "Big San Andreas Ave. Office Up",
    Pos     = { x = -589.37, y = -707.78, z = 36.28, h = 359.34 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -579.77, y = -716.88, z = 129.88, h = 91.14, }, -- exit
            heading = 91.14,
        },
    },
    },
    { -- Big San Andreas Ave. Office Rooftop Down
    name    = "Big San Andreas Ave. Office Down",
    Pos     = { x = -579.77, y = -716.88, z = 129.88, h = 91.14, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -589.37, y = -707.78, z = 36.28, h = 359.34 },
            heading = 359.34,
        },
    },
    },
    { -- Kayton Building 1 Rooftop Up
    name    = "Kayton Building 1 Up",
    Pos     = { x = -773.48, y = -633.75, z = 29.82, h = 178.43 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -773.49, y = -625.96, z = 96.2, h = 178.56, }, -- exit
            heading = 178.56,
        },
    },
    },
    { -- Kayton Building 1 Rooftop Down
    name    = "Kayton Building 1 Down",
    Pos     = { x = -773.49, y = -625.96, z = 96.2, h = 178.56, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -773.48, y = -633.75, z = 29.82, h = 178.43 },
            heading = 178.43,
        },
    },
    },
    { -- Kayton Building 2 Rooftop Up
    name    = "Kayton Building 2 Up",
    Pos     = { x = -817.39, y = -621.99, z = 29.22, h = 148.86 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -813.56, y = -615.35, z = 96.2, h = 152.06, }, -- exit
            heading = 152.06,
        },
    },
    },
    { -- Kayton Building 2 Rooftop Down
    name    = "Kayton Building 2 Down",
    Pos     = { x = -813.56, y = -615.35, z = 96.2, h = 152.06, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -817.39, y = -621.99, z = 29.22, h = 148.86 },
            heading = 148.86,
        },
    },
    },
    { -- Kayton Building 3 Rooftop Up
    name    = "Kayton Building 3 Up",
    Pos     = { x = -849.69, y = -589.86, z = 29.22, h = 119.65 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -842.61, y = -585.81, z = 96.2, h = 120.2, }, -- exit
            heading = 120.2,
        },
    },
    },
    { -- Kayton Building 3 Rooftop Down
    name    = "Kayton Building 3 Down",
    Pos     = { x = -842.61, y = -585.81, z = 96.2, h = 120.2, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -849.69, y = -589.86, z = 29.22, h = 119.65 },
            heading = 119.65,
        },
    },
    },
    { -- Wiwang Tower Rooftop Up
    name    = "Wiwang Tower Up",
    Pos     = { x = -827.41, y = -699.84, z = 28.06, h = 89.8 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -820.08, y = -704.65, z = 121.27, h = 0.17, }, -- exit
            heading = 0.17,
        },
    },
    },
    { -- Wiwang Tower Rooftop Down
    name    = "Wiwang Tower Down",
    Pos     = { x = -820.08, y = -704.65, z = 121.27, h = 0.17, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -827.41, y = -699.84, z = 28.06, h = 89.8 },
            heading = 89.8,
        },
    },
    },
    { -- HLM Little Seoul Rooftop Up
    name    = "HLM Little Seoul Up",
    Pos     = { x = -767.38, y = -751.83, z = 27.88, h = 267.8 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -771.86, y = -766.6, z = 84.9, h = 4.23, }, -- exit
            heading = 4.23,
        },
    },
    },
    { -- HLM Little Seoul Rooftop Down
    name    = "HLM Little Seoul Down",
    Pos     = { x = -771.86, y = -766.6, z = 84.9, h = 4.23, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -767.38, y = -751.83, z = 27.88, h = 267.8 },
            heading = 267.8,
        },
    },
    },
    { -- Vespucci Blvd. Apt. Rooftop Up
    name    = "Vespucci Blvd. Apt. Up",
    Pos     = { x = -831.53, y = -861.94, z = 20.69, h = 7.17 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -827.44, y = -863.71, z = 38.45, h = 1.89, }, -- exit
            heading = 1.89,
        },
    },
    },
    { -- Vespucci Blvd. Apt. Rooftop Down
    name    = "Vespucci Blvd. Apt. Down",
    Pos     = { x = -827.44, y = -863.71, z = 38.45, h = 1.89, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -831.53, y = -861.94, z = 20.69, h = 7.17 },
            heading = 7.17,
        },
    },
    },
    { -- Sunshine Apartments Rooftop Up
    name    = "Sunshine Apartments Up",
    Pos     = { x = -728.66, y = -879.81, z = 22.71, h = 92.53 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -722.88, y = -878.63, z = 34.13, h = 88.58, }, -- exit
            heading = 88.58,
        },
    },
    },
    { -- Sunshine Apartments Rooftop Down
    name    = "Sunshine Apartments Down",
    Pos     = { x = -722.88, y = -878.63, z = 34.13, h = 88.58, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -728.66, y = -879.81, z = 22.71, h = 92.53 },
            heading = 92.53,
        },
    },
    },
    { -- Palomino Ave. U-shaped Apartments Rooftop Up
    name    = "Palomino Ave. U-shaped Apartments Up",
    Pos     = { x = -604.82, y = -802.47, z = 25.19, h = 91.01 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -595.72, y = -803.47, z = 41.36, h = 359.25, }, -- exit
            heading = 359.25,
        },
    },
    },
    { -- Palomino Ave. U-shaped Apartments Rooftop Down
    name    = "Palomino Ave. U-shaped Apartments Down",
    Pos     = { x = -595.72, y = -803.47, z = 41.36, h = 359.25, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -604.82, y = -802.47, z = 25.19, h = 91.01 },
            heading = 91.01,
        },
    },
    },
    { -- Palomino Ave. U-shaped Apartments Rooftop Up
    name    = "Palomino Ave. U-shaped Apartments Up",
    Pos     = { x = -604.12, y = -774.32, z = 25.2, h = 180.27 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -605.04, y = -765.56, z = 41.36, h = 279.07, }, -- exit
            heading = 279.07,
        },
    },
    },
    { -- Palomino Ave. U-shaped Apartments Rooftop Down
    name    = "Palomino Ave. U-shaped Apartments Down",
    Pos     = { x = -605.04, y = -765.56, z = 41.36, h = 279.07, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -604.12, y = -774.32, z = 25.2, h = 180.27 },
            heading = 180.27,
        },
    },
    },
    { -- Corner Suites Apartments Rooftop Up
    name    = "Corner Suites Apartments Up",
    Pos     = { x = -517.82, y = -809.07, z = 30.74, h = 267.3 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -534.03, y = -813.31, z = 46.43, h = 184.07, }, -- exit
            heading = 184.07,
        },
    },
    },
    { -- Corner Suites Apartments Rooftop Down
    name    = "Corner Suites Apartments Down",
    Pos     = { x = -534.03, y = -813.31, z = 46.43, h = 184.07, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -517.82, y = -809.07, z = 30.74, h = 267.3 },
            heading = 267.3,
        },
    },
    },
    { -- Corner Suites Apartments Rooftop Up
    name    = "Corner Suites Apartments Up",
    Pos     = { x = -567.88, y = -781.28, z = 30.67, h = 0.57 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -570.92, y = -788.73, z = 46.44, h = 90.25, }, -- exit
            heading = 90.25,
        },
    },
    },
    { -- Corner Suites Apartments Rooftop Down
    name    = "Corner Suites Apartments Down",
    Pos     = { x = -570.92, y = -788.73, z = 46.44, h = 90.25, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -567.88, y = -781.28, z = 30.67, h = 0.57 },
            heading = 0.57,
        },
    },
    },
    { -- Palomino Ave. Apartment Rooftop Up
    name    = "Palomino Ave. Apartment Up",
    Pos     = { x = -670.3, y = -1015.79, z = 18.07, h = 209.88 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -672.53, y = -1012.05, z = 30.35, h = 303.47, }, -- exit
            heading = 303.47,
        },
    },
    },
    { -- Palomino Ave. Apartment Rooftop Down
    name    = "Palomino Ave. Apartment Down",
    Pos     = { x = -672.53, y = -1012.05, z = 30.35, h = 303.47, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -670.3, y = -1015.79, z = 18.07, h = 209.88 },
            heading = 209.88,
        },
    },
    },
    { -- Palomino Ave. Apartment Rooftop Up
    name    = "Palomino Ave. Apartment Up",
    Pos     = { x = -667.97, y = -1105.8, z = 14.63, h = 62.29 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -661.83, y = -1104.1, z = 58.36, h = 66.65, }, -- exit
            heading = 66.65,
        },
    },
    },
    { -- Palomino Ave. Apartment Rooftop Down
    name    = "Palomino Ave. Apartment Down",
    Pos     = { x = -661.83, y = -1104.1, z = 58.36, h = 66.65, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -667.97, y = -1105.8, z = 14.63, h = 62.29 },
            heading = 62.29,
        },
    },
    },
    { -- Palomino Ave. Apartment Rooftop Up
    name    = "Palomino Ave. Apartment Up",
    Pos     = { x = -675.27, y = -1118.01, z = 11.99, h = 335.91 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -673.99, y = -1124.02, z = 48.49, h = 333.06, }, -- exit
            heading = 333.06,
        },
    },
    },
    { -- Palomino Ave. Apartment Rooftop Down
    name    = "Palomino Ave. Apartment Down",
    Pos     = { x = -673.99, y = -1124.02, z = 48.49, h = 333.06, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -675.27, y = -1118.01, z = 11.99, h = 335.91 },
            heading = 335.91,
        },
    },
    },
    { -- Lindsay Circus Apartment Rooftop Up
    name    = "Lindsay Circus Apartment Up",
    Pos     = { x = -741.72, y = -981.59, z = 17.06, h = 25.08 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -738.83, y = -990.34, z = 33.4, h = 296.54, }, -- exit
            heading = 296.54,
        },
    },
    },
    { -- Lindsay Circus Apartment Rooftop Down
    name    = "Lindsay Circus Apartment Down",
    Pos     = { x = -738.83, y = -990.34, z = 33.4, h = 296.54, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -741.72, y = -981.59, z = 17.06, h = 25.08 },
            heading = 25.08,
        },
    },
    },
    { -- Little Seoul Strip Mall Rooftop Up
    name    = "Little Seoul Strip Mall Up",
    Pos     = { x = -785.62, y = -1044.54, z = 12.98, h = 119.57 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -764.92, y = -1052.58, z = 31.2, h = 119.95, }, -- exit
            heading = 119.95,
        },
    },
    },
    { -- Little Seoul Strip Mall Rooftop Down
    name    = "Little Seoul Strip Mall Down",
    Pos     = { x = -764.92, y = -1052.58, z = 31.2, h = 119.95, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -785.62, y = -1044.54, z = 12.98, h = 119.57 },
            heading = 119.57,
        },
    },
    },
    { -- Palomino Ave. Hotel Thing Rooftop Up
    name    = "Palomino Ave. Hotel Thing Up",
    Pos     = { x = -886.04, y = -1233.11, z = 5.66, h = 359.45 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -885.27, y = -1242.67, z = 50.63, h = 349.92, }, -- exit
            heading = 349.92,
        },
    },
    },
    { -- Palomino Ave. Hotel Thing Rooftop Down
    name    = "Palomino Ave. Hotel Thing Down",
    Pos     = { x = -885.27, y = -1242.67, z = 50.63, h = 349.92, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -886.04, y = -1233.11, z = 5.66, h = 359.45 },
            heading = 359.45,
        },
    },
    },
    { -- Palomino Ave. Hotel Thing Rooftop Up
    name    = "Palomino Ave. Hotel Thing Up",
    Pos     = { x = -867.43, y = -1275.04, z = 5.15, h = 240.64 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -875.09, y = -1265.02, z = 50.63, h = 248.28, }, -- exit
            heading = 248.28,
        },
    },
    },
    { -- Palomino Ave. Hotel Thing Rooftop Down
    name    = "Palomino Ave. Hotel Thing Down",
    Pos     = { x = -875.09, y = -1265.02, z = 50.63, h = 248.28, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -867.43, y = -1275.04, z = 5.15, h = 240.64 },
            heading = 240.64,
        },
    },
    },
    { -- Palomino Ave. Hotel Thing Rooftop Up
    name    = "Palomino Ave. Hotel Thing Up",
    Pos     = { x = -968.72, y = -1329.16, z = 5.66, h = 198.23 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -971.75, y = -1322.69, z = 50.63, h = 184.56, }, -- exit
            heading = 184.56,
        },
    },
    },
    { -- Palomino Ave. Hotel Thing Rooftop Down
    name    = "Palomino Ave. Hotel Thing Down",
    Pos     = { x = -971.75, y = -1322.69, z = 50.63, h = 184.56, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -968.72, y = -1329.16, z = 5.66, h = 198.23 },
            heading = 198.23,
        },
    },
    },
    { -- Palomino Ave. Hotel Thing Rooftop Up
    name    = "Palomino Ave. Hotel Thing Up",
    Pos     = { x = -960.64, y = -1287.12, z = 5.33, h = 332.99 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -975.79, y = -1288.47, z = 50.63, h = 12.66, }, -- exit
            heading = 12.66,
        },
    },
    },
    { -- Palomino Ave. Hotel Thing Rooftop Down
    name    = "Palomino Ave. Hotel Thing Down",
    Pos     = { x = -975.79, y = -1288.47, z = 50.63, h = 184.56, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -960.64, y = -1287.12, z = 5.33, h = 332.99 },
            heading = 332.99,
        },
    },
    },
    { -- Fruity Dance Studio Rooftop Up
    name    = "Fruity Dance Studio Up",
    Pos     = { x = -1246.65, y = -1182.59, z = 7.66, h = 26.91 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1246.51, y = -1185.2, z = 14.66, h = 6.52, }, -- exit
            heading = 6.52,
        },
    },
    },
    { -- Fruity Dance Studio Rooftop Down
    name    = "Fruity Dance Studio Down",
    Pos     = { x = -1246.51, y = -1185.2, z = 14.66, h = 6.52, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1246.65, y = -1182.59, z = 7.66, h = 26.91 },
            heading = 26.91,
        },
    },
    },
    { -- Venetian Vespucci Rooftop Up
    name    = "Venetian Vespucci Up",
    Pos     = { x = -1361.8, y = -1079.73, z = 3.6, h = 116.88 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1357.26, y = -1066.28, z = 11.47, h = 213.97, }, -- exit
            heading = 213.97,
        },
    },
    },
    { -- Venetian Vespucci Rooftop Down
    name    = "Venetian Vespucci Down",
    Pos     = { x = -1357.26, y = -1066.28, z = 11.47, h = 213.97, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1361.8, y = -1079.73, z = 3.6, h = 116.88 },
            heading = 116.88,
        },
    },
    },
    { -- Venetian Vespucci Rooftop Up
    name    = "Venetian Vespucci Up",
    Pos     = { x = -1340.89, y = -1075.65, z = 6.94, h = 213.36 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1344.45, y = -1059.07, z = 11.47, h = 205.98, }, -- exit
            heading = 205.98,
        },
    },
    },
    { -- Venetian Vespucci Rooftop Down
    name    = "Venetian Vespucci Down",
    Pos     = { x = -1344.45, y = -1059.07, z = 11.47, h = 205.98, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1340.89, y = -1075.65, z = 6.94, h = 213.36 },
            heading = 213.36,
        },
    },
    },
    { -- Vespucci Hotel Rooftop Up
    name    = "Vespucci Hotel Up",
    Pos     = { x = -1385.03, y = -976.23, z = 9.05, h = 306.22 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1399.33, y = -986.17, z = 19.38, h = 124.29, }, -- exit
            heading = 124.29,
        },
    },
    },
    { -- Vespucci Hotel Rooftop Down
    name    = "Vespucci Hotel Down",
    Pos     = { x = -1399.33, y = -986.17, z = 19.38, h = 124.29, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1385.03, y = -976.23, z = 9.05, h = 306.22 },
            heading = 306.22,
        },
    },
    },
    { -- Office Near Burger Shot Rooftop Up
    name    = "Office Near Burger Shot Up",
    Pos     = { x = -1233.07, y = -855.99, z = 13.11, h = 214.75 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1246.19, y = -853.76, z = 65.33, h = 216.04, }, -- exit
            heading = 216.04,
        },
    },
    },
    { -- Office Near Burger Shot Rooftop Down
    name    = "Office Near Burger Shot Down",
    Pos     = { x = -1246.19, y = -853.76, z = 65.33, h = 216.04, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1233.07, y = -855.99, z = 13.11, h = 214.75 },
            heading = 214.75,
        },
    },
    },
    { -- Nutsaki Restaurant Rooftop Up
    name    = "Nutsaki Restaurant Up",
    Pos     = { x = -1209.08, y = -824.34, z = 15.45, h = 307.64 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1236.83, y = -828.84, z = 25.13, h = 37.25, }, -- exit
            heading = 37.25,
        },
    },
    },
    { -- Nutsaki Restaurant Rooftop Down
    name    = "Nutsaki Restaurant Down",
    Pos     = { x = -1236.83, y = -828.84, z = 25.13, h = 37.25, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1209.08, y = -824.34, z = 15.45, h = 307.64 },
            heading = 307.64,
        },
    },
    },
    { -- Universal Uniform Rooftop Up
    name    = "Universal Uniform Up",
    Pos     = { x = -1176.45, y = -814.14, z = 14.46, h = 171.25 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1178.83, y = -806.57, z = 25.96, h = 126.11, }, -- exit
            heading = 126.11,
        },
    },
    },
    { -- Universal Uniform Rooftop Down
    name    = "Universal Uniform Down",
    Pos     = { x = -1178.83, y = -806.57, z = 25.96, h = 126.11, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1176.45, y = -814.14, z = 14.46, h = 171.25 },
            heading = 171.25,
        },
    },
    },
    { -- Universal Uniform Rooftop Up
    name    = "Universal Uniform Up",
    Pos     = { x = -1183.45, y = -800.84, z = 25.64, h = 128.75 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1175.83, y = -796.77, z = 31.04, h = 129.51, }, -- exit
            heading = 129.51,
        },
    },
    },
    { -- Universal Uniform Rooftop Down
    name    = "Universal Uniform Down",
    Pos     = { x = -1175.73, y = -796.77, z = 31.04, h = 129.51, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1183.45, y = -800.84, z = 25.64, h = 128.75 },
            heading = 128.75,
        },
    },
    },
    { -- The Fish Net Rooftop Up
    name    = "The Fish Net Up",
    Pos     = { x = -1335.08, y = -661.02, z = 26.51, h = 211.97 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1341.49, y = -656.73, z = 40.57, h = 211.73, }, -- exit
            heading = 211.73,
        },
    },
    },
    { -- The Fish Net Rooftop Down
    name    = "The Fish Net Down",
    Pos     = { x = -1341.49, y = -656.73, z = 40.57, h = 211.73, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1335.08, y = -661.02, z = 26.51, h = 211.97 },
            heading = 211.97,
        },
    },
    },
    { -- Zip Rooftop Up
    name    = "Zip Up",
    Pos     = { x = -1373.77, y = -598.1, z = 29.6, h = 304.14 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1380.85, y = -599.66, z = 43.71, h = 125.81, }, -- exit
            heading = 125.81,
        },
    },
    },
    { -- Zip Rooftop Down
    name    = "Zip Down",
    Pos     = { x = -1380.85, y = -599.66, z = 43.71, h = 125.81, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1373.77, y = -598.1, z = 29.6, h = 304.14 },
            heading = 304.14,
        },
    },
    },
    { -- Grain of Truth Rooftop Up
    name    = "Grain of Truth Up",
    Pos     = { x = -1370.98, y = -685.27, z = 24.99, h = 215.88 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1390.49, y = -681.92, z = 39.12, h = 215.73, }, -- exit
            heading = 215.73,
        },
    },
    },
    { -- Grain of Truth Rooftop Down
    name    = "Grain of Truth Down",
    Pos     = { x = -1390.49, y = -681.92, z = 39.12, h = 215.73, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1370.98, y = -685.27, z = 24.99, h = 215.88 },
            heading = 215.88,
        },
    },
    },
    { -- Haute Rooftop Up
    name    = "Haute Up",
    Pos     = { x = -1389.04, y = -745.95, z = 24.63, h = 128.38 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1376.74, y = -752.29, z = 41.68, h = 127.52, }, -- exit
            heading = 127.52,
        },
    },
    },
    { -- Haute Rooftop Down
    name    = "Haute Down",
    Pos     = { x = -1376.74, y = -752.29, z = 41.68, h = 127.52, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1389.04, y = -745.95, z = 24.63, h = 128.38 },
            heading = 128.38,
        },
    },
    },
    { -- Trapezoid Building Rooftop Up
    name    = "Trapezoid Building Up",
    Pos     = { x = -1489.72, y = -602.6, z = 31.29, h = 218.88 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1507.66, y = -602.67, z = 67.52, h = 262.56, }, -- exit
            heading = 262.56,
        },
    },
    },
    { -- Trapezoid Building Rooftop Down
    name    = "Trapezoid Building Down",
    Pos     = { x = -1507.66, y = -602.67, z = 67.52, h = 262.56, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1489.72, y = -602.6, z = 31.29, h = 218.88 },
            heading = 218.88,
        },
    },
    },
    { -- Trapezoid Building Rooftop Up
    name    = "Trapezoid Building Up",
    Pos     = { x = -1539.49, y = -607.59, z = 31.29, h = 175.23 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1522.93, y = -603.3, z = 67.52, h = 84.97, }, -- exit
            heading = 84.97,
        },
    },
    },
    { -- Trapezoid Building Rooftop Down
    name    = "Trapezoid Building Down",
    Pos     = { x = -1522.93, y = -603.3, z = 67.52, h = 84.97, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1539.49, y = -607.59, z = 31.29, h = 175.23 },
            heading = 175.23,
        },
    },
    },
    { -- Crastenburg Rooftop Up
    name    = "Crastenburg Up",
    Pos     = { x = -1545.28, y = -529.62, z = 36.15, h = 31.26 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1539.55, y = -532.28, z = 72.3, h = 36.33, }, -- exit
            heading = 36.33,
        },
    },
    },
    { -- Crastenburg Rooftop Down
    name    = "Crastenburg Down",
    Pos     = { x = -1539.55, y = -532.28, z = 72.3, h = 36.33, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1545.28, y = -529.62, z = 36.15, h = 31.26 },
            heading = 31.26,
        },
    },
    },
    { -- Del Perro Heights Rooftop Up
    name    = "Del Perro Heights Up",
    Pos     = { x = -1447.28, y = -536.96, z = 34.74, h = 220.84 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1451.55, y = -540.96, z = 85.07, h = 129.1, }, -- exit
            heading = 129.1,
        },
    },
    },
    { -- Del Perro Heights Rooftop Down
    name    = "Del Perro Heights Down",
    Pos     = { x = -1451.55, y = -540.96, z = 85.07, h = 129.1, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1447.28, y = -536.96, z = 34.74, h = 220.84 },
            heading = 220.84,
        },
    },
    },
    { -- Elgin House Rockford Rooftop Up
    name    = "Elgin House Rockford Up",
    Pos     = { x = -1288.09, y = -430.4, z = 35.16, h = 307.07 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1292.94, y = -428.91, z = 103.47, h = 307.96, }, -- exit
            heading = 307.96,
        },
    },
    },
    { -- Elgin House Rockford Rooftop Down
    name    = "Elgin House Rockford Down",
    Pos     = { x = -1292.94, y = -428.91, z = 103.47, h = 307.96, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1288.09, y = -430.4, z = 35.16, h = 307.07 },
            heading = 307.07,
        },
    },
    },
    { -- Fancy Hotel Rooftop Up
    name    = "Fancy Hotel Up",
    Pos     = { x = -1163.9, y = -348.87, z = 36.64, h = 5.47 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1164.98, y = -357.78, z = 57.83, h = 183.73, }, -- exit
            heading = 183.73,
        },
    },
    },
    { -- Fancy Hotel Rooftop Down
    name    = "Fancy Hotel Down",
    Pos     = { x = -1164.98, y = -357.78, z = 57.83, h = 183.73, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1163.9, y = -348.87, z = 36.64, h = 5.47 },
            heading = 5.47,
        },
    },
    },
    { -- Fancy Hotel Rooftop Up
    name    = "Fancy Hotel Up",
    Pos     = { x = -1160.48, y = -388.38, z = 36.64, h = 186.22 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1160.15, y = -380.1, z = 57.83, h = 4.55, }, -- exit
            heading = 4.55,
        },
    },
    },
    { -- Fancy Hotel Rooftop Down
    name    = "Fancy Hotel Down",
    Pos     = { x = -1160.15, y = -380.1, z = 57.83, h = 4.55, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1160.48, y = -388.38, z = 36.64, h = 186.22 },
            heading = 186.22,
        },
    },
    },
    { -- ULSA Annexe Rooftop Up
    name    = "ULSA Annexe Up",
    Pos     = { x = -1213.48, y = -406.88, z = 34.14, h = 208.72 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1214.47, y = -400.72, z = 43.83, h = 40,33, }, -- exit
            heading = 40,33,
        },
    },
    },
    { -- ULSA Annexe Rooftop Down
    name    = "ULSA Annexe Down",
    Pos     = { x = -1214.47, y = -400.72, z = 43.83, h = 40,33, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1213.48, y = -406.88, z = 34.14, h = 208.72 },
            heading = 208.72,
        },
    },
    },
    { -- Boulevard Del Perro Rooftop Up
    name    = "Boulevard Del Perro Up",
    Pos     = { x = -1197.15, y = -259.38, z = 37.76, h = 219.69 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1205.99, y = -255.19, z = 50.74, h = 240.95, }, -- exit
            heading = 240.95,
        },
    },
    },
    { -- Boulevard Del Perro Rooftop Down
    name    = "Boulevard Del Perro Down",
    Pos     = { x = -1205.99, y = -255.19, z = 50.74, h = 240.95, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1197.15, y = -259.38, z = 37.76, h = 219.69 },
            heading = 219.69,
        },
    },
    },
    { -- Boulevard Del Perro Rooftop Up
    name    = "Boulevard Del Perro Up",
    Pos     = { x = -1200.27, y = -156.71, z = 40.09, h = 16.63 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1200.4, y = -180.01, z = 79.77, h = 16.32, }, -- exit
            heading = 16.32,
        },
    },
    },
    { -- Boulevard Del Perro Rooftop Down
    name    = "Boulevard Del Perro Down",
    Pos     = { x = -1200.4, y = -180.01, z = 79.77, h = 16.32, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1200.27, y = -156.71, z = 40.09, h = 16.63 },
            heading = 16.63,
        },
    },
    },
    { -- Boulevard Del Perro Rooftop Up
    name    = "Boulevard Del Perro Up",
    Pos     = { x = -1213.46, y = -191.18, z = 39.32, h = 61.68 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1187.15, y = -190.99, z = 79.77, h = 190.74, }, -- exit
            heading = 190.74,
        },
    },
    },
    { -- Boulevard Del Perro Rooftop Down
    name    = "Boulevard Del Perro Down",
    Pos     = { x = -1187.15, y = -190.99, z = 79.77, h = 190.74, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1213.46, y = -191.18, z = 39.32, h = 61.68 },
            heading = 61.68,
        },
    },
    },
    { -- Cougar Ave. Apartment Rooftop Up
    name    = "Cougar Ave. Apartment Up",
    Pos     = { x = -1566.29, y = -404.63, z = 42.39, h = 230.22 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1556.42, y = -387.69, z = 59.15, h = 232.58, }, -- exit
            heading = 232.58,
        },
    },
    },
    { -- Cougar Ave. Apartment Rooftop Down
    name    = "Cougar Ave. Apartment Down",
    Pos     = { x = -1556.42, y = -387.69, z = 59.15, h = 232.58, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1566.29, y = -404.63, z = 42.39, h = 230.22 },
            heading = 230.22,
        },
    },
    },
    { -- Cougar Ave. Apartment Rooftop Up
    name    = "Cougar Ave. Apartment Up",
    Pos     = { x = -1597.71, y = -422.05, z = 41.41, h = 49.99 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1597.75, y = -439.86, z = 56.21, h = 47.6, }, -- exit
            heading = 47.6,
        },
    },
    },
    { -- Cougar Ave. Apartment Rooftop Down
    name    = "Cougar Ave. Apartment Down",
    Pos     = { x = -1597.75, y = -439.86, z = 56.21, h = 47.6, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1597.71, y = -422.05, z = 41.41, h = 49.99 },
            heading = 49.99,
        },
    },
    },
    { -- Banner Hotel Rooftop Up
    name    = "Banner Hotel Up",
    Pos     = { x = -1661.5, y = -533.36, z = 35.5, h = 142.4 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1632.24, y = -498.31, z = 74.56, h = 143.69, }, -- exit
            heading = 143.69,
        },
    },
    },
    { -- Banner Hotel Rooftop Down
    name    = "Banner Hotel Down",
    Pos     = { x = -1632.24, y = -498.31, z = 74.56, h = 143.69, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1661.5, y = -533.36, z = 35.5, h = 142.4 },
            heading = 142.4,
        },
    },
    },
    { -- Playa Vista Rooftop Up
    name    = "Playa Vista Up",
    Pos     = { x = -1790.23, y = -368.84, z = 44.66, h = 322.99 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1799.24, y = -379.18, z = 62.21, h = 53.53, }, -- exit
            heading = 53.53,
        },
    },
    },
    { -- Playa Vista Rooftop Down
    name    = "Playa Vista Down",
    Pos     = { x = -1799.24, y = -379.18, z = 62.21, h = 53.53, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1790.23, y = -368.84, z = 44.66, h = 322.99 },
            heading = 322.99,
        },
    },
    },
    { -- Playa Vista Rooftop Up
    name    = "Playa Vista Up",
    Pos     = { x = -1821.54, y = -405.07, z = 46.15, h = 145.08 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1815.54, y = -399.08, z = 62.78, h = 142.95, }, -- exit
            heading = 142.95,
        },
    },
    },
    { -- Playa Vista Rooftop Down
    name    = "Playa Vista Down",
    Pos     = { x = -1815.54, y = -399.08, z = 62.78, h = 142.95, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1821.54, y = -405.07, z = 46.15, h = 145.08 },
            heading = 145.08,
        },
    },
    },
    { -- Playa Vista Rooftop Up
    name    = "Playa Vista Up",
    Pos     = { x = -1768.08, y = -372.28, z = 45.92, h = 326.61 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1769.58, y = -377.41, z = 57.74, h = 190.19, }, -- exit
            heading = 190.19,
        },
    },
    },
    { -- Playa Vista Rooftop Down
    name    = "Playa Vista Down",
    Pos     = { x = -1769.58, y = -377.41, z = 57.74, h = 190.19, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1768.08, y = -372.28, z = 45.92, h = 326.61 },
            heading = 326.61,
        },
    },
    },
    { -- Playa Vista Hotel Rooftop Up
    name    = "Playa Vista Hotel Up",
    Pos     = { x = -1838.51, y = -361.04, z = 56.59, h = 177.08 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1825.28, y = -365.32, z = 93.18, h = 179.68, }, -- exit
            heading = 179.68,
        },
    },
    },
    { -- Playa Vista Hotel Rooftop Down
    name    = "Playa Vista Hotel Down",
    Pos     = { x = -1825.28, y = -365.32, z = 93.18, h = 179.68, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1838.51, y = -361.04, z = 56.59, h = 177.08 },
            heading = 177.08,
        },
    },
    },
    { -- South Shambles St. Office Building Up
    name    = "South Shambles St. Office Building Up",
    Pos     = { x = 1037.83, y = -2237.39, z = 31.89, h = 256.99 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 1028.62, y = -2245.93, z = 51.05, h = 358.93 }, -- exit
            heading = 358.93,
        },
    },
    },
    { -- South Shambles St. Office Building Down
    name    = "South Shambles St. Office Building Down",
    Pos     = { x = 1028.62, y = -2245.93, z = 51.05, h = 358.93 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 1037.83, y = -2237.39, z = 31.89, h = 256.99 },
            heading = 256.99,
        },
    },
    },
    { -- Playa Vista Hotel Rooftop Up
    name    = "Playa Vista Hotel Up",
    Pos     = { x = -1857.15, y = -348.65, z = 49.34, h = 138.47 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1842.45, y = -353.32, z = 93.18, h = 86.51, }, -- exit
            heading = 86.51,
        },
    },
    },
    { -- Playa Vista Hotel Rooftop Down
    name    = "Playa Vista Hotel Down",
    Pos     = { x = -1842.45, y = -353.32, z = 93.18, h = 86.51, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1857.15, y = -348.65, z = 49.34, h = 138.47 },
            heading = 138.47,
        },
    },
    },
    { -- Playa Vista Hotel Rooftop Up
    name    = "Playa Vista Hotel Up",
    Pos     = { x = -1885.1, y = -325.12, z = 56.62, h = 90.52 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1889.71, y = -312.17, z = 93.16, h = 89.51, }, -- exit
            heading = 89.51,
        },
    },
    },
    { -- Playa Vista Hotel Rooftop Down
    name    = "Playa Vista Hotel Down",
    Pos     = { x = -1889.71, y = -312.17, z = 93.16, h = 89.51, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1885.1, y = -325.12, z = 56.62, h = 90.52 },
            heading = 90.52,
        },
    },
    },
    { -- Playa Vista Hotel Rooftop Up
    name    = "Playa Vista Hotel Up",
    Pos     = { x = -1859.33, y = -346.72, z = 49.34, h = 140.17 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1877.51, y = -329.18, z = 93.16, h = 179.09, }, -- exit
            heading = 179.09,
        },
    },
    },
    { -- Playa Vista Hotel Rooftop Down
    name    = "Playa Vista Hotel Down",
    Pos     = { x = -1877.51, y = -329.18, z = 93.16, h = 179.09, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1859.33, y = -346.72, z = 49.34, h = 140.17 },
            heading = 140.17,
        },
    },
    },
    { -- The Richman Hotel Rooftop Up
    name    = "The Richman Hotel Up",
    Pos     = { x = -1383.6, y = 267.27, z = 60.76, h = 195.81 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1388.28, y = 279.74, z = 89.36, h = 198.8, }, -- exit
            heading = 198.8,
        },
    },
    },
    { -- The Richman Hotel Rooftop Down
    name    = "The Richman Hotel Down",
    Pos     = { x = -1388.28, y = 279.74, z = 89.36, h = 198.8, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1383.6, y = 267.27, z = 60.76, h = 195.81 },
            heading = 195.81,
        },
    },
    },
    { -- L.T. Weld Supply Co Up
    name    = "L.T. Weld Supply Co Up",
    Pos     = { x = 1145.27, y = -1402.17, z = 34.8, h = 183.63 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 1137.2, y = -1387.14, z = 49.64, h = 178.3 }, -- exit
            heading = 178.3,
        },
    },
    },
    { -- L.T. Weld Supply Co Down
    name    = "L.T. Weld Supply Co Down",
    Pos     = { x = 1137.2, y = -1387.14, z = 49.64, h = 178.3 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 1145.27, y = -1402.17, z = 34.8, h = 183.63 },
            heading = 183.63,
        },
    },
    },
    { -- Celltowa Rooftop Up
    name    = "Celltowa Up",
    Pos     = { x = -1001.53, y = -785.11, z = 15.82, h = 153.81 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1018.26, y = -766.17, z = 76.54, h = 87.91, }, -- exit
            heading = 87.91,
        },
    },
    },
    { -- Celltowa Rooftop Down
    name    = "Celltowa Down",
    Pos     = { x = -1018.26, y = -766.17, z = 76.54, h = 87.91, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1001.53, y = -785.11, z = 15.82, h = 153.81 },
            heading = 153.81,
        },
    },
    },
    { -- Celltowa Rooftop Up
    name    = "Celltowa Up",
    Pos     = { x = -1009.51, y = -732.03, z = 21.03, h = 40.41 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -1000.95, y = -751.99, z = 76.54, h = 272.06, }, -- exit
            heading = 272.06,
        },
    },
    },
    { -- Celltowa Rooftop Down
    name    = "Celltowa Down",
    Pos     = { x = -1000.95, y = -751.99, z = 76.54, h = 272.06, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -1009.51, y = -732.03, z = 21.03, h = 40.41 },
            heading = 40.41,
        },
    },
    },
    { -- Ten Cent Office Building Up
    name    = "Ten Cent Office Building Up",
    Pos     = { x = 363.51, y = -711.97, z = 29.29, h = 74.48 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 376.66, y = -703.28, z = 85.61, h = 174.25 }, -- exit
            heading = 174.25,
        },
    },
    },
    { -- Ten Cent Office Building Down
    name    = "Ten Cent Office Building Down",
    Pos     = { x = 376.66, y = -703.28, z = 85.61, h = 174.25 },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 363.51, y = -711.97, z = 29.29, h = 74.48 },
            heading = 74.48,
        },
    },
    },
    { -- Discount Fabrics Wholesale Rooftop Up
    name    = "Discount Fabrics Wholesale Up",
    Pos     = { x = 489.52, y = -801.6, z = 23.34, h = 268.32 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 487.58, y = -790.92, z = 41.92, h = 184.25, }, -- exit
            heading = 184.25,
        },
    },
    },
    { -- Discount Fabrics Wholesale Rooftop Down
    name    = "Discount Fabrics Wholesale Down",
    Pos     = { x = 487.58, y = -790.92, z = 41.92, h = 184.25, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 489.52, y = -801.6, z = 23.94, h = 268.32 },
            heading = 268.32,
        },
    },
    },
    { -- Wall Fabric Rooftop Up
    name    = "Wall Fabric Up",
    Pos     = { x = 418.21, y = -745.17, z = 28.77, h = 94.37 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 427.17, y = -742.94, z = 37.48, h = 266.18, }, -- exit
            heading = 266.18,
        },
    },
    },
    { -- Wall Fabric Rooftop Down
    name    = "Wall Fabric Down",
    Pos     = { x = 427.17, y = -742.94, z = 37.48, h = 266.18, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 418.21, y = -745.17, z = 29.94, h = 94.37 },
            heading = 94.37,
        },
    },
    },
    { -- Broker Fabric Rooftop Up
    name    = "Broker Fabric Up",
    Pos     = { x = 419.24, y = -692.87, z = 28.85, h = 47.23 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 432.04, y = -705.38, z = 35.78, h = 224.31, }, -- exit
            heading = 224.31,
        },
    },
    },
    { -- Broker Fabric Rooftop Down
    name    = "Broker Fabric Down",
    Pos     = { x = 432.04, y = -705.38, z = 35.78, h = 224.31, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 419.24, y = -692.87, z = 29.94, h = 47.23 },
            heading = 47.23,
        },
    },
    },
    { -- Foxy's Cinema Rooftop Up
    name    = "Foxy's Cinema Up",
    Pos     = { x = 345.25, y = -751.1, z = 28.77, h = 68.62 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 360.55, y = -753.36, z = 48.85, h = 254.47, }, -- exit
            heading = 254.47,
        },
    },
    },
    { -- Foxy's Cinema Rooftop Down
    name    = "Foxy's Cinema Down",
    Pos     = { x = 360.55, y = -753.36, z = 48.85, h = 254.47, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 345.25, y = -751.1, z = 28.77, h = 68.62 },
            heading = 68.62,
        },
    },
    },
    { -- Krapea Rooftop Up
    name    = "Foxy's Cinema Up",
    Pos     = { x = 338.91, y = -776.94, z = 28.77, h = 69.76 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 347.58, y = -778.39, z = 66.4, h = 160.64, }, -- exit
            heading = 160.64,
        },
    },
    },
    { -- Krapea Rooftop Down
    name    = "Foxy's Cinema Down",
    Pos     = { x = 347.58, y = -778.39, z = 66.4, h = 160.64, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 338.91, y = -776.94, z = 28.77, h = 69.76 },
            heading = 69.76,
        },
    },
    },
    { -- J's Bonds Rooftop Up
    name    = "J's Bonds Up",
    Pos     = { x = 327.33, y = -806.39, z = 28.77, h = 69.17 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 336.36, y = -801.95, z = 50.22, h = 66.19, }, -- exit
            heading = 66.19,
        },
    },
    },
    { -- J's Bonds Rooftop Down
    name    = "J's Bonds Down",
    Pos     = { x = 336.36, y = -801.95, z = 50.22, h = 66.19, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 327.33, y = -806.39, z = 28.77, h = 69.17 },
            heading = 69.17,
        },
    },
    },
    { -- Multipurpose Building Rooftop Up
    name    = "Multipurpose Building Up",
    Pos     = { x = 336.93, y = -833.62, z = 28.77, h = 179.22 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 349.05, y = -827.35, z = 66.6, h = 92.15, }, -- exit
            heading = 92.15,
        },
    },
    },
    { -- Multipurpose Building Rooftop Down
    name    = "Multipurpose Building Down",
    Pos     = { x = 349.05, y = -827.35, z = 66.6, h = 92.15, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 336.93, y = -833.62, z = 28.77, h = 179.22 },
            heading = 179.22,
        },
    },
    },
    { -- Best Buds Rooftop Up
    name    = "Best Buds Up",
    Pos     = { x = 372.13, y = -827.1, z = 28.77, h = 91.2 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 377.21, y = -826.48, z = 38.57, h = 180.63, }, -- exit
            heading = 180.63,
        },
    },
    },
    { -- Best Buds Rooftop Down
    name    = "Best Buds Down",
    Pos     = { x = 377.21, y = -826.48, z = 38.57, h = 180.63, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 372.13, y = -827.1, z = 28.77, h = 91.2 },
            heading = 91.2,
        },
    },
    },
    { -- Food Market Rooftop Up
    name    = "Food Market Up",
    Pos     = { x = 394.19, y = -804.63, z = 28.69, h = 273.66 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 381.63, y = -809.36, z = 52.84, h = 277.49, }, -- exit
            heading = 277.43,
        },
    },
    },
    { -- Food Market Rooftop Down
    name    = "Food Market Down",
    Pos     = { x = 381.63, y = -809.36, z = 52.84, h = 277.49, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 394.19, y = -804.63, z = 28.69, h = 273.66 },
            heading = 273.66,
        },
    },
    },
    { -- Mama's Grocery Rooftop Up
    name    = "Mama's Grocery Up",
    Pos     = { x = 393.43, y = -782.56, z = 28.69, h = 271.68 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 382.25, y = -780.58, z = 35.01, h = 270.67, }, -- exit
            heading = 277.43,
        },
    },
    },
    { -- Mama's Grocery Rooftop Down
    name    = "Mama's Grocery Down",
    Pos     = { x = 382.25, y = -780.58, z = 35.01, h = 270.67, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 393.43, y = -782.56, z = 28.69, h = 271.68 },
            heading = 271.68,
        },
    },
    },
    { -- Place With a Closing Sale Rooftop Up
    name    = "Place With a Closing Sale Up",
    Pos     = { x = 415.02, y = -924.57, z = 28.91, h = 88.42 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 439.59, y = -928.26, z = 45.1, h = 90.76, }, -- exit
            heading = 90.76,
        },
    },
    },
    { -- Place With a Closing Sale Rooftop Down
    name    = "Place With a Closing Sale Down",
    Pos     = { x = 439.59, y = -928.26, z = 45.1, h = 90.76, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 415.02, y = -924.57, z = 28.91, h = 88.42 },
            heading = 88.42,
        },
    },
    },
    { -- Wholesale Mart Rooftop Up
    name    = "Wholesale Mart Up",
    Pos     = { x = 394.13, y = -877.1, z = 28.54, h = 315.85 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 380.09, y = -886.01, z = 38.66, h = 272.01, }, -- exit
            heading = 277.43,
        },
    },
    },
    { -- Wholesale Mart Rooftop Down
    name    = "Wholesale Mart Down",
    Pos     = { x = 380.09, y = -886.01, z = 38.66, h = 272.01, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 394.13, y = -877.1, z = 28.54, h = 315.85 },
            heading = 315.85,
        },
    },
    },
    { -- Robert Dazzler International Jewelry Exchange Rooftop Up
    name    = "Robert Dazzler International Jewelry Exchange Up",
    Pos     = { x = 301.22, y = -883.27, z = 28.78, h = 69.88 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 310.2, y = -893.56, z = 57.55, h = 90.44, }, -- exit
            heading = 90.44,
        },
    },
    },
    { -- Robert Dazzler International Jewelry Exchange Rooftop Down
    name    = "Robert Dazzler International Jewelry Exchange Down",
    Pos     = { x = 310.2, y = -893.56, z = 57.55, h = 90.44, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 301.22, y = -883.27, z = 28.78, h = 69.88 },
            heading = 69.88,
        },
    },
    },
    { -- Elkridge Hotel Rooftop Up
    name    = "Elkridge Hotel Up",
    Pos     = { x = 286.05, y = -936.75, z = 28.78, h = 135.73 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 295.4, y = -933.24, z = 55.96, h = 93.27, }, -- exit
            heading = 93.27,
        },
    },
    },
    { -- Elkridge Hotel Rooftop Down
    name    = "Elkridge Hotel Down",
    Pos     = { x = 295.4, y = -933.24, z = 55.96, h = 93.27, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 286.05, y = -936.75, z = 28.78, h = 135.73 },
            heading = 135.73,
        },
    },
    },
    { -- Sound Sanctuary Rooftop Up
    name    = "Sound Sanctuary Up",
    Pos     = { x = 386.94, y = -970.18, z = 28.94, h = 270.5 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 373.4, y = -969.18, z = 43.44, h = 271.47, }, -- exit
            heading = 271.47,
        },
    },
    },
    { -- Sound Sanctuary Rooftop Down
    name    = "Sound Sanctuary Down",
    Pos     = { x = 373.4, y = -969.18, z = 43.44, h = 271.47, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 386.94, y = -970.18, z = 28.94, h = 270.5 },
            heading = 270.5,
        },
    },
    },
    { -- Payback Time Loans Rooftop Up
    name    = "Payback Time Loans Up",
    Pos     = { x = 387.42, y = -984.73, z = 28.92, h = 267.66 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 381.08, y = -983.95, z = 42.42, h = 270.86, }, -- exit
            heading = 270.86,
        },
    },
    },
    { -- Payback Time Loans Rooftop Down
    name    = "Payback Time Loans Down",
    Pos     = { x = 381.08, y = -983.95, z = 42.42, h = 270.86, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 387.42, y = -984.73, z = 28.92, h = 267.66 },
            heading = 267.66,
        },
    },
    },
    { -- The Infamous Gear and Clothing in Los Santos Rooftop Up
    name    = "The Infamous Gear and Clothing in Los Santos Up",
    Pos     = { x = 360.6, y = -966.42, z = 28.93, h = 358.61 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 361.65, y = -986.01, z = 35.14, h = 88.77, }, -- exit
            heading = 88.77,
        },
    },
    },
    { -- The Infamous Gear and Clothing in Los Santos Rooftop Down
    name    = "The Infamous Gear and Clothing in Los Santos Down",
    Pos     = { x = 361.65, y = -986.01, z = 35.14, h = 88.77, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 360.6, y = -966.42, z = 28.93, h = 358.61 },
            heading = 358.61,
        },
    },
    },
    { -- Little Gems Jewelry Rooftop Up
    name    = "Little Gems Jewelry Up",
    Pos     = { x = 341.09, y = -965.01, z = 28.93, h = 353.67 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 337.58, y = -971.81, z = 78.9, h = 3.04, }, -- exit
            heading = 3.04,
        },
    },
    },
    { -- Little Gems Jewelry Rooftop Down
    name    = "Little Gems Jewelry Down",
    Pos     = { x = 337.58, y = -971.81, z = 78.9, h = 3.04, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 341.09, y = -965.01, z = 28.93, h = 353.67 },
            heading = 353.67,
        },
    },
    },
    { -- Ring Midas Rooftop Up
    name    = "Ring Midas Up",
    Pos     = { x = 328.94, y = -964.42, z = 28.93, h = 359.88 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 324.92, y = -985.94, z = 86.44, h = 357.89, }, -- exit
            heading = 357.89,
        },
    },
    },
    { -- Ring Midas Rooftop Down
    name    = "Ring Midas Down",
    Pos     = { x = 324.92, y = -985.94, z = 86.44, h = 357.89, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 328.94, y = -964.42, z = 28.93, h = 359.88 },
            heading = 359.88,
        },
    },
    },
    { -- Bean Machine (Atlee) Rooftop Up
    name    = "Bean Machine (Atlee) Up",
    Pos     = { x = 280.65, y = -963.83, z = 28.92, h = 359.88 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 285.08, y = -977.78, z = 44.59, h = 1.29, }, -- exit
            heading = 1.29,
        },
    },
    },
    { -- Bean Machine (Atlee) Rooftop Down
    name    = "Bean Machine (Atlee) Down",
    Pos     = { x = 285.08, y = -977.78, z = 44.59, h = 1.29, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 280.65, y = -963.83, z = 28.92, h = 359.88 },
            heading = 359.88,
        },
    },
    },
    { -- Limey's (Strawberry) Rooftop Up
    name    = "Limey's (Strawberry) Up",
    Pos     = { x = 250.24, y = -1026.66, z = 28.66, h = 115.49 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 261.06, y = -1004.94, z = 61.13, h = 159.63, }, -- exit
            heading = 159.63,
        },
    },
    },
    { -- Limey's (Strawberry) Rooftop Down
    name    = "Limey's (Strawberry) Down",
    Pos     = { x = 261.06, y = -1004.94, z = 61.13, h = 159.63, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 250.24, y = -1026.66, z = 28.66, h = 115.49 },
            heading = 115.49,
        },
    },
    },
    { -- The Other Templar Hotel Rooftop Up
    name    = "The Other Templar Hotel Up",
    Pos     = { x = 296.27, y = -1027.93, z = 28.66, h = 182.99 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 285.55, y = -1011.41, z = 86.15, h = 184.07, }, -- exit
            heading = 184.07,
        },
    },
    },
    { -- The Other Templar Hotel Rooftop Down
    name    = "The Other Templar Hotel Down",
    Pos     = { x = 285.55, y = -1011.41, z = 86.15, h = 184.07, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 296.27, y = -1027.93, z = 28.66, h = 182.99 },
            heading = 182.99,
        },
    },
    },
    { -- Rusty Brown Rooftop Up
    name    = "Rusty Brown Up",
    Pos     = { x = 353.99, y = -1028.33, z = 28.66, h = 183.6 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 359.26, y = -1018.26, z = 57.04, h = 180.67, }, -- exit
            heading = 180.67,
        },
    },
    },
    { -- Rusty Brown Rooftop Down
    name    = "Rusty Brown Down",
    Pos     = { x = 359.26, y = -1018.26, z = 57.04, h = 180.67, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 353.99, y = -1028.33, z = 28.66, h = 183.6 },
            heading = 183.6,
        },
    },
    },
    { -- MRPD Balcony Rooftop Up
    name    = "MRPD Balcony Up",
    Pos     = { x = 459.02, y = -1008.03, z = 27.66, h = 93.76 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 463.62, y = -1011.99, z = 32.38, h = 181.57, }, -- exit
            heading = 181.57,
        },
    },
    },
    { -- MRPD Balcony Rooftop Down
    name    = "MRPD Balcony Down",
    Pos     = { x = 463.62, y = -1011.99, z = 32.38, h = 181.57, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 459.02, y = -1008.03, z = 27.66, h = 93.76 },
            heading = 93.76,
        },
    },
    },
    { -- Templar Hotel Rooftop Up
    name    = "Templar Hotel Up",
    Pos     = { x = 278.7, y = -1118.16, z = 28.92, h = 178.51 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 278.33, y = -1109.46, z = 85.14, h = 271.3, }, -- exit
            heading = 271.3,
        },
    },
    },
    { -- Templar Hotel Rooftop Down
    name    = "Templar Hotel Down",
    Pos     = { x = 278.33, y = -1109.46, z = 85.14, h = 271.3, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 278.7, y = -1118.16, z = 28.92, h = 178.51 },
            heading = 178.51,
        },
    },
    },
    { -- J's Bonds (Vespucci) Rooftop Up
    name    = "J's Bonds (Vespucci) Up",
    Pos     = { x = 261.2, y = -1069.93, z = 28.92, h = 359.95 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 257.54, y = -1094.17, z = 46.41, h = 0.48, }, -- exit
            heading = 0.48,
        },
    },
    },
    { -- J's Bonds (Vespucci) Rooftop Down
    name    = "J's Bonds (Vespucci) Down",
    Pos     = { x = 257.54, y = -1094.17, z = 46.41, h = 0.48, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 261.2, y = -1069.93, z = 28.92, h = 359.95 },
            heading = 359.95,
        },
    },
    },
    { -- Schlongberg Sachs (Adam's Apple) Rooftop Up
    name    = "Schlongberg Sachs (Adam's Apple) Up",
    Pos     = { x = 162.23, y = -1119.26, z = 28.92, h = 179.14 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 172.26, y = -1095.84, z = 48.66, h = 90.05, }, -- exit
            heading = 90.05,
        },
    },
    },
    { -- Schlongberg Sachs (Adam's Apple) Rooftop Down
    name    = "Schlongberg Sachs (Adam's Apple) Down",
    Pos     = { x = 172.26, y = -1095.84, z = 48.66, h = 90.05, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 162.23, y = -1119.26, z = 28.92, h = 179.14 },
            heading = 179.14,
        },
    },
    },
    { -- Schlongberg Sachs (Adam's Apple) Rooftop Up
    name    = "Schlongberg Sachs (Adam's Apple) Up",
    Pos     = { x = 159.06, y = -1087.05, z = 28.69, h = 2.54 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 148.08, y = -1095.84, z = 48.66, h = 272.7, }, -- exit
            heading = 272.7,
        },
    },
    },
    { -- Schlongberg Sachs (Adam's Apple) Rooftop Down
    name    = "Schlongberg Sachs (Adam's Apple) Down",
    Pos     = { x = 148.08, y = -1095.84, z = 48.66, h = 272.7, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 159.06, y = -1087.05, z = 28.69, h = 2.54 },
            heading = 2.54,
        },
    },
    },
    { -- Vespucci Fleeca Bank Rooftop Up
    name    = "Vespucci Fleeca Bank Up",
    Pos     = { x = 146.05, y = -1058.91, z = 29.59, h = 157.12 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 144.1, y = -1055.41, z = 48.72, h = 72.04, }, -- exit
            heading = 72.04,
        },
    },
    },
    { -- Vespucci Fleeca Bank Rooftop Down
    name    = "Vespucci Fleeca Bank Down",
    Pos     = { x = 144.1, y = -1055.41, z = 48.72, h = 72.04, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 146.05, y = -1058.91, z = 29.59, h = 157.12 },
            heading = 157.12,
        },
    },
    },
    { -- Crucial Fix Rooftop Up
    name    = "Crucial Fix Up",
    Pos     = { x = 273.74, y = -833.24, z = 29.41, h = 201.71 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 256.62, y = -810.97, z = 75.1, h = 163.63, }, -- exit
            heading = 163.63,
        },
    },
    },
    { -- Crucial Fix Rooftop Down
    name    = "Crucial Fix Down",
    Pos     = { x = 256.62, y = -810.97, z = 75.1, h = 163.63, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 273.74, y = -833.24, z = 29.41, h = 201.71 },
            heading = 201.71,
        },
    },
    },
    { -- Strawberry Aprtments Rooftop Up
    name    = "Strawberry Aprtments Up",
    Pos     = { x = 299.14, y = -759.08, z = 28.86, h = 249.29 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 287.69, y = -751.82, z = 62.87, h = 335.27, }, -- exit
            heading = 335.27,
        },
    },
    },
    { -- Strawberry Aprtments Rooftop Down
    name    = "Strawberry Aprtments Down",
    Pos     = { x = 287.69, y = -751.82, z = 62.87, h = 335.27, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 299.14, y = -759.08, z = 28.86, h = 249.29 },
            heading = 249.29,
        },
    },
    },
    { -- Alesandro Hotel Rooftop Up
    name    = "Alesandro Hotel Up",
    Pos     = { x = 307.7, y = -728.07, z = 28.86, h = 247.68 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 300.25, y = -708.72, z = 80.91, h = 253.76, }, -- exit
            heading = 253.76,
        },
    },
    },
    { -- Alesandro Hotel Rooftop Down
    name    = "Alesandro Hotel Down",
    Pos     = { x = 300.25, y = -708.72, z = 80.91, h = 253.76, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 307.7, y = -728.07, z = 28.86, h = 247.68 },
            heading = 247.68,
        },
    },
    },
    { -- Alesandro Hotel Rooftop Up
    name    = "Alesandro Hotel Up",
    Pos     = { x = 238.86, y = -696.72, z = 36.14, h = 71.6 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 249.03, y = -694.56, z = 80.91, h = 158.45, }, -- exit
            heading = 158.45,
        },
    },
    },
    { -- Alesandro Hotel Rooftop Down
    name    = "Alesandro Hotel Down",
    Pos     = { x = 249.03, y = -694.56, z = 80.91, h = 158.45, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 238.86, y = -696.72, z = 36.14, h = 71.6 },
            heading = 71.6,
        },
    },
    },
    { -- Integrity Apartments Rooftop Up
    name    = "Integrity Apartments Up",
    Pos     = { x = 267.68, y = -645.23, z = 41.52, h = 70.28 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 287.83, y = -642.02, z = 113.07, h = 72.01, }, -- exit
            heading = 72.01,
        },
    },
    },
    { -- Integrity Apartments Rooftop Down
    name    = "Integrity Apartments Down",
    Pos     = { x = 287.83, y = -642.02, z = 113.07, h = 72.01, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 267.68, y = -645.23, z = 41.52, h = 70.28 },
            heading = 70.28,
        },
    },
    },
    { -- Pillbox Hospital Rooftop Up
    name    = "Pillbox Hospital Up",
    Pos     = { x = 310.24, y = -602.97, z = 42.68, h = 69.46 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 312.83, y = -570.91, z = 90.11, h = 341.15, }, -- exit
            heading = 341.15,
        },
    },
    },
    { -- Pillbox Hospital Rooftop Down
    name    = "Pillbox Hospital Down",
    Pos     = { x = 312.83, y = -570.91, z = 90.11, h = 341.15, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 310.24, y = -602.97, z = 42.68, h = 69.46 },
            heading = 69.46,
        },
    },
    },
    { -- Penris Building Rooftop Up
    name    = "Penris Building Up",
    Pos     = { x = 212.87, y = -593.07, z = 43.27, h = 162.43 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 206.2, y = -580.87, z = 125.01, h = 252.46, }, -- exit
            heading = 252.46,
        },
    },
    },
    { -- Penris Building Rooftop Down
    name    = "Penris Building Down",
    Pos     = { x = 206.2, y = -580.87, z = 125.01, h = 252.46, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 212.87, y = -593.07, z = 43.27, h = 162.43 },
            heading = 162.43,
        },
    },
    },
    { -- Penris Building Rooftop Up
    name    = "Penris Building Up",
    Pos     = { x = 169.68, y = -567.45, z = 43.27, h = 79.45 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 200.64, y = -579.35, z = 125.01, h = 73.5, }, -- exit
            heading = 73.5,
        },
    },
    },
    { -- Penris Building Rooftop Down
    name    = "Penris Building Down",
    Pos     = { x = 200.64, y = -579.35, z = 125.01, h = 73.5, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 169.68, y = -567.45, z = 43.27, h = 79.45 },
            heading = 79.45,
        },
    },
    },
    { -- Maison Ricard Building Rooftop Up
    name    = "Maison Ricard Building Up",
    Pos     = { x = 142.89, y = -832.63, z = 30.69, h = 297.44 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 109.46, y = -847.73, z = 73.09, h = 250.85, }, -- exit
            heading = 250.85,
        },
    },
    },
    { -- Maison Ricard Building Rooftop Down
    name    = "Maison Ricard Building Down",
    Pos     = { x = 109.46, y = -847.73, z = 73.09, h = 250.85, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 142.89, y = -832.63, z = 30.69, h = 297.44 },
            heading = 297.44,
        },
    },
    },
    { -- Escapism Travel Rooftop Up
    name    = "Escapism Travel Up",
    Pos     = { x = 121.56, y = -877.01, z = 30.69, h = 249.79 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 110.08, y = -867.54, z = 134.27, h = 343.57, }, -- exit
            heading = 343.57,
        },
    },
    },
    { -- Escapism Travel Rooftop Down
    name    = "Escapism Travel Down",
    Pos     = { x = 110.08, y = -867.54, z = 134.27, h = 343.57, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 121.56, y = -877.01, z = 30.69, h = 249.79 },
            heading = 249.79,
        },
    },
    },
    { -- The Emissary Rooftop Up
    name    = "The Emissary Up",
    Pos     = { x = 105.03, y = -933.1, z = 29.31, h = 251.41 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = 69.48, y = -921.08, z = 84.69, h = 250.7, }, -- exit
            heading = 250.7,
        },
    },
    },
    { -- The Emissary Rooftop Down
    name    = "The Emissary Down",
    Pos     = { x = 69.48, y = -921.08, z = 84.69, h = 250.7, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = 105.03, y = -933.1, z = 29.31, h = 251.41 },
            heading = 251.41,
        },
    },
    },
    { -- Maze Bank Tower Rooftop Up
    name    = "Maze Bank Tower Up",
    Pos     = { x = -70.91, y = -800.82, z = 43.83, h = 335.11 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -67.3, y = -821.86, z = 320.89, h = 253.13, }, -- exit
            heading = 253.13,
        },
    },
    },
    { -- Maze Bank Tower Rooftop Down
    name    = "Maze Bank Tower Down",
    Pos     = { x = -67.3, y = -821.86, z = 320.89, h = 253.13, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -70.91, y = -800.82, z = 43.83, h = 335.11 },
            heading = 335.11,
        },
    },
    },
    { -- Tinkle Tower Rooftop Up
    name    = "Tinkle Tower Up",
    Pos     = { x = -47.61, y = -585.91, z = 37.45, h = 72.08 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -36.8, y = -598.78, z = 105.82, h = 339.14, }, -- exit
            heading = 339.14,
        },
    },
    },
    { -- Tinkle Tower Rooftop Down
    name    = "Tinkle Tower Down",
    Pos     = { x = -36.8, y = -598.78, z = 105.82, h = 339.14, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -47.61, y = -585.91, z = 37.45, h = 72.08 },
            heading = 72.08,
        },
    },
    },
    { -- Tinkle Tower Rooftop Up
    name    = "Tinkle Tower Up",
    Pos     = { x = -59.65, y = -616.07, z = 36.16, h = 68.86 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -48.48, y = -622.04, z = 82.84, h = 68.2, }, -- exit
            heading = 68.2,
        },
    },
    },
    { -- Tinkle Tower Rooftop Down
    name    = "Tinkle Tower Down",
    Pos     = { x = -48.48, y = -622.04, z = 82.84, h = 68.2, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -59.65, y = -616.07, z = 36.16, h = 68.86 },
            heading = 68.86,
        },
    },
    },
    { -- Arcadius Building Rooftop Up
    name    = "Arcadius Building Up",
    Pos     = { x = -115.72, y = -600.88, z = 35.78, h = 253.15 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -137.07, y = -596.18, z = 206.42, h = 254.26, }, -- exit
            heading = 254.26,
        },
    },
    },
    { -- Arcadius Building Rooftop Down
    name    = "Arcadius Building Down",
    Pos     = { x = -137.07, y = -596.18, z = 206.42, h = 254.26, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -115.72, y = -600.88, z = 35.78, h = 253.15 },
            heading = 253.15,
        },
    },
    },
    { -- Schlongberg Sachs Building (Peaceful) Rooftop Up
    name    = "Schlongberg Sachs Building (Peaceful) Up",
    Pos     = { x = -213.01, y = -727.98, z = 33.04, h = 71.64 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -199.2, y = -740.51, z = 216.41, h = 71.98, }, -- exit
            heading = 71.98,
        },
    },
    },
    { -- Schlongberg Sachs Building (Peaceful) Rooftop Down
    name    = "Schlongberg Sachs Building (Peaceful) Down",
    Pos     = { x = -199.2, y = -740.51, z = 216.41, h = 71.98, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -213.01, y = -727.98, z = 33.04, h = 71.64 },
            heading = 71.64,
        },
    },
    },
    { -- GoPostal (San Andreas) Rooftop Up
    name    = "GoPostal (San Andreas) Up",
    Pos     = { x = -229.96, y = -852.19, z = 30.18, h = 160.11 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -225.66, y = -841.43, z = 124.76, h = 339.98, }, -- exit
            heading = 339.98,
        },
    },
    },
    { -- GoPostal (San Andreas) Rooftop Down
    name    = "GoPostal (San Andreas) Down",
    Pos     = { x = -225.66, y = -841.43, z = 124.76, h = 339.98, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -229.96, y = -852.19, z = 30.18, h = 160.11 },
            heading = 160.11,
        },
    },
    },
    { -- 3 Alta St. Rooftop Up
    name    = "3 Alta St. Up",
    Pos     = { x = -270.94, y = -957.93, z = 30.62, h = 300.93 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -275.18, y = -962.86, z = 130.02, h = 161.67, }, -- exit
            heading = 161.67,
        },
    },
    },
    { -- 3 Alta St. Rooftop Down
    name    = "3 Alta St. Down",
    Pos     = { x = -275.18, y = -962.86, z = 130.02, h = 161.67, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -270.94, y = -957.93, z = 30.62, h = 300.93 },
            heading = 300.93,
        },
    },
    },
    { -- 3 Alta St. Rooftop Up
    name    = "3 Alta St. Up",
    Pos     = { x = -266.26, y = -955.45, z = 30.62, h = 116.67 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -269.18, y = -948.66, z = 130.02, h = 340.94, }, -- exit
            heading = 340.94,
        },
    },
    },
    { -- 3 Alta St. Rooftop Down
    name    = "3 Alta St. Down",
    Pos     = { x = -269.18, y = -948.66, z = 130.02, h = 340.94, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -266.26, y = -955.45, z = 30.62, h = 116.67 },
            heading = 116.67,
        },
    },
    },
    { -- Banner Hotel & Spa Rooftop Up
    name    = "Banner Hotel & Spa Up",
    Pos     = { x = -286.73, y = -1060.42, z = 26.61, h = 251.3 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -334.48, y = -1051.29, z = 73.19, h = 160.85, }, -- exit
            heading = 160.85,
        },
    },
    },
    { -- Banner Hotel & Spa Rooftop Down
    name    = "Banner Hotel & Spa Down",
    Pos     = { x = -334.48, y = -1051.29, z = 73.19, h = 160.85, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -286.73, y = -1060.42, z = 26.61, h = 251.3 },
            heading = 251.3,
        },
    },
    },
    { -- Slaughter, Slaughter, & Slaughter Rooftop Up
    name    = "Slaughter, Slaughter, & Slaughter Up",
    Pos     = { x = -272.53, y = -703.66, z = 37.78, h = 291.11 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -280.53, y = -703.95, z = 110.09, h = 71.51, }, -- exit
            heading = 71.51,
        },
    },
    },
    { -- Slaughter, Slaughter, & Slaughter Rooftop Down
    name    = "Slaughter, Slaughter, & Slaughter Down",
    Pos     = { x = -280.53, y = -703.95, z = 110.09, h = 71.51, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -272.53, y = -703.66, z = 37.78, h = 291.11 },
            heading = 291.11,
        },
    },
    },
    { -- Alta Apartments Rooftop Up
    name    = "Alta Apartments Up",
    Pos     = { x = -50.89, y = -398.78, z = 37.73, h = 160.74 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -55.25, y = -395.01, z = 55.05, h = 162.32, }, -- exit
            heading = 162.32,
        },
    },
    },
    { -- Alta Apartments Rooftop Down
    name    = "Alta Apartments Down",
    Pos     = { x = -55.25, y = -395.01, z = 55.05, h = 162.32, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -50.89, y = -398.78, z = 37.73, h = 160.74 },
            heading = 160.74,
        },
    },
    },
    { -- Alta Apartments Rooftop Up
    name    = "Alta Apartments Up",
    Pos     = { x = -30.26, y = -347.18, z = 45.88, h = 254.84 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -35.09, y = -341.55, z = 56.07, h = 0.73, }, -- exit
            heading = 0.73,
        },
    },
    },
    { -- Alta Apartments Rooftop Down
    name    = "Alta Apartments Down",
    Pos     = { x = -35.09, y = -341.55, z = 56.07, h = 0.73, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -30.26, y = -347.18, z = 45.88, h = 254.84 },
            heading = 254.84,
        },
    },
    },
    { -- Crastenburg Hotel Rooftop Up
    name    = "Crastenburg Hotel Up",
    Pos     = { x = -877.86, y = -2177.8, z = 9.21, h = 134.25 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -850.16, y = -2135.37, z = 95.86, h = 46.69, }, -- exit
            heading = 46.69,
        },
    },
    },
    { -- Crastenburg Hotel Rooftop Down
    name    = "Crastenburg Hotel Down",
    Pos     = { x = -850.16, y = -2135.37, z = 95.86, h = 46.69, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -877.86, y = -2177.8, z = 9.21, h = 134.25 },
            heading = 134.25,
        },
    },
    },
    { -- Opium Nights Hotel Rooftop Up
    name    = "Opium Nights Hotel Up",
    Pos     = { x = -735.54, y = -2276.67, z = 12.84, h = 135.08 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -740.6, y = -2259.01, z = 79.79, h = 84.95, }, -- exit
            heading = 84.95,
        },
    },
    },
    { -- Opium Nights Hotel Rooftop Down
    name    = "Opium Nights Hotel Down",
    Pos     = { x = -740.6, y = -2259.01, z = 79.79, h = 84.95, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -735.54, y = -2276.67, z = 12.84, h = 135.08 },
            heading = 135.08,
        },
    },
    },
    { -- Opium Nights Hotel Rooftop Up
    name    = "Opium Nights Hotel Up",
    Pos     = { x = -702.56, y = -2274.75, z = 12.87, h = 224.89 }, -- enter
    options = {
        {
            label   = "Rooftop",
            name    = "Rooftop",
            pos     = { x = -699.13, y = -2259.11, z = 80.19, h = 280.22, }, -- exit
            heading = 280.22,
        },
    },
    },
    { -- Opium Nights Hotel Rooftop Down
    name    = "Opium Nights Hotel Down",
    Pos     = { x = -699.13, y = -2259.11, z = 80.19, h = 280.22, },
    options = {
        {
            label   = "Ground Level",
            name    = "Ground Level",
            pos     = { x = -702.56, y = -2274.75, z = 12.87, h = 224.89 },
            heading = 224.89,
        },
    },
    },
    { -- Casino Into Cashier
    name    = "Casino Door",
    Pos     = { x = 978.47, y = 32.13, z = 74.28 },
    options = {
         {
            label   = "Cashier's Booth",
            name    = "Cashier's Booth",
            pos     = { x = 982.25, y = 38.41, z = 74.28 },
            heading = 56.49,
         }, 
     },
    },
    { -- Casino Exit Cashier
    name    = "Casino Door",
    Pos     = { x = 982.25, y = 38.41, z = 73.88 },
    options = {
         {
            label   = "Lounge",
            name    = "Lounge",
            pos     = { x = 978.47, y = 32.13, z = 73.88 },
            heading = 56.49,
         }, 
     },
    },
    { -- Casino Elevator Up
    name    = "Casino Elevator",
    Pos     = { x = 947.72, y = 50.76, z = 74.98 },
    options = {
     {
        label   = "Rooftop",
        name    = "Rooftop",
        pos     = { x = 965.01, y = 58.48, z = 112.20 },
        heading = 52.08,
     }, 
 },
},
{ -- Casino Elevator down
    name    = "Casino Elevator",
    Pos     = { x = 965.00, y = 58.48, z = 112.20 },
    options = {
    {
        label   = "Lounge",
        name    = "Lounge",
        pos     = { x = 947.72, y = 50.76, z = 74.98 },
        heading = 284.9,
 }, 
},
},
}