-- more emotes available at https://pastebin.com/6mrYTdQv
local emotes       = {
    ['smoke']       = "WORLD_HUMAN_SMOKING",
    ['cop']         = "WORLD_HUMAN_COP_IDLES",
    ['lean']        = "WORLD_HUMAN_LEANING",
    ['sit']         = "WORLD_HUMAN_PICNIC",
    ['stupor']      = "WORLD_HUMAN_STUPOR",
    ['sunbathe2']   = "WORLD_HUMAN_SUNBATHE_BACK",
    ['sunbathe']    = "WORLD_HUMAN_SUNBATHE",
    ['medic']       = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
    ['clipboard']   = "WORLD_HUMAN_CLIPBOARD",
    ['party']       = "WORLD_HUMAN_PARTYING",
    ['kneel']       = "CODE_HUMAN_MEDIC_KNEEL",
    ['notepad']     = "CODE_HUMAN_MEDIC_TIME_OF_DEATH",
    ['weed']        = "WORLD_HUMAN_SMOKING_POT",
    ['impatient']   = "WORLD_HUMAN_STAND_IMPATIENT",
    ['fish']        = "WORLD_HUMAN_STAND_FISHING",
    ['weld']        = "WORLD_HUMAN_WELDING",
    ['photography'] = "WORLD_HUMAN_PAPARAZZI",
    ['film']        = "WORLD_HUMAN_MOBILE_FILM_SHOCKING",
    ['cheer']       = "WORLD_HUMAN_CHEERING",
    ['binoculars']  = "WORLD_HUMAN_BINOCULARS",
    ['flex']        = "WORLD_HUMAN_MUSCLE_FLEX",
    ['weights']     = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
    ['yoga']        = "WORLD_HUMAN_YOGA",
    ['sitc']        = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER",
}
-- this is an area for customizing messages
local msgTemplates = {
    ['prefix']             = '<b><span style="color:rgb(255,0,0)">EMOTES</span>:</b> ',
    ['displayEmotes']      = '<br>{0}',
    ['playingEmote']       = 'Playing the emote ^3{0}^0',
    ['errorPrefix']        = '<b><span style="color:rgb(255,0,0)">ERROR</span>:</b> ',
    ['errorInVehicle']     = 'You must leave the vehicle first',
    ['errorInvalidName']   = 'Invalid emote name',
    ['errorDisplayEmotes'] = '^7Use \"^3/emotes^7\" to display all of the emotes',
}

--[[------------------------------------------------------------------------------------------------

					DON'T TOUCH BELOW THIS UNLESS YOU KNOW WHAT YOU ARE DOING

------------------------------------------------------------------------------------------------]]--

function message(templates, args)
    local total = ''
    for _, n in ipairs(templates) do
        total = total .. msgTemplates[n]
    end
    TriggerEvent('chat:addMessage', {
        template = total,
        args     = args or {}
    })
end

local emotePlaying = IsPedActiveInScenario(GetPlayerPed(-1)) -- Registering whether or not the player is in an active scenario

function playEmote(emoteName)
    -- Plays an emote from the given name dictionary
    if not DoesEntityExist(GetPlayerPed(-1)) then
        -- Return of the ped doesn't exist
        return false
    end

    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        -- Returns if the player is in any vehicle
        message({ 'errorPrefix', 'errorInVehicle' })
        return false
    end

    if IsPedArmed(GetPlayerPed(-1), 7) then
        -- If the player is holding weapon, remove it
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_UNARMED'), true)
    end

    local ped = GetPlayerPed(-1)
    if emoteName == "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" then
        -- special case, sit in a chair
        local x, y, z = table.unpack(GetEntityCoords(ped, true))
        TaskStartScenarioAtPosition(ped, emoteName, x, y, z - 1, GetEntityHeading(ped), 0, 0, false)
    else
        TaskStartScenarioInPlace(ped, emoteName, 0, true)
    end

    emotePlaying = true
    return true
end

Citizen.CreateThread(function()
    while true do

        if emotePlaying then
            if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0,
                                                                                                                  35)) then
                -- Cancels the emote if the player is moving
                ClearPedTasks(GetPlayerPed(-1))
                emotePlaying = false
            end
        end

        Citizen.Wait(0)
    end
end)

--RegisterCommand('e', function(source, args, raw)
--	if #args > 0 then -- if supplied atleast 1 argument
--		local name = args[1]
--		if emotes[name] ~= nil then -- Checking if the name is in the dictionary
--			playEmote(emotes[name])
--		else
--			message({'errorPrefix', 'errorInvalidName'}) -- Saying if the name wasn't in the dictionary
--		end
--	else
--		message({'errorPrefix', 'errorDisplayEmotes'}) -- showing a message to display emotes
--	end
--end)
--TriggerEvent('chat:addSuggestion', '/e', 'Plays an emote', {
--	{name = 'name', help = 'The emote name to play'}
--})

RegisterCommand('emotes', function(source, args, raw)
    local index   = 0 -- Current index
    local display = "^7" -- Text to display

    for name, value in pairs(emotes) do
        -- Adding the emote names to the display var
        index = index + 1
        if index == 1 then
            display = display .. name
        else
            display = display .. ", " .. name
        end
    end

    message({ 'prefix', 'displayEmotes' }, { display })
end)
TriggerEvent('chat:addSuggestion', '/emotes', 'Displays possible emotes')

RegisterCommand('ce', function(source, args, raw)
    if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
        ClearPedTasksImmediately(GetPlayerPed(-1))
        emotePlaying = false
    end
end)
TriggerEvent('chat:addSuggestion', '/ce', 'Immediately cancels your current emote')
