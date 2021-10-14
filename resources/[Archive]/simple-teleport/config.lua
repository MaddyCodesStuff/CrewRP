Config              = {};

Config.DrawDistance = 100
Config.MarkerOffset = 1
Config.Type         = 27
Config.Size         = 1.0

Config.Blip         = {
    x      = -121.16,
    y      = -1258.5,
    z      = 29.31,
    Color  = 47,
    Sprite = 93,
    Name   = 'Galaxy'
}

Config.Markers      = {
    Strawberry_Club_Entrance            = {
        Hint   = 'Press ~INPUT_CONTEXT~ to enter the club',
        Source = {
            x = -121.16,
            y = -1258.5,
            z = 29.31
        },
        Target = {
            x = -1569.6,
            y = -3017.39,
            z = -74.41
        },
    },
    Strawberry_Club_Exit                = {
        Hint   = 'Press ~INPUT_CONTEXT~ to exit the club',
        Source = {
            x = -1569.6,
            y = -3017.39,
            z = -74.41
        },
        Target = {
            x = -121.16,
            y = -1258.5,
            z = 29.31
        }
    },
    Strawberry_Club_Coat_Check_Entrance = {
        Hint   = 'Press ~INPUT_CONTEXT~ to go to the coat check',
        Source = {
            x = -1581.63,
            y = -3006.45,
            z = -76.0
        },
        Target = {
            x = -1572.83,
            y = -3014.53,
            z = -74.41
        }
    },
    Strawberry_Club_Coat_Check_Exit     = {
        Hint   = 'Press ~INPUT_CONTEXT~ to go back into the club',
        Source = {
            x = -1572.83,
            y = -3014.53,
            z = -74.41
        },
        Target = {
            x = -1581.63,
            y = -3006.45,
            z = -76.0
        },
    }
}