local Keys                  = {
    ['ESC']       = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~']         = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB']       = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS']      = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL']  = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME']      = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT']      = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
    ['NENTER']    = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118
}

Config                      = {}
Config.Locale               = 'en'

Config.servername           = 'K - Menu' -- change it to you're server name
Config.doublejob            = false -- enable if you're using esx double job
Config.noclip_speed         = 1.0 -- change it to change the speed in noclip

Config.EnableJsfourIDCard   = true -- enable if you're using jsfour-idcard

-- GENERAL
Config.Menu                 = {
    clavier = Keys['K']
}

Config.handsUP              = {
    clavier = Keys['X']
}

Config.pointing             = {
    clavier = Keys['B']
}

Config.stopAnim             = {
    clavier = Keys['X']
}

Config.crouch               = {
    clavier = Keys['C']
}

--Config.TPMarker = {
--	clavier1 = Keys['LEFTALT'],
--	clavier2 = Keys['E']
--}

-- DPEmotes

Config.SharedEmotesEnabled  = true

-- Set this to true to enable some extra prints
Config.DebugDisplay         = false
-- Set this to false if you have something else on X, and then just use /e c to cancel emotes.
Config.EnableXtoCancel      = true
-- Set this to true if you want to disarm the player when they play an emote.
Config.DisarmPlayer         = false
-- Set this if you really wanna disable emotes in cars, as of 1.7.2 they only play the upper body part if in vehicle
Config.AllowedInCars        = true
-- You can disable the (F3) menu here / change the keybind.
Config.MenuKeybindEnabled   = true
Config.MenuKeybind          = 170 -- Get the button number here https://docs.fivem.net/game-references/controls/
-- You can disable the Favorite emote keybinding here.
Config.FavKeybindEnabled    = false
Config.FavKeybind           = 171 -- Get the button number here https://docs.fivem.net/game-references/controls/
-- You can disable the Ragdoll keybinding here.
Config.RagdollEnabled       = true
Config.RagdollKeybind       = 303 -- Get the button number here https://docs.fivem.net/game-references/controls/
-- You can disable the Facial Expressions menu here.
Config.ExpressionsEnabled   = true
-- You can disable the Walking Styles menu here.
Config.WalkingStylesEnabled = true
-- You can disable the Shared Emotes here.
Config.SharedEmotesEnabled  = true
Config.CheckForUpdates      = true
-- If you have the SQL imported enable this to turn on keybinding.
Config.SqlKeybinding        = true

Config.KeybindKeys          = {
    ['num4'] = 108,
    ['num5'] = 110,
    ['num6'] = 109,
    ['num7'] = 117,
    ['num8'] = 111,
    ['num9'] = 118
}