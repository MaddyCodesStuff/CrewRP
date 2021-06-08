Config = {}
Config.Debug = true
Config.TaskTimer = 5 -- Task timer in minutes
Config.ExpireSuspension = 30 -- Expire suspensions older than X days
Config.Licenses = {
    drive = {
        label = "Driver's",
        suspend_points = 7,
        suspend_days = {
            3,
            5,
            7,
            -1,
        }
    },
    weapons = {
        label = "Firearm",
        suspend_points = 1,
        suspend_days = {
            7,
            14,
            -1,
        }
    },
}