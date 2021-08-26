ESX                               = nil

local timing, isPlayerWhitelisted = math.ceil(Config.Timer * 60000), false
local streetName, playerGender
local is
gunWhitelisted                    = false
local isPlayerEMSWhitelisted      = false
local lastThrowCoords             = {}

local toggleDispatch              = false

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

    TriggerEvent('skinchanger:getSkin', function(skin)
        playerGender = skin.sex
    end)

    isPlayerFDWhitelisted  = refreshPlayerFDWhitelisted()
    isPlayerWhitelisted    = refreshPlayerWhitelisted()
    isPlayerEMSWhitelisted = refreshPlayerEMSWhitelisted()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job     = job

    isPlayerFDWhitelisted  = refreshPlayerFDWhitelisted()
    isPlayerWhitelisted    = refreshPlayerWhitelisted()
    isPlayerEMSWhitelisted = refreshPlayerEMSWhitelisted()
end)

RegisterNetEvent('esx_outlawalert:outlawNotify')
AddEventHandler('esx_outlawalert:outlawNotify', function(alert, title)
    if isPlayerWhitelisted then
        TriggerEvent('mythic_notify:client:SendCopAlert', { text = alert, title = title })
    end
end)

RegisterNetEvent('esx_outlawalert:emsDistressNotify')
AddEventHandler('esx_outlawalert:emsDistressNotify', function(alert)
    if isPlayerEMSWhitelisted then
        TriggerEvent('mythic_notify:client:SendEMSAlert', { text = alert, title = 'Citizen Injured' })
    end
end)

RegisterNetEvent('esx_outlawalert:fireStartNotify')
AddEventHandler('esx_outlawalert:fireStartNotify', function(alert, title)
    if isPlayerFDWhitelisted then
        TriggerEvent('mythic_notify:client:SendFireAlert', { text = alert, title = title })
    end
end)

RegisterNetEvent('esx_outlawalert:firstStartBlip')
AddEventHandler('esx_outlawalert:fireStartBlip', function(targetCoords, alert)
    if isPlayerFDWhitelisted then
        local blip = {["x"] = targetCoords.x, ["y"] = targetCoords.y, ["z"] = targetCoords.z, ["text"] = alert, ["sprite"] = 436, ["color"] = 47, ["scale"] = 1.0, ["layer"] = 35, ["duration"] = Config.BlipFireTime}
        TriggerEvent("tcrp-blips:addblip", blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        if NetworkIsSessionStarted() then
            DecorRegister('isOutlaw', 3)
            DecorSetInt(PlayerPedId(), 'isOutlaw', 1)

            return
        end
    end
end)

-- Gets the player's current street.
-- Aaalso get the current player gender
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)

        local playerCoords = GetEntityCoords(PlayerPedId())
        streetName, _      = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        streetName         = GetStreetNameFromHashKey(streetName)
    end
end)

AddEventHandler('skinchanger:loadSkin', function(character)
    playerGender = character.sex
end)

function refreshPlayerWhitelisted()

    if not ESX.PlayerData then
        return false
    end

    if not ESX.PlayerData.job then
        return false
    end

    for k, v in ipairs(Config.WhitelistedCops) do
        if v == ESX.PlayerData.job.name then
            return true
        end
    end

    return false
end

function refreshPlayerEMSWhitelisted()

    if not ESX.PlayerData then
        return false
    end

    if not ESX.PlayerData.job then
        return false
    end

    if ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'fireman' then
        return true
    end

    return false
end

function refreshPlayerFDWhitelisted()

    if not ESX.PlayerData then
        return false
    end

    if not ESX.PlayerData.job then
        return false
    end

    if ESX.PlayerData.job.name == 'fireman' then
        return true
    end

    return false
end

function isGunWhitelisted(gun)
    for k, v in ipairs(Config.WhitelistedWeapons) do
        if GetHashKey(v) == gun or throwableHash == gun then
            return true
        end
    end

    return false
end

RegisterNetEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords)
    if isPlayerWhitelisted then
        if Config.CarJackingAlert then
            local alpha     = 250
            local thiefBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipJackingRadius)

            SetBlipHighDetail(thiefBlip, true)
            SetBlipColour(thiefBlip, 1)
            SetBlipAlpha(thiefBlip, alpha)
            SetBlipAsShortRange(thiefBlip, true)

            while alpha ~= 0 do
                Citizen.Wait(Config.BlipJackingTime * 4)
                alpha = alpha - 1
                SetBlipAlpha(thiefBlip, alpha)

                if alpha == 0 then
                    RemoveBlip(thiefBlip)
                    return
                end
            end

        end
    end
end)

RegisterNetEvent('esx_outlawalert:policeDistress')
AddEventHandler('esx_outlawalert:policeDistress', function(targetCoords)
    if isPlayerWhitelisted then
        local alpha              = 250
        -- local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipGunRadius)
        local policedistressBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
        SetBlipSprite(policedistressBlip, 304)
        SetBlipHighDetail(policedistressBlip, true)
        SetBlipColour(policedistressBlip, 38)
        SetBlipRouteColour(policedistressBlip, 38)
        SetBlipAlpha(policedistresstBlip, alpha)
        SetBlipAsShortRange(policedistressBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Officer in need')
        EndTextCommandSetBlipName(policedistressBlip)

        while alpha ~= 0 do
            Citizen.Wait(30 * 4)
            alpha = alpha - 1
            SetBlipAlpha(policedistressBlip, alpha)

            if alpha == 0 then
                RemoveBlip(policedistressBlip)
                return
            end
        end
    end
end)

RegisterNetEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords, fromVehicle, pedinterior, interiorhash)
    print(targetCoords, fromVehicle, pedinterior, interiorhash)
    if isPlayerWhitelisted and Config.GunshotAlert then
        local message = '[PD] Shots fired'
        local sprite  = 432
        local color   = 29
        if fromVehicle then
            message = message .. ' from vehicle'
            sprite  = 610
        end
        if interiorhash ~= 0 and interiorhash ~= nil then
            color = 5
        end
        if pedinterior ~= nil then
            print(pedinterior)
            message = message .. " inside " .. pedinterior
        end
        local blip = {["x"] = targetCoords.x, ["y"] = targetCoords.y, ["z"] = targetCoords.z, ["text"] = message, ["longrange"] = true, ["sprite"] = sprite, ["color"] = color, ["scale"] = 1.2, ["layer"] = 35, ["flash"] = true, ["flashinterval"] = 1000, ["duration"] = 90}
        TriggerEvent("tcrp-blips:addblip", blip)
    end
end)

RegisterNetEvent('esx_outlawalert:explosionInProgress')
AddEventHandler('esx_outlawalert:explosionInProgress', function(targetCoords, pedinterior, interiorhash)
    if isPlayerWhitelisted and Config.GunshotAlert then
        local message = '[PD] Explosion'
        local sprite = 486
        local color = 29
        if interiorhash ~= 0 and interiorhash ~= nil then
            color = 5
        end
        if pedinterior ~= nil then
            message = message .. " inside " .. pedinterior
        end
        local blip = {["x"] = targetCoords.x, ["y"] = targetCoords.y, ["z"] = targetCoords.z, ["text"] = message, ["longrange"] = true, ["sprite"] = 486, ["color"] = color, ["scale"] = 1.4, ["layer"] = 35, ["flash"] = true, ["flashinterval"] = 1000, ["duration"] = 90}
        TriggerEvent("tcrp-blips:addblip", blip)
    end
end)

RegisterNetEvent('esx_outlawalert:citizenDistress')
AddEventHandler('esx_outlawalert:citizenDistress', function(targetCoords, pedinterior, interiorhash)
    print("1",targetCoords, pedinterior, interiorhash)
    if isPlayerEMSWhitelisted then
        local message = "[CID] Citizen In Distress"
        local sprite = 153
        local color = 1
        if interiorhash ~= 0 and interiorhash ~= nil then
            color = 5
        end
        if pedinterior ~= nil then
            message = message .. " inside " .. pedinterior
        end
        local blip = {["x"] = targetCoords.x, ["y"] = targetCoords.y, ["z"] = targetCoords.z, ["text"] = message, ["sprite"] = sprite, ["color"] = color, ["scale"] = 1.2, ["layer"] = 35, ["duration"] = Config.BlipEMSTime}
        TriggerEvent("tcrp-blips:addblip", blip)
    end
end)

RegisterNetEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords)
    if isPlayerWhitelisted and Config.MeleeAlert then
        local alpha     = 250
        local meleeBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipMeleeRadius)

        SetBlipHighDetail(meleeBlip, true)
        SetBlipColour(meleeBlip, 17)
        SetBlipAlpha(meleeBlip, alpha)
        SetBlipAsShortRange(meleeBlip, true)

        while alpha ~= 0 do
            Citizen.Wait(Config.BlipMeleeTime * 4)
            alpha = alpha - 1
            SetBlipAlpha(meleeBlip, alpha)

            if alpha == 0 then
                RemoveBlip(meleeBlip)
                return
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        if DecorGetInt(PlayerPedId(), 'isOutlaw') == 2 then
            Citizen.Wait(timing)
            DecorSetInt(PlayerPedId(), 'isOutlaw', 1)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed       = PlayerPedId()
        local playerCoords    = GetEntityCoords(playerPed)
        local playerInVehicle = IsPedInAnyVehicle(playerPed)

        -- is jackin'
        if (IsPedTryingToEnterALockedVehicle(playerPed) or IsPedJacking(playerPed)) and Config.CarJackingAlert then

            Citizen.Wait(3000)
            local vehicle = GetVehiclePedIsIn(playerPed, true)

            if vehicle and ((isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted) then
                local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

                ESX.TriggerServerCallback('esx_outlawalert:isVehicleOwner', function(owner)
                    if not owner then

                        local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                        vehicleLabel       = GetLabelText(vehicleLabel)

                        DecorSetInt(playerPed, 'isOutlaw', 2)

                        TriggerServerEvent('esx_outlawalert:carJackInProgress', {
                            x = ESX.Math.Round(playerCoords.x, 1),
                            y = ESX.Math.Round(playerCoords.y, 1),
                            z = ESX.Math.Round(playerCoords.z, 1)
                        }, streetName, vehicleLabel, playerGender)
                    end
                end, plate)
            end

        elseif IsPedInMeleeCombat(playerPed) and Config.MeleeAlert then

            Citizen.Wait(3000)

            if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
                DecorSetInt(playerPed, 'isOutlaw', 2)

                TriggerServerEvent('esx_outlawalert:combatInProgress', {
                    x = ESX.Math.Round(playerCoords.x, 1),
                    y = ESX.Math.Round(playerCoords.y, 1),
                    z = ESX.Math.Round(playerCoords.z, 1)
                }, streetName, playerGender)
            end

            local _, weapon = GetCurrentPedWeapon(GetPlayerPed(-1))
        elseif IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and Config.GunshotAlert then

            Citizen.Wait(300)
            local _, weapon = GetCurrentPedWeapon(GetPlayerPed(-1))

            if not isGunWhitelisted(weapon) then
                if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
                    DecorSetInt(playerPed, 'isOutlaw', 2)
                    local interiorhash = (GetInteriorFromEntity(PlayerPedId()))
                    print(interiorhash)
                    TriggerServerEvent('esx_outlawalert:gunshotInProgress', {
                        x = ESX.Math.Round(playerCoords.x, 1),
                        y = ESX.Math.Round(playerCoords.y, 1),
                        z = ESX.Math.Round(playerCoords.z, 1)
                    }, streetName, playerGender, playerInVehicle, interiorhash)
                end
            end

        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        if IsPedShooting(playerPed) or IsPedPlantingBomb(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and Config.GunshotAlert then
            local _, weapon = GetCurrentPedWeapon(GetPlayerPed(-1))
            for i = 1, #Config.ExplosiveHashes, 1 do
                if weapon == Config.ExplosiveHashes[i] then
                    table.insert(lastThrowCoords, GetEntityCoords(playerPed))
                end
            end
            while IsPedPlantingBomb(playerPed) do
                Wait(10)
            end
        end
        for i = 1, #lastThrowCoords, 1 do
            local coords = lastThrowCoords[i]
            if IsExplosionInSphere(0, coords.x, coords.y, coords.z, 100.0) or IsExplosionInSphere(1, coords.x, coords.y, coords.z, 500.0) or IsExplosionInSphere(2, coords.x, coords.y, coords.z, 250.0) or IsExplosionInSphere(4, coords.x, coords.y, coords.z, 1000.0) or IsExplosionInSphere(5, coords.x, coords.y, coords.z, 100.0) or IsExplosionInSphere(36, coords.x, coords.y, coords.z, 500.0) or IsExplosionInSphere(40, coords.x, coords.y, coords.z, 250.0) or IsExplosionInSphere(43, coords.x, coords.y, coords.z, 500.0) then
                local interiorhash = (GetInteriorAtCoords(coords.x, coords.y, coords.z))
                print(interiorhash)
                local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
                TriggerServerEvent('esx_outlawalert:explosionInProgress', coords, streetName, true, interiorhash)
                lastThrowCoords[i] = nil
            end
        end
        Citizen.Wait(1)
    end
end)

-- Debug Thread to get Hashes of Interiors
--[[Citizen.CreateThread(function()
    while true do
        Wait(0)
        local interiorhash = GetInteriorFromEntity(PlayerPedId())
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString("Interior Hash: " .. interiorhash)
        DrawText(0.5, 0.91)
    end
end)]]