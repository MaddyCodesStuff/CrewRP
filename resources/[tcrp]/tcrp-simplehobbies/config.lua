Config = {}

Config.fuelPrice = 50

Config.clothesPrice = 50

Config.pearlPrice = 75

Config.Processing = {
    {
        pos = vec3(1649.91, -1858.33, 108.05), 
        type = 'Gather Oil',
        Text = "Hobby - Fuel-Gather Oil",
        blip = 415,
        colour = 69,
        onMap = true
    },
    {
        pos = vec3(305.25, -2734.30, 5.10),
        type = 'Refine Oil', 
        Text = "Hobby - Fuel-Refine Oil",
        blip = 415,
        colour = 69,
        onMap = true
    },
    {
        pos = vec3(148.09, -2391.45, 5.00), 
        type = 'Sell Essence',
        Text = "Hobby - Fuel-Sell Essence",
        blip = 415,
        colour = 69,
        onMap = true
    },
    {
        pos = vec3(2055.79, 4927.90, 20.00), 
        type = 'Gather Wool',
        Text = "Hobby - Tailor-Wool",
        blip = 73,
        colour = 36,
        onMap = true
    },
    {
        pos = vec3(712.09, -973.92, 29.50), 
        type = 'Refine Wool',
        Text = "Hobby - Tailor-Refine",
        blip = 73,
        colour = 36,
        onMap = true
    },
    {
        pos = vec3(716.28, -962.43, 29.50), 
        type = 'Refine Fabric',
        Text = "Hobby - Tailor-Refine Fabric",
        blip = 73,
        colour = 36,
        onMap = false
    },
    {
        pos = vec3(451.29, -801.77, 26.60), 
        type = 'Sell Clothes',
        Text = "Hobby - Tailor-Sell Clothes",
        blip = 73,
        colour = 36,
        onMap = true
    },
    {
        pos = vec3(-2488.29, -735.61, -100.00), 
        type = 'Gather Pearls',
        Text = "Hobby - Gather Pearls",
        blip = 267,
        colour = 46,
        onMap = true
    },
    {
        pos = vec3(-622.65, -230.05, 37.07), 
        type = 'Sell Pearls',
        Text = "Hobby - Sell Pearls",
        blip = 73,
        colour = 36,
        onMap = false
    },
    
}

Config.MaxNodesSpawned  = 25 -- Maximum number of nodes that spawn at a time

Config.NodeModel        = 'prop_creosote_b_01'

Config.Node             = {
    coords = vector3(2055.79, 4927.90, 40.96)
}

Config.PearlNodeModel        = 'prop_poolball_cue'

Config.PearlNode             = {
    coords = vector3(-2488.29, -735.61, -45.40)
}