local ESX        = nil
local group      = "user"
local states     = {}
local noClipSpeed = 1.00
states.frozen    = false
states.frozenPos = nil

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank)
-- 			if playerRank == "admin" or playerRank == "superadmin" then
-- 				if (IsControlJustPressed(1, 214)) then --and IsControlJustPressed(1, 213)) then
-- 					if true then
-- 						SetNuiFocus(true, true)
-- 						SendNUIMessage({type = 'open', players = getPlayers()})
-- 					end
-- 				end
-- 			end
-- 		end)
-- 	end
-- end)

-- Add a command to trigger the admin menu using a /ad command. (To help controller users)

Citizen.CreateThread(function()
    while not ESX do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(100)
    end
end)

RegisterNetEvent('es_admin:openAdmin')
AddEventHandler('es_admin:openAdmin', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'open', players = getPlayers() })
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()

    TriggerEvent('es_admin:getPlayerPed')
    
    TriggerEvent('chat:addSuggestion', '/noclipspeed', 'Format: 1.00 ex. /noclipspeed 2.00', {})
end)

AddEventHandler('es_admin:getPlayerPed', function()
    --ESX.TriggerServerCallback('es_admin:getSavedPed',function(cb)
    --	if cb ~= nil then
    --		TriggerEvent('es_admin:setPed',cb)
    --	end
    --end)
end)

RegisterCommand('ad', function()
    TriggerServerEvent('es_admin:openAdmin')

    -- ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank)
    -- 	if playerRank == "admin" or playerRank == "superadmin" then
    -- 		-- if (IsControlJustPressed(1, 214)) then --and IsControlJustPressed(1, 213)) then
    -- 			-- if true then
    -- 				SetNuiFocus(true, true)
    -- 				SendNUIMessage({type = 'open', players = getPlayers()})
    -- 			-- end
    -- 		-- end
    -- 	end
    -- end)
end)

RegisterCommand("noclipspeed", function(src, args, raw)
    noClipSpeed = args[1]
end)

TriggerServerEvent('chat:removeSuggestions', '/ad')

RegisterNetEvent('es_admin:setGroup')
AddEventHandler('es_admin:setGroup', function(g)
    group = g
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false)
end)

RegisterNUICallback('quick', function(data, cb)
    if data.type == "slay_all" or data.type == "bring_all" or data.type == "slap_all" then
        TriggerServerEvent('es_admin:all', data.type)
    else
        TriggerServerEvent('es_admin:quick', data.id, data.type)
    end
end)

RegisterNUICallback('set', function(data, cb)
    TriggerServerEvent('es_admin:set', data.type, data.user, data.param)
end)

local noclip = false
RegisterNetEvent('es_admin:quick')
AddEventHandler('es_admin:quick', function(t, target)
    if t == "slay" then
        SetEntityHealth(PlayerPedId(), 0)
    end
    if t == "goto" then
        SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(target))))
    end
    if t == "bring" then
        states.frozenPos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(target)))
        SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(target))))
    end
    if t == "crash" then
        Citizen.Trace("You're being crashed, so you know. This server sucks.\n")
        Citizen.CreateThread(function()
            while true do
            end
        end)
    end
    if t == "slap" then
        ApplyForceToEntity(PlayerPedId(), 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
    end
    if t == "noclip" then
        local msg = "disabled"
        if (noclip == false) then
            noclip_pos = GetEntityCoords(PlayerPedId(), false)
        end

        noclip = not noclip

        if (noclip) then
            msg = "enabled"
        end

        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Noclip has been ^2^*" .. msg)
    end
    if t == "freeze" then
        local player     = PlayerId()

        local ped        = PlayerPedId()

        states.frozen    = not states.frozen
        states.frozenPos = GetEntityCoords(ped, false)

        if not state then
            if not IsEntityVisible(ped) then
                SetEntityVisible(ped, true)
            end

            if not IsPedInAnyVehicle(ped) then
                SetEntityCollision(ped, true)
            end

            FreezeEntityPosition(ped, false)
            SetPlayerInvincible(player, false)
        else
            SetEntityCollision(ped, false)
            FreezeEntityPosition(ped, true)
            SetPlayerInvincible(player, true)

            if not IsPedFatallyInjured(ped) then
                ClearPedTasksImmediately(ped)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if (states.frozen) then
            ClearPedTasksImmediately(PlayerPedId())
            SetEntityCoords(PlayerPedId(), states.frozenPos)
        else
            Citizen.Wait(200)
        end
    end
end)

local heading = 0

function getPosition()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    return x, y, z
end

function getCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(GetPlayerPed(-1))
    local pitch   = GetGameplayCamRelativePitch()

    local x       = -math.sin(heading * math.pi / 180.0)
    local y       = math.cos(heading * math.pi / 180.0)
    local z       = math.sin(pitch * math.pi / 180.0)

    -- normalize
    local len     = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end

    return x, y, z
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = GetPlayerPed(-1)
        if (noclip) then
            local ped        = GetPlayerPed(-1)
            local x, y, z    = getPosition()
            local dx, dy, dz = getCamDirection()
            local speed      = noClipSpeed

            -- forward
            if IsControlPressed(0, 32) then
                -- MOVE UP
                x = x + speed * dx
                y = y + speed * dy
                z = z + speed * dz
            end

            -- backward
            if IsControlPressed(0, 269) then
                -- MOVE DOWN
                x = x - speed * dx
                y = y - speed * dy
                z = z - speed * dz
            end

            SetEntityCoordsNoOffset(ped, x, y, z, true, true, true)
            SetEntityInvincible(ped, true)
            SetEntityVisible(ped, false, false)
            SetEntityCompletelyDisableCollision(ped, false, false)
            ClearPedTasksImmediately(ped)
        else
            Citizen.Wait(200)
            SetEntityInvincible(ped, false)
            SetEntityVisible(ped, true, false)
            SetEntityCompletelyDisableCollision(ped, true, true)
        end
    end
end)

RegisterNetEvent('es_admin:freezePlayer')
AddEventHandler("es_admin:freezePlayer", function(state)
    local player     = PlayerId()

    local ped        = PlayerPedId()

    states.frozen    = state
    states.frozenPos = GetEntityCoords(ped, false)

    if not state then
        if not IsEntityVisible(ped) then
            SetEntityVisible(ped, true)
        end

        if not IsPedInAnyVehicle(ped) then
            SetEntityCollision(ped, true)
        end

        FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    else
        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)

        if not IsPedFatallyInjured(ped) then
            ClearPedTasksImmediately(ped)
        end
    end
end)

RegisterNetEvent('es_admin:teleportUser')
AddEventHandler('es_admin:teleportUser', function(x, y, z)
    SetEntityCoords(PlayerPedId(), x, y, z)
    states.frozenPos = { x = x, y = y, z = z }
end)

RegisterNetEvent('es_admin:slap')
AddEventHandler('es_admin:slap', function()
    local ped = PlayerPedId()

    ApplyForceToEntity(ped, 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
end)

RegisterNetEvent('es_admin:kill')
AddEventHandler('es_admin:kill', function()
    SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent('es_admin:heal')
AddEventHandler('es_admin:heal', function()
    SetEntityHealth(PlayerPedId(), 200)
end)

RegisterNetEvent('es_admin:crash')
AddEventHandler('es_admin:crash', function()
    while true do
    end
end)

RegisterNetEvent("es_admin:noclip")
AddEventHandler("es_admin:noclip", function(t)
    local msg = "disabled"
    if (noclip == false) then
        noclip_pos = GetEntityCoords(PlayerPedId(), false)
    end

    noclip = not noclip

    if (noclip) then
        msg = "enabled"
    end

    TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Noclip has been ^2^*" .. msg)
end)

function getPlayers()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        table.insert(players, { id = GetPlayerServerId(player), name = GetPlayerName(player) })
    end
    return players
end

RegisterNetEvent('es_admin:setPed')
AddEventHandler('es_admin:setPed', function(model)

    if type(model) == "string" then
        modelHash = GetHashKey(model)
    else
        modelHash = model
    end

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        ESX.Streaming.RequestModel(modelHash, function()
            SetPlayerModel(PlayerId(), modelHash)
            SetPedRandomComponentVariation(GetPlayerPed(PlayerId()), true)
            SetModelAsNoLongerNeeded(modelHash)

            TriggerEvent('esx:restoreLoadout')
            TriggerServerEvent('es_admin:setSavedPed', model)

        end)
    end)
end)

RegisterNetEvent('es_admin:resetPed')
AddEventHandler('es_admin:resetPed', function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        local isMale = skin.sex == 0

        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
                TriggerServerEvent('es_admin:setSavedPed', nil)

            end)
        end)

    end)
end)