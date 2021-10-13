Config                 = {}

Config.Zones           = {
    -- Drug stations
    drug_breakdown_1 = {
        coords               = vector3(1092.9, -3194.79, -38.99),
        range                = 3.0,
        breakdown_item_types = { "drug" },
        label                = "Drug Cutting Station",
    },
    drug_breakdown_2 = {
        coords               = vector3(1391.92, 3605.81, 38.94),
        range                = 3.0,
        breakdown_item_types = { "drug" },
        label                = "Drug Cutting Station",
    },
    drug_breakdown_3 = {
        coords               = vector3(1442.81, -1661.47, 66.13),
        range                = 3.0,
        breakdown_item_types = { "drug" },
        label                = "Drug Cutting Station",
    },
    drug_breakdown_4 = {
        coords               = vector3(1953.65, 5179.14, 47.98),
        range                = 3.0,
        breakdown_item_types = { "drug" },
        label                = "Drug Cutting Station",
    },
    drug_breakdown_5 = {
        coords               = vector3(890.66, -959.09, 39.28),
        range                = 3.0,
        breakdown_item_types = { "drug" },
        label                = "Drug Cutting Station",
    },
    drug_breakdown_6 = {
        coords               = vector3(-332.04, -2445.02, 7.36),
        range                = 3.0,
        breakdown_item_types = { "drug" },
        label                = "Drug Cutting Station",
    },
    drug_breakdown_7 = {
        coords               = vector3(-1367.84, -318.42, 39.52),
        range                = 3.0,
        breakdown_item_types = { "drug" },
        label                = "Drug Cutting Station",
    },
}

Config.BreakdownItems  = {
    drug = {
        -- Weed
        marijuana_ounce   = {
            breaks_into      = "marijuana_quarter",
            count            = 4,
            station_required = false,
        },
        marijuana_quarter = {
            breaks_into      = "marijuana_eighth",
            count            = 2,
            station_required = false,
        },
        marijuana_eighth  = {
            breaks_into      = "marijuana",
            count            = 3,
            station_required = false,
        },
        rolling_papers    = {
            breaks_into      = "rolling_paper",
            count            = 21,
            station_required = false,
        },

        -- Cocaine
        cocaine_ounce     = {
            breaks_into      = "cocaine_quarter",
            count            = 4,
            station_required = true,
        },
        cocaine_quarter   = {
            breaks_into      = "cocaine_eighth",
            count            = 2,
            station_required = true,
        },
        cocaine_eighth    = {
            breaks_into      = "cocaine",
            count            = 3,
            station_required = true,
        },

        -- Opium
        opium_brick       = {
            breaks_into      = "opium_quarter",
            count            = 4,
            station_required = true,
        },
        opium_quarter     = {
            breaks_into      = "opium_eighth",
            count            = 2,
            station_required = true,
        },
        opium_eighth      = {
            breaks_into      = "opium",
            count            = 5,
            station_required = true,
        },

        -- Meth
        meth_sheet        = {
            breaks_into      = "meth_chunk",
            requires         = { "mallet" },
            count            = 4,
            station_required = true,
        },
        meth_chunk        = {
            breaks_into      = "meth",
            requires         = { "mallet" },
            count            = 8,
            station_required = true,
        },

        -- LSD
        lsd_sheet         = {
            breaks_into      = "lsd_half",
            count            = 2,
            station_required = true,
        },
        lsd_half          = {
            breaks_into      = "lsd_quarter",
            count            = 2,
            station_required = true,
        },
        lsd_quarter       = {
            breaks_into      = "lsd",
            count            = 25,
            station_required = true,
        },

        -- Extasy
        extasy_roll       = {
            breaks_into      = "extasy_half",
            count            = 2,
            station_required = true,
        },
        extasy_half       = {
            breaks_into      = "extasy_quarter",
            count            = 2,
            station_required = true,
        },
        extasy_quarter    = {
            breaks_into      = "extasy",
            count            = 4,
            station_required = true,
        },
    },
}

Config.CombinableItems = {
    joint = {
        { item = "marijuana", consume = true, qty = 1 },
        { item = "rolling_paper", consume = true, qty = 1 },
        { item = "grinder", consume = false, qty = 1 },
    },
}