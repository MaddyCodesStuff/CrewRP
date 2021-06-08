local playerHealth = nil
local playerStamina = 100
local playerBodyArmor = nil
local toggleMap = true
local cruiseIsOn = false
local seatbeltIsOn = false
local seatbeltEjectSpeed = 45 -- Speed threshold to eject player (MPH)
local seatbeltEjectAccel = 100
local camison = false
local spawned = false
local inVehicle = false
local hudData = {}
local hudUpdateInterval = 500 -- NUI update interval (in ms)
local showUi = false

function ToggleUI()
    showUi = not showUi
    if showUi then
        SendNUIMessage({
                           action = 'showui'
                       })

        if inVehicle then
            SendNUIMessage({
                               action = 'showcar'
                           })
        end
    else
        SendNUIMessage({
                           action = 'hideui'
                       })
        SendNUIMessage({
                           action = 'hidecar'
                       })
    end
end

function getCardinalDirectionFromHeading(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "N" -- North
    elseif (heading >= 45 and heading < 135) then
        return "W" -- West
    elseif (heading >= 135 and heading < 225) then
        return "S" -- South
    elseif (heading >= 225 and heading < 315) then
        return "E" -- East
    end
end

function updateHUD()
    SendNUIMessage({
        action = 'update',
        value = hudData
    })
end

RegisterCommand('mmap', function(source, args, rawCommand)
    if not inVehicle then
        toggleMap = not toggleMap
        DisplayRadar(toggleMap)
        SendNUIMessage({
            action = 'mmap',
            value = {
                toggle = toggleMap
            }
        })
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    ToggleUI()
end)

RegisterNetEvent('tcrp:displayTextMessage')
AddEventHandler('tcrp:displayTextMessage', function(sender)
    SendNUIMessage({
        action = 'notificationmessage',
        sender = sender
    })
end)

RegisterNetEvent('tcrp:displayPhoneCall')
AddEventHandler('tcrp:displayPhoneCall', function( sender)
    SendNUIMessage({
        action = 'notificationphone',
        sender = sender
    })
end)

RegisterNetEvent('tcrp:displayBank')
AddEventHandler('tcrp:displayBank', function(cash)
    SendNUIMessage({
        action = 'notificationbank',
        cash = cash
    })
end)

RegisterNetEvent('tcrp:displayCash')
AddEventHandler('tcrp:displayCash', function(cash, bank)
    SendNUIMessage({
        action = 'notificationcash',
        cash = cash,
        bank = bank
    })
end)

RegisterNetEvent('tcrp:displayGeneral')
AddEventHandler('tcrp:displayGeneral', function(message)
    SendNUIMessage({
        action = 'notificationgeneral',
        message = message
    })
end)

RegisterNetEvent('tcrphud:toggleHud')
AddEventHandler('tcrphud:toggleHud', function(show)
    if show == false then
        SendNUIMessage({
            action = 'showui'
        })
        camison = false
    else
        SendNUIMessage({
            action = 'hideui'
        })
        camison = true
    end
end)

-- Set voice volume
RegisterNetEvent('tcrphud:setVoiceLevel')
AddEventHandler('tcrphud:setVoiceLevel', function(level)
    hudData.voice = math.floor(level * 100 / 3)
    updateHUD()
end)

-- Toggle talking status
RegisterNetEvent('tcrphud:setTalking')
AddEventHandler('tcrphud:setTalking', function(talking)
    hudData.talking = talking
    updateHUD()
end)

-- Toggle radio talking status
RegisterNetEvent('tcrphud:setRadioTalking')
AddEventHandler('tcrphud:setRadioTalking', function(talking)
    hudData.radioTalking = talking
    updateHUD()
end)

-- Set radio channel
RegisterNetEvent('tcrphud:setRadioChannel')
AddEventHandler('tcrphud:setRadioChannel', function(channel)
    hudData.radio = channel + 0.0
    updateHUD()
end)

-- Set radio volume
RegisterNetEvent('tcrphud:setRadioVolume')
AddEventHandler('tcrphud:setRadioVolume', function(volume)
    hudData.radioVolume = math.floor(volume * 100)
    updateHUD()
end)

RegisterNetEvent('disc-hud:LeftVehicle')
AddEventHandler('disc-hud:LeftVehicle', function()
    DisplayRadar(false)
    SendNUIMessage({
        action = 'mmap',
        value = {
            toggle = false
        }
    })
end)

RegisterNetEvent('disc-hud:EnteringVehicle')
AddEventHandler('disc-hud:EnteringVehicle', function(veh)
    seatbeltIsOn = false
    cruiseIsOn   = false
    SendNUIMessage({
        action = 'toggle-seatbelt',
        value = seatbeltIsOn
    })
    SendNUIMessage({
        action = 'toggle-cruise',
        value = cruiseIsOn
    })
end)

-- Handle vehicle HUD elements
RegisterNetEvent('disc-hud:EnteredVehicle')
AddEventHandler('disc-hud:EnteredVehicle', function()
    seatbeltIsOn = false
    cruiseIsOn   = false
    SendNUIMessage({
        action = 'toggle-seatbelt',
        value = seatbeltIsOn
    })
    SendNUIMessage({
        action = 'toggle-cruise',
        value = cruiseIsOn
    })
    local player = PlayerPedId()
    local veh    = GetVehiclePedIsIn(player)
    local prevHp = GetEntityHealth(veh)
    local maxSpeed = GetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel")
    inVehicle = IsPedInAnyVehicle(PlayerPedId(), false)

    Citizen.CreateThread(function()
        while inVehicle do
            Citizen.Wait(0)

            -- Check if cruise control button pressed, toggle state and set maximum speed appropriately
            if IsControlJustReleased(0, 20) then
                -- When player in driver seat, handle cruise control
                if (GetPedInVehicleSeat(veh, -1) == player) then
                    if cruiseIsOn then
                        exports['mythic_notify']:SendAlert('inform', 'Cruise Disabled')
                    else
                        exports['mythic_notify']:SendAlert('inform', 'Cruise Activated')
                    end

                    cruiseIsOn = not cruiseIsOn
                    SendNUIMessage({
                                       action = 'toggle-cruise',
                                       value = cruiseIsOn
                                   })
                    cruiseSpeed = GetEntitySpeed(veh)
                end
                maxSpeed = cruiseIsOn and cruiseSpeed or GetVehicleHandlingFloat(veh, "CHandlingData",
                                                                                       "fInitialDriveMaxFlatVel")
            end

            if cruiseIsOn then
                local curSpeed = GetEntitySpeed(veh)
                if curSpeed >= maxSpeed then
                    DisableControlAction(0, 71)
                end
            end
        end
    end)

    -- Handle player ejection from vehicle
    Citizen.CreateThread(function()
        local currSpeed    = 0
        local prevVelocity = { x = 0.0, y = 0.0, z = 0.0 }
        while inVehicle do
            Citizen.Wait(50)
            local prevSpeed = currSpeed
            local position  = GetEntityCoords(player)
            currSpeed       = GetEntitySpeed(veh)
            if not seatbeltIsOn then
                local vehIsMovingFwd = GetEntitySpeedVector(veh, true).y > 1.0
                local vehAcc         = (prevSpeed - currSpeed) / GetFrameTime()
                if (vehIsMovingFwd and (prevSpeed > seatbeltEjectSpeed) and (vehAcc > (seatbeltEjectAccel * 9.81))) then
                    SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                    SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                    Citizen.Wait(1)
                    SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                else
                    prevVelocity = GetEntityVelocity(veh)
                end
            end
        end
    end)

    -- Handle seatbelt
    Citizen.CreateThread(function()
        while inVehicle do
            Citizen.Wait(1)
            if IsControlJustReleased(0, 344) then
                local vehClass = GetVehicleClass(veh)
                if vehClass ~= 8 and vehClass ~= 13 and vehClass ~= 14 then
                    if seatbeltIsOn then
                        exports['mythic_notify']:SendAlert('inform', 'Seatbelt Off')
                    else
                        exports['mythic_notify']:SendAlert('inform', 'Seatbelt On')
                        -- Disable control while seatbelt is On
                        Citizen.CreateThread(function()
                            while inVehicle and seatbeltIsOn do
                                DisableControlAction(0, 75)
                                Wait(1)
                            end
                        end)
                    end
                    seatbeltIsOn = not seatbeltIsOn
                    SendNUIMessage({
                                       action = 'toggle-seatbelt',
                                       value = seatbeltIsOn
                                   })
                end
            end
        end
    end)

    -- Update fuel guage
    Citizen.CreateThread(function()
        while inVehicle do
            SendNUIMessage({
                               action = 'update-fuel',
                               fuel   = math.ceil(GetVehicleFuelLevel(veh))
                           })
            Citizen.Wait(5000)
        end
    end)

    -- Vehicle speed update & display vehicle HUD
    Citizen.CreateThread(function()
        while true do -- Using true here so we can disable the HUD after exiting & manually break the loop
            Citizen.Wait(250)
            if inVehicle then
                local primary = 0.0
                local secondary = 0.0
                local primarylabel = ""
                local secondarylabel = ""
                if (ShouldUseMetricMeasurements()) then
                    primarylabel = 'KPH'
                    primary = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId())) * 3.6
                    currSpeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId()))
                else
                    primarylabel = 'MPH'
                    primary = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId())) * 2.23694
                    currSpeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId()))
                end

                SendNUIMessage({
                    action = 'showcar',
                    primary =  math.ceil(primary),
                    primarylabel = primarylabel,
                })
            else
                SendNUIMessage({
                    action = 'hidecar'
                })
                break -- Exit loop after hiding HUD
            end
        end
    end)
end)

-- In vehicle checker
Citizen.CreateThread(function()
    while true do
        inVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
        Wait(250)
    end
end)

-- Hide default HUD elements
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        HideHudComponentThisFrame(7) -- Area Name
        HideHudComponentThisFrame(9) -- Street Name
        HideHudComponentThisFrame(3) -- SP Cash display
        HideHudComponentThisFrame(4)  -- MP Cash display
        HideHudComponentThisFrame(13) -- Cash changesSetPedHelmet(PlayerPedId(), false)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 500
        local radarEnabled = IsRadarEnabled()

        if not inVehicle and radarEnabled then
            DisplayRadar(false)
            SendNUIMessage({
                action = 'mmap',
                value = {
                    toggle = false
                }
            })
        elseif inVehicle and not radarEnabled then
            DisplayRadar(true)
            SendNUIMessage({
                action = 'mmap',
                value = {
                    toggle = true
                }
            })
        end
        if camison == false then
            if (IsPauseMenuActive()) then
                SendNUIMessage({
                    action = 'hideui'
                })
                SendNUIMessage({
                    action = 'hidecar'
                })
            else
                SendNUIMessage({
                    action = 'showui'
                })

                if inVehicle then
                    SendNUIMessage({
                            action = 'showcar'
                        })
                 end
            end
        end
        Citizen.Wait(sleepThread)
    end
end)

Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()

        -- If health isn't the same as it was last check, let's update it
        if playerHealth ~= GetEntityHealth(PlayerPedId()) then
            -- Get the players health
            playerHealth = GetEntityHealth(PlayerPedId())
            playerHealth = math.ceil(GetEntityMaxHealth(PlayerPedId()) / playerHealth * 100);
            if playerHealth > 100 then
                playerHealth = 100
            end
        end

        -- If player stamina is different than it was last check, let's update it
        if playerStamina ~= GetPlayerSprintStaminaRemaining(PlayerId()) then
            playerStamina = 100 - math.floor(GetPlayerSprintStaminaRemaining(PlayerId()))
        end

        if playerBodyArmor ~= GetPedArmour(PlayerPedId()) then
            playerBodyArmor = math.ceil(GetPedArmour(PlayerPedId()))
        end
        local heading = getCardinalDirectionFromHeading(GetEntityHeading(player))

        local pos = GetEntityCoords(player)
        local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(),
                                            Citizen.ResultAsInteger())

        hudData.health = (GetEntityHealth(player) - 100)
        hudData.stamina = playerStamina
        hudData.armor = playerBodyArmor
        hudData.direction = heading
        hudData.street1 = GetStreetNameFromHashKey(street1)
        hudData.street2 = GetStreetNameFromHashKey(street2)

        Wait(hudUpdateInterval)
    end
end)

-- Get statuses
Citizen.CreateThread(function()
    while true do
        TriggerEvent('esx_status:getAllStatus', function(vals)
            local statuses = {'hunger', 'thirst', 'drunk', 'drug', 'poison'}
            for _, status in ipairs(statuses) do
                if vals[status] then
                    hudData[status] = math.floor(vals[status].getPercent())
                else
                    hudData[status] = 0
                end
            end
        end)
        Wait(1000)
    end
end)

-- HUD update tick
Citizen.CreateThread(function()
    while true do
        updateHUD()
        Wait(hudUpdateInterval)
    end
end)