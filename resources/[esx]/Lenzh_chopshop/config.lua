Config                          = {} -- DON'T TOUCH

Config.DrawDistance             = 100.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips              = false -- Set to false to disable blips.
Config.MarkerType               = 27    -- Change to -1 to disable marker.
Config.MarkerColor              = { r = 255, g = 0, b = 0 } -- Change the marker color.

Config.Locale                   = 'en' -- Change the language. Currently available (en or fr).
Config.CooldownMinutes          = 15 -- Minutes between chopping.

Config.CallCops                 = true -- Set to true if you want cops to be alerted when chopping is in progress
Config.CallCopsPercent          = 2 -- (min1) if 1 then cops will be called every time=100%, 2=50%, 3=33%, 4=25%, 5=20%.
Config.CopsRequired             = 1

Config.NPCEnable                = true -- Set to false to disable NPC Ped at shop location.
Config.NPCHash                  = 68070371 --Hash of the npc ped. Change only if you know what you are doing.
Config.NPCShop                  = { x = -55.42, y = 6392.8, z = 30.5, h = 46.0 } -- Location of the shop For the npc.

Config.GiveBlack                = false -- Wanna use Blackmoney?

-- Change the time it takes to open door then to break them.
-- Time in Seconde. 1000 = 1 seconde
Config.DoorOpenFrontLeftTime    = 5000
Config.DoorBrokenFrontLeftTime  = 5000
Config.DoorOpenFrontRightTime   = 5000
Config.DoorBrokenFrontRightTime = 5000
Config.DoorOpenRearLeftTime     = 5000
Config.DoorBrokenRearLeftTime   = 5000
Config.DoorOpenRearRightTime    = 5000
Config.DoorBrokenRearRightTime  = 5000
Config.DoorOpenHoodTime         = 5000
Config.DoorBrokenHoodTime       = 5000
Config.DoorOpenTrunkTime        = 5000
Config.DoorBrokenTrunkTime      = 5000
Config.DeletingVehicleTime      = 5000

Config.Zones                    = {
    Chopshop1 = { coords = vector3(-522.87, -1713.99,
                                   18.33), name = _U('map_blip'), color = 49, sprite = 225, radius = 100.0, Pos = { x = -522.87, y = -1713.99, z = 18.33 }, Size = { x = 5.0, y = 5.0, z = 0.5 }, locationName = "La Puerta", },
    Chopshop2 = { coords = vector3(60.02, 3717.86,
                                   38.57), name = _U('map_blip'), color = 49, sprite = 225, radius = 100.0, Pos = { x = 60.02, y = 3717.86, z = 38.57 }, Size = { x = 5.0, y = 5.0, z = 0.5 }, locationName = "Stab City", },
    Chopshop3 = { coords = vector3(1659.49, 4958.83,
                                   41.52), name = _U('map_blip'), color = 49, sprite = 225, radius = 100.0, Pos = { x = 1659.49, y = 4958.83, z = 41.52 }, Size = { x = 5.0, y = 5.0, z = 0.5 }, locationName = "Grapeseed", },
    Chopshop4 = { coords = vector3(-211.04, -1358.12,
                                   31.26), name = _U('map_blip'), color = 49, sprite = 225, radius = 100.0, Pos = { x = -211.04, y = -1358.12, z = 31.26 }, Size = { x = 5.0, y = 5.0, z = 0.5 }, locationName = "Innocence", },
    Chopshop5 = { coords = vector3(-1172.12, -2034.65,
                                   13.56), name = _U('map_blip'), color = 49, sprite = 225, radius = 100.0, Pos = { x = -1172.12, y = -2034.65, z = 13.56 }, Size = { x = 5.0, y = 5.0, z = 0.5 }, locationName = "Greenwich Pkwy", },
    Chopshop6 = { coords = vector3(464.73, -1315.15,
                                   29.23), name = _U('map_blip'), color = 49, sprite = 225, radius = 100.0, Pos = { x = 464.73, y = -1315.15, z = 29.23 }, Size = { x = 5.0, y = 5.0, z = 0.5 }, locationName = "Little Bighorn", },
    Chopshop7 = { coords = vector3(1010.52, -114.63,
                                   73.92, name = _U('map_blip'), color = 49, sprite = 225, radius = 100.0, Pos = { x = 1010.52, y = -114.63, z = 73.92 }, Size = { x = 5.0, y = 5.0, z = 0.5 }, locationName = "Mirror Park Blvd", },                                                        
    Shop      = { coords = vector3(-55.42, 6392.8,
                                   30.5), name = _U('map_blip_shop'), color = 50, sprite = 120, radius = 25.0, Pos = { x = -55.42, y = 6392.8, z = 30.5 }, Size = { x = 3.0, y = 3.0, z = 1.0 }, },
}

Config.Items                    = {
    "electronics",
    "metal",
    "plastic",
    "battery",
    "lowradio",
    "stockrim",
    "airbag",
    "highradio",
    "highrim"
}

Config.Itemsprice               = {
    battery   = 150,
    lowradio  = 100,
    highradio = 200,
    stockrim  = 125,
    highrim   = 175,
    airbag    = 110,
    plastic   = 5
}

Config.Itemschance              = {
    battery     = 1,
    lowradio    = 1,
    highradio   = 1,
    stockrim    = 4,
    highrim     = 4,
    airbag      = 2,
    electronics = 5,
    metal       = 25,
    plastic     = 10,
} 