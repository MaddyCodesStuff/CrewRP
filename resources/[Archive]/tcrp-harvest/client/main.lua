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
local crop_objects = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

-- Spawn crops
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for name, details in pairs(Config.Zones) do
            local zone_type = Config.ZoneTypes[details.type]
            if GetDistanceBetweenCoords(playerCoords, details.coords) < 50.0 and zone_type.spawn_object then
                local object_model = zone_type.object
                local crops        = Config.Zones[name].crops
                if not crop_objects[name] then
                    crop_objects[name] = {}
                end
                if crops then
                    for i = 1, #crops, 1 do
                        local closest_crop = GetClosestObjectOfType(crops[i].x, crops[i].y, crops[i].z, 2.0,
                                                                    object_model, false)
                        if closest_crop == 0 then
                            local object = CreateObjectNoOffset(object_model, crops[i].x, crops[i].y, crops[i].z, false,
                                                                false)
                            PlaceObjectOnGroundProperly(object)
                            FreezeEntityPosition(object, true)
                            table.insert(crop_objects[name], { coords = crops[i], object = object })
                        end
                    end
                end
            end
        end
    end
end)

-- Pick crops
Citizen.CreateThread(function()
    local crops = {}
    while true do
        Citizen.Wait(1)
        local isHarvesting = false
        local nearObject   = nil
        local inZone       = nil
        local picked       = nil
        local playerCoords = GetEntityCoords(PlayerPedId())
        local playerPed    = GetPlayerPed(-1)

        for name, details in pairs(Config.Zones) do
            local zone_type = Config.ZoneTypes[details.type]
            if zone_type.spawn_object and GetDistanceBetweenCoords(playerCoords,
                                                                   details.coords) < details.radius + 10.0 then
                inZone = name
                crops  = Config.Zones[name].crops
                for i = 1, #crops, 1 do
                    if GetDistanceBetweenCoords(playerCoords, crops[i], false) < 2 then
                        nearObject = crops[i]
                    end
                end
                if nearObject and IsPedOnFoot(playerPed) then
                    ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to harvest')
                    if IsControlJustReleased(0, Keys['E']) and not isHarvesting then
                        isHarvesting = true
                        TriggerServerEvent('tcrp-harvest:removeCrop', inZone, nearObject)
                        TaskStartScenarioInPlace(playerPed, zone_type.harvest_scenario, 0, false)
                        FreezeEntityPosition(playerPed, true)
                        Citizen.Wait(25000)
                        ClearPedTasks(playerPed)
                        Citizen.Wait(2000)
                        TriggerServerEvent('tcrp-harvest:giveCrop', inZone)
                        FreezeEntityPosition(playerPed, false)
                        isHarvesting = false
                    end
                else
                    Citizen.Wait(500)
                end
            end
        end
        if not inZone then
            crops = {}
        end
    end
end)

-- Removes the in game object
RegisterNetEvent('tcrp-harvest:removeCropObject')
AddEventHandler('tcrp-harvest:removeCropObject', function(zone, crop)
    local object_model = Config.ZoneTypes[Config.Zones[zone].type].object
    for i = 1, #crop_objects[zone], 1 do
        if crop_objects[zone][i].coords == crop then
            local object = crop_objects[zone][i].object
            ESX.Game.DeleteObject(object)
            Citizen.Wait(1000)
            break
        end
    end
end)

-- Sync crop / config w/ server
RegisterNetEvent('tcrp-harvest:syncCrops')
AddEventHandler('tcrp-harvest:syncCrops', function(new_config)
    Config = new_config
end)