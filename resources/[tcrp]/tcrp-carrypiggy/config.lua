Config = {}

Config.ActionDetails = {
    carry = {
        pos = {
            x = 0.0,
            y = 0.50,
            z = 0.63,
        },
        rot = {
            x = 45.0,
            y = -15.0,
            z = -75.0,
        },
        fixed = true,
        disableSprint = true,
    },
    carry2 = {
        pos = {
            x = 0.25,
            y = 0.0,
            z = 0.67,
        },
        rot = {
            x = 10.0,
            y = 0.5,
            z = 0.0,
        },
        fixed = false,
        disableSprint = true,
    },
    carryanimal = {
        pos = {
            x = 0.15,
            y = 0.0,
            z = 0.67,
        },
        rot = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
        fixed = false,
        disableSprint = false,
    },
    piggyback = {
        pos = {
            x = -0.07,
            y = -0.10,
            z = 0.45,
        },
        rot = {
            x = 0.5,
            y = 0.5,
            z = 0.0,
        },
        fixed = false,
    },
    piggyback2 = {
        pos = {
            x = 0.0,
            y = -0.15,
            z = 1.25,
        },
        rot = {
            x = 0.5,
            y = 0.5,
            z = 0.0,
        },
        fixed = false,
        disableSprint = true,
    },
    piggyback3 = {
        pos = {
            x = 0.0,
            y = -0.38,
            z = 0.78,
        },
        rot = {
            x = 7.5,
            y = 0.0,
            z = 0.0,
        },
        fixed = true,
    },
}

Config.ActionEmotes = {
    carry = {
        source = 'carry2',
        target = 'sitchairside',
    },
    carry2 = {
        source = 'carry',
        target = 'carried',
    },
    carryanimal = {
        source = 'carry',
        target = nil,
    },
    piggyback = {
        source = 'piggyback',
        target = 'piggybacked',
    },
    piggyback2 = {
        source = 'surrender3',
        target = 'sit5',
    },
    piggyback3 = {
        source = 'wait',
        target = 'sit5',
    },
}