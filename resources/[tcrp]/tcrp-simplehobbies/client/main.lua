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
	["1"] = 185, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["E"] = 38, ["X"] = 73, ["F"] = 23
}

local spawnedNodes = 0
local woolNodes = {}
local gatheredNodes   = 0
local isGathering     = false
local pearlGathering = false
local pSpawnedNodes = 0
local pearlNodes = {}
local pGatheredNodes   = 0
local wSpawnedNodes = 0
local weedNodes = {}
local wGatheredNodes   = 0

for _, v in ipairs(Config.Processing) do
	if v.onMap then
		local blip = AddBlipForCoord(v.pos)
		SetBlipSprite (blip, v.blip)
		SetBlipDisplay(blip, 0)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, v.colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.Text)
		EndTextCommandSetBlipName(blip)
	end
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(woolNodes) do
            ESX.Game.DeleteObject(v)
        end
        for k, v in pairs(pearlNodes) do
            ESX.Game.DeleteObject(v)
        end
        for k, v in pairs(weedNodes) do
            ESX.Game.DeleteObject(v)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if pearlGathering then
            for k, v in pairs(Nodes) do
                local coords = GetEntityCoords(v)
                local player = PlayerPedId()
                local playerCoords = GetEntityCoords(player)
                if GetDistanceBetweenCoords(coords, playerCoords) < 20 then
                    DrawMarker(0, coords.x, coords.y, coords.z + 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .1, .1, .1, 3, 127, 252, 50,
                                false, true, 2, false, false, false, false)
                end
            end
        else
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		for k, v in ipairs(Config.Processing) do
			local dist = #(pedCoords - v.pos)
			if dist < 50.0 then
                local playerInCar = IsPedSittingInAnyVehicle(ped)
				DrawMarker(25, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				if dist < 2.0 then
					ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to '.. v.type)
					if IsControlJustReleased(0, Keys['E']) and v.type == 'Gather Oil' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "gather_oil",
                            duration        = 5000,
                            label           = "Drilling for Oil",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = true,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = 'anim@amb@nightclub@mini@drinking@bar@drink@base',
                                anim = 'outro_bartender',
                            },
                        }, function(status)
                            TriggerServerEvent('fueling:gatherOil')
                        end)
                    elseif IsControlJustReleased(0, Keys['E']) and v.type == 'Refine Oil' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "refine_oil",
                            duration        = 30000,
                            label           = "Refining Oil",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = false,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = "misscarsteal4@vendor",
                                anim     = "idle_b_vendor",
                                flags    = 49,
                            },
                        }, function(status)
                            TriggerServerEvent('fueling:refineOil')
                        end)
                    elseif IsControlJustReleased(0, Keys['E']) and v.type == 'Sell Essence' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "sell_oil",
                            duration        = 30000,
                            label           = "Selling Oil",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = false,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = "misscarsteal4@vendor",
                                anim     = "idle_b_vendor",
                                flags    = 49,
                            },
                        }, function(status)
                            TriggerServerEvent('fueling:sellOil')
                        end)
                    elseif IsControlJustReleased(0, Keys['E']) and v.type == 'Refine Wool' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "refine_wool",
                            duration        = 30000,
                            label           = "Spinning Wool",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = false,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = "misscarsteal4@vendor",
                                anim     = "idle_b_vendor",
                                flags    = 49,
                            },
                        }, function(status)
                            TriggerServerEvent('tailor:fabric')
                        end)
                    elseif IsControlJustReleased(0, Keys['E']) and v.type == 'Refine Fabric' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "refine_fabric",
                            duration        = 30000,
                            label           = "Stitching Fabric",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = false,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = "misscarsteal4@vendor",
                                anim     = "idle_b_vendor",
                                flags    = 49,
                            },
                        }, function(status)
                            TriggerServerEvent('tailor:clothes')
                        end)
                    elseif IsControlJustReleased(0, Keys['E']) and v.type == 'Sell Clothes' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "sell_clothes",
                            duration        = 30000,
                            label           = "Selling Clothes",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = false,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = "misscarsteal4@vendor",
                                anim     = "idle_b_vendor",
                                flags    = 49,
                            },
                        }, function(status)
                            TriggerServerEvent('tailor:sell')
                        end)
                    elseif IsControlJustReleased(0, Keys['E']) and v.type == 'Sell Pearls' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "sell_pearls",
                            duration        = 30000,
                            label           = "Selling Pearls",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = false,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = "misscarsteal4@vendor",
                                anim     = "idle_b_vendor",
                                flags    = 49,
                            },
                        }, function(status)
                            TriggerServerEvent('pearl:sell')
                        end)
					end
				end
			end
		end
    end
end)

--Wool Gathering
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local nearbyObject, nearbyID

        for i = 1, #woolNodes, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(woolNodes[i]), false) < 1 then
                nearbyObject, nearbyID = woolNodes[i], i
            end
        end

        if nearbyObject and IsPedOnFoot(playerPed) then

            if not isGathering then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to pick wool.")
            end

            if IsControlJustReleased(0, Keys['E']) and not isGathering then
                isGathering = true                     
                exports['mythic_progbar']:Progress({
                                                        name            = "tailoring_action",
                                                        duration        = 10000,
                                                        label           = "Picking Wool",
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
                    if not status then
                        gatheredNodes = gatheredNodes + 1
                        ESX.Game.DeleteObject(nearbyObject)
                        table.remove(woolNodes, nearbyID)
                        spawnedNodes = spawnedNodes - 1
                        TriggerServerEvent('tailor:wool')                                  
                    end
                end)
                isGathering = false                
            end
        else
            Citizen.Wait(500)
        end
    end
end)

--Pearl Gathering
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local nearbyObject, nearbyID

        for i = 1, #pearlNodes, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(Nodes[i]), true) < 2 then
                nearbyObject, nearbyID = Nodes[i], i
            end
        end

        if nearbyObject then

            if not isGathering then
                ESX.ShowHelpNotification("Press F to gather Pearls.")
            end

            if IsControlJustReleased(0, Keys['F']) and not isGathering then
                isGathering = true                     
                exports['mythic_progbar']:Progress({
                                                        name            = "pearl_action",
                                                        duration        = 10000,
                                                        label           = "Opening Oyster",
                                                        useWhileDead    = false,
                                                        canCancel       = false,
                                                        controlDisables = {
                                                            disableMovement    = true,
                                                            disableCarMovement = true,
                                                            disableMouse       = false,
                                                            disableCombat      = true,
                                                        },
                                                    }, function(status)
                    if not status then
                        pGatheredNodes = pGatheredNodes + 1
                        ESX.Game.DeleteObject(nearbyObject)
                        table.remove(pearlNodes, nearbyID)
                        pSpawnedNodes = pSpawnedNodes - 1
                        TriggerServerEvent('pearl:gather')                                  
                    end
                end)
                isGathering = false                
            end
        else
            Citizen.Wait(500)
        end
    end
end)

--Weed Baby
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local nearbyObject, nearbyID

        for i = 1, #weedNodes, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(weedNodes[i]), false) < 1 then
                nearbyObject, nearbyID = weedNodes[i], i
            end
        end

        if nearbyObject and IsPedOnFoot(playerPed) then

            if not isGathering then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to pick weed.")
            end

            if IsControlJustReleased(0, Keys['E']) and not isGathering then
                isGathering = true                     
                exports['mythic_progbar']:Progress({
                                                        name            = "weed_action",
                                                        duration        = 10000,
                                                        label           = "Harvesting Weed",
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
                    if not status then
                        wGatheredNodes = wGatheredNodes + 1
                        ESX.Game.DeleteObject(nearbyObject)
                        table.remove(weedNodes, nearbyID)
                        wSpawnedNodes = wSpawnedNodes - 1
                        TriggerServerEvent('weed:gather')                                  
                    end
                end)
                isGathering = false                
            end
        else
            Citizen.Wait(500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())

        if GetDistanceBetweenCoords(coords, Config.TailoringNode.coords, true) < 100 then
            spawnNodes()
            Citizen.Wait(500)
        elseif GetDistanceBetweenCoords(coords, Config.PearlNode.coords, true) < 100 then
            spawnPearlNodes()
            pearlGathering = true
            Citizen.Wait(500)
        elseif GetDistanceBetweenCoords(coords, Config.WeedNode.coords, true) < 100 then
            spawnWeedNodes()
            Citizen.Wait(500)
        else
            pearlGathering = false
            Citizen.Wait(500)
        end
    end
end)

--Spawn Tailoring Nodes
function spawnNodes()
    local prop
    while spawnedNodes < Config.MaxNodesSpawned do
        Citizen.Wait(0)
        local nodeCoords = generateNodeCoords(Config.TailoringNode.coords)

        prop = Config.TailoringNode.prop

        ESX.Game.SpawnLocalObject(prop, nodeCoords, function(obj)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)

            table.insert(woolNodes, obj)

            spawnedNodes = spawnedNodes + 1
        end)
    end
end

--Spawn Pearl nodes
function spawnPearlNodes()
    local prop
    while pSpawnedNodes < Config.MaxNodesSpawned do
        Citizen.Wait(0)
        local nodeCoords = generatePearlNodeCoords(Config.PearlNode.coords)

        prop = Config.PearlNode.prop

        ESX.Game.SpawnLocalObject(prop, nodeCoords, function(obj)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)

            table.insert(pearlNodes, obj)

            pSpawnedNodes = pSpawnedNodes + 1
        end)
    end
end

--Spawn Weed nodes
function spawnWeedNodes()
    local prop
    while wSpawnedNodes < Config.MaxNodesSpawned do
        Citizen.Wait(0)
        local nodeCoords = generateWeedNodeCoords(Config.WeedNode.coords)

        prop = Config.WeedNode.prop

        ESX.Game.SpawnLocalObject(prop, nodeCoords, function(obj)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)

            table.insert(weedNodes, obj)

            wSpawnedNodes = wSpawnedNodes + 1
        end)
    end
end

--Generate Tailoring Node Coords
function generateNodeCoords()
    while true do
        Citizen.Wait(0)

        local nodeCoordX, nodeCoordY

        math.randomseed(GetGameTimer())
        local modX = math.random(-20, 20)

        Citizen.Wait(100)

        math.randomseed(GetGameTimer())
        local modY   = math.random(-30, 30)

        nodeCoordX   = Config.TailoringNode.coords.x + modX
        nodeCoordY   = Config.TailoringNode.coords.y + modY

        local coordZ = getCoordZ(nodeCoordX, nodeCoordY)
        local coord  = vector3(nodeCoordX, nodeCoordY, coordZ)

        if validateCoord(coord) then
            return coord
        end
    end
end

--Generate Pearl Node Coords
function generatePearlNodeCoords()
    while true do
        Citizen.Wait(0)

        local nodeCoordX, nodeCoordY

        math.randomseed(GetGameTimer())
        local modX = math.random(-20, 20)

        Citizen.Wait(100)

        math.randomseed(GetGameTimer())
        local modY   = math.random(-30, 30)

        nodeCoordX   = Config.PearlNode.coords.x + modX
        nodeCoordY   = Config.PearlNode.coords.y + modY

        local coordZ = getCoordZ(nodeCoordX, nodeCoordY)
        local pcoord  = vector3(nodeCoordX, nodeCoordY, coordZ)

        if validatePearlCoord(pcoord) then
            return pcoord
        end
    end
end

function generateWeedNodeCoords()
    while true do
        Citizen.Wait(0)

        local nodeCoordX, nodeCoordY

        math.randomseed(GetGameTimer())
        local modX = math.random(-20, 20)

        Citizen.Wait(100)

        math.randomseed(GetGameTimer())
        local modY   = math.random(-30, 30)

        nodeCoordX   = Config.WeedNode.coords.x + modX
        nodeCoordY   = Config.WeedNode.coords.y + modY

        local coordZ = getCoordZ(nodeCoordX, nodeCoordY)
        local pcoord  = vector3(nodeCoordX, nodeCoordY, coordZ)

        if validateWeedCoord(pcoord) then
            return pcoord
        end
    end
end

function getCoordZ(x, y)
    local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0 }

    for i, height in ipairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

        if foundGround then
            return z
        end
    end

    return 43.0
end

--Validate Tailoring Coords
function validateCoord(nodeCoord)
    if spawnedNodes > 0 then
        local validate = true

        for k, v in pairs(woolNodes) do
            if GetDistanceBetweenCoords(nodeCoord, GetEntityCoords(v), true) < 5 then
                validate = false
            end
        end

        if GetDistanceBetweenCoords(nodeCoord, Config.TailoringNode.coords, false) > 50 then
            validate = false
        end

        return validate
    else
        return true
    end
end

--Validate Pearl Coords
function validatePearlCoord(nodeCoord)
    if spawnedNodes > 0 then
        local validate = true

        for k, v in pairs(pearlNodes) do
            if GetDistanceBetweenCoords(nodeCoord, GetEntityCoords(v), true) < 5 then
                validate = false
            end
        end

        if GetDistanceBetweenCoords(nodeCoord, Config.PearlNode.coords, false) > 50 then
            validate = false
        end

        return validate
    else
        return true
    end
end

--Validate Weed Coords
function validateWeedCoord(nodeCoord)
    if spawnedNodes > 0 then
        local validate = true

        for k, v in pairs(weedNodes) do
            if GetDistanceBetweenCoords(nodeCoord, GetEntityCoords(v), true) < 5 then
                validate = false
            end
        end

        if GetDistanceBetweenCoords(nodeCoord, Config.WeedNode.coords, false) > 50 then
            validate = false
        end

        return validate
    else
        return true
    end
end