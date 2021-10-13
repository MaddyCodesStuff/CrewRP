local Keys             = {
    ["ESC"]       = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"]         = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"]       = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"]      = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"]  = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"]      = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"]    = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local hintIsShowed     = false

local isInMarker       = false
local isInPublicMarker = false

local hintToDisplay    = "no hint to display"

ESX                    = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    if Config.Blip ~= nil then
        local blip = AddBlipForCoord(Config.Blip.x, Config.Blip.y, Config.Blip.z - Config.MarkerOffset)
        SetBlipSprite(blip, Config.Blip.Sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, Config.Blip.Color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip.Name)
        EndTextCommandSetBlipName(blip)
    end

    while true do
        Citizen.Wait(10)
        local coords   = GetEntityCoords(PlayerPedId())
        local position = nil
        local zone     = nil

        for k, v in pairs(Config.Markers) do
            if (GetDistanceBetweenCoords(coords, v.Source.x, v.Source.y, v.Source.z, true) < Config.DrawDistance) then
                DrawMarker(Config.Type, v.Source.x, v.Source.y, v.Source.z - Config.MarkerOffset, 0.0, 0.0, 0.0, 0.0,
                           0.0, 0.0, Config.Size, Config.Size, Config.Size, 255, 255, 255, 100, false, true, 2, false,
                           false, false, false)
            end

            if (GetDistanceBetweenCoords(coords, v.Source.x, v.Source.y, v.Source.z, true) < Config.Size * 2) then
                isInPublicMarker = true
                position         = v.Target
                zone             = v
                break
            elseif position == nil then
                isInPublicMarker = false
                position         = nil
                zone             = nil
            end
        end

        if IsControlJustReleased(0, Keys['E']) and isInPublicMarker then
            ESX.Game.Teleport(PlayerPedId(), position)
        end

        -- hide or show top left zone hints
        if isInPublicMarker then
            hintToDisplay = zone.Hint
            hintIsShowed  = true
        else
            if not isInMarker then
                hintToDisplay = "no hint to display"
                hintIsShowed  = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if hintIsShowed then
            ESX.ShowHelpNotification(hintToDisplay)
        else
            Citizen.Wait(500)
        end
    end
end)