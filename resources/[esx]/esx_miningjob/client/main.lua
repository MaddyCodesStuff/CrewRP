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
local isOnCooldown = false

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

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k, v in pairs(mineralNodes) do
            local coords = GetEntityCoords(v)
            DrawMarker(20, coords.x, coords.y, coords.z + 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 255, 255, 0, 100,
                       false, true, 2, false, false, false, false)
        end

        local playerPed   = PlayerPedId()
        local coords      = GetEntityCoords(playerPed)
        local cloakCoords = vector3(892.35, -2172.77, 31.28)

        if GetDistanceBetweenCoords(coords, cloakCoords, true) < 100 then
            DrawMarker(25, cloakCoords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 255, 255, 0, 100, false, true, 2, false,
                       false, false, false)
        end

        if GetDistanceBetweenCoords(coords, cloakCoords, true) < 1.5 then
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to access the change room")

            if IsControlJustPressed(0, Keys['E']) then
                OpenCloakRoom()
            end
        else
            if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'cloakroom') then
                ESX.UI.Menu.Close('default', GetCurrentResourceName(), 'cloakroom')
            end
        end
    end
end)

function OpenCloakRoom()

    local elements = {
        { value = 'work_outfit', label = 'Work Uniform' },
        { value = 'citizen_outfit', label = 'Change Back' },
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
                     {
                         title    = 'Change Room',
                         align    = 'top-right',
                         elements = elements
                     }, function(data, menu)
            if data.current.value == 'work_outfit' then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin.sex == 0 then
                        TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.male)
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.female)
                    end
                end)
            elseif data.current.value == 'citizen_outfit' then
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)
            end

        end, function(data, menu)
            menu.close()
        end)
end

-- Smelter
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = Config.Smelting.coords

        DrawMarker(27, coords.x, coords.y, coords.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 255, 255, 0, 100,
                   false, true, 2, false, false, false, false)

        local playerPed    = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, playerCoords, false) < 1 then
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to smelt rocks.")

            if IsControlJustReleased(0, Keys['E']) then
                if not isSmelting then
                    ESX.TriggerServerCallback('esx_miningjob:checkItem', function(hasItem)
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
                                    local xp = math.random(1, 25)
                                    TriggerServerEvent('esx_miningjob:smelt')
                                    TriggerServerEvent('esx_proficiencies:giveXP', xp, 'mining')
                                end
                            end)

                            isSmelting = false
                        else
                            ESX.ShowNotification("Not enough ~y~" .. Config.Smelting.label)
                        end
                    end, Config.Smelting.item)
                else
                    ESX.ShowNotification("You must wait longer to do that!")
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

        for i = 1, #mineralNodes, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(mineralNodes[i]), false) < 1 then
                nearbyObject, nearbyID = mineralNodes[i], i
            end
        end

        if nearbyObject and IsPedOnFoot(playerPed) then

            if not isMining then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to mine rocks.")
            end

            if IsControlJustReleased(0, Keys['E']) and not isMining then

                if isOnCooldown then
                    ESX.ShowNotification("~r~Error~w~ You must wait longer to mine more nodes!")
                else
                    isMining = true
                    ESX.TriggerServerCallback('esx_miningjob:checkItem', function(hasItem)
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
                                    TriggerServerEvent('esx_miningjob:giveItems')
                                    local xp = math.random(1, 25)
                                    TriggerServerEvent('esx_proficiencies:giveXP', xp, 'mining')

                                    if minedNodes == Config.MaxNodes then
                                        isOnCooldown = true

                                        cooldown     = Config.Cooldown

                                        print(cooldown)
                                        ESX.TriggerServerCallback('esx_miningjob:getProficiencyLevel', function(level)
                                            cooldown = Config.Cooldown
                                            cooldown = cooldown - (level * Config.CooldownBonus)
                                            if cooldown < 0 then
                                                cooldown = 0
                                            end

                                            ESX.SetTimeout(cooldown, function()
                                                isOnCooldown = false
                                            end)
                                        end)
                                    end
                                end
                            end)

                            isMining = false
                        else
                            ESX.ShowNotification("Missing item: ~g~Jackhammer")
                            isMining = false
                        end
                    end, 'jackhammer')
                end
            end

        else
            Citizen.Wait(500)
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
        local coords = GetEntityCoords(PlayerPedId())

        if GetDistanceBetweenCoords(coords, Config.Node.coords, true) < 100 then
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
        local nodeCoords = generateNodeCoords()

        if Config.UseBigNode then
            local random = math.random(1, 100)

            if random <= 25 then
                prop = Config.BigNodeModel
            else
                prop = Config.NodeModel
            end
        else
            prop = Config.NodeModel
        end

        ESX.Game.SpawnLocalObject(prop, nodeCoords, function(obj)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)

            table.insert(mineralNodes, obj)

            spawnedNodes = spawnedNodes + 1
        end)
    end
end

function generateNodeCoords()
    while true do
        Citizen.Wait(0)

        local nodeCoordX, nodeCoordY

        math.randomseed(GetGameTimer())
        local modX = math.random(-90, 90)

        Citizen.Wait(100)

        math.randomseed(GetGameTimer())
        local modY   = math.random(-90, 90)

        nodeCoordX   = Config.Node.coords.x + modX
        nodeCoordY   = Config.Node.coords.y + modY

        local coordZ = getCoordZ(nodeCoordX, nodeCoordY)
        local coord  = vector3(nodeCoordX, nodeCoordY, coordZ)

        if validateCoord(coord) then
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

function validateCoord(nodeCoord)
    if spawnedNodes > 0 then
        local validate = true

        for k, v in pairs(mineralNodes) do
            if GetDistanceBetweenCoords(nodeCoord, GetEntityCoords(v), true) < 5 then
                validate = false
            end
        end

        if GetDistanceBetweenCoords(nodeCoord, Config.Node.coords, false) > 50 then
            validate = false
        end

        return validate
    else
        return true
    end
end

Citizen.CreateThread(function()
    local miningBlip = AddBlipForCoord(Config.Node.coords)
    SetBlipSprite(miningBlip, 480)
    SetBlipDisplay(miningBlip, 4)
    SetBlipScale(miningBlip, 1.0)
    SetBlipColour(miningBlip, 36)
    SetBlipAsShortRange(miningBlip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('[HOBBY] Mining')
    EndTextCommandSetBlipName(miningBlip)

    local smeltingBlip = AddBlipForCoord(Config.Smelting.coords.x, Config.Smelting.coords.y, Config.Smelting.coords.z)
    SetBlipSprite(smeltingBlip, 480)
    SetBlipDisplay(smeltingBlip, 4)
    SetBlipScale(smeltingBlip, 1.0)
    SetBlipColour(smeltingBlip, 36)
    SetBlipAsShortRange(smeltingBlip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('[HOBBY] Rock Smelting')
    EndTextCommandSetBlipName(smeltingBlip)

    local cloakBlip = AddBlipForCoord(892.35, -2172.77, 31.28)
    SetBlipSprite(cloakBlip, 480)
    SetBlipDisplay(cloakBlip, 4)
    SetBlipScale(cloakBlip, 1.0)
    SetBlipColour(cloakBlip, 36)
    SetBlipAsShortRange(cloakBlip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('[HOBBY] Mining Changeroom')
    EndTextCommandSetBlipName(cloakBlip)
end)

RegisterNetEvent('esx_miningjob:jackhammer')
AddEventHandler('esx_miningjob:jackhammer', function()
    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CONST_DRILL', 0, true)
end)