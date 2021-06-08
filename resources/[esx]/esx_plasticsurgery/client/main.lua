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

ESX                           = nil

local PlayerData              = {}
local BlipList                = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasPaid                 = false
local nearZone                = nil
local isInMarker              = false

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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    refreshBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    deleteBlips()
    refreshBlips()
end)

-- Open Plastic Surgery Menu
function OpenPlasticSurgery()
    HasPaid = false

    TriggerEvent('esx_skin:openSaveableMenu', function(data, menu)
        menu.close()

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
            title    = _U('valid_purchase'),
            align    = 'top-right',
            elements = {
                { label = _U('no'), value = 'no' },
                { label = _U('yes'), value = 'yes' }
            }
        }, function(data, menu)

            if data.current.value == 'yes' then
                ESX.TriggerServerCallback('esx_plasticsurgery:checkMoney', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerEvent('esx_skin:setLastSkin', skin)
                        end)

                        TriggerServerEvent('esx_plasticsurgery:pay')
                        HasPaid = true
                    else
                        TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('not_enough_money')})
                    end
                    menu.close()
                end)
            elseif data.current.value == 'no' then
                menu.close()
            end

            CurrentAction     = 'surgery_menu'
            CurrentActionMsg  = _U('press_access')
            CurrentActionData = {}
        end, function(data, menu)
            menu.close()

            CurrentAction     = 'surgery_menu'
            CurrentActionMsg  = _U('press_access')
            CurrentActionData = {}
        end, function(data, menu)
        end, function(data, menu)
            TriggerEvent('esx_skin:getLastSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)

            CurrentAction     = 'surgery_menu'
            CurrentActionMsg  = _U('press_access')
            CurrentActionData = {}
        end)
    end, function(data, menu)
        menu.close()

        CurrentAction     = 'surgery_menu'
        CurrentActionMsg  = _U('press_access')
        CurrentActionData = {}
    end)
end

AddEventHandler('esx_plasticsurgery:hasEnteredMarker', function(zone)
    CurrentAction     = 'surgery_menu'
    CurrentActionMsg  = _U('press_access')
    CurrentActionData = {}
end)

AddEventHandler('esx_plasticsurgery:hasExitedMarker', function(zone)
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

-- Detect nearest zone
Citizen.CreateThread(function()
    while true do
        Wait(555)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local distance = nil
        nearZone = nil
        isInMarker = false
        for k, v in pairs(Config.Zones) do
            local new_distance = #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z))
            if new_distance < Config.DrawDistance and (distance == nil or new_distance < distance) then
                distance = new_distance
                nearZone = v
                if distance < v.Size.x then
                    isInMarker = true
                    currentZone = k
                end
            end
        end
    end
end)

-- Display markers
Citizen.CreateThread(function()
    while true do
        Wait(1)

        if nearZone ~= nil and nearZone.Type ~= -1 then
            DrawMarker(nearZone.Type, nearZone.Pos.x, nearZone.Pos.y, nearZone.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, nearZone.Size.x, nearZone.Size.y, 
                nearZone.Size.z, nearZone.Color.r, nearZone.Color.g, nearZone.Color.b, 100, false, true, 2, false, false, false, false)
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone                = currentZone
            TriggerEvent('esx_plasticsurgery:hasEnteredMarker', currentZone)
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_plasticsurgery:hasExitedMarker', LastZone)
        end
    end
end)

-- Key controls
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(1)

        if CurrentAction ~= nil then

            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlPressed(0, Keys['E']) then

                if CurrentAction == 'surgery_menu' then
                    OpenPlasticSurgery()
                end

                CurrentAction = nil
            end

        end

    end
end)

-- Blips
function deleteBlips()
    if BlipList[1] ~= nil then
        for i = 1, #BlipList, 1 do
            RemoveBlip(BlipList[i])
            BlipList[i] = nil
        end
    end
end

function refreshBlips()
    if Config.EnableBlips then
        if Config.EnableUnemployedOnly then
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'unemployed' or ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'gang' then
                for k, v in pairs(Config.Locations) do
                    local blip = AddBlipForCoord(v.x, v.y)

                    SetBlipSprite(blip, Config.BlipPlasticSurgery.Sprite)
                    SetBlipDisplay(blip, Config.BlipPlasticSurgery.Display)
                    SetBlipScale(blip, Config.BlipPlasticSurgery.Scale)
                    SetBlipColour(blip, Config.BlipPlasticSurgery.Color)
                    SetBlipAsShortRange(blip, true)

                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(_U('blip_plastic_surgery'))
                    EndTextCommandSetBlipName(blip)
                    table.insert(BlipList, blip)
                end
            end
        else
            for k, v in pairs(Config.Locations) do
                local blip = AddBlipForCoord(v.x, v.y)

                SetBlipSprite(blip, Config.BlipPlasticSurgery.Sprite)
                SetBlipDisplay(blip, Config.BlipPlasticSurgery.Display)
                SetBlipScale(blip, Config.BlipPlasticSurgery.Scale)
                SetBlipColour(blip, Config.BlipPlasticSurgery.Color)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(_U('blip_plastic_surgery'))
                EndTextCommandSetBlipName(blip)
                table.insert(BlipList, blip)
            end
        end
    end
end

-- Create Ped
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_y_autopsy_01"))

    while not HasModelLoaded(GetHashKey("s_m_y_autopsy_01")) do
        Wait(1)
    end

    if Config.EnablePeds then
        for _, item in pairs(Config.Locations) do
            local npc = CreatePed(4, 0xB2273D4E, item.x, item.y, item.z, item.heading, false, true)

            SetEntityHeading(npc, item.heading)
            FreezeEntityPosition(npc, true)
            SetEntityInvincible(npc, true)
            SetBlockingOfNonTemporaryEvents(npc, true)
        end
    end
end)