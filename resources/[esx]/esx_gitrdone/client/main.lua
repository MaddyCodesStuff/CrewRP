--[[
ORIGINAL CODE BY ESX-ORG / ESX_POLICEJOB
EDITS BY CHIP W
]]

local Keys                          = {
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

local PlayerData                    = {}
local HasAlreadyEnteredMarker       = false
local LastStation, LastPart, LastPartNum, LastEntity
local CurrentAction                 = nil
local CurrentActionMsg              = ''
local CurrentActionData             = {}
local hasAlreadyJoined              = false
local blipsWorkers                  = {}
local isDead                        = false
local CurrentTask                   = {}
local playerInService               = false
local spawnedVehicles, isInShopMenu = {}, false

ESX                                 = nil

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

    PlayerData = ESX.GetPlayerData()
end)

function cleanPlayer(playerPed)
    --	SetPedArmour(playerPed, 0)
    ClearPedBloodDamage(playerPed)
    ResetPedVisibleDamage(playerPed)
    ClearPedLastWeaponDamage(playerPed)
    ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job, playerPed)
    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
            if Config.Uniforms[job].male ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
            else
                ESX.ShowNotification(_U('no_outfit'))
            end

        else
            if Config.Uniforms[job].female ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
            else
                ESX.ShowNotification(_U('no_outfit'))
            end

        end
    end)
end

function OpenCloakroomMenu()

    local playerPed = PlayerPedId()
    local grade     = PlayerData.job.grade_name

    local elements  = {
        { label = _U('citizen_wear'), value = 'citizen_wear' }
    }

    if grade == 'laborer' then
        table.insert(elements, { label = _U('laborer_wear'), value = 'laborer_wear' })
    elseif grade == 'operator' then
        table.insert(elements, { label = _U('operator_wear'), value = 'operator_wear' })
    elseif grade == 'foreman' then
        table.insert(elements, { label = _U('foreman_wear'), value = 'foreman_wear' })
    elseif grade == 'boss' then
        table.insert(elements, { label = _U('boss_wear'), value = 'boss_wear' })
    end

    if Config.EnableNonFreemodePeds then
        table.insert(elements,
                     { label = 'Laborer PPE', value = 'freemode_ped', maleModel = 's_m_y_construct_01', femaleModel = 's_m_y_construct_01' })
        table.insert(elements,
                     { label = 'Operator PPE', value = 'freemode_ped', maleModel = 's_m_y_construct_01', femaleModel = 's_m_y_construct_01' })
        table.insert(elements,
                     { label = 'Foreman PPE', value = 'freemode_ped', maleModel = 's_m_y_construct_01', femaleModel = 's_m_y_construct_01' })
        table.insert(elements,
                     { label = 'Contractor PPE', value = 'freemode_ped', maleModel = 's_m_y_construct_01', femaleModel = 's_m_y_construct_01' })
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
                     {
                         title    = _U('cloakroom'),
                         align    = 'top-left',
                         elements = elements
                     }, function(data, menu)

            cleanPlayer(playerPed)

            if data.current.value == 'citizen_wear' then

                if Config.EnableNonFreemodePeds then
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                        local isMale = skin.sex == 0

                        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                                TriggerEvent('esx:restoreLoadout')
                            end)
                        end)

                    end)
                else
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                end

                if Config.MaxInService ~= -1 then

                    ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
                        if isInService then

                            playerInService    = false

                            local notification = {
                                title    = _U('service_anonunce'),
                                subject  = '',
                                msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
                                iconType = 1
                            }

                            TriggerServerEvent('esx_service:notifyAllInService', notification, 'gitrdone')

                            TriggerServerEvent('esx_service:disableService', 'gitrdone')
                            TriggerEvent('esx_gitrdone:updateBlip')
                            ESX.ShowNotification(_U('service_out'))
                        end
                    end, 'gitrdone')
                end

            end

            if Config.MaxInService ~= -1 and data.current.value ~= 'citizen_wear' then
                local serviceOk = 'waiting'

                ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
                    if not isInService then

                        ESX.TriggerServerCallback('esx_service:enableService',
                                                  function(canTakeService, maxInService, inServiceCount)
                                                      if not canTakeService then
                                                          ESX.ShowNotification(_U('service_max', inServiceCount,
                                                                                  maxInService))
                                                      else

                                                          serviceOk          = true
                                                          playerInService    = true

                                                          local notification = {
                                                              title    = _U('service_anonunce'),
                                                              subject  = '',
                                                              msg      = _U('service_in_announce',
                                                                            GetPlayerName(PlayerId())),
                                                              iconType = 1
                                                          }

                                                          TriggerServerEvent('esx_service:notifyAllInService',
                                                                             notification, 'gitrdone')
                                                          TriggerEvent('esx_gitrdone:updateBlip')
                                                          ESX.ShowNotification(_U('service_in'))
                                                      end
                                                  end, 'gitrdone')

                    else
                        serviceOk = true
                    end
                end, 'gitrdone')

                while type(serviceOk) == 'string' do
                    Citizen.Wait(5)
                end

                -- if we couldn't enter service don't let the player get changed
                if not serviceOk then
                    return
                end
            end

            if
            data.current.value == 'laborer_wear' or
                data.current.value == 'operator_wear' or
                data.current.value == 'foreman_wear' or
                data.current.value == 'boss_wear'
            then
                setUniform(data.current.value, playerPed)
            end

            if data.current.value == 'freemode_ped' then
                local modelHash = ''

                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    if skin.sex == 0 then
                        modelHash = GetHashKey(data.current.maleModel)
                    else
                        modelHash = GetHashKey(data.current.femaleModel)
                    end

                    ESX.Streaming.RequestModel(modelHash, function()
                        SetPlayerModel(PlayerId(), modelHash)
                        SetModelAsNoLongerNeeded(modelHash)

                        TriggerEvent('esx:restoreLoadout')
                    end)
                end)

            end

        end, function(data, menu)
            menu.close()

            CurrentAction     = 'menu_cloakroom'
            CurrentActionMsg  = _U('open_cloackroom')
            CurrentActionData = {}
        end)
end

function OpenVehicleSpawnerMenu(type, station, part, partNum)
    local playerCoords = GetEntityCoords(PlayerPedId())
    PlayerData         = ESX.GetPlayerData()
    local elements     = {
        { label = _U('garage_storeditem'), action = 'garage' },
        { label = _U('garage_storeitem'), action = 'store_garage' },
        { label = _U('garage_buyitem'), action = 'buy_vehicle' }
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle', {
        title    = _U('garage_title'),
        align    = 'top-left',
        elements = elements
    }, function(data, menu)

        if data.current.action == 'buy_vehicle' then
            local shopElements, shopCoords = {}

            if type == 'car' then
                shopCoords               = Config.GitrdoneStations[station].Vehicles[partNum].InsideShop
                local authorizedVehicles = Config.AuthorizedVehicles[PlayerData.job.grade_name]

                if #Config.AuthorizedVehicles['Shared'] > 0 then
                    for k, vehicle in ipairs(Config.AuthorizedVehicles['Shared']) do
                        table.insert(shopElements, {
                            label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label,
                                                                                         _U('shop_item',
                                                                                            ESX.Math.GroupDigits(vehicle.price))),
                            name  = vehicle.label,
                            model = vehicle.model,
                            price = vehicle.price,
                            type  = 'car'
                        })
                    end
                end

                if #authorizedVehicles > 0 then
                    for k, vehicle in ipairs(authorizedVehicles) do
                        table.insert(shopElements, {
                            label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label,
                                                                                         _U('shop_item',
                                                                                            ESX.Math.GroupDigits(vehicle.price))),
                            name  = vehicle.label,
                            model = vehicle.model,
                            price = vehicle.price,
                            type  = 'car'
                        })
                    end
                else
                    if #Config.AuthorizedVehicles['Shared'] == 0 then
                        return
                    end
                end
            end

            OpenShopMenu(shopElements, playerCoords, shopCoords)
        elseif data.current.action == 'garage' then
            local garage = {}

            ESX.TriggerServerCallback('esx_vehicleshop:retrieveJobVehicles', function(jobVehicles)
                if #jobVehicles > 0 then
                    for k, v in ipairs(jobVehicles) do
                        local props       = json.decode(v.vehicle)
                        local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(props.model))
                        local label       = ('%s - <span style="color:darkgoldenrod;">%s</span>: '):format(vehicleName,
                                                                                                           props.plate)

                        if v.stored then
                            label = label .. ('<span style="color:green;">%s</span>'):format(_U('garage_stored'))
                        else
                            label = label .. ('<span style="color:darkred;">%s</span>'):format(_U('garage_notstored'))
                        end

                        table.insert(garage, {
                            label        = label,
                            stored       = v.stored,
                            model        = props.model,
                            vehicleProps = props
                        })
                    end

                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_garage', {
                        title    = _U('garage_title'),
                        align    = 'top-left',
                        elements = garage
                    }, function(data2, menu2)
                        if data2.current.stored then
                            local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(station, part, partNum)

                            if foundSpawn then
                                menu2.close()

                                ESX.Game.SpawnVehicle(data2.current.model, spawnPoint.coords, spawnPoint.heading,
                                                      function(vehicle)
                                                          ESX.Game.SetVehicleProperties(vehicle,
                                                                                        data2.current.vehicleProps)

                                                          TriggerServerEvent('esx_vehicleshop:setJobVehicleState',
                                                                             data2.current.vehicleProps.plate, false)
                                                          ESX.ShowNotification(_U('garage_released'))
                                                      end)
                            end
                        else
                            ESX.ShowNotification(_U('garage_notavailable'))
                        end
                    end, function(data2, menu2)
                        menu2.close()
                    end)

                else
                    ESX.ShowNotification(_U('garage_empty'))
                end
            end, type)

        elseif data.current.action == 'store_garage' then
            StoreNearbyVehicle(playerCoords)
        end

    end, function(data, menu)
        menu.close()
    end)

end

function StoreNearbyVehicle(playerCoords)
    local vehicles, vehiclePlates = ESX.Game.GetVehiclesInArea(playerCoords, 30.0), {}

    if #vehicles > 0 then
        for k, v in ipairs(vehicles) do

            -- Make sure the vehicle we're saving is empty, or else it wont be deleted
            if GetVehicleNumberOfPassengers(v) == 0 and IsVehicleSeatFree(v, -1) then
                table.insert(vehiclePlates, {
                    vehicle = v,
                    plate   = ESX.Math.Trim(GetVehicleNumberPlateText(v))
                })
            end
        end
    else
        ESX.ShowNotification(_U('garage_store_nearby'))
        return
    end

    ESX.TriggerServerCallback('esx_gitrdone:storeNearbyVehicle', function(storeSuccess, foundNum)
        if storeSuccess then
            local vehicleId = vehiclePlates[foundNum]
            local attempts  = 0
            ESX.Game.DeleteVehicle(vehicleId.vehicle)
            IsBusy = true

            Citizen.CreateThread(function()
                while IsBusy do
                    Citizen.Wait(0)
                    drawLoadingText(_U('garage_storing'), 255, 255, 255, 255)
                end
            end)

            -- Workaround for vehicle not deleting when other players are near it.
            while DoesEntityExist(vehicleId.vehicle) do
                Citizen.Wait(500)
                attempts = attempts + 1

                -- Give up
                if attempts > 30 then
                    break
                end

                vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 30.0)
                if #vehicles > 0 then
                    for k, v in ipairs(vehicles) do
                        if ESX.Math.Trim(GetVehicleNumberPlateText(v)) == vehicleId.plate then
                            ESX.Game.DeleteVehicle(v)
                            break
                        end
                    end
                end
            end

            IsBusy = false
            ESX.ShowNotification(_U('garage_has_stored'))
        else
            ESX.ShowNotification(_U('garage_has_notstored'))
        end
    end, vehiclePlates)
end

function GetAvailableVehicleSpawnPoint(station, part, partNum)
    local spawnPoints            = Config.GitrdoneStations[station][part][partNum].SpawnPoints
    local found, foundSpawnPoint = false, nil

    for i = 1, #spawnPoints, 1 do
        if ESX.Game.IsSpawnPointClear(spawnPoints[i].coords, spawnPoints[i].radius) then
            found, foundSpawnPoint = true, spawnPoints[i]
            break
        end
    end

    if found then
        return true, foundSpawnPoint
    else
        ESX.ShowNotification(_U('vehicle_blocked'))
        return false
    end
end

function OpenShopMenu(elements, restoreCoords, shopCoords)
    local playerPed = PlayerPedId()
    isInShopMenu    = true

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
        title    = _U('vehicleshop_title'),
        align    = 'top-left',
        elements = elements
    }, function(data, menu)

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop_confirm',
                         {
                             title    = _U('vehicleshop_confirm', data.current.name, data.current.price),
                             align    = 'top-left',
                             elements = {
                                 { label = _U('confirm_no'), value = 'no' },
                                 { label = _U('confirm_yes'), value = 'yes' }
                             }
                         }, function(data2, menu2)

                if data2.current.value == 'yes' then
                    local newPlate = exports['esx_vehicleshop']:GeneratePlate()
                    local vehicle  = GetVehiclePedIsIn(playerPed, false)
                    local props    = ESX.Game.GetVehicleProperties(vehicle)
                    props.plate    = newPlate

                    ESX.TriggerServerCallback('esx_gitrdone:buyJobVehicle', function(bought)
                        if bought then
                            ESX.ShowNotification(_U('vehicleshop_bought', data.current.name,
                                                    ESX.Math.GroupDigits(data.current.price)))

                            isInShopMenu = false
                            ESX.UI.Menu.CloseAll()

                            DeleteSpawnedVehicles()
                            FreezeEntityPosition(playerPed, false)
                            SetEntityVisible(playerPed, true)

                            ESX.Game.Teleport(playerPed, restoreCoords)
                        else
                            ESX.ShowNotification(_U('vehicleshop_money'))
                            menu2.close()
                        end
                    end, props, data.current.type)
                else
                    menu2.close()
                end

            end, function(data2, menu2)
                menu2.close()
            end)

    end, function(data, menu)
        isInShopMenu = false
        ESX.UI.Menu.CloseAll()

        DeleteSpawnedVehicles()
        FreezeEntityPosition(playerPed, false)
        SetEntityVisible(playerPed, true)

        ESX.Game.Teleport(playerPed, restoreCoords)
    end, function(data, menu)
        DeleteSpawnedVehicles()

        WaitForVehicleToLoad(data.current.model)
        ESX.Game.SpawnLocalVehicle(data.current.model, shopCoords, 0.0, function(vehicle)
            table.insert(spawnedVehicles, vehicle)
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            FreezeEntityPosition(vehicle, true)

            if data.current.livery then
                SetVehicleModKit(vehicle, 0)
                SetVehicleLivery(vehicle, data.current.livery)
            end
        end)
    end)

    WaitForVehicleToLoad(elements[1].model)
    ESX.Game.SpawnLocalVehicle(elements[1].model, shopCoords, 0.0, function(vehicle)
        table.insert(spawnedVehicles, vehicle)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        FreezeEntityPosition(vehicle, true)

        if elements[1].livery then
            SetVehicleModKit(vehicle, 0)
            SetVehicleLivery(vehicle, elements[1].livery)
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isInShopMenu then
            DisableControlAction(0, 75, true)  -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle
        else
            Citizen.Wait(500)
        end
    end
end)

function DeleteSpawnedVehicles()
    while #spawnedVehicles > 0 do
        local vehicle = spawnedVehicles[1]
        ESX.Game.DeleteVehicle(vehicle)
        table.remove(spawnedVehicles, 1)
    end
end

function WaitForVehicleToLoad(modelHash)
    modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)

            DisableControlAction(0, Keys['TOP'], true)
            DisableControlAction(0, Keys['DOWN'], true)
            DisableControlAction(0, Keys['LEFT'], true)
            DisableControlAction(0, Keys['RIGHT'], true)
            DisableControlAction(0, 176, true) -- ENTER key
            DisableControlAction(0, Keys['BACKSPACE'], true)

            drawLoadingText(_U('vehicleshop_awaiting_model'), 255, 255, 255, 255)
        end
    end
end

function drawLoadingText(text, red, green, blue, alpha)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.0, 0.5)
    SetTextColour(red, green, blue, alpha)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.5, 0.5)
end

function OpenGitrdoneActionsMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gitrdone_actions',
                     {
                         title    = 'Gitrdone',
                         align    = 'top-left',
                         elements = {
                             { label = _U('billing'), value = 'billing' },
                             { label = _U('object_spawner'), value = 'object_spawner' }
                         }
                     }, function(data, menu)
            if IsBusy then
                return
            end

            if data.current.value == 'billing' then

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
                    title = _U('invoice_amount')
                }, function(data, menu)
                    local amount = tonumber(data.value)

                    if amount == nil or amount < 0 then
                        ESX.ShowNotification(_U('amount_invalid'))
                    else
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification(_U('no_players_nearby'))
                        else
                            menu.close()
                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer),
                                               'society_clydes', _U('mechanic'), amount)
                        end
                    end
                end, function(data, menu)
                    menu.close()
                end)

            elseif data.current.value == 'object_spawner' then
                ESX.UI.Menu.Open(
                    'default', GetCurrentResourceName(), 'citizen_interaction',
                    {
                        title    = _U('traffic_interaction'),
                        align    = 'top-left',
                        elements = {
                            { label = _U('cone'), value = 'prop_roadcone01a' },
                            { label = _U('cone_2'), value = 'prop_mp_cone_04' },
                            { label = _U('block_pallet_1'), value = 'prop_conc_blocks01a' },
                            { label = _U('block_pallet_2'), value = 'prop_conc_blocks01b' },
                            { label = _U('block_pallet_3'), value = 'prop_conc_blocks01c' },
                            { label = _U('steel_plate_stack'), value = 'prop_metal_plates02' },
                            { label = _U('road_work_ahead_barrier'), value = 'prop_mp_barrier_02' },
                            { label = _U('large_barrier'), value = 'prop_mp_barrier_02b' },
                            { label = _U('cement_mixer'), value = 'prop_cementmixer_01a' },
                            { label = _U('pallet_cement_bags'), value = 'prop_cementbags01' },
                            { label = _U('load_steel_pipe'), value = 'prop_pipes_01b' },
                            { label = _U('load_steel_pipe_2'), value = 'prop_pipes_02b' },
                            { label = _U('load_concrete_pipe'), value = 'prop_pipes_conc_02' },
                            { label = _U('rebar_pile'), value = 'prop_rebar_pile01' },
                            { label = _U('rebar_pipe'), value = 'prop_rebar_pile02' },
                            { label = _U('wheel_barrow'), value = 'prop_wheelbarrow01a' },
                            { label = _U('wood_pile_1'), value = 'prop_woodpile_01a' },
                            { label = _U('wood_pile_2'), value = 'prop_woodpile_01b' },
                            { label = _U('wood_pile_3'), value = 'prop_woodpile_03a' },
                            { label = _U('clean_plywood_pile'), value = 'prop_cons_ply02' },
                            { label = _U('dirty_plywood_pile'), value = 'prop_plywoodpile_01b' },
                            { label = _U('work_light'), value = 'prop_worklight_03b' },
                            { label = _U('barrel_barrier'), value = 'prop_barrier_wat_03a' },
                            { label = _U('small_barrier_1'), value = 'prop_barrier_work01a' },
                            { label = _U('small_barrier_2'), value = 'prop_barrier_work01b' },
                            { label = _U('uneven_pavement_sign'), value = 'prop_barrier_work01d' },
                            { label = _U('medium_barrier'), value = 'prop_barrier_work06a' },
                            { label = _U('medium_barrier_sign'), value = 'prop_barrier_work06b' },
                            { label = _U('portable_generator'), value = 'prop_generator_03a' },
                            { label = _U('portable_generator_lights'), value = 'prop_generator_03b' },
                            { label = _U('blue_plastic_barrel'), value = 'prop_barrel_02a' },
                            { label = _U('steel_beam_stack'), value = 'prop_girder_01b' },
                            { label = _U('2_green_steel_barrels'), value = 'prop_barrel_pile_04' },
                            { label = _U('3_blue_steel_barrels'), value = 'prop_barrel_pile_03' },
                            { label = _U('industrial_dumpster'), value = 'prop_skip_01a' },
                            { label = _U('small_generator'), value = 'prop_generator_01a' },
                            { label = _U('sempty_wooden_cable_spool'), value = 'prop_cablespool_01a' },
                            { label = _U('lempty_wooden_cable_spool'), value = 'prop_cablespool_01b' },
                            { label = _U('black_wooden_cable_spool'), value = 'prop_cablespool_06' },
                            { label = _U('yellow_cable_spool'), value = 'prop_cablespool_02' },
                            { label = _U('portajohn'), value = 'prop_portaloo_01a' },
                            { label = _U('1_section_mesh_fence'), value = 'prop_fnc_omesh_01a' },
                            { label = _U('2_section_mesh_fence'), value = 'prop_fnc_omesh_02a' },
                            { label = _U('3_section_mesh_fence'), value = 'prop_fnc_omesh_03a' },
                            { label = _U('portable_office'), value = 'prop_portacabin01' },
                            { label = _U('tool_container_1'), value = 'prop_container_03a' },
                            { label = _U('tool_container_2'), value = 'prop_container_03b' },
                            { label = _U('tool_container_3'), value = 'prop_container_old1' }
                        }
                    }, function(data2, menu2)
                        local model     = data2.current.value
                        local playerPed = PlayerPedId()
                        local coords    = GetEntityCoords(playerPed)
                        local forward   = GetEntityForwardVector(playerPed)
                        local x, y, z   = table.unpack(coords + forward * 1.0)

                        --if model == 'prop_roadcone02a' then
                        --	z = z - 2.0
                        --end

                        ESX.Game.SpawnObject(model, {
                            x = x,
                            y = y,
                            z = z
                        }, function(obj)
                            SetEntityHeading(obj, GetEntityHeading(playerPed))
                            PlaceObjectOnGroundProperly(obj)
                        end)

                    end, function(data2, menu2)
                        menu2.close()
                    end)
            end

        end, function(data, menu)
            menu.close()
        end)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job

    Citizen.Wait(5000)
    TriggerServerEvent('esx_gitrdone:forceBlip')
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
    local specialContact = {
        name       = _U('phone_gitrdone'),
        number     = 'gitrdone',
        base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAgCAYAAADjaQM7AAAEAUlEQVRIibWWW2hcVRSGv3VmkkymyUwuxphLHQw1Wpt4KS1CFC1oK1p9sFQsUrxiFVERfBMFQUVE6x1BlCo0LyIiEilirWK9VHxRaVrUJ5PGdhqaaTOTmclMzuwtO+4zHI+T5CS0PxzW2Ze1/r3WvqwlyZ0fsQw8CrwFnAC6gGeA58OqOyHnCbAFeNK2u6zcBdxsx5dENMScdmAUuKDG2GpgH5ABBoHjK/GszhoySC5A5EebXRTW6/rlkL0NvGf/3SWIPFSsfBN4JSzZA3Yvpm071H74kAUeA+5aiuwq4H37X7JShyTx5s1aOQxcvBjZq4sYWQoqMG4isnshsluATb72OisvCkk2EJAGtwHX1CK7L6C8HjgGfBaSbA8wDlwX6K/unXfPjMtX1zDQG5LIIGG/IIa8tufZGt+9OtsY8F4cj2ztOSLCRq/fI7sR+OQckhl8AWx2ZiX2uGGX0Cd8RYiVJPac06oyD+ckMVmmnrNNaOzNUUdWktmkOn13ZNu6uj6B3Sel+0xeEps0Ig4qdO4JQiMoosxKjIIkXAf17GXq8P1D6uB5UdDfbaj8mOnVY1snJLX3hNO9Nkdi4wzN2yPiXh7XM+gQ1MaLvDShtPNznMKnHWryl06d/r1Xj8W71N/flCTWFy0RK5alIdWhTo72cOy3nEp8mCNxsCjx4dHIlfm0dKeS+kybhlZ7jxp8T1jJPtiZaWmd6lYTEwPq1/ZGXehrIru+Sc+8XKZhMCtJ43HGHIyi0SrIKvI0XRHFfa2dUzSq/KFuPTG0P7p18rikSOgpTHi1LwkYb0zAs9JOj/6LzZXPievCgYLEB+eo57S0Vc+BoMsmPl9Z3XFDXCFCkUam5PwNEdyem9wR1qgj8waz0kJR4tVvWlrm+/vVKFvcERx01ynpuGSWRowdQZfsk2dwyFy4B4GHbPLbDnz870pU3QzNd8R1/vXr3QN0RtJMyIW4ROdXazyso8xqPU5/5SgViZInfo+D8mdpY3svEDFZQXbs+F+O+9OXh6Y1cmmESnqVzuGKMd9QDWE9JSLaJS/NxpNeQR8Fmq1uxmaMrGe41jF7x/efFPR+hZPMSRITHv8RLxLH9CucNkF/6SPC5sas33AtsuA7OWDjvksjEbMX3qcRsw2P2PGg3mDQcLCU+wC4t8YCzIrfBV4CvrchMtXUtbb6qoU7bZW1rRbZwAJEfrQAty4xx4/b7YLMAv8TRlOIvhGY/BPwlC23F4PZm6eBrwNz9nhEQTKDJ3yEf9j08yKQAnb6yjsPZbtnncALwA3mPtmxYVsWVlHr6GOLnyPAWKD/20CN8YMNkx+met5oc9icf2ChWt/U7ytFGhippbzcTHLYyryV5hKHA/APwR03GmXbPREAAAAASUVORK5CYII='
    }

    TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
    if type(PlayerData.job.name) == 'string' and PlayerData.job.name == 'gitrdone' and PlayerData.job.name == dispatchNumber then
        -- if esx_service is enabled
        if Config.MaxInService ~= -1 and not playerInService then
            CancelEvent()
        end
    end
end)

AddEventHandler('esx_gitrdone:hasEnteredMarker', function(station, part, partNum)

    if part == 'Cloakroom' then
        CurrentAction     = 'menu_cloakroom'
        CurrentActionMsg  = _U('open_cloackroom')
        CurrentActionData = {}

    elseif part == 'Vehicles' then

        CurrentAction     = 'menu_vehicle_spawner'
        CurrentActionMsg  = _U('garage_prompt')
        CurrentActionData = { station = station, part = part, partNum = partNum }

    elseif part == 'BossActions' then

        CurrentAction     = 'menu_boss_actions'
        CurrentActionMsg  = _U('open_bossmenu')
        CurrentActionData = {}

    end

end)

AddEventHandler('esx_gitrdone:hasExitedMarker', function(station, part, partNum)
    if not isInShopMenu then
        ESX.UI.Menu.CloseAll()
    end

    CurrentAction = nil
end)

AddEventHandler('esx_gitrdone:hasEnteredEntityZone', function(entity)
    local playerPed = PlayerPedId()

    if PlayerData.job ~= nil and PlayerData.job.name == 'gitrdone' and IsPedOnFoot(playerPed) then
        CurrentAction     = 'remove_entity'
        CurrentActionMsg  = _U('remove_prop')
        CurrentActionData = { entity = entity }
    end

end)

AddEventHandler('esx_gitrdone:hasExitedEntityZone', function(entity)
    if CurrentAction == 'remove_entity' then
        CurrentAction = nil
    end
end)

-- Create blips
Citizen.CreateThread(function()

    for k, v in pairs(Config.GitrdoneStations) do
        local blip = AddBlipForCoord(v.Blip.Coords)

        SetBlipSprite(blip, v.Blip.Sprite)
        SetBlipDisplay(blip, v.Blip.Display)
        SetBlipScale(blip, v.Blip.Scale)
        SetBlipColour(blip, v.Blip.Colour)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(_U('map_blip'))
        EndTextCommandSetBlipName(blip)
    end

end)

-- Display markers
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(0)

        if PlayerData.job ~= nil and PlayerData.job.name == 'gitrdone' then

            local playerPed             = PlayerPedId()
            local coords                = GetEntityCoords(playerPed)
            local isInMarker, hasExited = false, false
            local currentStation, currentPart, currentPartNum

            for k, v in pairs(Config.GitrdoneStations) do

                for i = 1, #v.Cloakrooms, 1 do
                    local distance = GetDistanceBetweenCoords(coords, v.Cloakrooms[i], true)

                    if distance < Config.DrawDistance then
                        DrawMarker(20, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r,
                                   Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false,
                                   false)
                    end

                    if distance < Config.MarkerSize.x then
                        isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
                    end
                end

                for i = 1, #v.Vehicles, 1 do
                    local distance = GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner, true)

                    if distance < Config.DrawDistance then
                        DrawMarker(36, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0,
                                   Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true,
                                   2, true, false, false, false)
                    end

                    if distance < Config.MarkerSize.x then
                        isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Vehicles', i
                    end
                end

                if Config.EnablePlayerManagement and PlayerData.job.grade_name == 'boss' then
                    for i = 1, #v.BossActions, 1 do
                        local distance = GetDistanceBetweenCoords(coords, v.BossActions[i], true)

                        if distance < Config.DrawDistance then
                            DrawMarker(21, v.BossActions[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0,
                                       Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false,
                                       true, 2, true, false, false, false)
                        end

                        if distance < Config.MarkerSize.x then
                            isInMarker, currentStation, currentPart, currentPartNum = true, k, 'BossActions', i
                        end
                    end
                end

                if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

                    if
                    (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
                        (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
                    then
                        TriggerEvent('esx_gitrdone:hasExitedMarker', LastStation, LastPart, LastPartNum)
                        hasExited = true
                    end

                    HasAlreadyEnteredMarker = true
                    LastStation             = currentStation
                    LastPart                = currentPart
                    LastPartNum             = currentPartNum

                    TriggerEvent('esx_gitrdone:hasEnteredMarker', currentStation, currentPart, currentPartNum)
                end

                if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
                    HasAlreadyEnteredMarker = false
                    TriggerEvent('esx_gitrdone:hasExitedMarker', LastStation, LastPart, LastPartNum)
                end

            end

        else
            Citizen.Wait(500)
        end

    end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()
    local trackedEntities = {
        'prop_roadcone01a',
        'prop_mp_cone_04',
        'prop_conc_blocks01a',
        'prop_conc_blocks01b',
        'prop_conc_blocks01c',
        'prop_metal_plates02',
        'prop_mp_barrier_02',
        'prop_mp_barrier_02b',
        'prop_cementmixer_01a',
        'prop_cementbags01',
        'prop_pipes_01b',
        'prop_pipes_02b',
        'prop_pipes_conc_02',
        'prop_rebar_pile01',
        'prop_rebar_pile02',
        'prop_wheelbarrow01a',
        'prop_woodpile_01a',
        'prop_woodpile_01b',
        'prop_woodpile_03a',
        'prop_cons_ply02',
        'prop_plywoodpile_01b',
        'prop_worklight_03b',
        'prop_barrier_wat_03a',
        'prop_barrier_work01a',
        'prop_barrier_work01b',
        'prop_barrier_work01d',
        'prop_barrier_work06a',
        'prop_barrier_work06b',
        'prop_generator_03a',
        'prop_generator_03b',
        'prop_barrel_02a',
        'prop_girder_01b',
        'prop_barrel_pile_04',
        'prop_barrel_pile_03',
        'prop_skip_01a',
        'prop_generator_01a',
        'prop_cablespool_01a',
        'prop_cablespool_01b',
        'prop_cablespool_06',
        'prop_cablespool_02',
        'prop_portaloo_01a',
        'prop_fnc_omesh_01a',
        'prop_fnc_omesh_02a',
        'prop_fnc_omesh_03a',
        'prop_portacabin01',
        'prop_container_03a',
        'prop_container_03b',
        'prop_container_old1'
    }

    while true do
        Citizen.Wait(500)

        local playerPed       = PlayerPedId()
        local coords          = GetEntityCoords(playerPed)

        local closestDistance = -1
        local closestEntity   = nil

        for i = 1, #trackedEntities, 1 do
            local object = GetClosestObjectOfType(coords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

            if DoesEntityExist(object) then
                local objCoords = GetEntityCoords(object)
                local distance  = GetDistanceBetweenCoords(coords, objCoords, true)

                if closestDistance == -1 or closestDistance > distance then
                    closestDistance = distance
                    closestEntity   = object
                end
            end
        end

        if closestDistance ~= -1 and closestDistance <= 3.0 then
            if LastEntity ~= closestEntity then
                TriggerEvent('esx_gitrdone:hasEnteredEntityZone', closestEntity)
                LastEntity = closestEntity
            end
        else
            if LastEntity ~= nil then
                TriggerEvent('esx_gitrdone:hasExitedEntityZone', LastEntity)
                LastEntity = nil
            end
        end
    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(0)

        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)

            if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'gitrdone' then

                if CurrentAction == 'menu_cloakroom' then
                    OpenCloakroomMenu()
                elseif CurrentAction == 'menu_vehicle_spawner' then
                    if Config.MaxInService == -1 then
                        OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part,
                                               CurrentActionData.partNum)
                    elseif playerInService then
                        OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part,
                                               CurrentActionData.partNum)
                    else
                        ESX.ShowNotification(_U('service_not'))
                    end
                elseif CurrentAction == 'delete_vehicle' then
                    ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
                elseif CurrentAction == 'menu_boss_actions' then
                    ESX.UI.Menu.CloseAll()
                    TriggerEvent('esx_society:openBossMenu', 'gitrdone', function(data, menu)
                        menu.close()

                        CurrentAction     = 'menu_boss_actions'
                        CurrentActionMsg  = _U('open_bossmenu')
                        CurrentActionData = {}
                    end, { wash = false }) -- disable washing money
                elseif CurrentAction == 'remove_entity' then
                    DeleteEntity(CurrentActionData.entity)
                end

                CurrentAction = nil
            end
        end -- CurrentAction end

        if IsControlJustReleased(0,
                                 Keys['F6']) and not isDead and PlayerData.job ~= nil and PlayerData.job.name == 'gitrdone' and not ESX.UI.Menu.IsOpen('default',
                                                                                                                                                       GetCurrentResourceName(),
                                                                                                                                                       'gitrdone_actions') then
            if Config.MaxInService == -1 then
                OpenGitrdoneActionsMenu()
            elseif playerInService then
                OpenGitrdoneActionsMenu()
            else
                ESX.ShowNotification(_U('service_not'))
            end
        end

        if IsControlJustReleased(0, Keys['E']) and CurrentTask.Busy then
            ESX.ShowNotification(_U('impound_canceled'))
            ESX.ClearTimeout(CurrentTask.Task)
            ClearPedTasks(PlayerPedId())

            CurrentTask.Busy = false
        end
    end
end)

-- Create blip for colleagues
function createBlip(id)
    local ped  = GetPlayerPed(id)
    local blip = GetBlipFromEntity(ped)

    if not DoesBlipExist(blip) then
        -- Add blip and create head display on player
        blip = AddBlipForEntity(ped)
        SetBlipSprite(blip, 1)
        ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
        SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
        SetBlipNameToPlayerName(blip, id) -- update blip name
        SetBlipScale(blip, 0.85) -- set scale
        SetBlipAsShortRange(blip, true)

        table.insert(blipsWorkers, blip) -- add blip to array so we can remove it later
    end
end

RegisterNetEvent('esx_gitrdone:updateBlip')
AddEventHandler('esx_gitrdone:updateBlip', function()

    -- Refresh all blips
    for k, existingBlip in pairs(blipsWorkers) do
        RemoveBlip(existingBlip)
    end

    -- Clean the blip table
    blipsWorkers = {}

    -- Enable blip?
    if Config.MaxInService ~= -1 and not playerInService then
        return
    end

    if not Config.EnableJobBlip then
        return
    end

    -- Is the player a cop? In that case show all the blips for other cops
    if PlayerData.job ~= nil and PlayerData.job.name == 'gitrdone' then
        ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
            for i = 1, #players, 1 do
                if players[i].job.name == 'gitrdone' then
                    local id = GetPlayerFromServerId(players[i].source)
                    if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
                        createBlip(id)
                    end
                end
            end
        end)
    end

end)
