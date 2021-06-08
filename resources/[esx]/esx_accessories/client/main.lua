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
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsDead                  = false
local nearZone                = {pos = nil, type = nil}
local isInMarker  = false
local currentZone = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

function OpenAccessoryMenu()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'set_unset_accessory',
        {
            title    = _U('set_unset'),
            align    = 'top-right',
            elements = {
                { label = _U('helmet'), value = 'Helmet' },
                { label = _U('ears'), value = 'Ears' },
                { label = _U('mask'), value = 'Mask' },
                { label = _U('glasses'), value = 'Glasses' },
                { label = "Bag", value = 'Bags' }
            }
        },
        function(data, menu)
            menu.close()
            SetUnsetAccessory(data.current.value)

        end,
        function(data, menu)
            menu.close()
        end
    )
end

function SetUnsetAccessory(accessory)

    ESX.TriggerServerCallback('esx_accessories:get', function(hasAccessory, accessorySkin)
        local _accessory = string.lower(accessory)

        if hasAccessory then
            TriggerEvent('skinchanger:getSkin', function(skin)
                local mAccessory = -1
                local mColor     = 0
                if _accessory == "mask" then
                    mAccessory = 0
                end
                if skin[_accessory .. '_1'] == mAccessory then
                    mAccessory = accessorySkin[_accessory .. '_1']
                    mColor     = accessorySkin[_accessory .. '_2']
                end
                local accessorySkin               = {}
                accessorySkin[_accessory .. '_1'] = mAccessory
                accessorySkin[_accessory .. '_2'] = mColor
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end)
        else
            TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('no_' .. _accessory)})
        end

    end, accessory)

end

function OpenShopMenu(accessory)

    if accessory then
        local restrict = {}

        restrict       = { string.lower(accessory) .. '_1', string.lower(accessory) .. '_2' }

        TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)

            menu.close()

            ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'shop_confirm',
                {
                    title    = _U('valid_purchase'),
                    align    = 'top-left',
                    elements = {
                        { label = _U('yes'), value = 'yes' },
                        { label = _U('no'), value = 'no' },
                    }
                },
                function(data, menu)
                    if data.current.value == 'yes' then
                        ESX.TriggerServerCallback('esx_accessories:checkMoney', function(hasEnoughMoney)
                            if hasEnoughMoney then
                                TriggerServerEvent('esx_accessories:pay')
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    TriggerServerEvent('esx_accessories:save', skin, accessory)
                                    TriggerEvent('esx_skin:setLastSkin', skin)
                                end)
                            else
                                TriggerEvent('mythic_notify:client:SendErrorAlert', { text = _U('not_enough_money')})
                            end
                            menu.close()
                        end)
                    elseif data.current.value == 'no' then
                        menu.close()
                    end
                    CurrentAction     = 'shop_menu'
                    CurrentActionMsg  = _U('press_access')
                    CurrentActionData = {}
                end,
                function(data, menu)
                    menu.close()
                    CurrentAction     = 'shop_menu'
                    CurrentActionMsg  = _U('press_access')
                    CurrentActionData = {}

                end,
                function(data, menu)
                end,
                function(data, menu)

                    TriggerEvent('esx_skin:getLastSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)

                    CurrentAction     = 'shop_menu'
                    CurrentActionMsg  = _U('press_access')
                    CurrentActionData = {}

                end
            )

        end,
            function(data, menu)
                menu.close()
                CurrentAction     = 'shop_menu'
                CurrentActionMsg  = _U('press_access')
                CurrentActionData = {}
            end, restrict)
    end

end

AddEventHandler('playerSpawned', function()
    IsDead = false
end)

AddEventHandler('baseevents:onPlayerDied', function(killerType, coords)
    TriggerEvent('esx_ambulancejob:onPlayerDeath')
end)

AddEventHandler('baseevents:onPlayerKilled', function(killerId, data)
    TriggerEvent('esx_ambulancejob:onPlayerDeath')
end)

AddEventHandler('esx_ambulancejob:onPlayerDeath', function()
    IsDead = true
end)

AddEventHandler('esx_accessories:hasEnteredMarker', function(zone)

    CurrentAction     = 'shop_menu'
    CurrentActionMsg  = _U('press_access')
    CurrentActionData = { accessory = zone }

end)

AddEventHandler('esx_accessories:hasExitedMarker', function(zone)
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

-- Create Blips --
Citizen.CreateThread(function()
    for k, v in pairs(Config.ShopsBlips) do
        if v.Pos ~= nil then
            for i = 1, #v.Pos, 1 do
                local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)

                SetBlipSprite(blip, v.Blip.sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 1.0)
                SetBlipColour(blip, v.Blip.color)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                -- AddTextComponentString(_U('store') .. ' ' .. _U(string.lower(k)))
                AddTextComponentString(_U(string.lower(k)) .. ' ' .. _U('store'))
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

-- Detect nearest zone
Citizen.CreateThread(function()
    while true do
        Wait(555)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local distance = nil
        nearZone = {pos = nil, type = nil}
        isInMarker = false
        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Pos, 1 do
                local new_distance = #(coords - vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z))
                if new_distance < Config.DrawDistance and (distance == nil or new_distance < distance) then
                    distance = new_distance
                    nearZone.pos = v.Pos[i]
                    nearZone.type = k
                    if distance < Config.Size.x then
                        isInMarker = true
                        currentZone = k
                    end
                end
            end
        end
    end
end)

-- Display markers
Citizen.CreateThread(function()
    while true do
        Wait(1)

        if nearZone.pos ~= nil and Config.Type ~= -1 then
            DrawMarker(Config.Type, nearZone.pos.x, nearZone.pos.y, nearZone.pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
                       Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g,
                       Config.Color.b, 100, false, true, 2, false, false, false, false)
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone                = currentZone
            TriggerEvent('esx_accessories:hasEnteredMarker', currentZone)
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_accessories:hasExitedMarker', LastZone)
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

            if IsControlJustReleased(0, 38) then
                OpenShopMenu(CurrentActionData.accessory)
                CurrentAction = nil
            end
        end
    end
end)