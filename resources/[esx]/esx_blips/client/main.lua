local blips = {}

-- Generate a pseudo-random UUID (stolen from the interwebs)
local function generateUUID()
    local random   = math.random
    local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function(c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

-- Register a blip and set properties
local function addBlip(sprite, size, colour, blip, duration, mapname, fade)
    SetBlipSprite(blip, sprite)
    SetBlipScale(blip, size)
    SetBlipColour(blip, colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(mapname)
    EndTextCommandSetBlipName(blip)
    if pulse then
        PulseBlip(blip)
    end

    expiry          = GetGameTimer() + (duration * 1000)

    local blipUUID  = generateUUID()
    blips[blipUUID] = {
        ["blip"]    = blip,
        ["expiry"]  = expiry,
        ["fade"]    = fade,
        ["opacity"] = 250,
    }
    return blipUUID
end

-- Unregister a blip
local function removeBlip(blipUUID)
    if blips[blipUUID] then
        RemoveBlip(blips[blipUUID]["blip"])
        blips[blipUUID] = nil
    end
end

-- Check for expired blips
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for UUID, blip in pairs(blips) do
            if blip ~= nil then
                local curTime = GetGameTimer()
                if curTime > blip["expiry"] then
                    removeBlip(UUID)
                elseif blip["fade"] then
                    blip["opacity"] = blip["opacity"] - 1
                    SetBlipAlpha(blip["blip"], blip["opacity"])
                end
            end
        end
    end
end)

-- Set a blip on a position
RegisterNetEvent('esx_blips:setBlipOnCoord')
AddEventHandler('esx_blips:setBlipOnCoord', function(pos, duration, colour, pulse, size, sprite, mapname, fade)
    duration = duration or 60 -- (int) Blip duration in seconds
    pulse    = pulse or false -- (boolean) Pulse the blip
    colour   = colour or 1 -- (int) Colour code of blip
    size     = size or 2.0 -- (float) Size of blip
    sprite   = sprite or 161 -- (int) Sprite used for blip
    local blip

    blip     = AddBlipForCoord(pos.x, pos.y, pos.z)
    addBlip(sprite, size, colour, blip, duration, mapname, fade)
end)

-- Set a blip on an entity (ped, vehicle, etc)
RegisterNetEvent('esx_blips:setBlipOnEntity')
AddEventHandler('esx_blips:setBlipOnEntity', function(entity, duration, colour, pulse, size, sprite, mapname, fade)
    duration = duration or 60 -- (int) Blip duration in seconds
    pulse    = pulse or false -- (boolean) Pulse the blip
    colour   = colour or 1 -- (int) Colour code of blip
    size     = size or 2.0 -- (float) Size of blip
    sprite   = sprite or 161 -- (int) Sprite used for blip
    local blip

    blip     = AddBlipForEntity(entity)
    addBlip(sprite, size, colour, blip, duration, mapname, fade)
end)

-- Kill a blip
RegisterNetEvent('esx_blips:killBlip')
AddEventHandler('esx_blips:killBlip', function(blipUUID)
    removeBlip(blipUUID)
end)