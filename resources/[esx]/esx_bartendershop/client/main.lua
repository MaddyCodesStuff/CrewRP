ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local PlayerData              = {}
local closeToBars             = {}
local inBar                   = nil

AddEventHandler('esx_status:loaded', function(status)
    TriggerEvent('esx_status:registerStatus', 'poison', 0, '#228B22',
                 function(status)
                     if status.val > 0 then
                         return false
                     else
                         return false
                     end
                 end,
                 function(status)
                     status.remove(10000)
                 end
    )

    Citizen.CreateThread(function()

        while true do

            Wait(1000)

            local playerPed  = GetPlayerPed(-1)
            local prevHealth = GetEntityHealth(playerPed)
            local health     = prevHealth

            TriggerEvent('esx_status:getStatus', 'poison', function(status)
                if status.val > 0 then
                    if prevHealth <= 150 then
                        health = health - 5
                    else
                        health = health - 1
                    end
                end
            end)

            if health ~= prevHealth then
                SetEntityHealth(playerPed, health)
            end

        end

    end)
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    Citizen.Wait(5000)
    PlayerData = ESX.GetPlayerData()

    ESX.TriggerServerCallback('bar:requestDBItems', function(ShopItems)
        for k, v in pairs(ShopItems) do
            if Config.Zones[k] then
                Config.Zones[k].Items = v
            end
        end
    end)
end)

function OpenShopMenu(zone)
    PlayerData     = ESX.GetPlayerData()

    local elements = {}
    for i = 1, #Config.Zones[zone].Items, 1 do
        local item = Config.Zones[zone].Items[i]

        if item then
            table.insert(elements, {
                label      = item.label .. ' - $' .. item.price .. '',
                label_real = item.label,
                item       = item.item,
                price      = item.price,

                -- menu properties
                value      = 1,
                type       = 'slider',
                min        = 1,
                max        = item.limit
            })
        end
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
        title    = _U('shop'),
        align    = 'bottom-right',
        elements = elements
    }, function(data, menu)
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
            title    = _U('shop_confirm', data.current.value, data.current.label_real,
                          data.current.price * data.current.value),
            align    = 'bottom-right',
            elements = {
                { label = _U('no'), value = 'no' },
                { label = _U('yes'), value = 'yes' }
            }
        }, function(data2, menu2)
            if data2.current.value == 'yes' then
                TriggerServerEvent('bar:buyItem', data.current.item, data.current.value, zone)
            end

            menu2.close()
        end, function(data2, menu2)
            menu2.close()
        end)
    end, function(data, menu)
        menu.close()
        CurrentAction     = 'shop_menu'
        CurrentActionMsg  = _U('press_menu')
        CurrentActionData = { zone = zone }
    end)
end

AddEventHandler('bar:hasEnteredMarker', function(zone)

    CurrentAction     = 'shop_menu'
    CurrentActionMsg  = _U('press_menu')
    CurrentActionData = { zone = zone }
end)

AddEventHandler('bar:hasExitedMarker', function(zone)

    CurrentAction = nil
    ESX.UI.Menu.CloseAll()
end)

-- Create Blips
Citizen.CreateThread(function()
    for k, v in pairs(Config.Zones) do
        for i = 1, #v.Pos, 1 do
            if not v.ShowBlip then
                v.ShowBlip = false
            end
            if v.Blip ~= 0 and v.ShowBlip then
                if not v.BlipName then
                    v.BlipName = 'Bar'
                end
                local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z - Config.MarkerOffset)
                SetBlipSprite(blip, v.Blip)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 1.0)
                SetBlipColour(blip, v.BlipColor)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.BlipName)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

-- Detect close bar
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        closeToBars = {}
        inBar = nil

        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Pos, 1 do
                if not v.Color then
                    v.Color = Config.Color
                end
                local distance = #(coords - vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z))
                if Config.Type ~= -1 and distance < Config.DrawDistance then
                    table.insert(closeToBars, v)
                    if distance < Config.Size.x then
                        inBar = k
                    end
                end
            end
        end
    end
end)

-- Display markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for j = 1, #closeToBars, 1 do
            v = closeToBars[j]
            for i = 1, #v.Pos, 1 do
                if not v.Color then
                    v.Color = Config.Color
                end
                DrawMarker(Config.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z - Config.MarkerOffset, 0.0, 0.0, 0.0,
                                   0.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, v.Color.r, v.Color.g,
                                   v.Color.b, 100, false, true, 2, false, false, false, false)
            end
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300)
        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil

        if inBar ~= nil then
            isInMarker  = true
            ShopItems   = Config.Zones[inBar].Items
            currentZone = inBar
            LastZone    = inBar
        end

        if isInMarker and not HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = true
            TriggerEvent('bar:hasEnteredMarker', currentZone)
        end
        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('bar:hasExitedMarker', LastZone)
        end
    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CurrentAction ~= nil then

            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0, 38) then

                if CurrentAction == 'shop_menu' then
                    OpenShopMenu(CurrentActionData.zone)
                end

                CurrentAction = nil
            end
        end
    end
end)