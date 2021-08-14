cfg                      = {}

-- Settings
cfg.displayBankBlips     = false -- Toggles Bank Blips on the map (Default: true)
cfg.displayAtmBlips      = false -- Toggles ATM blips on the map (Default: false) // THIS IS UGLY. SOME ICONS OVERLAP BECAUSE SOME PLACES HAVE MULTIPLE ATM MACHINES. NOT RECOMMENDED
cfg.enableBankingGui     = true -- Enables the banking GUI (Default: true) // MAY HAVE SOME ISSUES
cfg.addInterest          = true -- Enables interest rates on banking accounts
cfg.interestRate         = 0.75 -- Percentage of interest to increase on banking accounts
cfg.interestOnOffline    = true -- If set to false, then characters who aren't online will not receive bank interest
cfg.interestRateOffline  = 0.0025 -- Percentage of interest to increase for characters who are offline (This should be set low so long returning players dont earn a fortune)
cfg.allowOfflineTransfer = false -- Do you want to allow players to transfer to other players if offline? (NOTE: This could be used to cheat, or to send money to their own personal characters from one another)
cfg.interval             = 60 -- Interval for interest to increase in minutes
cfg.notifyRecipient      = false -- If set to true, whenever you transfer funds to another player, they will receive a notification

-- Map entities
cfg.banks_map_entity     = { "PoI", { blip_id = 108, blip_color = 2, marker_id = 1 } }

-- Banks
cfg.banks                = {
    { 150.266, -1040.203, 29.374 },
    { -1212.980, -330.841, 37.787 },
    { -2962.582, 482.627, 15.703 },
    { -112.202, 6469.295, 31.626 },
    { 314.187, -278.621, 54.170 },
    { -351.534, -49.529, 49.042 },
    { 241.727, 220.706, 106.286 },
}

return cfg