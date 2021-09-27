Config = {}

--Menus
--[[ Default Menu
    Config.MenuName = {
        {type = "", label = ""},
        {type = "", label = ""},
    }
]]
Config.handguns = {
    {type = "weapon_pistol", label = "Pistol"},
    {type = "weapon_snspistol", label = "SnS Pistol"},
    {type = "weapon_vintagepistol", label = "Vintage Pistol"},
    {type = "weapon_combatpistol", label = "Combat Pistol"},
    {type = "weapon_snspistol_mk2", label = "SnS Pistol MK2"},
    {type = "weapon_heavypistol", label = "Heavy Pistol"},
    {type = "weapon_pistol50", label = "Deagle"},
    {type = "weapon_flaregun", label = "Flare Gun"},
    {type = "weapon_stungun", label = "Taser"},
    {type = "ammo_pistol", label = "Box of Pistol Rounds"},
}

Config.general = {
    {type = "lockpick", label = "Lockpick"},
    {type = "blowtorch", label = "Blowtorch"},
    {type = "c4_bank", label = "C4"},
    {type = "moonshine", label = "Moonshine"},
    {type = "weapon_molotov", label = "Molotov"},
    {type = "ammo_pistol", label = "Box of Pistol Rounds"},
    {type = "ammo_shotgun", label = "Box of Shotgun Shells"},
    {type = "ammo_smg", label = "Box of SMG Rounds"},
    {type = "ammo_ar", label = "Box of Assault Rifle Rounds"},
    {type = "parachute", label = "Parachute"},
    {type = "metal", label = "Metal"},
    {type = "bodyarmor_1", label = "Level 1 Body Armor"},
    {type = "bodyarmor_2", label = "Level 2 Body Armor"},
    {type = "bodyarmor_3", label = "Level 3 Body Armor"},
    {type = "repairkit_basic", label = "Roadside Repair Kit"},
    {type = "diamond", label = "Diamond"},
    {type = "golddiamond", label = "Gold Diamond"},
    {type = "silverdiamond", label = "Silver Diamond"},
    {type = "weapon_switchblade", label = "Switchblade"},
    {type = "methlab", label = "Methlab"},
    {type = "mallet", label = "mallet"},
    {type = "grinder", label = "Grinder"},
    {type = "razer", label = "Razer"},
    {type = "pipe_opium", label = "Opium Pipe"},
    {type = "pipe_meth", label = "Meth Pipe"},
    {type = "pipe_weed", label = "Weed Pipe"},
}

Config.medicine = {
    {type = "medikit", label = "MediKit"},
    {type = "medkit", label = "MedKit"},
    {type = "firstaid", label = "FirstAid"},
    {type = "bandage", label = "Bandage"},
    {type = "gauze", label = "Gauze"},
}

Config.electronics = {
    {type = "raspberry", label = "Raspberry Pi"},
    {type = "phone", label = "Cell Phone"},
    {type = "tablet", label = "Tablet"},
    {type = "usb", label = "USB"},
}

--Recipes
--[[ If it doesn't work, probably missing a comma. 
    itemSpawnCode = {
        {item = "", quantity = },
        {item = "", quantity = },
        {item = "", quantity = }
    },
]]
Config.Recipes = {
    weapon_pistol = {
        { item = "metal", quantity = 10 },
        { item = "plastic", quantity = 5 },
        { item = "copper", quantity = 5 }
    },
    lockpick  = {
        { item = "metal", quantity = 10 },
        { item = "plastic", quantity = 2 }
    },
    blowtorch = {
        { item = "blowpipe", quantity = 1 },
        { item = "gazbottle", quantity = 1 },
        { item = "essence", quantity = 2 }
    },
    raspberry = {
        { item = "electronics", quantity = 4 },
        { item = "plastic", quantity = 10 },
        { item = "lithium", quantity = 4 },
		{ item = "gold", quantity = 5 }
    },
    c4_bank   = {
        { item = "electronics", quantity = 7 },
        { item = "clay", quantity = 18 },
        { item = "essence", quantity = 24 },
        { item = "lithium", quantity = 4 },
		{ item = "phone", quantity = 1 }
    },
    moonshine = {
        { item = "water", quantity = 2 },
        { item = "beer_1", quantity = 2 },
        { item = "acetone", quantity = 2 }
    },
	weapon_molotov = {
        { item = "moonshine", quantity = 2 },
        { item = "lighter", quantity = 1 },
        { item = "fabric", quantity = 5 }
    },
	phone = {
        { item = "electronics", quantity = 15 },
        { item = "lithium", quantity = 6 },
        { item = "plastic", quantity = 10 },
		{ item = "metal", quantity = 10 }
    },
	ammo_pistol = {
        { item = "copper", quantity = 15 },
        { item = "metal", quantity = 10 }
    },
	ammo_smg = {
        { item = "copper", quantity = 32 },
        { item = "metal", quantity = 25 }
    },
	ammo_ar = {
        { item = "copper", quantity = 56 },
        { item = "metal", quantity = 33 }
    },
	ammo_shotgun = {
        { item = "copper", quantity = 30 },
        { item = "metal", quantity = 23 }
    },
	parachute = {
        { item = "plastic", quantity = 5 },
        { item = "fabric", quantity = 20 }
    },
    metal = {
        { item = "copper", quantity = 2 },
        { item = "iron", quantity = 1 }
    },
	bodyarmor_1 = {
        { item = "clothe", quantity = 2 },
        { item = "fabric", quantity = 8 },
		{ item = "metal", quantity = 8 }
    },
    bodyarmor_2 = {
        { item = "clothe", quantity = 1 },
        { item = "fabric", quantity = 2 },
		{ item = "metal", quantity = 9 },
		{ item = "bodyarmor_1", quantity = 1 },
    },
	bodyarmor_3 = {
        { item = "clothe", quantity = 1 },
        { item = "fabric", quantity = 5 },
		{ item = "metal", quantity = 10 },
		{ item = "bodyarmor_1", quantity = 1 },
		{ item = "bodyarmor_2", quantity = 1 }
    },
	weapon_snspistol = {
        { item = "plastic", quantity = 10 },
        { item = "iron", quantity = 40 },
		{ item = "metal", quantity = 50 }
    },
	repairkit_basic = {
		{ item = "plastic", quantity = 10 },
		{ item = "airbag", quantity = 1 },
    },
	diamond = {
		{ item = "jewels", quantity = 1 }
    },
	golddiamond = {
        { item = "diamond", quantity = 50 },
        { item = "gold", quantity = 21 },
		{ item = "silverdiamond", quantity = 1 }
    },
	silverdiamond = {
        { item = "bleach", quantity = 1 },
        { item = "acetone", quantity = 1 },
		{ item = "iron", quantity = 22 },
		{ item = "diamond", quantity = 25 }
    },
	weapon_switchblade = {
        { item = "razer", quantity = 1 },
        { item = "plastic", quantity = 4 },
		{ item = "iron", quantity = 12 },
		{ item = "metal", quantity = 3 }
    },
	methlab = {
        { item = "scuba", quantity = 1 },
        { item = "blowtorch", quantity = 1 },
		{ item = "blowpipe", quantity = 3 },
		{ item = "gazbottle", quantity = 3 }
    },
	mallet = {
        { item = "plastic", quantity = 12 },
        { item = "iron", quantity = 22 }
    },
	tablet = {
        { item = "electronics", quantity = 45 },
        { item = "lithium", quantity = 12 },
		{ item = "plastic", quantity = 30 },
		{ item = "metal", quantity = 30 }
    },
	medikit = {
        { item = "gauze", quantity = 22 },
        { item = "bandage", quantity = 5 },
		{ item = "tylenol", quantity = 4 },
		{ item = "morphine", quantity = 1 }
    },
	medkit = {
        { item = "gauze", quantity = 22 },
        { item = "bandage", quantity = 5 },
		{ item = "tylenol", quantity = 4 },
		{ item = "hydrocodone", quantity = 1 }
    },
	firstaid = {
        { item = "gauze", quantity = 22 },
        { item = "bandage", quantity = 5 },
		{ item = "tylenol", quantity = 4 },
		{ item = "vicodin", quantity = 1 }
    },
	grinder = {
        { item = "metal", quantity = 12 },
        { item = "clay", quantity = 8 }
    },
	razer = {
        { item = "metal", quantity = 5 },
        { item = "plastic", quantity = 2 }
    },
	pipe_opium = {
        { item = "blowtorch", quantity = 1 },
        { item = "clay", quantity = 20 }
    },
	pipe_meth = {
        { item = "blowtorch", quantity = 1 },
        { item = "clay", quantity = 25 }
    },
	pipe_weed = {
        { item = "blowtorch", quantity = 1 },
        { item = "clay", quantity = 13 }
    },
    bandage = {
        {item = "fabric", quantity = 1 },
    },
    gauze = {
        {item = "fabric", quantity = 1 },
        {item = "bandage", quantity = 1 }
    },
    usb = {
        { item = "electronics", quantity = 2 },
        { item = "plastic", quantity = 5 }
    },
    --[[weapon_snspistol_mk2 = {
        {item = "", quantity = },
        {item = "", quantity = },
        {item = "", quantity = }
    },
    weapon_vintagepistol = {
        {item = "", quantity = },
        {item = "", quantity = },
        {item = "", quantity = }
    },
    weapon_combatpistol = {
        {item = "", quantity = },
        {item = "", quantity = },
        {item = "", quantity = }
    },
    weapon_heavypistol = {
        {item = "", quantity = },
        {item = "", quantity = },
        {item = "", quantity = }
    },
    weapon_pistol50 = {
        {item = "", quantity = },
        {item = "", quantity = },
        {item = "", quantity = }
    },
    weapon_flaregun = {
        {item = "", quantity = },
        {item = "", quantity = },
        {item = "", quantity = }
    },
    weapon_stungun = {
        {item = "", quantity = },
        {item = "", quantity = },
        {item = "", quantity = }
    },--]]
}

--Stations
--[[
    {
        pos = vec3(x, y, z), 
        type = '', Associates the proper menu table
        Text = "", Appears when player is near the station
    },
]]

Config.Stations = {
    --[[{
        pos = vec3(582.53, -3113.30, 5.08), 
        type = 'handguns',
        Text = "Craft Handguns",
    },
    {
        pos = vec3(1649.91, -1858.33, 108.05), 
        type = 'shotguns',
        Text = "Craft Shotguns",
    },
    {
        pos = vec3(1649.91, -1858.33, 108.05), 
        type = 'automaticRifles',
        Text = "Craft Automatic Rifles",
    },
    {
        pos = vec3(1649.91, -1858.33, 108.05), 
        type = 'longRifles',
        Text = "Craft Long Rifles",
    },
    {
        pos = vec3(1649.91, -1858.33, 108.05), 
        type = 'explosives',
        Text = "Craft Explosives",
    },
    {
        pos = vec3(1649.91, -1858.33, 108.05), 
        type = 'components',
        Text = "Craft Components",
    },
    {
        pos = vec3(1649.91, -1858.33, 108.05), 
        type = 'armor',
        Text = "Craft Armor",
    },]]
    {--Paleto Pharmacy
        pos = vec3(-179.39, -6387.61, 30.51), 
        type = 'medicine',
        Text = "Craft Medicine",
    },
    {--Strawberry Pharmacy
        pos = vec3(297.07, -731.13, 29.35), 
        type = 'medicine',
        Text = "Craft Medicine",
    },
    {--Vespucci Pharmacy
        pos = vec3(321.57, -1078.70, 28.49), 
        type = 'medicine',
        Text = "Craft Medicine",
    },
    { --The main Crafting Station, by Popular St Ammunation
        pos = vec3(798.11, -2135.55, 28.53), 
        type = 'general',
        Text = "Craft General Goods",
    },
    {--Little Seoul Digital Den
        pos = vec3(-661.51, -861.30, 23.50), 
        type = 'electronics',
        Text = "Craft Electronics",
    },
    {--Mirror Park Digital Den
        pos = vec3(-1130.07, -472.45, 66.72), 
        type = 'electronics',
        Text = "Craft Electronics",
    },
    {--Mirror Park Digital Den
        pos = vec3(-623.47, -282.20, 34.59), 
        type = 'electronics',
        Text = "Craft Electronics",
    },
}
