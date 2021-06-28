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
local minedNodes   = 0
local vineNodes    = {}

local isHarvesting = false

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

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(vineNodes) do
            ESX.Game.DeleteObject(v)
        end
    end
end)

-- Draw wine making markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DrawMarker(27, Config.FineWine.pos.x, Config.FineWine.pos.y, Config.FineWine.pos.z - 1, 0.0, 0.0, 0.0, 0, 0.0,
                   0.0, .5, .5, .5, 255, 255, 0, 100, false, true, 2, false, false, false, false)
        DrawMarker(27, Config.Middle.pos.x, Config.Middle.pos.y, Config.Middle.pos.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
                   .5, .5, .5, 255, 255, 0, 100, false, true, 2, false, false, false, false)
        DrawMarker(27, Config.Fresh.pos.x, Config.Fresh.pos.y, Config.Fresh.pos.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5,
                   .5, .5, 255, 255, 0, 100, false, true, 2, false, false, false, false)
    end
end)

-- Todo move this into a zone

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k, v in pairs(vineNodes) do
            local coords = GetEntityCoords(v)

            DrawMarker(20, coords.x, coords.y, coords.z + 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 255, 255, 0, 100,
                       false, true, 2, false, false, false, false)
        end

        for i = 1, #Config.SellPoints, 1 do
            DrawMarker(27, Config.SellPoints[i].pos.x, Config.SellPoints[i].pos.y, Config.SellPoints[i].pos.z, 0.0, 0.0,
                       0.0, 0, 0.0, 0.0, .5, .5, .5, 128, 128, 0, 100, false, true, 2, false, false, false, false)
            local playerPed = PlayerPedId()
            local coords    = GetEntityCoords(playerPed)
            if (GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.SellPoints[i].pos.x,
                                         Config.SellPoints[i].pos.y, Config.SellPoints[i].pos.z, true) < 1.5) then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to sell your wine.")

                if IsControlJustReleased(0, Keys['E']) then
                    OpenWineSellMenu(i)
                    GetPlayerServerId(PlayerId(), 'wineselling')
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local wineryBlip = AddBlipForCoord(Config.Node.coords)
    SetBlipSprite(wineryBlip, 480)
    SetBlipDisplay(wineryBlip, 4)
    SetBlipScale(wineryBlip, 1.0)
    SetBlipColour(wineryBlip, 36)
    SetBlipAsShortRange(wineryBlip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Wine Harvesting')
    EndTextCommandSetBlipName(wineryBlip)

    local winemakingBlip = AddBlipForCoord(Config.FineWine.pos.x, Config.FineWine.pos.y, Config.FineWine.pos.z)
    SetBlipSprite(winemakingBlip, 480)
    SetBlipDisplay(winemakingBlip, 4)
    SetBlipScale(winemakingBlip, 1.0)
    SetBlipColour(winemakingBlip, 36)
    SetBlipAsShortRange(winemakingBlip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Wine Making')
    EndTextCommandSetBlipName(winemakingBlip)
end)

function OpenWineSellMenu(shop)
    local elements = {}
    menuOpen       = true
    for i = 1, #Config.SellPoints[shop].items, 1 do
        table.insert(elements, {
            name  = Config.SellPoints[shop].items[i].name,
            label = Config.SellPoints[shop].items[i].label,
            type  = 'slider',
            value = 1,
            price = Config.SellPoints[shop].items[i].price,
            min   = 1,
            max   = Config.SellPoints[shop].items[i].maximum,
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wine_shop', {
        title    = 'Wine Shop',
        align    = 'top-right',
        elements = elements
    }, function(data, menu)
        TriggerServerEvent('esx_winery:sellWine', data.current.name, data.current.value, data.current.price)
    end, function(data, menu)
        menu.close()
        menuOpen = false
    end)

end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local nearbyObject, nearbyID

        for i = 1, #vineNodes, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(vineNodes[i]), false) < 1 then
                nearbyObject, nearbyID = vineNodes[i], i
            end
        end

        if nearbyObject and IsPedOnFoot(playerPed) then

            if not isHarvesting then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to harvest.")
            end

            if IsControlJustReleased(0, Keys['E']) and not isHarvesting then

            isHarvesting = true

            TaskTurnPedToFaceEntity(PlayerPedId(), nearbyID)
            exports['mythic_progbar']:Progress({
                                                    name            = "harvesting_action",
                                                    duration        = Config.HarvestingTime,
                                                    label           = "Harvesting",
                                                    useWhileDead    = false,
                                                    canCancel       = false,
                                                    controlDisables = {
                                                        disableMovement    = true,
                                                        disableCarMovement = true,
                                                        disableMouse       = false,
                                                        disableCombat      = true,
                                                    },
                                                    animation       = {
                                                        task = 'WORLD_HUMAN_GARDENER_PLANT',
                                                    },
                                                    prop            = {
                                                        -- model = "prop_tool_pickaxe",
                                                    }
                                                }, function(status)
                        if not status then
                            minedNodes = minedNodes + 1
                            ESX.Game.DeleteObject(nearbyObject)
                            table.remove(vineNodes, nearbyID)
                            spawnedNodes = spawnedNodes - 1

                            --Do the random logic here to generate random numbers of grapes from this node
                            TriggerServerEvent('esx_winery:giveItems')
                        end
                    end)
                    isHarvesting = false
                end
            end
    end
end)

-- Draw wine making markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

        if GetDistanceBetweenCoords(coords, Config.FineWine.pos.x, Config.FineWine.pos.y, Config.FineWine.pos.z,
                                    true) < 1 then
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to make Fine Wine")

            if IsControlJustReleased(0, Keys['E']) then
                TriggerServerEvent('esx_winery:doProcessing', 'FineWine')
            end
        end

        if GetDistanceBetweenCoords(coords, Config.Middle.pos.x, Config.Middle.pos.y, Config.Middle.pos.z,
                                    true) < 1 then
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to make Middle Aged Wine")

            if IsControlJustReleased(0, Keys['E']) then
                TriggerServerEvent('esx_winery:doProcessing', 'Middle')
            end
        end

        if GetDistanceBetweenCoords(coords, Config.Fresh.pos.x, Config.Fresh.pos.y, Config.Fresh.pos.z, true) < 1 then
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to make Fresh Wine")

            if IsControlJustReleased(0, Keys['E']) then
                TriggerServerEvent('esx_winery:doProcessing', 'Fresh')
            end
        end
    end
end)

RegisterNetEvent('esx_winery:doProcessing')
AddEventHandler('esx_winery:doProcessing', function(winetype)
    exports['mythic_progbar']:Progress({
                                           name            = "winery_action",
                                           duration        = Config[winetype].processing,
                                           label           = "Making " .. Config[winetype].name,
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
            -- Do the random logic here to generate random numbers of grapes
            ESX.ShowNotification("Made 1x " .. Config[winetype].name)
            TriggerServerEvent('esx_winery:makeWine', winetype)
        end
    end)
end)

function generateNodeCoords()
    while true do
        Citizen.Wait(0)

        local nodeCoordX, nodeCoordY

        math.randomseed(GetGameTimer())
        local modX = math.random(-10, 10)

        Citizen.Wait(100)

        math.randomseed(GetGameTimer())
        local modY   = math.random(-10, 10)

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
    local groundCheckHeights = { 169.0, 170.0, 171.0, 172.0, 173.0, 174.0, 175.0, 176.0, 177.0, 178.0, 179.0 }

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

        for k, v in pairs(vineNodes) do
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
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())

        if GetDistanceBetweenCoords(coords, Config.Node.coords, true) < 100 then
            spawnVines()
            Citizen.Wait(500)
        else
            Citizen.Wait(500)
        end
    end
end)

function spawnVines()
    local prop
    while spawnedNodes < Config.MaxNodesSpawned do
        Citizen.Wait(0)
        local nodeCoords = generateNodeCoords()

        prop             = Config.NodeModel

        ESX.Game.SpawnLocalObject(prop, nodeCoords, function(obj)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)

            table.insert(vineNodes, obj)

            spawnedNodes = spawnedNodes + 1
        end)
    end
end