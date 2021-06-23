Config                      = {}
Config.Locale               = 'en'

Config.MarkerType           = -1
Config.DrawDistance         = 10.0
Config.MarkerSize           = { x = 2.0, y = 2.0, z = 1.0 }
Config.MarkerColor          = { r = 102, g = 102, b = 204 }

Config.BlipPlasticSurgery   = {
    Sprite  = 403,
    Color   = 0,
    Display = 2,
    Scale   = 1.0
}

Config.Price                = 0 -- Edit to your liking.

Config.EnableUnemployedOnly = false -- If true it will only show Blips to Unemployed Players | false shows it to Everyone.
Config.EnableBlips          = false -- If true then it will show blips | false does the Opposite.
Config.EnablePeds           = false -- If true then it will add Peds on Markers | false does the Opposite.

Config.Locations            = {
    --{ x = 402.85, y = -998.4, z = -100.0, heading = 180.0 }, -- Police Booking Room
    { x = 106.64, y =-1302.3, z = 28.9, heading = 252.76},
    { x = 1825.03, y = 3682.7, z = 33.29, heading = 328.06 } -- Hospital Bottom Floor
}

Config.Zones                = {}

for i = 1, #Config.Locations, 1 do
    Config.Zones['Shop_' .. i] = {
        Pos   = Config.Locations[i],
        Size  = Config.MarkerSize,
        Color = Config.MarkerColor,
        Type  = Config.MarkerType
    }
end
