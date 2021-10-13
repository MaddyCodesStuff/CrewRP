ESX  = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end
end)

local spawnedNodes = 0
local scrapNodes = {}
local gatheredNodes = 0
local isScavenging = false
local heistActive = false 
local vespucciCD = 0
local upperPowerCD = 0
local lowerPowerCD = 0

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(scrapNodes) do
            ESX.Game.DeleteObject(v)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k, v in pairs(scrapNodes) do
            local coords = GetEntityCoords(v)
            local player = PlayerPedId()
            local playerCoords = GetEntityCoords(player)
            if GetDistanceBetweenCoords(coords, playerCoords) < 15 then
                DrawMarker(0, coords.x, coords.y, coords.z + 0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .1, .1, .1, 252, 0, 0, 50,
                            false, true, 2, false, false, false, false)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

        for k, v in ipairs(Config.Fence) do
            local dist = #(pedCoords - v.pos)
            if dist < 10 then
                DrawMarker(23, v.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 0, 100, 0, 0, 0, 0) 
                if dist <= 1.40 then
                    DisplayHelpText('Press ~INPUT_CONTEXT~ to Fence Stolen Goods')
                    
                    if IsControlJustPressed(0, 38) and IsPedOnFoot(ped) then
                        OpenShop()
                    end 
                elseif dist < 1.45 then
                    ESX.UI.Menu.CloseAll()
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        if vespucciCD ~= 0 then
            vespucciCD = vespucciCD - 1
        end
        if lowerPowerCD ~= 0 then
            lowerPowerCD = lowerPowerCD - 1
        end
        if  upperPowerCD ~= 0 then
            upperPowerCD = upperPowerCD - 1
        end   
    end
end)

--Start Heist
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

        for k, v in pairs(Config.Heists) do
            local dist = #(pedCoords - v.start)
            if dist <= 10 then
                DrawMarker(23, v.start, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 252, 0, 0, 100, 0, 0, 0, 0) 
                if dist <= 1.40 then
                    DisplayHelpText('Press ~INPUT_CONTEXT~ to start the heist.')
                    local cooldown = nil
                    if v.loc == 'Vespucci' then
                        cooldown = vespucciCD
                    elseif v.loc == 'lowerPower' then
                        cooldown = lowerPowerCD
                    else 
                        cooldown = upperPowerCD
                    end
                    
                    if IsControlJustPressed(0, 38) and IsPedOnFoot(ped) and cooldown == 0 then
                        if v.type == 'trapForeman' then
                            exports['mythic_progbar']:Progress({
                                name            = "trap_foreman",
                                duration        = 5000,
                                label           = "Locking the Door and Breaking the Lock",
                                useWhileDead    = false,
                                canCancel       = false,
                                controlDisables = {
                                    disableMovement    = true,
                                    disableCarMovement = true,
                                    disableMouse       = false,
                                    disableCombat      = true,
                                },
                                animation       = {
                                    animDict = "anim@heists@keycard@",
                                    anim     = "exit",
                                },
                            }, function(status)
                                TriggerServerEvent('constructionHeist:notifyPD', pedCoords)
                                TriggerServerEvent('constructionHeist:startHeist', v.loc, v.Nodes, v.robberyTime)    
                            end)
                        elseif v.type == 'disableCrane' then
                            exports['mythic_progbar']:Progress({
                                name            = "disable_crane",
                                duration        = 5000,
                                label           = "Disabling the Crane",
                                useWhileDead    = false,
                                canCancel       = false,
                                controlDisables = {
                                    disableMovement    = true,
                                    disableCarMovement = true,
                                    disableMouse       = false,
                                    disableCombat      = true,
                                },
                                animation       = {
                                    animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                                    anim     = "machinic_loop_mechandplayer",
                                },
                            }, function(status)
                                TriggerServerEvent('constructionHeist:notifyPD', pedCoords)
                                TriggerServerEvent('constructionHeist:startHeist', v.loc, v.Nodes, v.robberyTime)
                            end)
                        end
                    end
                end
            end              		
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local nearbyObject, nearbyID
        local model = 's_m_y_construct_02'

        for i = 1, #scrapNodes, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(scrapNodes[i]), true) < 2 then
                nearbyObject, nearbyID = scrapNodes[i], i
            end
        end

        if nearbyObject and IsPedOnFoot(playerPed) then

            if not isScavenging then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to scavenge parts.")
            end

            if IsControlJustReleased(0, 38) and not isScavenging then
                isScavenging = true                     
                exports['mythic_progbar']:Progress({
                                                        name            = "scavenging_action",
                                                        duration        = 5000,
                                                        label           = "Grabbing Useful Items",
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
                        local pedSpawnChance = math.random(0, 100)
                        if pedSpawnChance > 70 then
                            TriggerEvent('constructionHeist:spawnPed', model)
                        end
                        gatheredNodes = gatheredNodes + 1
                        ESX.Game.DeleteObject(nearbyObject)
                        table.remove(scrapNodes, nearbyID)
                        spawnedNodes = spawnedNodes - 1
                        TriggerServerEvent('constructionHeist:scavenge')                                  
                    end
                end)
                isScavenging = false                
            end
        else
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent('constructionHeist:beginHeist')
AddEventHandler('constructionHeist:beginHeist', function(loc, coords, time)
    spawnNodes(coords)
    Citizen.Wait(time * 60000)
    TriggerServerEvent('constructionHeist:endHeist', coords, loc)
    deleteNodes()
    if loc == 'Vespucci' then
        vespucciCD = Config.cooldown
    elseif loc == 'lowerPower' then
        lowerPowerCD = Config.cooldown
    elseif loc == 'upperPower' then 
        upperPowerCD = Config.cooldown
    end
end)

RegisterNetEvent('constructionHeist:spawnPed')
AddEventHandler('constructionHeist:spawnPed', function(model)
	RequestTheModel(model)
    local player = PlayerPedId()
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, GetHashKey(model), (pos.x - 10), (pos.y - 10), (pos.z - 1.5), 90.0, true, false)
	SetEntityHealth(ped, 200)
	DecorSetInt(ped, "propHack", 74)
    --GiveWeaponToPed(ped, GetHashKey("WEAPON_PISTOL"), 250, false, false) --FOR SHITS AND GIGGLES
	SetModelAsNoLongerNeeded(GetHashKey(model))
    TaskCombatPed(ped, player, 0, 16)
end)

function spawnNodes(coords)
    local prop
    while spawnedNodes < Config.MaxNodesSpawned do
        Citizen.Wait(0)
        local nodeCoords = generateNodeCoords(coords)
        prop = Config.NodeModel

        ESX.Game.SpawnLocalObject(prop, nodeCoords, function(obj)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)

            table.insert(scrapNodes, obj)

            spawnedNodes = spawnedNodes + 1
        end)
    end
end

function generateNodeCoords(coords)
    while true do
        Citizen.Wait(0)

        local nodeCoordX, nodeCoordY

        math.randomseed(GetGameTimer())
        local modX = math.random(-40, 40)

        Citizen.Wait(100)

        math.randomseed(GetGameTimer())
        local modY   = math.random(-40, 40)

        nodeCoordX   = coords.x + modX
        nodeCoordY   = coords.y + modY

        local coordZ = getCoordZ(nodeCoordX, nodeCoordY)
        local coord  = vector3(nodeCoordX, nodeCoordY, coordZ)

        if validateCoord(coord, coords) then
            return coord
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

function validateCoord(nodeCoord, spawnerCoords)
    if spawnedNodes > 0 then
        local validate = true

        for k, v in pairs(scrapNodes) do
            if GetDistanceBetweenCoords(nodeCoord, GetEntityCoords(v), true) < 5 then
                validate = false
            end
        end

        if GetDistanceBetweenCoords(nodeCoord, spawnerCoords, false) > 50 then
            validate = false
        end

        return validate
    else
        return true
    end
end

function deleteNodes()
    for k, v in pairs(scrapNodes) do
        ESX.Game.DeleteObject(v)
    end
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function RequestTheModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

function OpenShop()
    local elements = {}
    menuOpen       = true

    for k, v in pairs(ESX.GetPlayerData().inventory) do
        local price = Config.fenceItems[v.name]

        if price and v.count > 0 then
            table.insert(elements, {
                label = ('%s - <span style="color:green;">%s</span>'):format(v.label,
                                                                             'item', ESX.Math.GroupDigits(price)),
                name  = v.name,
                price = price,

                -- menu properties
                type  = 'slider',
                value = 1,
                min   = 1,
                max   = v.count
            })
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Fence', {
        title    = 'Fence Menu',
        align    = 'right',
        elements = elements
    }, function(data, menu)
        TriggerServerEvent('constructionHeist:fence', data.current.name, data.current.value)
    end, function(data, menu)
        menu.close()
        menuOpen = false
    end)
end