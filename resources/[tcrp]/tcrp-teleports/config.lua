Config              = {}

Config.DrawDistance = 3

Config.Elevators    = {
    -- Pillbox elevators
    { -- Pillbox Upper 1
        name    = "Pillbox Top Floor",
        Pos     = { x = 331.72, y = -595.43, z = 43.28 }, -- Position of the text to show up
        options = {
            {
                label = "Coronor's Office",
                name  = "coronor",
                pos   = { x = 248.67, y = -1369.74, z = 29.65 }, -- Position to take you to
            },
            {
                label = "Morgue",
                name  = "morgue",
                pos   = { x = 247.06, y = -1372.07, z = 24.54 }, -- Position to take you to
            },
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
                label = "Coronor's Office",
                name  = "coronor",
                pos   = { x = 248.67, y = -1369.74, z = 29.65 }, -- Position to take you to
            },
            {
                label = "Morgue",
                name  = "morgue",
                pos   = { x = 247.06, y = -1372.07, z = 24.54 }, -- Position to take you to
            },
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
                label = "Coronor's Office",
                name  = "coronor",
                pos   = { x = 248.67, y = -1369.74, z = 29.65 }, -- Position to take you to
            },
            {
                label = "Morgue",
                name  = "morgue",
                pos   = { x = 247.06, y = -1372.07, z = 24.54 }, -- Position to take you to
            },
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
    { -- Coronor
        name    = "Pillbox Coronor's Office",
        Pos     = { x = 247.52, y = -1369.1, z = 29.65 }, -- Position of the text to show up
        options = {
            {
                label = "Main Floor",
                name  = "upperfloor",
                pos   = { x = 331.72, y = -595.43, z = 43.28 }, -- Position to take you to
            },
            {
                label = "Morgue",
                name  = "morgue",
                pos   = { x = 247.06, y = -1372.07, z = 24.54 }, -- Position to take you to
            },
        },
    },
    { -- Morgue
        name    = "Pillbox Morgue",
        Pos     = { x = 247.1, y = -1370.37, z = 24.54 }, -- Position of the text to show up
        options = {
            {
                label = "Main Floor",
                name  = "upperfloor",
                pos   = { x = 331.72, y = -595.43, z = 43.28 }, -- Position to take you to
            },
            {
                label = "Coronor's Office",
                name  = "coronor",
                pos   = { x = 248.67, y = -1369.74, z = 29.65 }, -- Position to take you to
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
    { -- Sandy Medical
        name    = "Sandy Top Floor",
        Pos     = { x = 1838.55, y = 3686.77, z = 34.27 }, -- Position of the text to show up
        options = {
            {
                label = "Lower Level",
                name  = "lowerlevel",
                pos   = { x = 1839.06, y = 3686.30, z = 29.01 }, -- Position to take you to
            },
        },
    },
    { -- Sandy Medical
        name    = "Sandy Lower Floor",
        Pos     = { x = 1838.72, y = 3686.51, z = 29.01 }, -- Position of the text to show up
        options = {
            {
                label = "Top Level",
                name  = "toplevel",
                pos   = { x = 1838.55, y = 3687.04, z = 34.27 }, -- Position to take you to
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
}