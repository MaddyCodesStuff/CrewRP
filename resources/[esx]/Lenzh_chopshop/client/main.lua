ESX                            = nil
local PlayerData               = {}
local HasAlreadyEnteredMarker  = false
local LastZone                 = nil
local CurrentAction            = nil
local CurrentActionMsg         = ''
local CurrentActionData        = {}
local isDead                   = false
local CurrentTask              = {}
local menuOpen                 = false
local wasOpen                  = false
local pedIsTryingToChopVehicle = false
local ChoppingInProgress       = false
local streetName
local chopLocation             = nil

local lastTested               = 0

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

AddEventHandler('esx:onPlayerDeath', function(data)
    isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
    isDead = false
end)

-- Sales point prompt and menu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

        if GetDistanceBetweenCoords(coords, Config.Zones.Shop.coords, true) < 3.0 then
            ESX.ShowHelpNotification(_U('shop_prompt'))

            if IsControlJustReleased(0, 38) then
                wasOpen = true
                OpenShop()
            end
        else
            if wasOpen then
                wasOpen = false
                ESX.UI.Menu.CloseAll()
            end

            Citizen.Wait(500)
        end
    end
end)

function OpenShop()
    local elements = {}
    menuOpen       = true

    for k, v in pairs(ESX.GetPlayerData().inventory) do
        local price = Config.Itemsprice[v.name]

        if price and v.count > 0 then
            table.insert(elements, {
                label = ('%s - <span style="color:green;">%s</span>'):format(v.label,
                                                                             _U('item', ESX.Math.GroupDigits(price))),
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

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'car_shop', {
        title    = _U('shop_title'),
        align    = 'right',
        elements = elements
    }, function(data, menu)
        TriggerServerEvent('lenzh_chopshop:sell', data.current.name, data.current.value)
    end, function(data, menu)
        menu.close()
        menuOpen = false
    end)
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if menuOpen then
            ESX.UI.Menu.CloseAll()
        end
    end
end)

function IsDriver()
    return GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId()
end

function ChopVehicle()
    if GetGameTimer() - lastTested > Config.CooldownMinutes * 60000 then
        ESX.TriggerServerCallback('Lenzh_chopshop:anycops', function(anycops)
            if anycops >= Config.CopsRequired then
                local ped     = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(ped, false)
                if Config.CallCops then
                    local randomReport = math.random(1, Config.CallCopsPercent)
                    if randomReport == Config.CallCopsPercent then
                        local coords = GetEntityCoords(ped)
                        SetVehicleAlarmTimeLeft(vehicle, 60000)
                        TriggerServerEvent('chopNotify', coords)
                    end
                end
                ChoppingInProgress = true
                lastTested         = GetGameTimer()
                TriggerEvent('mythic_notify:client:SendAlert',
                             { type = 'inform', text = 'Chopping in progress. Please remain in the vehicle until chopping is complete.', length = 10000 })
                VehiclePartsRemoval()
                if not HasAlreadyEnteredMarker then
                    HasAlreadyEnteredMarker = true
                    ChoppingInProgress      = false
                    TriggerEvent('mythic_notify:client:SendAlert',
                                 { type = 'error', text = 'You Left The Zone. No Rewards For You!', length = 10000 })
                end
            else
                TriggerEvent('mythic_notify:client:SendAlert',
                             { type = 'error', text = _U('not_enough_cops'), length = 10000 })
            end
        end)
    else
        local timerNewChop = Config.CooldownMinutes * 60000 - (GetGameTimer() - lastTested)
        local minsLeft     = math.floor(timerNewChop / 60000)
        if minsLeft > 1 then
            TriggerEvent('mythic_notify:client:SendAlert',
                         { type = 'error', text = "John is busy. Come back in " .. math.floor(timerNewChop / 60000) .. " minutes", length = 10000 })
        elseif minsLeft == 1 then
            TriggerEvent('mythic_notify:client:SendAlert',
                         { type = 'error', text = "John is busy. Come back in " .. math.floor(timerNewChop / 60000) .. " minute", length = 10000 })
        else
            TriggerEvent('mythic_notify:client:SendAlert',
                         { type = 'error', text = "John is just about ready! Wait a moment.", length = 10000 })
        end
    end
end

function VehiclePartsRemoval()
    local ped          = PlayerPedId()
    local vehicle      = GetVehiclePedIsIn(ped, false)
    local rearLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_r')
    local bonnet       = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'bonnet')
    local boot         = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'boot')
    SetVehicleNumberPlateText(vehicle, "stolen")
    SetVehicleEngineOn(vehicle, false, false, true)
    SetVehicleUndriveable(vehicle, false)
    if ChoppingInProgress == true then
        exports['progressBars']:startUI(Config.DoorOpenFrontLeftTime, "Opening Front Left Door")
        Citizen.Wait(Config.DoorOpenFrontLeftTime)
        SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 0, false, false)
    end
    Citizen.Wait(1000)
    if ChoppingInProgress == true then
        exports['progressBars']:startUI(Config.DoorBrokenFrontLeftTime, "Removing Front Left Door")
        Citizen.Wait(Config.DoorBrokenFrontLeftTime)
        SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 0, true)
    end
    Citizen.Wait(1000)
    if ChoppingInProgress == true then
        exports['progressBars']:startUI(Config.DoorOpenFrontRightTime, "Opening Front Right Door")
        Citizen.Wait(Config.DoorOpenFrontRightTime)
        SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 1, false, false)
    end
    Citizen.Wait(1000)
    if ChoppingInProgress == true then
        exports['progressBars']:startUI(Config.DoorBrokenFrontRightTime, "Removing Front Right Door")
        Citizen.Wait(Config.DoorBrokenFrontRightTime)
        SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 1, true)
    end
    Citizen.Wait(1000)
    if rearLeftDoor ~= -1 then
        if ChoppingInProgress == true then
            exports['progressBars']:startUI(Config.DoorOpenRearLeftTime, "Opening Rear Left Door")
            Citizen.Wait(Config.DoorOpenRearLeftTime)
            SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 2, false, false)
        end
        Citizen.Wait(1000)
        if ChoppingInProgress == true then
            exports['progressBars']:startUI(Config.DoorBrokenRearLeftTime, "Removing Rear Left Door")
            Citizen.Wait(Config.DoorBrokenRearLeftTime)
            SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 2, true)
        end
        Citizen.Wait(1000)
        if ChoppingInProgress == true then
            exports['progressBars']:startUI(Config.DoorOpenRearRightTime, "Opening Rear Right Door")
            Citizen.Wait(Config.DoorOpenRearRightTime)
            SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 3, false, false)
        end
        Citizen.Wait(1000)
        if ChoppingInProgress == true then
            exports['progressBars']:startUI(Config.DoorBrokenRearRightTime, "Removing Rear Right Door")
            Citizen.Wait(Config.DoorBrokenRearRightTime)
            SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 3, true)
        end
    end
    Citizen.Wait(1000)
    if bonnet ~= -1 then
        if ChoppingInProgress == true then
            exports['progressBars']:startUI(Config.DoorOpenHoodTime, "Opening Hood")
            Citizen.Wait(Config.DoorOpenHoodTime)
            SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 4, false, false)
        end
        Citizen.Wait(1000)
        if ChoppingInProgress == true then
            exports['progressBars']:startUI(Config.DoorBrokenHoodTime, "Removing Hood")
            Citizen.Wait(Config.DoorBrokenHoodTime)
            SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 4, true)
        end
    end
    Citizen.Wait(1000)
    if boot ~= -1 then
        if ChoppingInProgress == true then
            exports['progressBars']:startUI(Config.DoorOpenTrunkTime, "Opening Trunk")
            Citizen.Wait(Config.DoorOpenTrunkTime)
            SetVehicleDoorOpen(GetVehiclePedIsIn(ped, false), 5, false, false)
        end
        Citizen.Wait(1000)
        if ChoppingInProgress == true then
            exports['progressBars']:startUI(Config.DoorBrokenTrunkTime, "Removing Trunk")
            Citizen.Wait(Config.DoorBrokenTrunkTime)
            SetVehicleDoorBroken(GetVehiclePedIsIn(ped, false), 5, true)
        end
    end
    Citizen.Wait(1000)
    exports['progressBars']:startUI(Config.DeletingVehicleTime, "John is taking care of the car")
    Citizen.Wait(Config.DeletingVehicleTime)
    if ChoppingInProgress == true then
        DeleteVehicle()
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'success', text = 'Vehicle chopped.', length = 10000 })
        ChoppingInProgress = false
    end
end

function DeleteVehicle()
    if IsDriver() then
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            ESX.Game.DeleteVehicle(vehicle)
        end
        TriggerServerEvent("lenzh_chopshop:rewards", rewards)
    end
end

AddEventHandler('lenzh_chopshop:hasEnteredMarker', function(zone)
    if string.find(zone, 'Chopshop') ~= nil and IsDriver() then
        CurrentAction     = 'Chopshop'
        CurrentActionMsg  = _U('press_to_chop')
        CurrentActionData = {}
    end
end)

AddEventHandler('lenzh_chopshop:hasExitedMarker', function(zone)
    if menuOpen then
        ESX.UI.Menu.CloseAll()
    end

    if zone == 'Chopshop' then

        if ChoppingInProgress == true then
            TriggerEvent('mythic_notify:client:SendAlert',
                         { type = 'error', text = 'You Left The Zone. Go back!', length = 10000 })
        end
    end
    ChoppingInProgress = false

    CurrentAction      = nil
end)

function CreateBlipCircle(coords, text, radius, color, sprite)

    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
    if Config.EnableBlips == true then
        --if xPlayer.job.name ~= police then
        for k, zone in pairs(Config.Zones) do
            CreateBlipCircle(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
        end
        --end
    end
end)

Citizen.CreateThread(function()
    if Config.NPCEnable == true then
        RequestModel(Config.NPCHash)
        while not HasModelLoaded(Config.NPCHash) do
            Wait(1)
        end
        --PROVIDER
        meth_dealer_seller = CreatePed(1, Config.NPCHash, Config.NPCShop.x, Config.NPCShop.y, Config.NPCShop.z,
                                       Config.NPCShop.h, false, true)
        SetBlockingOfNonTemporaryEvents(meth_dealer_seller, true)
        SetPedDiesWhenInjured(meth_dealer_seller, false)
        SetPedCanPlayAmbientAnims(meth_dealer_seller, true)
        SetPedCanRagdollFromPlayerImpact(meth_dealer_seller, false)
        SetEntityInvincible(meth_dealer_seller, true)
        FreezeEntityPosition(meth_dealer_seller, true)
        TaskStartScenarioInPlace(meth_dealer_seller, "WORLD_HUMAN_SMOKING", 0, true);
    else
    end
end)

-- Display markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true
        for k, v in pairs(Config.Zones) do
            --if xPlayer.job.name ~= 'police' then
            if Config.MarkerType ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z,
                                                                    true) < Config.DrawDistance then
                --DrawMarker(Config.MarkerType, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
                letSleep = false
            end
            --end
        end
        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords      = GetEntityCoords(PlayerPedId())
        local isInMarker  = false
        local currentZone = nil
        local letSleep    = true
        for k, v in pairs(Config.Zones) do
            if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                isInMarker   = true
                currentZone  = k
                chopLocation = v.locationName
            end
        end
        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone                = currentZone
            TriggerEvent('lenzh_chopshop:hasEnteredMarker', currentZone)
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('lenzh_chopshop:hasExitedMarker', LastZone)
        end
    end
end)

-- Key controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)
            if IsControlJustReleased(0, 38) then
                if IsDriver() then
                    if CurrentAction == 'Chopshop' then
                        ChopVehicle()
                    end
                end
                CurrentAction = nil
            end
        else
            Citizen.Wait(500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if menuOpen then
            ESX.UI.Menu.CloseAll()
        end
    end
end)

--Only if Config.CallCops = true
GetPlayerName()

RegisterNetEvent('outlawChopNotify')
AddEventHandler('outlawChopNotify', function(coords)
    local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, ["text"] = "[PD] Suspicious Activity", ["sprite"] = 161, ["color"] = 5, ["scale"] = 1.5, ["duration"] = 120}
    if chopLocation == nil then
        chopLocation = "Unknown"
    end
    TriggerEvent('mythic_notify:client:SendCopAlert',
                 { title = 'Suspicious Activity', text = 'Suspicious activity reported in this area ' .. chopLocation })
    TriggerEvent("tcrp-blips:addblip", blip)
    PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
end)