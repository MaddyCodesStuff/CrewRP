ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

Citizen.CreateThread(function()
    while true do
        for zone, details in pairs(Config.Zones) do
            if Config.ZoneTypes[details.type].spawn_object then
                Citizen.CreateThread(function()
                    while #details.crops < details.crop_limit do
                        local new_crop = GenerateCropCoords(zone)
                        table.insert(details.crops, new_crop)
                        Citizen.Wait(Config.RegrowDelay / details.crop_limit)
                    end
                end)
            end
        end
        Citizen.Wait(Config.RegrowDelay)
    end
end)

-- Sync crops to clients
Citizen.CreateThread(function()
    while true do
        Wait(15000)
        TriggerClientEvent('tcrp-harvest:syncCrops', -1, Config)
    end
end)

ESX.RegisterServerCallback('tcrp-harvest:getCrops', function(source, cb, zone)
    if Config.Zones[zone] then
        cb(Config.Zones[zone].crops)
    else
        cb(nil)
    end
end)

RegisterNetEvent('tcrp-harvest:removeCrop')
AddEventHandler('tcrp-harvest:removeCrop', function(zone, crop)
    local crops = Config.Zones[zone].crops
    for i = 1, #crops, 1 do
        if crops[i] == crop then
            table.remove(crops, i)
            break
        end
    end

    TriggerClientEvent('tcrp-harvest:syncCrops', -1, Config)
    if Config.ZoneTypes[Config.Zones[zone].type].spawn_object then
        Wait(27000)
        TriggerClientEvent('tcrp-harvest:removeCropObject', -1, zone, crop)
    end
end)

RegisterNetEvent('tcrp-harvest:giveCrop')
AddEventHandler('tcrp-harvest:giveCrop', function(zone)
    local xPlayer     = ESX.GetPlayerFromId(source)
    local zone_type   = Config.ZoneTypes[Config.Zones[zone].type]
    local item        = zone_type.gives_item
    local qty         = zone_type.gives_count
    local player_item = xPlayer.getInventoryItem(item)

    if player_item.limit == -1 or (player_item.count + qty) <= player_item.limit then
        xPlayer.addInventoryItem(item, qty)
    else
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                           { text = 'You cannot carry anymore ' .. ESX.GetItemLabel(item) })
    end
end)

function ValidateCropCoord(zone, plantCoord)
    local validate = true

    for i = 1, #zone.crops, 1 do
        if plantCoord == zone.crops[i] then
            validate = false
        end
    end

    return validate
end

function GenerateCropCoords(zoneName)
    while true do
        Citizen.Wait(1)

        local cropCoordX, cropCoordY
        local zone = Config.Zones[zoneName]

        math.randomseed(GetGameTimer())
        local modX = math.random(-zone.radius, zone.radius)

        Citizen.Wait(100)

        math.randomseed(GetGameTimer())
        local modY  = math.random(-zone.radius, zone.radius)

        cropCoordX  = zone.coords.x + modX
        cropCoordY  = zone.coords.y + modY

        local coord = vector3(cropCoordX, cropCoordY, zone.coords.z)

        if ValidateCropCoord(zone, coord) then
            return coord
        end
    end
end