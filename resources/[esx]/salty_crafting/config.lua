Config            = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 3

Config.Recipes    = {
    -- Can be a normal ESX item
    ["lockpick"]  = {
        { item = "metal", quantity = 10, remove = true },
        { item = "plastic", quantity = 2, remove = true }
    },
    ["blowtorch"] = {
        { item = "blowpipe", quantity = 1, remove = true },
        { item = "gazbottle", quantity = 1, remove = true },
        { item = "essence", quantity = 2, remove = true }
    },
    ["raspberry"] = {
        { item = "electronics", quantity = 4, remove = true },
        { item = "plastic", quantity = 10, remove = true },
        { item = "lithium", quantity = 4, remove = true },
		{ item = "gold", quantity = 5, remove = true }
    },
    ["c4_bank"]   = {
        { item = "electronics", quantity = 7, remove = true },
        { item = "clay", quantity = 18, remove = true },
        { item = "essence", quantity = 24, remove = true },
        { item = "lithium", quantity = 4, remove = true },
		{ item = "phone", quantity = 1, remove = true }
    },
    ["moonshine"] = {
        { item = "water", quantity = 2, remove = true },
        { item = "beer_1", quantity = 2, remove = true },
        { item = "acetone", quantity = 2, remove = true }
    },
	["weapon_molotov"] = {
        { item = "moonshine", quantity = 5, remove = true },
        { item = "lighter", quantity = 1, remove = true },
        { item = "fabric", quantity = 10, remove = true }
    },
	["phone"] = {
        { item = "electronics", quantity = 15, remove = true },
        { item = "lithium", quantity = 6, remove = true },
        { item = "plastic", quantity = 10, remove = true },
		{ item = "metal", quantity = 10, remove = true }
    },
	["ammo_pistol"] = {
        { item = "copper", quantity = 15, remove = true },
        { item = "metal", quantity = 10, remove = true }
    },
	["ammo_smg"] = {
        { item = "copper", quantity = 32, remove = true },
        { item = "metal", quantity = 25, remove = true }
    },
	["ammo_ar"] = {
        { item = "copper", quantity = 56, remove = true },
        { item = "metal", quantity = 33, remove = true }
    },
	["ammo_shotgun"] = {
        { item = "copper", quantity = 30, remove = true },
        { item = "metal", quantity = 23, remove = true }
    },
	["parachute"] = {
        { item = "plastic", quantity = 5, remove = true },
        { item = "fabric", quantity = 20, remove = true }
    },
	["bodyarmor_1"] = {
        { item = "clothe", quantity = 2, remove = true },
        { item = "fabric", quantity = 8, remove = true },
		{ item = "metal", quantity = 8, remove = true }
    },
	["bodyarmor_3"] = {
        { item = "clothe", quantity = 1, remove = true },
        { item = "fabric", quantity = 5, remove = true },
		{ item = "metal", quantity = 10, remove = true },
		{ item = "bodyarmor_1", quantity = 1, remove = true },
		{ item = "bodyarmor_2", quantity = 1, remove = true }
    },
	["weapon_snspistol"] = {
        { item = "plastic", quantity = 10, remove = true },
        { item = "iron", quantity = 40, remove = true },
		{ item = "metal", quantity = 50, remove = true }
    },
	["repairkit_basic"] = {
        { item = "stockrim", quantity = 2, remove = true },
        { item = "highrim", quantity = 2, remove = true },
		{ item = "plastic", quantity = 4, remove = true },
		{ item = "airbag", quantity = 1, remove = true }
    },
	["diamond"] = {
		{ item = "jewels", quantity = 1, remove = true }
    },
	["golddiamond"] = {
        { item = "diamond", quantity = 50, remove = true },
        { item = "gold", quantity = 21, remove = true },
		{ item = "silverdiamond", quantity = 1, remove = true }
    },
	["silverdiamond"] = {
        { item = "bleach", quantity = 1, remove = true },
        { item = "acetone", quantity = 1, remove = true },
		{ item = "iron", quantity = 22, remove = true },
		{ item = "diamond", quantity = 25, remove = true }
    },
	["weapon_switchblade"] = {
        { item = "razer", quantity = 1, remove = true },
        { item = "plastic", quantity = 4, remove = true },
		{ item = "iron", quantity = 12, remove = true },
		{ item = "metal", quantity = 3, remove = true }
    },
	["methlab"] = {
        { item = "scuba", quantity = 1, remove = true },
        { item = "blowtorch", quantity = 1, remove = true },
		{ item = "blowpipe", quantity = 3, remove = true },
		{ item = "gazbottle", quantity = 3, remove = true }
    },
	["mallet"] = {
        { item = "plastic", quantity = 12, remove = true },
        { item = "iron", quantity = 22, remove = true }
    },
	["tablet"] = {
        { item = "electronics", quantity = 45, remove = true },
        { item = "lithium", quantity = 12, remove = true },
		{ item = "plastic", quantity = 30, remove = true },
		{ item = "metal", quantity = 30, remove = true }
    },
	["medikit"] = {
        { item = "gauze", quantity = 22, remove = true },
        { item = "bandage", quantity = 5, remove = true },
		{ item = "tylenol", quantity = 4, remove = true },
		{ item = "morphine", quantity = 1, remove = true }
    },
	["medkit"] = {
        { item = "gauze", quantity = 22, remove = true },
        { item = "bandage", quantity = 5, remove = true },
		{ item = "tylenol", quantity = 4, remove = true },
		{ item = "hydrocodone", quantity = 1, remove = true }
    },
	["firstaid"] = {
        { item = "gauze", quantity = 22, remove = true },
        { item = "bandage", quantity = 5, remove = true },
		{ item = "tylenol", quantity = 4, remove = true },
		{ item = "vicodin", quantity = 1, remove = true }
    },
	["grinder"] = {
        { item = "metal", quantity = 12, remove = true },
        { item = "clay", quantity = 8, remove = true }
    },
	["razer"] = {
        { item = "metal", quantity = 5, remove = true },
        { item = "plastic", quantity = 2, remove = true }
    },
	["pipe_opium"] = {
        { item = "blowtorch", quantity = 1, remove = true },
        { item = "clay", quantity = 20, remove = true }
    },
	["pipe_meth"] = {
        { item = "blowtorch", quantity = 1, remove = true },
        { item = "clay", quantity = 25, remove = true }
    },
	["pipe_weed"] = {
        { item = "blowtorch", quantity = 1, remove = true },
        { item = "clay", quantity = 13, remove = true }
    },
}

-- Enable a shop to access the crafting menu
Config.Shop       = {
    useShop         = true,
    shopCoordinates = { x = 747.28, y = -1215.06, z = 24.75 },
    shopName        = "Crafting Station",
    zoneSize        = { x = 2.5, y = 2.5, z = .5 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard   = {
    useKeyboard = false,
    keyCode     = 303
}
