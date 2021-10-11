Config               = {}

-- Turn this to false if you want everyone to use this.
Config.OnlyPolicemen = true

-- This is how much ammo you should get per weapon you take out.
Config.ReceiveAmmo   = 0

-- You don't need to edit these if you don't want to.
Config.Armory        = { ["x"] = 479.20, ["y"] = -996.68, ["z"] = 30.69, ["h"] = 270.0 }
Config.ArmoryPed     = { ["x"] = 480.36, ["y"] = -996.62, ["z"] = 30.69, ["h"] = 90.0, ["hash"] = "s_m_y_cop_01" }

-- This is the available weapons you can pick out.
Config.ArmoryWeapons = {
    {
        ["hash"] = "weapon_taser",
        ["type"] = "pistol"
    },
    {
        ["hash"] = "weapon_flashlight",
        ["type"] = "pistol"
    },
    {
        ["hash"] = "weapon_nightstick",
        ["type"] = "pistol"
    },
    {
        ["hash"] = "weapon_pdpistol",
        ["type"] = "pistol",
    },
    {
        ["hash"] = "weapon_pdshotgun",
        ["type"] = "rifle",
    },  
    {
        ["hash"] = "weapon_pdsmg",
        ["type"] = "rifle",
    },  
    {
        ["hash"] = "weapon_pdrifle",
        ["type"] = "rifle",
    },  
    {
        ["hash"] = "weapon_pdcarbine",
        ["type"] = "rifle",
    },  
}

