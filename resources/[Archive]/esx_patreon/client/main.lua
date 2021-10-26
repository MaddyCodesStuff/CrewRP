local Keys                    = {
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

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsHandcuffed            = false
local HandcuffTimer           = {}
local DragStatus              = {}
DragStatus.IsDragged          = false
local hasAlreadyJoined        = false
local blipsCops               = {}
local isDead                  = false
local CurrentTask             = {}
local playerInService         = false
local Vehicles                = {}

ESX                           = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(500)
    ESX.TriggerServerCallback('esx_patreon:getVehicles', function(patreonCars)
        Vehicles = patreonCars
    end)
end)

-- Display markers
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(1)

        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

        DrawMarker(Config.MarkerType, Config.Garage.x, Config.Garage.y, Config.Garage.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
                   Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r,
                   Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        DrawMarker(1, Config.CarReturner.x, Config.CarReturner.y, Config.CarReturner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0,
                   3.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2,
                   false, false, false, false)

    end
end)

-- Create Blips
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.Garage.x, Config.Garage.y, Config.Garage.z)

    SetBlipSprite(blip, 490)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 23)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Patreon Shop')
    EndTextCommandSetBlipName(blip)
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

    while true do

        Citizen.Wait(10)

        local playerPed      = PlayerPedId()
        local coords         = GetEntityCoords(playerPed)
        local isInMarker     = false
        local currentStation = nil
        local currentPart    = nil
        local currentPartNum = nil
        local currentVehicle = nil

        if GetDistanceBetweenCoords(coords, Config.Garage.x, Config.Garage.y, Config.Garage.z,
                                    true) < Config.MarkerSize.x then
            isInMarker  = true
            currentPart = 'main_menu'
        end

        if GetDistanceBetweenCoords(coords, Config.CarReturner.x, Config.CarReturner.y, Config.CarReturner.z,
                                    true) < Config.MarkerSize.x then
            isInMarker     = true
            currentPart    = 'vehicle_deleter'
            currentVehicle = GetVehiclePedIsIn(playerPed)

        end

        local hasExited = false

        if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

            if
            (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
                (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
            then
                TriggerEvent('esx_patreon:hasExitedMarker', LastPart, currentVehicle)
                hasExited = true
            end

            HasAlreadyEnteredMarker = true
            LastStation             = currentStation
            LastPart                = currentPart
            LastPartNum             = currentPartNum

            TriggerEvent('esx_patreon:hasEnteredMarker', currentPart, currentVehicle)
        end

        if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_patreon:hasExitedMarker', LastPart)
        end

    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(10)

        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)

            if IsControlJustReleased(0, Keys['E']) then
                if CurrentAction == 'main_menu' then
                    OpenMainMenu()
                elseif CurrentAction == 'vehicle_deleter' then
                    local vehicle = CurrentActionData.vehicle
                    -- Do the stuff to put the patreon car into the garage
                    local plate   = GetVehicleNumberPlateText(vehicle)
                    ESX.TriggerServerCallback('esx_patreon:checkOwnedPatreon', function(cb)
                        if cb == true then
                            OpenParameterDialog(255, function(email)
                                if #email == 0 then
                                    ESX.ShowNotification('Please enter your Patreon Email.')
                                else
                                    ESX.TriggerServerCallback('esx_patreon:tryValidatePatreon', function(cb)
                                        if cb == 'ok' then
                                            TriggerServerEvent('esx_patreon:returnPatreon', plate)
                                            TriggerServerEvent('esx_patreon:updatePatreonUsage', email, 'decrease')
                                            ESX.ShowNotification('Patreon car returned!')
                                            ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
                                        else
                                            ESX.ShowNotification('~r~Error~w~ Unable to validate patreon email!')
                                        end
                                    end, email)
                                end
                            end)
                        else
                            ESX.ShowNotification('You do not own this vehicle!')
                        end
                    end
                    , { plate = plate })
                end
                CurrentAction = nil
            end
        end -- CurrentAction end
    end
end)

function OpenMainMenu()

    ESX.UI.Menu.CloseAll()

    local elements = {}
    local cars     = {}

    for _, v in ipairs(Vehicles) do
        table.insert(elements, { label = v.name, value = v.model })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
                     {
                         title    = 'Patreon Shop',
                         align    = 'top-right',
                         elements = elements
                     }, function(data, menu)

            OpenParameterDialog(255, function(email)
                ESX.TriggerServerCallback('esx_patreon:tryRetrieveVehicle', function(cb)
                    if cb == 'error' then
                        ESX.ShowNotification('~r~Error~w~ Unable to locate patreon information!')
                    elseif cb == 'max_number' then
                        ESX.ShowNotification('~r~Error~w~ Maximum number of cars reached. Sell one to get more!')
                    elseif cb == 'ok' then
                        -- Do the stuff to spawn out the car they want
                        TriggerServerEvent('esx_patreon:updatePatreonUsage', email, 'increase')

                        local playerPed = PlayerPedId()
                        ESX.Game.SpawnVehicle(data.current.value, Config.CarSpawn, Config.CarSpawnHeading,
                                              function(vehicle)
                                                  TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

                                                  local newPlate     = GeneratePlate()
                                                  local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                                                  vehicleProps.plate = newPlate
                                                  SetVehicleNumberPlateText(vehicle, newPlate)

                                                  TriggerServerEvent('esx_vehicleshop:setVehicleOwned', vehicleProps)

                                                  ESX.ShowNotification('Patreon car received!')
                                              end)
                    end
                end, email)

                menu.close()
            end)

        end, function(data, menu)
            menu.close()

            CurrentAction     = 'menu_vehicle_spawner'
            CurrentActionMsg  = _U('vehicle_spawner')
            CurrentActionData = { station = station, partNum = partNum }
        end)
end

function SetVehicleOwned(vehicleProps, plate)
    TriggerServerEvent('esx_patreon:setVehicleOwned', vehicleProps, plate)

    ESX.ShowNotification('Patreon car received!')
end

function OpenParameterDialog(length, callback)
    TriggerEvent('tcrp-input:OpenInput', 'Enter your Patreon Email Address', 'text', length, callback)
end

AddEventHandler('esx_patreon:hasEnteredMarker', function(part, vehicle)

    if part == 'main_menu' then
        CurrentAction     = 'main_menu'
        CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to access the Patreon shop'
        CurrentActionData = {}
    elseif part == 'vehicle_deleter' then
        if IsPedSittingInAnyVehicle(PlayerPedId()) then
            CurrentAction     = 'vehicle_deleter'
            CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to return vehicle to the Patreon shop'
            CurrentActionData = { vehicle = vehicle }
        end
    end

end)

AddEventHandler('esx_patreon:hasExitedMarker', function(part)
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)