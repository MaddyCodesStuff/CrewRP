local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local inMarker
local closeMarkers = {}

ESX                             = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

--Grabs the ID of the PED on the ground immediately in front of the player
function GetPedInFront()
    local plyPed = GetPlayerPed(-1)
    local plyPos = GetEntityCoords(plyPed, false)
    plyPos = plyPos - vector3(0, 0, 1)
    local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
    local rayHandle = CastRayPointToPoint(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 8, plyPed, 4)
    local _, _, _, _, ped = GetRaycastResult(rayHandle)
    return ped
end

--Allows the player to slaughter the animal and checks if the animal is dead
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(0, Keys['E']) then
            local corpse = GetPedInFront() --Grabs the dead PED
            local animal = GetPedType(corpse) --Grabs the PEDS Type

            if corpse and animal == 28 then
                local AnimalHealth = GetEntityHealth(corpse) --Grabs the PEDS Health
                local cod = GetPedCauseOfDeath(corpse)

                if AnimalHealth <= 0 and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_KNIFE') then
                    local permittedWeapon = false
                    for _, weapon in ipairs(Config.PermittedWeapons) do
                        if weapon == cod then
                            permittedWeapon = true
                            SlaughterAnimal(corpse)
                            break
                        end
                        if not permittedWeapon then
                            ESX.ShowNotification('You did not find any usable materials.')
                        end
                    end
                else
                    ESX.ShowNotification('You need to use a knife!')
                end
            end
        end
    end
end)

--Draw the sell and bait points & Make Interactable the Sell Point and Bait and initialize animal models
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local pCoords = GetEntityCoords(GetPlayerPed(-1))
        inMarker = nil
        closeMarkers = {}

        for markerName, marker in pairs(Config.markers) do
            if #(pCoords - vector3(marker.x, marker.y, marker.z)) < 20.0 then
                table.insert(closeMarkers, vector3(marker.x, marker.y, marker.z))
                if #(pCoords - vector3(marker.x, marker.y, marker.z)) < 1.5 then
                    inMarker = markerName
                end
            end
        end
    end
end)

-- Draw markers
Citizen.CreateThread(function()
    while true do
        for _, marker in ipairs(closeMarkers) do
            DrawMarker(25, marker.x, marker.y, marker.z, 0, 0, 0, 0, 180.0, 0, 1.5, 1.5, 1.5, 102, 217, 239, 150, false, true)
        end
        Wait(0)
    end
end)

-- Handle marker interaction
Citizen.CreateThread(function()
    while true do
        if inMarker ~= nil then
            if inMarker == "sell" then
                ESX.ShowHelpNotification("Press E to Sell Meat and Leather")
            end

            if IsControlJustReleased(0, Keys['E']) then
                if inMarker == 'sell' then
                    TriggerServerEvent('tcrp-hunting:sell')
                    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", false, 0, true)
                end
                Wait(2500)
            end
        end
        Wait(10)
    end
end)

function SlaughterAnimal(corpse)
    exports['mythic_progbar']:Progress({
        name            = "skinning_action",
        duration        = 10000,
        label           = "Skinning",
        useWhileDead    = false,
        canCancel       = false,
        controlDisables = {
            disableMovement    = true,
            disableCarMovement = true,
            disableMouse       = false,
            disableCombat      = true,
        },
        animation       = {
            animDict = 'amb@medic@standing@kneel@idle_a',
            anim = 'idle_a',
        },
    }, function(status)
        local playerCoords = GetEntityCoords(GetPlayerPed(-1))
        DeleteEntity(corpse)
        ESX.ShowNotification('You slaughtered the animal.')
        TriggerServerEvent('tcrp-hunting:reward', playerCoords)
    end)
end
