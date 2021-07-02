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
local GUI                     = {}
GUI.Time                      = 0
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasPayed                = false
local nearZone                = nil
local isInMarker              = false

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

end)

function OpenShopMenu()

    HasPayed = false

    TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
        menu.close()

        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'shop_confirm',
            {
                title    = _U('valid_this_purchase'),
                align    = 'top',
                elements = {
                    { label = _U('yes'), value = 'yes' },
                    { label = _U('no'), value = 'no' },
                }
            },
            function(data, menu)

                if data.current.value == 'yes' then

                    ESX.TriggerServerCallback('esx_clotheshop:checkMoney', function(hasEnoughMoney)

                        if hasEnoughMoney then

                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('esx_skin:setLastSkin', skin)
                            end)

                            TriggerServerEvent('esx_clotheshop:pay')

                            HasPayed = true
                        else
                            TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('not_enough_money')})
                        end

                        menu.close()

                    end)

                elseif data.current.value == 'no' then
                    menu.close()
                end

                CurrentAction     = 'shop_menu'
                CurrentActionMsg  = _U('press_menu')
                CurrentActionData = {}

            end,
            function(data, menu)
                menu.close()

                CurrentAction     = 'shop_menu'
                CurrentActionMsg  = _U('press_menu')
                CurrentActionData = {}

            end,
            function(data, menu)
            end,
            function(data, menu)
                TriggerEvent('esx_skin:getLastSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)

                CurrentAction     = 'shop_menu'
                CurrentActionMsg  = _U('press_menu')
                CurrentActionData = {}

            end
        )

    end, function(data, menu)

        menu.close()

        CurrentAction     = 'shop_menu'
        CurrentActionMsg  = _U('press_menu')
        CurrentActionData = {}

    end, {
                     'tshirt_1',
                     'tshirt_2',
                     'torso_1',
                     'torso_2',
                     'decals_1',
                     'decals_2',
                     'arms',
                     'pants_1',
                     'pants_2',
                     'shoes_1',
                     'shoes_2',
                     'chain_1',
                     'chain_2',
                 })

end

AddEventHandler('esx_clotheshop:hasEnteredMarker', function(zone)
    CurrentAction     = 'shop_menu'
    CurrentActionMsg  = _U('press_menu')
    CurrentActionData = {}
end)

AddEventHandler('esx_clotheshop:hasExitedMarker', function(zone)

    ESX.UI.Menu.CloseAll()
    CurrentAction = nil

    if not HasPayed then

        TriggerEvent('esx_skin:getLastSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)


    end

end)

-- Create Blips
Citizen.CreateThread(function()

    for i = 1, #Config.Shops, 1 do

        local blip = AddBlipForCoord(Config.Shops[i].x, Config.Shops[i].y, Config.Shops[i].z)

        SetBlipSprite(blip, 73)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 10)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(_U('clothes'))
        EndTextCommandSetBlipName(blip)
    end

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
            TriggerEvent('esx_clotheshop:hasEnteredMarker', currentZone)
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_clotheshop:hasExitedMarker', LastZone)
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

            if IsControlPressed(0, Keys['E']) and (GetGameTimer() - GUI.Time) > 300 then

                if CurrentAction == 'shop_menu' then
                    OpenShopMenu()
                end

                CurrentAction = nil
                GUI.Time      = GetGameTimer()

            end

        end

    end
end)