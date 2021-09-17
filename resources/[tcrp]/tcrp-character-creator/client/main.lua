ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(200)
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
    end
end)

RegisterCommand('wm', function()
    SendNUIMessage({
                       action = "toggle-watermark"
                   })
end)

--[[RegisterCommand('switch', function()
    isChoosing     = true
    isPlayerLoaded = false
    loadCharSelector()
end)--]]

characters = {}
ped        = nil

isChoosing = true

Citizen.CreateThread(function()
    Citizen.Wait(7)
    loadCharSelector()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if isChoosing then
            DisplayHud(false)
            DisplayRadar(false)
        else
            SetPedSuffersCriticalHits(PlayerPedId(), false)
        end
    end
end)

RegisterNetEvent('tcrp-character-creator:SetupUI')
AddEventHandler('tcrp-character-creator:SetupUI', function(Characters)
    RequestModel('mp_m_freemode_01')
    Citizen.CreateThread(function()
        while not HasModelLoaded('mp_m_freemode_01') do
            RequestModel('mp_m_freemode_01')
            Citizen.Wait(0)
        end

        SetPlayerModel(PlayerId(), GetHashKey('mp_m_freemode_01'))
        SetModelAsNoLongerNeeded(GetHashKey('mp_m_freemode_01'))
    end)

    RenderScriptCams(true, false, 1, true, true)
    SetTimecycleModifier('default')
    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1120.81, -3027.11, -5.60, 0.00, 0.00, 0.00, 100.00, false, 0)
    PointCamAtCoord(cam2, -1121.99, -3026.76, -6.15)
    SetCamActiveWithInterp(cam2, cam, 1700, true, true)

    Citizen.Wait(1700)

    SetEntityVisible(PlayerPedId(), false)
    SetPlayerVisibleLocally(PlayerId(), false)
    NetworkSetEntityVisibleToNetwork(PlayerPedId(), false)
    SetEntityCoords(PlayerPedId(), -1121.99, -3026.76, -7.15)
    FreezeEntityPosition(PlayerPedId(), true)

    SetNuiFocus(true, true)

    Citizen.Wait(300)

    SendNUIMessage({
                       action     = "openui",
                       window     = "selector",
                       characters = Characters,
                   })
end)

RegisterNetEvent('tcrp-character-creator:SetupCharacters')
AddEventHandler('tcrp-character-creator:SetupCharacters', function()
    -- Hover over the city
    SetTimecycleModifier('hud_def_blur')
    FreezeEntityPosition(GetPlayerPed(-1), true)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1355.93, -1487.78, 520.75, 300.00, 0.00, 0.00, 100.00, false,
                              0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    Citizen.Wait(1700)
end)

RegisterNUICallback('exitGame', function()
    ForceSocialClubUpdate()
end)

RegisterNUICallback('playCharacter', function(data)
    SetNuiFocus(false)
    SendNUIMessage({
                       action = "closegui"
                   })

    -- Zoom up from the airport to the sky
    SetTimecycleModifier('hud_def_blur')
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1355.93, -1487.78, 520.75, 300.00, 0.00, 0.00, 100.00, false,
                              0)
    PointCamAtCoord(cam2, -1355.93, -1487.78, 520.75)
    RenderScriptCams(true, false, 1, true, true)
    SetCamActiveWithInterp(cam, cam2, 3700, true, true)
    DestroyCam(cam2, true)

    Citizen.Wait(3700)

    TriggerServerEvent('tcrp-character-creator:CharacterChosen', data.id, data.isChar)
end)

RegisterNUICallback('deleteCharacter', function(data)
    TriggerServerEvent('tcrp-character-creator:DeleteCharacter', data.id)
end)

RegisterNetEvent('tcrp-character-creator:ReloadCharacters')
AddEventHandler('tcrp-character-creator:ReloadCharacters', function()
    TriggerServerEvent("tcrp-character-creator:ReloadCharacters")
end)

RegisterNetEvent('tcrp-character-creator:Reload')
AddEventHandler('tcrp-character-creator:Reload', function(Characters)
    SendNUIMessage({
                       action     = "reload",
                       characters = Characters,
                   })
    DeletePed(ped)
    ped = nil
end)

RegisterNUICallback('selectCharacter', function(data)
    local skin    = json.decode(data.skin)
    local gender  = skin["sex"]
    local charped = data.charped

    if gender == 0 then
        SetModel(true, skin, charped)
    else
        SetModel(false, skin, charped)
    end
end)

RegisterNUICallback('selectCreateCharacter', function(data)
    if ped ~= nil then
        DeletePed(ped)
    end
end)

--[ Helpful debugging function to dump tables to console ]--
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

RegisterNetEvent('tcrp-character-creator:spawnPlayer')
AddEventHandler('tcrp-character-creator:spawnPlayer', function(spawn, ischar)

    TriggerServerEvent('es:firstJoinProper')
    TriggerEvent('es:allowedToSpawn')
    TriggerServerEvent('playerSpawn')

    SetTimecycleModifier('default')
    local pos = spawn

    SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z)
    SetEntityVisible(PlayerPedId(), true)
    SetPlayerVisibleLocally(PlayerId(), true)
    NetworkSetEntityVisibleToNetwork(PlayerPedId(), true)

    if ischar == true then

        -- Zoom down from the sky to the players spawn position
        cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z + 200, 300.00, 0.00, 0.00, 100.00,
                                   false, 0)
        SetCamActiveWithInterp(cam2, cam, 3700, true, true)
        Citizen.Wait(3700)
        PlaySoundFrontend(-1, "Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 1)
        RenderScriptCams(false, true, 500, true, true)
        PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
        PointCamAtCoord(cam, pos.x, pos.y, pos.z + 2)
        FreezeEntityPosition(GetPlayerPed(-1), false)
        Citizen.Wait(500)
        SetCamActive(cam2, false)
        DestroyCam(cam2, true)
    else
        DoScreenFadeOut(500)
        Citizen.Wait(1500)
        DoScreenFadeIn(500)
        FreezeEntityPosition(GetPlayerPed(-1), false)
    end

    DisplayHud(true)
    DisplayRadar(true)
    isPlayerLoaded = true
    isChoosing     = false
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        ESX.TriggerServerCallback('tcrp-character-creator:getSavedPed', function(ped)
            local isPeded = ped ~= nil

            if isPeded then
                local modelHash = ped

                if type(ped) == "string" then
                    modelHash = GetHashKey(ped)
                end

                ESX.Streaming.RequestModel(modelHash, function()
                    SetPlayerModel(PlayerId(), modelHash)
                    SetModelAsNoLongerNeeded(modelHash)
                    TriggerEvent('skinchanger:loadSkin', skin, function()
                        TriggerEvent('esx:restoreLoadout')
                    end, false)
                end)
            elseif skin then
                TriggerEvent('skinchanger:loadSkin', skin, function()
                    TriggerEvent('esx:restoreLoadout')
                end)
            else
                TriggerEvent('skinchanger:loadSkin', {sex = 0})
            end
            TriggerServerEvent('tcrp-eyecolor:setEyecolor')
        end)
    end)
end)

function loadCharSelector()
    if NetworkIsSessionStarted() then
        Citizen.Wait(100)
        TriggerServerEvent('tcrp-character-creator:SetupCharacters')
        TriggerEvent('tcrp-character-creator:SetupCharacters')
    end
end

function SetModel(malePed, skin, charped)
    local characterModel

    if ped ~= nil then
        DeletePed(ped)
    end

    if charped == 'undefined' then
        charped = nil
    end

    if charped then
        characterModel = GetHashKey(charped)
    elseif malePed then
        characterModel = GetHashKey('mp_m_freemode_01')
    else
        characterModel = GetHashKey('mp_f_freemode_01')
    end

    RequestModel(characterModel)

    Citizen.CreateThread(function()
        while not HasModelLoaded(characterModel) do
            RequestModel(characterModel)
            Citizen.Wait(0)
        end

        ped = CreatePed(3, characterModel, -1121.99, -3026.76, -7.15, 252.92, false, false)

        SetModelAsNoLongerNeeded(characterModel)

        local Gender = 'f'

        if malePed then
            Gender = 'm'
        end

        exports.skinchanger:ApplySkin(skin, nil, ped, Gender)
    end)
end