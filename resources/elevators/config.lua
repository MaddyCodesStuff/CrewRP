Config              = {}

Config.DrawDistance = 1

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
        name    = "ganggarage1",
        Pos     = { x = 997.44, y = -3158.1, z = -38.91 },
        options = {
            {
                label   = "Outside",
                name    = "outsideganggarage1",
                pos     = { x = -689.93, y = -893.08, z = 24.5, h = 275 },
            },
        },
    },
    { -- Andy's Gang Garage Outside
        name    = "outsideganggarage1",
        Pos     = { x = -689.93, y = -893.08, z = 24.5 },
        options = {
            {
                label   = "Outside",
                name    = "ganggarage1",
                pos     = { x = 997.44, y = -3158.1, z = -38.91, h = 275 },
            },
        },
    },
    { -- Helmuts Outside
        name    = "helmuts",
        Pos     = { x = -247.62, y = 6213.10, z = 31.94 },
        options = {
            {
                label   = "Inside",
                name    = "helmutsinside1",
                pos     = { x = -246.44, y = 6214.43, z = 30.95, h = 315 },
            },
        },
    },
    { -- Helmuts Inside
        name    = "helmutsinside1",
        Pos     = { x = -246.44, y = 6214.43, z = 31.95 },
        options = {
            {
                label   = "Outside",
                name    = "helmuts",
                pos     = { x = -247.62, y = 6213.10, z = 30.94, h = 121 },
            },
        },
    },
}