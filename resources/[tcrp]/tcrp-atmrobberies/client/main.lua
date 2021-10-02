ESX = nil
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if ESX ~= nil then
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local Keys = {
	["1"] = 185, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["E"] = 38, ["X"] = 73, ["F"] = 23, ["Z"] = 20,
}

local isNearATM = false
local isPolice = false 
local hasUSB = false
local playerGender

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
        if isNearATM and hasUSB then
            local ped = PlayerPedId()
            local hackerCoords = GetEntityCoords(ped)
            local street = GetStreetNameAtCoord(hackerCoords.x, hackerCoords.y, hackerCoords.z)
            local streetName = GetStreetNameFromHashKey(street)

            DisplayHelpText('Press Z to Hack ATM')
            
            if IsControlJustPressed(0, Keys['Z']) and IsPedOnFoot(ped) and not IsEntityDead(ped) then
                GetGender()
                TriggerEvent('mythic_notify:client:SendErrorAlert', { text = "Press F to Cancel the Hack"})
                TriggerServerEvent('tcrp-ATMRobbery:notifyPD', hackerCoords, streetName, playerGender)
                exports['mythic_progbar']:Progress({
                    name            = "hack_atm",
                    duration        = 60000,
                    label           = "Connecting PI to ATM, Installing Virus",
                    useWhileDead    = false,
                    canCancel       = true,
                    controlDisables = {
                        disableMovement    = true,
                        disableCarMovement = true,
                        disableMouse       = false,
                        disableCombat      = true,
                    },
                    animation       = {
                        animDict = "anim@heists@prison_heiststation@cop_reactions",
                        anim     = "cop_b_idle",
                    },
                }, function(status)
                    if IsControlJustPressed(0, 23) then
                        TriggerEvent('mythic_notify:client:SendErrorAlert', { text = "Hacking Cancelled"}) 
                    else 
                        TriggerServerEvent('tcrp-ATMRobbery:startHack', hackerCoords)
                    end
                end)
            end 
        end              		
    end
end)

Citizen.CreateThread(function()
    while true do
        local obj = rayCast(16, vector3(1.0, 1.0, 0))
        isNearATM = nil
        if obj ~= 0 then
            local model = GetEntityModel(obj)
            for _, hash in ipairs(Config.atmHashes) do
                if hash == model then
                    isNearATM = obj
                    TriggerServerEvent('tcrp-ATMRobbery:checkUSB')
                    break
                end
            end
        end
        Wait(3000)
    end
end)

RegisterNetEvent('tcrp-ATMRobbery:startHack')
AddEventHandler('tcrp-ATMRobbery:startHack', function(hackerCoords)
    TriggerEvent('mhacking:show')
    TriggerEvent('mhacking:start', 6, 25, function(success, _) -- this is where you change how hard the hack is 
        TriggerServerEvent('tcrp-ATMRobbery:hacked', success, hackerCoords)
        TriggerEvent('mhacking:hide')
        TriggerEvent('emote:cancel')
    end)
end)

RegisterNetEvent('tcrp-ATMRobbery:trueUSB')
AddEventHandler('tcrp-ATMRobbery:trueUSB', function(state)
    hasUSB = state
end)

function rayCast(flag, offset)
    local plyPed = PlayerPedId()
    local coords = GetEntityCoords(plyPed)
    local castTo = GetOffsetFromEntityInWorldCoords(plyPed, offset)
    local cast = StartShapeTestCapsule(coords, castTo, 0.8, flag, plyPed, 0)
    local castDone, obj

    while castDone ~= 0 and castDone ~= 2 do
        castDone, _, _, _, obj = GetShapeTestResult(cast)
        Wait(1)
    end
    return obj
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function GetGender()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local Gender = 0
        Gender = skin.sex
        if Gender == 0 then
            playerGender = 'Male'
        else
            playerGender = 'Female'
        end
    end)
end