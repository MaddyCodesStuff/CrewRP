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
local GUI                     = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local currentPart
local OnJob                   = false
local TargetCoords            = nil
local CurrentlyTowedVehicle   = nil
local Blips                   = {}
local NPCOnJob                = false
local NPCTargetTowable        = true
local NPCTargetTowableZone    = nil
local NPCHasSpawnedTowable    = false
local NPCLastCancel           = GetGameTimer() - 5 * 60000
local NPCHasBeenNextToTowable = false
local towSpawn                = {}
ESX                           = nil
GUI.Time                      = 0

itemQuantity                  = nil

local flatbeds                = {
  1353720154,
  520436975
}

local towtrucks               = {
  1353720154,
  -1323100960,
  -442313018
}

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

function SelectRandomTowable()

  local index = GetRandomIntInRange(1, #Config.Towables)

  for k, v in pairs(Config.Zones) do
    if v.Pos.x == Config.Towables[index].x and v.Pos.y == Config.Towables[index].y and v.Pos.z == Config.Towables[index].z then
      return k
    end
  end

end

function StartNPCJob()

  NPCOnJob                      = true

  NPCTargetTowableZone          = SelectRandomTowable()
  local zone                    = Config.Zones[NPCTargetTowableZone]

  Blips['NPCTargetTowableZone'] = AddBlipForCoord(zone.Pos.x, zone.Pos.y, zone.Pos.z)
  SetBlipRoute(Blips['NPCTargetTowableZone'], true)

  ESX.ShowNotification(_U('drive_to_indicated'))
end

function StopNPCJob(cancel)

  if Blips['NPCTargetTowableZone'] ~= nil then
    RemoveBlip(Blips['NPCTargetTowableZone'])
    Blips['NPCTargetTowableZone'] = nil
  end

  if Blips['NPCDelivery'] ~= nil then
    RemoveBlip(Blips['NPCDelivery'])
    Blips['NPCDelivery'] = nil
  end

  Config.Zones.VehicleDelivery.Type = -1

  NPCOnJob                          = false
  NPCTargetTowable                  = nil
  NPCTargetTowableZone              = nil
  NPCHasSpawnedTowable              = false
  NPCHasBeenNextToTowable           = false

  if cancel then
    ESX.ShowNotification(_U('mission_canceled'))
  else
    TriggerServerEvent('esx_mecanojob:onNPCJobCompleted')
  end

end

function OpenMecanoActionsMenu()

  local elements = {
    { label = _U('vehicle_list'), value = 'vehicle_list' },
    { label = _U('work_wear'), value = 'cloakroom' },
    { label = _U('civ_wear'), value = 'cloakroom2' },
    { label = _U('deposit_stock'), value = 'put_stock' },
    { label = _U('withdraw_stock'), value = 'get_stock' },
  }
  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
    table.insert(elements, { label = _U('boss_actions'), value = 'boss_actions' })
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mecano_actions',
    {
      title    = _U('mechanic'),
      align    = 'top-right',
      elements = elements
    },
    function(data, menu)
      if data.current.value == 'vehicle_list' then

        if Config.EnableSocietyOwnedVehicles then

          local elements = {}

          ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

            for i = 1, #vehicles, 1 do
              table.insert(elements,
                           { label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i] })
            end

            ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'vehicle_spawner',
              {
                title    = _U('service_vehicle'),
                align    = 'top-right',
                elements = elements,
              },
              function(data, menu)

                menu.close()

                local vehicleProps = data.current.value

                ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
                  ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
                  local playerPed = GetPlayerPed(-1)
                  TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                end)

                TriggerServerEvent('esx_society:removeVehicleFromGarage', 'mecano', vehicleProps)

              end,
              function(data, menu)
                menu.close()
              end
            )

          end, 'mecano')

        else

          local elements = {
            { label = _U('flat_bed'), value = 'flatbed' },
            { label = _U('tow_truck'), value = 'towtruck2' }
          }

          if Config.EnablePlayerManagement and PlayerData.job ~= nil and
            (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'chef' or PlayerData.job.grade_name == 'experimente') then
            table.insert(elements, { label = 'SlamVan', value = 'slamvan3' })
          end

          ESX.UI.Menu.CloseAll()

          ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'spawn_vehicle',
            {
              title    = _U('service_vehicle'),
              elements = elements
            },
            function(data, menu)
              for i = 1, #elements, 1 do
                if Config.MaxInService == -1 then
                  ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
                    local playerPed = GetPlayerPed(-1)
                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                  end)
                  break
                else
                  ESX.TriggerServerCallback('esx_service:enableService',
                                            function(canTakeService, maxInService, inServiceCount)
                                              if canTakeService then
                                                ESX.Game.SpawnVehicle(data.current.value,
                                                                      Config.Zones.VehicleSpawnPoint.Pos, 90.0,
                                                                      function(vehicle)
                                                                        local playerPed = GetPlayerPed(-1)
                                                                        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                                      end)
                                              else
                                                ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
                                              end
                                            end, 'mecano')
                  break
                end
              end
              menu.close()
            end,
            function(data, menu)
              menu.close()
              OpenMecanoActionsMenu()
            end
          )

        end
      end

      if data.current.value == 'cloakroom' then
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

          if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
          else
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
          end

        end)
      end

      if data.current.value == 'cloakroom2' then
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

          TriggerEvent('skinchanger:loadSkin', skin)

        end)
      end

      if data.current.value == 'put_stock' then
        OpenPutStocksMenu()
      end

      if data.current.value == 'get_stock' then
        OpenGetStocksMenu()
      end

      if data.current.value == 'boss_actions' then
        TriggerEvent('esx_society:openBossMenu', 'mecano', function(data, menu)
          menu.close()
        end)
      end

    end,
    function(data, menu)
      menu.close()
      CurrentAction     = 'mecano_actions_menu'
      CurrentActionMsg  = _U('open_actions')
      CurrentActionData = {}
    end
  )
end


function OpenTowMenu()
  local elements = {
    { label = 'Flatbed', value = 'flatbed' },
    --{label = 'Towtruck', value = 'towtruck'}
  }

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mecano_tow',
    {
      title    = 'Spawn towtruck',
      align    = 'top-right',
      elements = elements
    }, function(data, menu)
      if data.current.value == 'flatbed' then
        ESX.Game.SpawnVehicle(data.current.value, towSpawn.Pos, towSpawn.Heading, function(vehicle)
          TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
          SetVehicleFuelLevel(vehicle, 100)
          ESX.UI.Menu.CloseAll()
        end)
        --elseif data.current.value == 'towtruck' then
        -- ESX.Game.SpawnVehicle(data.current.value, towSpawn.Pos, towSpawn.Heading, function(vehicle)
        --    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        --    SetVehicleFuelLevel(vehicle, 100)
        --    ESX.UI.Menu.CloseAll()
        --  end)
      end
    end,
    function(data, menu)
      menu.close()
    end
  )
end


RegisterNetEvent('esx_mecanojob:onHijack')
AddEventHandler('esx_mecanojob:onHijack', function()
  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    local crochete = math.random(100)
    local alarm    = math.random(100)

    if DoesEntityExist(vehicle) then
      if alarm <= 33 then
        SetVehicleAlarm(vehicle, true)
        StartVehicleAlarm(vehicle)
      end
      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
      Citizen.CreateThread(function()
        Citizen.Wait(10000)
        if crochete <= 66 then
          SetVehicleDoorsLocked(vehicle, 1)
          SetVehicleDoorsLockedForAllPlayers(vehicle, false)
          ClearPedTasksImmediately(playerPed)
          ESX.ShowNotification(_U('veh_unlocked'))
        else
          ESX.ShowNotification(_U('hijack_failed'))
          ClearPedTasksImmediately(playerPed)
        end
      end)
    end

  end
end)

RegisterNetEvent('esx_mechanicjob:repair_vehicle')
AddEventHandler('esx_mechanicjob:repair_vehicle', function()
  local playerPed     = GetPlayerPed(-1)
  local coords        = GetEntityCoords(playerPed)
  local frontVehicle  = GetVehicleInFront()
  local hoodBoneCoords= GetWorldPositionOfEntityBone(frontVehicle, GetEntityBoneIndexByName(frontVehicle, 'engine'))

  if PlayerData.job == nil or PlayerData.job.name ~= 'mecano' then
    TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'Only mechanics can use Advanced Repair Kits' })
  elseif frontVehicle == 0 or #(coords - hoodBoneCoords) > 2.5 then
    TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'You aren\'t close to any vehicles' })
  else
    SetVehicleDoorOpen(frontVehicle, 4)
    SetVehicleDoorOpen(frontVehicle, 4)
    SetVehicleUndriveable(frontVehicle, true)
    SetVehicleEngineOn(frontVehicle, false, true)
    exports['mythic_progbar']:Progress({
                                         name            = "firstaid_action",
                                         duration        = 10000,
                                         label           = "Repairing Car",
                                         useWhileDead    = false,
                                         canCancel       = false,
                                         controlDisables = {
                                           disableMovement    = true,
                                           disableCarMovement = true,
                                           disableMouse       = false,
                                           disableCombat      = true,
                                         },
                                         animation       = {
                                           animDict = "mini@repair",
                                           anim     = "fixing_a_ped",
                                           flags    = 49,
                                         },
                                         prop            = {
                                           model = "prop_tool_spanner03",
                                         }
                                       }, function(status)
      if not status then
        TriggerServerEvent('esx_mechanicjob:sendRepairNet', NetworkGetNetworkIdFromEntity(frontVehicle), "full", false)
        ClearPedTasksImmediately(playerPed)
        TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'Vehicle repaired' })
      end
    end)
  end
end)

RegisterNetEvent('esx_mechanicjob:basic_repair')
AddEventHandler('esx_mechanicjob:basic_repair', function()
  local playerPed     = GetPlayerPed(-1)
  local coords        = GetEntityCoords(playerPed)
  local vehicle       = GetVehicleInFront()
  local hoodBoneCoords= GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, 'engine'))

  if vehicle == 0 or #(coords - hoodBoneCoords) > 2.5 then
    TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'You aren\'t close to any vehicles.' })
  elseif GetVehicleEngineHealth(vehicle) < 265.0 then
    SetVehicleDoorOpen(vehicle, 4)
    SetVehicleDoorOpen(vehicle, 4)
    SetVehicleUndriveable(vehicle, true)
    SetVehicleEngineOn(vehicle, false, true)

    exports['mythic_progbar']:Progress({
                                         name            = "repair_action",
                                         duration        = 20000,
                                         label           = "Repairing Car",
                                         useWhileDead    = false,
                                         canCancel       = false,
                                         controlDisables = {
                                           disableMovement    = true,
                                           disableCarMovement = true,
                                           disableMouse       = false,
                                           disableCombat      = true,
                                         },
                                         animation       = {
                                           animDict = "mini@repair",
                                           anim     = "fixing_a_ped",
                                           flags    = 49,
                                         },
                                         prop            = {
                                           model = "prop_tool_spanner03",
                                         }
                                       }, function(status)
      if not status then
        TriggerServerEvent('esx_mechanicjob:sendRepairNet', NetworkGetNetworkIdFromEntity(vehicle), "basic", PlayerData.job ~= nil and PlayerData.job.name == 'police')
        TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'Patched \'er up... now get to a mechanic!' })
      end
    end)

    TriggerServerEvent('esx_mechanicjob:takeItem', 'repairkit_basic', 1)
  else
    TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'Couldn\'t fix your vehicle. She\'s too far gone.' })
  end
end)

RegisterNetEvent('esx_mechanicjob:netRepairVehicle')
AddEventHandler('esx_mechanicjob:netRepairVehicle', function(vehicle, type, police)
  vehicle = NetworkGetEntityFromNetworkId(vehicle)
  local vehicleFuel = GetVehicleFuelLevel(vehicle) -- get the current fuel level
  if type == "full" then
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineOn(vehicle, true, true)
    SetVehicleDoorShut(vehicle, 4)
    SetVehicleFuelLevel(vehicle, vehicleFuel) -- restore the original fuel level
  elseif type == "basic" then
    SetVehicleAutoRepairDisabled(vehicle, true) -- This should stop cars from losing their fuel when they are auto-repaired
    SetVehicleUndriveable(vehicle, false)
    if police then
      SetVehicleEngineHealth(vehicle, 550.0)
      SetVehiclePetrolTankHealth(vehicle, 850.0)
    else
      SetVehicleEngineHealth(vehicle, 350.0)
      SetVehiclePetrolTankHealth(vehicle, 750.0)
    end
    SetVehicleEngineOn(vehicle, true, false)
    SetVehicleOilLevel(vehicle, GetVehicleOilLevel(vehicle) + 5.0)
    SetVehicleFuelLevel(vehicle, vehicleFuel) -- restore the original fuel level
    for i = 1, 6, 1 do
      SetVehicleTyreFixed(vehicle, i - 1)
    end
  end
end)

RegisterNetEvent('esx_mechanicjob:carcleaner')
AddEventHandler('esx_mechanicjob:carcleaner', function()
  local playerPed     = GetPlayerPed(-1)
  local coords        = GetEntityCoords(playerPed)
  local vehicle       = GetVehicleInFront()
  local vehicleCoords = GetEntityCoords(vehicle)

  if vehicle == 0 or GetDistanceBetweenCoords(coords.x, coords.y, coords.z, vehicleCoords.x, vehicleCoords.y,vehicleCoords.z, false) > 2.5 then
    TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'You aren\'t close to any vehicles.' })
  elseif GetVehicleDirtLevel(vehicle) < 1.0 then
    TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'Well your car was already clean...' })
  elseif GetVehicleDirtLevel(vehicle) <= 15.0 then
                exports['mythic_progbar']:Progress({
                                                    name            = "clean_action",
                                                    duration        = 10000,
                                                    label           = "Cleaning",
                                                    useWhileDead    = false,
                                                    canCancel       = false,
                                                    controlDisables = {
                                                        disableMovement    = false,
                                                        disableCarMovement = true,
                                                        disableMouse       = false,
                                                        disableCombat      = true,
                                                    },
                                                    animation       = {
                                                      animDict = "amb@world_human_maid_clean@",
                                                      anim     = "idle_b",
                                                    },
                                                    prop            = {
                                                      model = "prop_sponge_01",
                                                      bone      = 28422,
                                                      coords = { x = 0.0, y = 0.05, z = -0.02},
                                                      rotation = { x = 90.0, y = 30.0, z = 0.0 },
                                                    }
                                                }, function(status)
                                                end)
    Wait(10000)
    SetVehicleDirtLevel(vehicle, 0.1)
    TriggerServerEvent('esx_mechanicjob:takeItem', 'carcleaner', 1)
    TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'This car is all shiny!' })
  end
end)

function setEntityHeadingFromEntity (vehicle, playerPed)
  local heading = GetEntityHeading(vehicle)
  SetEntityHeading(playerPed, heading)
end

function getVehicleInDirection(coordFrom, coordTo)
  local rayHandle           = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y,
                                                  coordTo.z, 10,
                                                  GetPlayerPed(-1), 0)
  local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
  return vehicle
end

function deleteCar(entity)
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

AddEventHandler('esx_mecanojob:hasEnteredMarker', function(zone)

  if zone == NPCJobTargetTowable then

  end

  if zone == 'MecanoActions' then
    CurrentAction     = 'mecano_actions_menu'
    CurrentActionMsg  = _U('open_actions')
    CurrentActionData = {}
  end

  if zone == 'Garage' then
    CurrentAction     = 'mecano_harvest_menu'
    CurrentActionMsg  = _U('harvest_menu')
    CurrentActionData = {}
  end

  if zone == 'Craft' then
    CurrentAction     = 'mecano_craft_menu'
    CurrentActionMsg  = _U('craft_menu')
    CurrentActionData = {}
  end

  if zone == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then

      local vehicle     = GetVehiclePedIsIn(playerPed, false)

      CurrentAction     = 'delete_vehicle'
      CurrentActionMsg  = _U('veh_stored')
      CurrentActionData = { vehicle = vehicle }
    end
  end

end)

AddEventHandler('esx_mecanojob:hasExitedMarker', function(zone)

  if zone == 'Craft' then
    TriggerServerEvent('esx_mecanojob:stopCraft')
    TriggerServerEvent('esx_mecanojob:stopCraft2')
    TriggerServerEvent('esx_mecanojob:stopCraft3')
  end

  if zone == 'Garage' then
    TriggerServerEvent('esx_mecanojob:stopHarvest')
    TriggerServerEvent('esx_mecanojob:stopHarvest2')
    TriggerServerEvent('esx_mecanojob:stopHarvest3')
  end

  CurrentAction = nil
  ESX.UI.Menu.CloseAll()
end)

AddEventHandler('esx_mecanojob:hasEnteredEntityZone', function(entity)

  local playerPed = GetPlayerPed(-1)

  if PlayerData.job ~= nil and PlayerData.job.name == 'mecano' and not IsPedInAnyVehicle(playerPed, false) then
    CurrentAction     = 'remove_entity'
    CurrentActionMsg  = _U('press_remove_obj')
    CurrentActionData = { entity = entity }
  end

end)

AddEventHandler('esx_mecanojob:hasExitedEntityZone', function(entity)

  if CurrentAction == 'remove_entity' then
    CurrentAction = nil
  end

end)



-- Pop NPC mission vehicle when inside area
Citizen.CreateThread(function()
  while true do

    Wait(0)

    if NPCTargetTowableZone ~= nil and not NPCHasSpawnedTowable then

      local coords = GetEntityCoords(GetPlayerPed(-1))
      local zone   = Config.Zones[NPCTargetTowableZone]

      if GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < Config.NPCSpawnDistance then

        local model = Config.Vehicles[GetRandomIntInRange(1, #Config.Vehicles)]

        ESX.Game.SpawnVehicle(model, zone.Pos, 0, function(vehicle)
          NPCTargetTowable = vehicle
        end)

        NPCHasSpawnedTowable = true

      end

    end

    if NPCTargetTowableZone ~= nil and NPCHasSpawnedTowable and not NPCHasBeenNextToTowable then

      local coords = GetEntityCoords(GetPlayerPed(-1))
      local zone   = Config.Zones[NPCTargetTowableZone]

      if (GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < Config.NPCNextToDistance) then
        ESX.ShowNotification(_U('please_tow'))
        NPCHasBeenNextToTowable = true
      end

    end

  end
end)

-- Create Blips
Citizen.CreateThread(function()
  Citizen.Wait(1)

  --if PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then

  for k, v in pairs(Config.Impounds) do
    local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)
    SetBlipSprite(blip, v.Blip.Sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, v.Blip.Color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Impound Lot')
    EndTextCommandSetBlipName(blip)
  end

  --[[for k, v in pairs(Config.VehicleSpawners) do
    local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)
    SetBlipSprite(blip, v.Blip.Sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, v.Blip.Color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Mechanic Garage')
    EndTextCommandSetBlipName(blip)
  end
  --end]]--
end)

-- Display markers
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords = GetEntityCoords(GetPlayerPed(-1))

    if PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then
      local coords = GetEntityCoords(GetPlayerPed(-1))

      for k, v in pairs(Config.VehicleSpawners) do
        if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
          DrawMarker(v.Marker.Sprite, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Marker.Size.x,
                     v.Marker.Size.y, v.Marker.Size.z, v.Marker.Color.r, v.Marker.Color.g, v.Marker.Color.b, 100, false,
                     true, 2, false, false, false, false)

          if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Marker.Size.x) then
            isInMarker  = true
            currentPart = 'spawn'
            towSpawn    = v.CarSpawn
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to spawn a tow truck")
          else
            isInMarker  = false
            currentPart = ''
            towSpawn    = {}
          end
        end
      end

      for k, v in pairs(Config.VehicleDeleters) do
        if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
          DrawMarker(v.Marker.Sprite, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Marker.Size.x,
                     v.Marker.Size.y, v.Marker.Size.z, v.Marker.Color.r, v.Marker.Color.g, v.Marker.Color.b, 100, false,
                     true, 2, false, false, false, false)

          if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z,
                                       true) < v.Marker.Size.x) and IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
            isInMarker  = true
            currentPart = 'delete'
            towSpawn    = {}
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to store tow truck")
            -- else
            --   isInMarker = false
            --   currentPart = ''
            --   towSpawn = {}
          end
        end
      end

      for k, v in pairs(Config.Zones.Crafts) do
        if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
          DrawMarker(v.Marker.Sprite, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y,
                     v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)

          if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
            isInMarker  = true
            currentPart = 'crafting'
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to craft mechanics tools")
          end
        end
      end

    end

    for k, v in pairs(Config.Impounds) do
      if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(v.Marker.Sprite, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Marker.Size.x,
                   v.Marker.Size.y, v.Marker.Size.z, v.Marker.Color.r, v.Marker.Color.g, v.Marker.Color.b, 100, false,
                   true, 2, false, false, false, false)
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    if IsControlJustPressed(0, Keys['E']) and isInMarker and currentPart == 'spawn' then
      OpenTowMenu()
    elseif IsControlJustPressed(0, Keys['E']) and isInMarker and currentPart == 'delete' then

      local currentVehicle = GetVehiclePedIsIn(PlayerPedId(-1), false)
      tow                  = false
      for key, value in pairs(towtrucks) do
        if value == GetEntityModel(currentVehicle) then
          tow = true
        end
      end

      if tow then
        ESX.Game.DeleteVehicle(currentVehicle)
        TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'Towtruck returned!' })
      else
        TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = 'This isn\'t a towtruck!' })
      end
    elseif IsControlJustPressed(0, Keys['E']) and isInMarker and currentPart == 'crafting' then
      OpenMecanoCraftMenu()
    end
  end
end)

function GetVehicleInFront()
  local plyPed = PlayerPedId()
  local plyCoords           = GetEntityCoords(plyPed, false)
  local plyOffset           = GetOffsetFromEntityInWorldCoords(plyPed, vector3(0, 3.0, -0.5))
  local cast = StartShapeTestLosProbe(plyCoords, plyOffset, 10, plyPed, 0)
  local castDone, vehicle

  while castDone ~= 0 and castDone ~= 2 do
      castDone, _, _, _, vehicle = GetShapeTestResult(cast)
      Wait(1)
  end
  return vehicle

end

function CheckBlacklist(vehicle)
  for a = 1, #Config.BlacklistedVehicles do
    if GetHashKey(Config.BlacklistedVehicles[a]) == GetEntityModel(vehicle) then
      return true
    end
  end
  return false
end

function AttachVehicle(vehicle)
  local towOffset                          = GetOffsetFromEntityInWorldCoords(towtruck, 0.0, -2.2, 0.4)
  local towRot                             = GetEntityRotation(towtruck, 1)
  local vehicleHeightMin, vehicleHeightMax = GetModelDimensions(GetEntityModel(vehicle))

  AttachEntityToEntity(vehicle, towtruck, GetEntityBoneIndexByName(towtruck, "bodyshell"), 0, -2.2,
                       0.4 - vehicleHeightMin.z, 0, 0, 0, 1, 1, 0, 1, 0, 1)
  attachedVehicle = vehicle
  detachedVehicle = nil
end

function DetachVehicle()
  local towOffset = GetOffsetFromEntityInWorldCoords(towtruck, 0.0, -10.0, 0.0)
  DetachEntity(attachedVehicle, false, false)
  SetEntityCoords(attachedVehicle, towOffset.x, towOffset.y, towOffset.z, 1, 0, 0, 1)
  PlaceObjectOnGroundProperly(attachedVehicle)
  detachedVehicle = attachedVehicle
  attachedVehicle = nil
end

RegisterCommand("impound", function()

  if PlayerData.job ~= nil and PlayerData.job.name == 'mecano' or PlayerData.job.name == 'police' then
    local px, py, pz = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local inlot = false

    for k, v in pairs(Config.Impounds) do
      x, y, z = v.Pos.x, v.Pos.y, v.Pos.z
      if Vdist2(x, y, z, px, py, pz) < 20 then
        inlot = true
        detachedVehicle = GetVehicleInFront()

        tow             = false
        for key, value in pairs(towtrucks) do
          if value == GetEntityModel(detachedVehicle) then
            tow = true
          end
        end

        local lastVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)

        for key, value in pairs(towtrucks) do
          if value == GetEntityModel(lastVehicle) then
            canTow = true
          end
        end

        TriggerEvent("chatMessage", "Test")

        if tow then
          TriggerEvent("chatMessage", "You can't impound a towtruck")
        elseif IsPedInAnyVehicle(PlayerPedId(), false) then
          ESX.ShowNotification('You cannot impound a car while you are in it!')
        elseif not canTow then
          ESX.ShowNotification('You must use a tow truck to impound!')
        else
          TriggerEvent('esx_advancedgarage:impoundVehicle', detachedVehicle)
          if PlayerData.job.name ~= 'police' and detachedVehicle ~= 0 then
            payout = math.random(10, v.Price)
            TriggerServerEvent('esx_mechanicjob:pay', payout)
            ESX.ShowNotification('You impounded a car. You received $~g~' .. payout)
            detachedVehicle = nil
          end
        end
      end
    end
    if not inlot then
      ESX.ShowNotification('You must be in an impound lot.')
    end
  end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then

        if CurrentAction == 'mecano_actions_menu' then
          OpenMecanoActionsMenu()
        end

        if CurrentAction == 'mecano_harvest_menu' then
          OpenMecanoHarvestMenu()
        end

        if CurrentAction == 'mecano_craft_menu' then
          OpenMecanoCraftMenu()
        end

        if CurrentAction == 'delete_vehicle' then

          if Config.EnableSocietyOwnedVehicles then

            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
            TriggerServerEvent('esx_society:putVehicleInGarage', 'mecano', vehicleProps)

          else

            if
            GetEntityModel(vehicle) == GetHashKey('flatbed') or
              GetEntityModel(vehicle) == GetHashKey('towtrcuk2') or
              GetEntityModel(vehicle) == GetHashKey('slamvan3')
            then
              TriggerServerEvent('esx_service:disableService', 'mecano')
            end

          end

          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
        end

        if CurrentAction == 'remove_entity' then
          DeleteEntity(CurrentActionData.entity)
        end

        CurrentAction = nil
      end
    end
  end
end)
