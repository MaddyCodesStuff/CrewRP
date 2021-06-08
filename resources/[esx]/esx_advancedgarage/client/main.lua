Keys                          = {
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

ESX                           = nil

local PlayerData              = {}
local JobBlips                = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local userProperties          = {}
local this_Garage             = {}
local privateBlips            = {}
local closeGarages            = {}
local closePounds             = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
    refreshBlips()
end)

-- Store vehicles in bad state
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent('esx_advancedgarage:storeLostVehicles')
end)

function UpdatePrivateGarages()
    if Config.UsePrivateCarGarages == true then
        ESX.TriggerServerCallback('esx_advancedgarage:getOwnedProperties', function(properties)
            userProperties = properties
            PrivateGarageBlips()
        end)
    end
end

-- Event handler to update garages when a property is bought or sold
RegisterNetEvent('esx_advancedgarage:updateOwnedProperties')
AddEventHandler('esx_advancedgarage:updateOwnedProperties', function()
    UpdatePrivateGarages()
end)

RegisterNetEvent('esx_advancedgarage:impoundVehicle')
AddEventHandler('esx_advancedgarage:impoundVehicle', function(vehicle)
    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
    local vehicleHealth = { engine = GetVehicleEngineHealth(vehicle),
                            body = GetVehicleBodyHealth(vehicle),
                            petrol = GetVehiclePetrolTankHealth(vehicle)}

    ESX.Game.DeleteVehicle(vehicle)
    -- Pulled from mechanic job. Unknown if needed
--[[    SetVehicleHasBeenOwnedByPlayer(vehicle, false)
    SetEntityAsMissionEntity(vehicle, false, true)
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))--]]
    TriggerServerEvent('esx_advancedgarage:setVehicleImpoundState', vehicleProps.plate, true, vehicleHealth)

          
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    UpdatePrivateGarages()
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    deleteBlips()
    refreshBlips()
end)

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function ListOwnedMenu(vehType)
    local elements = {}

    if Config.ShowGarageSpacer1 then
        table.insert(elements, { label = _U('spacer1') })
    end

    if Config.ShowGarageSpacer2 then
        table.insert(elements, { label = _U('spacer2') })
    end

    if Config.ShowGarageSpacer3 then
        table.insert(elements, { label = _U('spacer3') })
    end

    ESX.TriggerServerCallback('esx_advancedgarage:getOwned', function(ownedVehicles)
        if #ownedVehicles == 0 then
            TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('garage_no'..vehType..'s')})
        else
            for _, v in pairs(ownedVehicles) do
                local hashVehicule = v.vehicle.model
                local vehicleName  = GetDisplayNameFromVehicleModel(hashVehicule)
                local plate        = v.plate
                local labelvehicle

                if v.stored then
                    labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_garage') .. ' |'
                elseif v.impounded then
                    labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_pound') .. ' |'
                else
                    labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | Out |'
                end

                if vehicleName ~= "CARNOTFOUND" then
                    table.insert(elements, { label = labelvehicle, value = v })
                end
            end
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_'..vehType, {
                title    = _U('garage_'..vehType..'s'),
                align    = 'top-right',
                elements = elements
            }, function(data, menu)
                if data.current.value.stored then
                    menu.close()
                    SpawnVehicle(data.current.value.vehicle, data.current.value.plate, data.current.value.health)
                else
                    TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U(vehType..'_is_impounded')})
                end
            end, function(data, menu)
                menu.close()
            end)
        end
    end, vehType)
end

-- Store Owned Vehicles Menu
function StoreOwnedMenu(vehType)
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerPed     = GetPlayerPed(-1)
        local coords        = GetEntityCoords(playerPed)
        local vehicle       = GetVehiclePedIsIn(playerPed, false)
        local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
        local current       = GetPlayersLastVehicle(GetPlayerPed(-1), true)
        local vehicleHealth = { engine = GetVehicleEngineHealth(current), body = GetVehicleBodyHealth(current), petrol = GetVehiclePetrolTankHealth(current) }
        local plate         = vehicleProps.plate

        
        ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
            if valid then
                putaway(vehicle, vehicleProps, vehicleHealth)
            else
                TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('cannot_store_vehicle')})
            end
        end, vehicleProps)
    else
        TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('no_vehicle_to_enter')})
    end
end

-- Pound Owned Vehicles Menu
function ReturnOwnedMenu(vehType)
    ESX.TriggerServerCallback('esx_advancedgarage:getOutOwned', function(ownedVehicles)
        local elements = {}

        if Config.ShowPoundSpacer2 then
            table.insert(elements, { label = _U('spacer2') })
        end

        if Config.ShowPoundSpacer3 then
            table.insert(elements, { label = _U('spacer3') })
        end

        for _, v in pairs(ownedVehicles) do
            local hashVehicule = v.vehicle.model
            local vehicleName  = GetDisplayNameFromVehicleModel(hashVehicule)
            local plate        = v.plate
            local labelvehicle

            labelvehicle       = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

            if vehicleName ~= "CARNOTFOUND" then
                table.insert(elements, { label = labelvehicle, value = v })
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_'..vehType, {
            title    = _U('pound_cars'),
            align    = 'top-right',
            elements = elements
        }, function(data, menu)
            ESX.TriggerServerCallback('esx_advancedgarage:checkMoney', function(hasEnoughMoney)
                if hasEnoughMoney then
                    TriggerServerEvent('esx_advancedgarage:pay', vehType)
                    SpawnPoundedVehicle(data.current.value.vehicle, data.current.value.plate, data.current.value.health)
                else
                    TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('not_enough_money')})
                end
                menu.close()
            end, vehType)
        end, function(data, menu)
            menu.close()
        end)
    end, vehType)
end

-- Put Away Vehicles
function putaway(vehicle, vehicleProps, health)
    ESX.Game.DeleteVehicle(vehicle)
    TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, true, health)
    TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = _U('vehicle_in_garage')})
end

-- Spawn Cars
function SpawnVehicle(vehicle, plate, health)
    ESX.Game.SpawnVehicle(vehicle.model, {
        x = this_Garage.SpawnPoint.x,
        y = this_Garage.SpawnPoint.y,
        z = this_Garage.SpawnPoint.z + 1
    }, this_Garage.SpawnPoint.h, function(callback_vehicle)
        ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
        SetVehRadioStation(callback_vehicle, "OFF")
        if health.engine then
            SetVehicleEngineHealth(callback_vehicle, health.engine + 0.00)
            if health.engine < 500.0 then
                SetVehicleDoorBroken(callback_vehicle, 4, true)
            end
        end
        if health.petrol then
            SetVehiclePetrolTankHealth(callback_vehicle, health.petrol + 0.00)
            if health.petrol < 700.0 then
                SetVehiclePetrolTankHealth(callback_vehicle, 600.0)
            end
        end
        if health.body then
            SetVehicleBodyHealth(callback_vehicle, health.body + 0.00)
            if health.body < 950.0 then
                SetVehicleDoorBroken(callback_vehicle, 0, true)
            end
            if health.body < 900.0 then
                SetVehicleDoorBroken(callback_vehicle, 1, true)
            end
            if health.body < 850.0 then
                SetVehicleDoorBroken(callback_vehicle, 2, true)
            end
            if health.body < 800.0 then
                SetVehicleDoorBroken(callback_vehicle, 3, true)
            end
            if health.body < 750.0 then
                SetVehicleTyreBurst(callback_vehicle, 0, true, 500)
            end
        end

        TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
    end)
    TriggerServerEvent('esx_vehiclelock:toggleLock', plate, 1)
    TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false, health)
    TriggerEvent('disc-hud:EnteringVehicle', plate)
end

-- Spawn Pound Cars
function SpawnPoundedVehicle(vehicle, plate, health)
    SpawnVehicle(vehicle, plate, health)
    TriggerServerEvent('esx_advancedgarage:setVehicleImpoundState', plate, false, health)
end

-- Entered Marker
AddEventHandler('esx_advancedgarage:hasEnteredMarker', function(zone)
    if zone == 'car_garage_point' then
        CurrentAction     = {action = 'list', vehType = 'car'}
        CurrentActionMsg  = _U('press_to_enter')
        CurrentActionData = {}
    elseif zone == 'boat_garage_point' then
        CurrentAction     = {action = 'list', vehType = 'boat'}
        CurrentActionMsg  = _U('press_to_enter')
        CurrentActionData = {}
    elseif zone == 'aircraft_garage_point' then
        CurrentAction     = {action = 'list', vehType = 'aircraft'}
        CurrentActionMsg  = _U('press_to_enter')
        CurrentActionData = {}
    elseif zone == 'car_store_point' then
        CurrentAction     = {action = 'store', vehType = 'car'}
        CurrentActionMsg  = _U('press_to_delete')
        CurrentActionData = {}
    elseif zone == 'boat_store_point' then
        CurrentAction     = {action = 'store', vehType = 'boat'}
        CurrentActionMsg  = _U('press_to_delete')
        CurrentActionData = {}
    elseif zone == 'aircraft_store_point' then
        CurrentAction     = {action = 'store', vehType = 'aircraft'}
        CurrentActionMsg  = _U('press_to_delete')
        CurrentActionData = {}
    elseif zone == 'car_pound_point' then
        CurrentAction     = {action = 'pound', vehType = 'car'}
        CurrentActionMsg  = _U('press_to_impound')
        CurrentActionData = {}
    elseif zone == 'boat_pound_point' then
        CurrentAction     = {action = 'pound', vehType = 'boat'}
        CurrentActionMsg  = _U('press_to_impound')
        CurrentActionData = {}
    elseif zone == 'aircraft_pound_point' then
        CurrentAction     = {action = 'pound', vehType = 'aircraft'}
        CurrentActionMsg  = _U('press_to_impound')
        CurrentActionData = {}
    end
end)

-- Set close garages
function setCloseGarages(zones, zone_type)
    for k, v in pairs(zones) do
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local garage_distance = #(coords - vector3(v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z))

        if garage_distance < Config.DrawDistance then
            if v.Marker == nil then
                v.Marker = Config.MarkerType
            end

            if v.Color == nil then
                v.Color = Config.PointMarker
            end
            v.zone_type = zone_type
            table.insert(closeGarages, v)
        end 
    end
end

-- Set close Pounds
function setClosePounds(zones, zone_type)
    for k, v in pairs(zones) do
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local pound_distance = #(coords - vector3(v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z))

        if pound_distance < Config.DrawDistance then
            v.zone_type = zone_type
            table.insert(closePounds, v)
        end
    end
end

-- Exited Marker
AddEventHandler('esx_advancedgarage:hasExitedMarker', function()
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

-- Update Private Garages every so often
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)

        if ESX and ESX.PlayerData then
            UpdatePrivateGarages()
        end
    end
end)

-- Get Close Garages & Pounds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        closeGarages = {}
        closePounds = {}

        if Config.UseCarGarages then
            setCloseGarages(Config.CarGarages, 'car')
            setClosePounds(Config.CarPounds, 'car')
        end
        if Config.UseBoatGarages then
            setCloseGarages(Config.BoatGarages, 'boat')
            setClosePounds(Config.BoatPounds, 'boat')
        end

        if Config.UseAircraftGarages then
            setCloseGarages(Config.AircraftGarages, 'aircraft')
            setClosePounds(Config.AircraftPounds, 'aircraft')
        end

        if Config.UsePrivateCarGarages then
            setCloseGarages(Config.PrivateCarGarages, 'car')
        end
    end
end)

-- Draw Markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for i = 1, #closeGarages, 1 do
            v = closeGarages[i]

            if not v.Invisible and (not v.Private or has_value(userProperties, v.Private)) then
                DrawMarker(v.Marker, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
                           Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, v.Color.r, v.Color.g,
                           v.Color.b, 100, false, true, 2, false, false, false, false)
                DrawMarker(Config.MarkerType, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, 0.0, 0.0, 0.0, 0,
                           0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z,
                           Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2,
                           false, false, false, false)
            end
        end

        for i = 1, #closePounds, 1 do
            v = closePounds[i]

            DrawMarker(Config.MarkerType, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, 0.0, 0.0, 0.0, 0, 0.0,
                       0.0, Config.PoundMarker.x, Config.PoundMarker.y, Config.PoundMarker.z,
                       Config.PoundMarker.r, Config.PoundMarker.g, Config.PoundMarker.b, 100, false, true, 2,
                       false, false, false, false)
        end
    end
end)

-- Activate Menu when in Markers
Citizen.CreateThread(function()
    local currentZone = 'garage'
    while true do
        Citizen.Wait(120)

        local playerPed  = PlayerPedId()
        local coords     = GetEntityCoords(playerPed)
        local isInMarker = false
        for i = 1, #closeGarages, 1 do
            v = closeGarages[i]

            if (not v.Private or has_value(userProperties, v.Private)) and #(coords - vector3(
                                                                                              v.GaragePoint.x,
                                                                                              v.GaragePoint.y,
                                                                                             v.GaragePoint.z)) < Config.SpawnMenuDistance then
                isInMarker  = true
                this_Garage = v
                currentZone = v.zone_type..'_garage_point'
            elseif (not v.Private or has_value(userProperties, v.Private)) and #(coords - vector3(
                                                                                                  v.DeletePoint.x,
                                                                                                  v.DeletePoint.y,
                                                                                                  v.DeletePoint.z)) < Config.DeleteMenuDistance then
                isInMarker  = true
                this_Garage = v
                currentZone = v.zone_type..'_store_point'
            end
        end

        for i = 1, #closePounds, 1 do
            v = closePounds[i]

            if #(coords - vector3(v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z)) < Config.SpawnMenuDistance then
                isInMarker  = true
                this_Garage = v
                currentZone = v.zone_type..'_pound_point'
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            LastZone                = currentZone
            TriggerEvent('esx_advancedgarage:hasEnteredMarker', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('esx_advancedgarage:hasExitedMarker', LastZone)
        end

        if not isInMarker then
            Citizen.Wait(500)
        end
    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustReleased(0, Keys['E']) then
                if CurrentAction.action == 'list' then
                    ListOwnedMenu(CurrentAction.vehType)
                elseif CurrentAction.action == 'store' then
                    StoreOwnedMenu(CurrentAction.vehType)
                elseif CurrentAction.action == 'pound' then
                    ReturnOwnedMenu(CurrentAction.vehType)
                end
                CurrentAction = nil
            end
        else
            Citizen.Wait(500)
        end
    end
end)

-- Create Blips
function PrivateGarageBlips()
    for _, blip in pairs(privateBlips) do
        RemoveBlip(blip)
    end

    privateBlips = {}

    for zoneKey, zoneValues in pairs(Config.PrivateCarGarages) do
        if zoneValues.Private and has_value(userProperties, zoneValues.Private) or zoneValues.PrivateAddon then
            local blip = AddBlipForCoord(zoneValues.GaragePoint.x, zoneValues.GaragePoint.y, zoneValues.GaragePoint.z)
            SetBlipSprite(blip, Config.BlipGaragePrivate.Sprite)
            SetBlipDisplay(blip, Config.BlipGaragePrivate.Display)
            SetBlipScale(blip, Config.BlipGaragePrivate.Scale)
            SetBlipColour(blip, Config.BlipGaragePrivate.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Garage (car) | Private")
            EndTextCommandSetBlipName(blip)
            table.insert(privateBlips, blip)
        end
    end
end

function deleteBlips()
    if JobBlips[1] ~= nil then
        for i = 1, #JobBlips, 1 do
            RemoveBlip(JobBlips[i])
            JobBlips[i] = nil
        end
    end
end

function refreshBlips()
    local blipList = {}
    local JobBlips = {}
    local Label, BlipColor

    if Config.UseCarGarages then
        for k, v in pairs(Config.CarGarages) do
            if v.Label ~= nil then
                Label = v.Label
            else
                Label = "Garage (car) | Public"
            end

            if v.BlipColor ~= nil then
                BlipColor = v.BlipColor
            else
                BlipColor = Config.BlipGarage.Color
            end

            if not v.Invisible then
                table.insert(blipList, {
                    coords = { v.GaragePoint.x, v.GaragePoint.y },
                    text   = Label,
                    sprite = Config.BlipGarage.Sprite,
                    color  = BlipColor,
                    scale  = Config.BlipGarage.Scale
                })
            end
        end

        for k, v in pairs(Config.CarPounds) do
            table.insert(blipList, {
                coords = { v.PoundPoint.x, v.PoundPoint.y },
                text   = "Garage (car) | Impound",
                sprite = Config.BlipPound.Sprite,
                color  = Config.BlipPound.Color,
                scale  = Config.BlipPound.Scale
            })
        end
    end

    if Config.UseBoatGarages then
        for k, v in pairs(Config.BoatGarages) do
            table.insert(blipList, {
                coords = { v.GaragePoint.x, v.GaragePoint.y },
                text   = "Garage (boat) | Public",
                sprite = Config.BlipBoatGarage.Sprite,
                color  = Config.BlipBoatGarage.Color,
                scale  = Config.BlipBoatGarage.Scale
            })
        end

        for k, v in pairs(Config.BoatPounds) do
            table.insert(blipList, {
                coords = { v.PoundPoint.x, v.PoundPoint.y },
                text   = "Garage (boat) | Impound",
                sprite = Config.BlipBoatPound.Sprite,
                color  = Config.BlipBoatPound.Color,
                scale  = Config.BlipBoatPound.Scale
            })
        end
    end

    if Config.UseAircraftGarages then
        for k, v in pairs(Config.AircraftGarages) do
            table.insert(blipList, {
                coords = { v.GaragePoint.x, v.GaragePoint.y },
                text   = "Garage (air) | Public",
                sprite = Config.BlipAirGarage.Sprite,
                color  = Config.BlipAirGarage.Color,
                scale  = Config.BlipAirGarage.Scale
            })
        end

        for k, v in pairs(Config.AircraftPounds) do
            table.insert(blipList, {
                coords = { v.PoundPoint.x, v.PoundPoint.y },
                text   = "Garage (air) | Impound",
                sprite = Config.BlipAirPound.Sprite,
                color  = Config.BlipAirPound.Color,
                scale  = Config.BlipAirPound.Scale
            })
        end
    end

    for i = 1, #blipList, 1 do
        CreateBlip(blipList[i].coords, blipList[i].text, blipList[i].sprite, blipList[i].color, blipList[i].scale)
    end

    for i = 1, #JobBlips, 1 do
        CreateBlip(JobBlips[i].coords, JobBlips[i].text, JobBlips[i].sprite, JobBlips[i].color, JobBlips[i].scale)
    end
end

function CreateBlip(coords, text, sprite, color, scale)
    local blip = AddBlipForCoord(table.unpack(coords))

    SetBlipSprite(blip, sprite)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandSetBlipName(blip)
    table.insert(JobBlips, blip)
end

--[[ Added to allow other resources to add new garages ]]--

-- Event to resync all garages (Need to find out how to unsync car garages when a property is sold or keys are taken away)
RegisterNetEvent('esx_advancedgarage:syncGarages')
AddEventHandler('esx_advancedgarage:syncGarages', function(garages, garage_type)
    if garage_type == "private" then
        -- Remove all private addon garages (of type housing), then re-add them
        for k, v in pairs(Config.PrivateCarGarages) do
            if v.PrivateName ~= nil and v.PrivateName == "housing" then
                Config.PrivateCarGarages[k] = nil
            end
        end
    end

    for k, v in pairs(garages) do
        Config.PrivateCarGarages[k] = garages[k]
    end
end)

function dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end