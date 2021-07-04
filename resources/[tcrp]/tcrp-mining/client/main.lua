Keys               = {
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

ESX                = nil
local PlayerData   = {}

local spawnedNodes = 0
local mineralNodes = {}
local minedNodes   = 0
local isMining     = false
isSmelting         = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while not ESX.PlayerData do
        ESX.PlayerData = ESX.GetPlayerData()
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(mineralNodes) do
            ESX.Game.DeleteObject(v)
        end
    end
end)

for _, v in ipairs(Config.Blips) do
	if v.onMap then
		local blip = AddBlipForCoord(v.pos)
		SetBlipSprite (blip, v.blip)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, v.colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.Text)
		EndTextCommandSetBlipName(blip)
	end
end

-- Smelter
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = Config.Smelting.coords
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
        local dist = #(pedCoords - coords)

        if dist < 50.0 then
            DrawMarker(27, Config.Smelting.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 255, 255, 0, 100, false, true, 2, false, false, false, false)
        end
        if dist < 2.0 then
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to smelt ore.")
            if IsControlJustReleased(0, Keys['E']) then
                if not isSmelting then
                    ESX.TriggerServerCallback('mining:checkItem', function(hasItem)
                        if hasItem then
                            isSmelting = true
                            exports['mythic_progbar']:Progress({
                                                                   name            = "smelting_action",
                                                                   duration        = 10000,
                                                                   label           = "Smelting",
                                                                   useWhileDead    = false,
                                                                   canCancel       = false,
                                                                   controlDisables = {
                                                                       disableMovement    = true,
                                                                       disableCarMovement = true,
                                                                       disableMouse       = false,
                                                                       disableCombat      = true,
                                                                   },
                                                                   animation       = {
                                                                       animDict = "misscarsteal4@vendor",
                                                                       anim     = "idle_b_vendor",
                                                                       flags    = 49,
                                                                   },
                                                                   prop            = {
                                                                       -- model = "prop_tool_pickaxe",
                                                                   }
                                                               }, function(status)
                                if not status then
                                    
                                    -- Do the random logic here to generate random minerals from the smelting
                                    TriggerServerEvent('mining:smelt')
                                end
                            end)
                            isSmelting = false
                        else
                            ESX.ShowNotification("Not enough " .. Config.Smelting.label)
                        end
                    end, Config.Smelting.item)
                end
            end
        end
    end
end)

--Mining Ore
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local nearbyObject, nearbyID

        for i = 1, #mineralNodes, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(mineralNodes[i]), false) < 1 then
                nearbyObject, nearbyID = mineralNodes[i], i
            end
        end

        if nearbyObject and IsPedOnFoot(playerPed) then

            if not isMining then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to mine.")
            end

            if IsControlJustReleased(0, Keys['E']) and not isMining then
                isMining = true
                ESX.TriggerServerCallback('mining:checkItem', function(hasItem)
                    if hasItem then
                        exports['mythic_progbar']:Progress({
                                                                name            = "mining_action",
                                                                duration        = 10000,
                                                                label           = "Mining",
                                                                useWhileDead    = false,
                                                                canCancel       = false,
                                                                controlDisables = {
                                                                    disableMovement    = true,
                                                                    disableCarMovement = true,
                                                                    disableMouse       = false,
                                                                    disableCombat      = true,
                                                                },
                                                                animation       = {
                                                                    task     = 'WORLD_HUMAN_CONST_DRILL',
                                                                    animDict = "amb@world_human_hammering@male@base",
                                                                    anim     = "base",
                                                                    flags    = 49,
                                                                },
                                                                prop            = {
                                                                    -- model = "prop_tool_pickaxe",
                                                                }
                                                            }, function(status)
                            if not status then

                                minedNodes = minedNodes + 1
                                ESX.Game.DeleteObject(nearbyObject)
                                table.remove(mineralNodes, nearbyID)
                                spawnedNodes = spawnedNodes - 1

                                -- Do the random logic here to generate random minerals from this node
                                TriggerServerEvent('mining:giveItems')
                            end
                        end)
                        isMining = false
                    else
                        ESX.ShowNotification("Missing item: Jackhammer")
                        isMining = false
                    end
                end, 'jackhammer')
            end
        else
            Citizen.Wait(10)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local dist = #(pedCoords - Config.Sell.pos)
        if dist < 50.0 then
            DrawMarker(25, Config.Sell.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
            if dist < 3.0 then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to Sell Minerals.")
                if IsControlJustReleased(0, Keys['E']) then
                    TriggerServerEvent('mining:startSelling')
                end
            end
        end
    end
end)

function checkInventoryItem(itemName)
    for k, v in ipairs(ESX.PlayerData.inventory) do
        if v.name == itemName then
            if v.count > 0 then
                return true
            end
        end
    end

    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = Config.Mine.coords
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
        local dist = #(pedCoords - coords)

        if dist < 100 then
            spawnNodes()
            Citizen.Wait(500)
        else
            Citizen.Wait(500)
        end
    end
end)

function spawnNodes()
    local prop
    while spawnedNodes < Config.MaxNodesSpawned do
        Citizen.Wait(0)
        local nodeCoords = Config.Node
            prop = Config.NodeModel
        for k, v in pairs(nodeCoords) do   
            ESX.Game.SpawnLocalObject(prop, v, function(obj)
                PlaceObjectOnGroundProperly(obj)
                FreezeEntityPosition(obj, true)

                table.insert(mineralNodes, obj)

                spawnedNodes = spawnedNodes + 1
            end)
            Citizen.Wait(100)
        end
    end
end
