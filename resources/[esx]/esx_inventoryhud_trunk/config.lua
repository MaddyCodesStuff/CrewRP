local Keys            = {
    ["ESC"]       = 322,
    ["F1"]        = 288,
    ["F2"]        = 289,
    ["F3"]        = 170,
    ["F5"]        = 166,
    ["F6"]        = 167,
    ["F7"]        = 168,
    ["F8"]        = 169,
    ["F9"]        = 56,
    ["F10"]       = 57,
    ["~"]         = 243,
    ["1"]         = 157,
    ["2"]         = 158,
    ["3"]         = 160,
    ["4"]         = 164,
    ["5"]         = 165,
    ["6"]         = 159,
    ["7"]         = 161,
    ["8"]         = 162,
    ["9"]         = 163,
    ["-"]         = 84,
    ["="]         = 83,
    ["BACKSPACE"] = 177,
    ["TAB"]       = 37,
    ["Q"]         = 44,
    ["W"]         = 32,
    ["E"]         = 38,
    ["R"]         = 45,
    ["T"]         = 245,
    ["Y"]         = 246,
    ["U"]         = 303,
    ["P"]         = 199,
    ["["]         = 39,
    ["]"]         = 40,
    ["ENTER"]     = 18,
    ["CAPS"]      = 137,
    ["A"]         = 34,
    ["S"]         = 8,
    ["D"]         = 9,
    ["F"]         = 23,
    ["G"]         = 47,
    ["H"]         = 74,
    ["K"]         = 311,
    ["L"]         = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"]         = 20,
    ["X"]         = 73,
    ["C"]         = 26,
    ["V"]         = 0,
    ["B"]         = 29,
    ["N"]         = 249,
    ["M"]         = 244,
    [","]         = 82,
    ["."]         = 81,
    ["-"]         = 84,
    ["LEFTCTRL"]  = 36,
    ["LEFTALT"]   = 19,
    ["SPACE"]     = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213,
    ["PAGEUP"]    = 10,
    ["PAGEDOWN"]  = 11,
    ["DELETE"]    = 178,
    ["LEFT"]      = 174,
    ["RIGHT"]     = 175,
    ["TOP"]       = 27,
    ["DOWN"]      = 173,
    ["NENTER"]    = 201,
    ["N4"]        = 108,
    ["N5"]        = 60,
    ["N6"]        = 107,
    ["N+"]        = 96,
    ["N-"]        = 97,
    ["N7"]        = 117,
    ["N8"]        = 61,
    ["N9"]        = 118
}

Config                = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice    = true -- If true, police will be able to search players' trunks.

Config.Locale         = "en"

Config.OpenKey        = Keys["G"]

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit          = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight  = 10

Config.localWeight    = {
    acetone       = 3600,
    alive_chicken = 1400,
    apple         = 200,
    banana        = 200,
    bandage       = 200,
    bleach        = 3600,
    bleeder       = 340,
    blowpipe      = 1000,
    blowtorch     = 2000,
    bodyarmor_1   = 2720,
    bodyarmor_2   = 3000,
    bodyarmor_3   = 3250,
    book          = 1400,
    bread         = 200,
    burger        = 3500,
    c4_bank       = 1400,
    cannabis      = 50,
    candy         = 20,
    candy2        = 20,
    candy3        = 20,
    candy4        = 20,
    candy5        = 20,
    cheesebows    = 3,
    chips         = 3,
    chips2        = 3,
    chips3        = 3,
    clay          = 500,
    cocacola      = 3,
    cocaine       = 1000,
    cocaleaf      = 30,
    copper        = 500,
    donut         = 4,
    donut2        = 4,
    egg           = 4,
    diamond       = 500,
    essence       = 3060,
    fabric        = 2,
    fanta         = 3,
    firstaid      = 1500,
    fish          = 900,
    gold          = 500,
    gazbottle     = 1000,
    iron          = 500,
    jewels        = 250,
    marijuana     = 9,
    milk          = 750,
    petrol        = 3600,
    petrol_raffin = 3200,
    raspberry     = 750,
    slushy        = 1810,
    slushy2       = 1810,
    stone         = 1000,
    washed_stone  = 900,
    water         = 750,
    wool          = 6,
    WEAPON_SMG    = 5000,
    meat          = 2000,
    leather       = 1000
}

Config.VehicleLimit   = {
    [0]  = 30000, --Compact
    [1]  = 40000, --Sedan
    [2]  = 70000, --SUV
    [3]  = 25000, --Coupes
    [4]  = 30000, --Muscle
    [5]  = 10000, --Sports Classics
    [6]  = 5000, --Sports
    [7]  = 5000, --Super
    [8]  = 5000, --Motorcycles
    [9]  = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 40000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 300000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate   = {
    taxi      = "TAXI",
    cop       = "LSPD",
    ambulance = "EMS0",
    mecano    = "MECA"
}
