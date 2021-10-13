Keys             = {
    ["ESC"]       = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"]         = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"]       = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"]      = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"]  = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
}

ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

-- --[ Stuff for testing. Remove this in production ]--
-- Citizen.CreateThread(function() 
-- 	while true do
-- 		Citizen.Wait(0)

-- 		if IsControlJustPressed(0, Keys['E']) then
-- 			math.randomseed(GetGameTimer())
-- 			xp = math.random(1,50)

-- 			TriggerServerEvent('esx_proficiencies:giveXP',xp, 'mining')
-- 		end

-- 		if IsControlJustPressed(0, Keys['R']) then
-- 			math.randomseed(GetGameTimer())
-- 			xp = math.random(1,50)

-- 			TriggerServerEvent('esx_proficiencies:giveXP',xp, 'winemaking')
-- 		end

-- 		if IsControlJustPressed(0, Keys['T']) then
-- 			math.randomseed(GetGameTimer())
-- 			xp = math.random(1,50)

-- 			TriggerServerEvent('esx_proficiencies:giveXP',xp, 'cooking')
-- 		end
-- 	end
-- end)