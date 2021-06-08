ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local PlayerData              = {}
local closeToShops            = {}
local inShop                  = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    Citizen.Wait(5000)
    PlayerData = ESX.GetPlayerData()
end)

function OpenShopMenu(zone)
    PlayerData     = ESX.GetPlayerData()

    local elements = {}
    for i = 1, #Config.Zones[zone].Items, 1 do
        local item = Config.Zones[zone].Items[i]

        table.insert(elements, {
            label            = item.label .. ' - $' .. item.price .. '',
            label_real       = item.label,
            item             = item.item,
            price            = item.price,
            license_required = item["license_required"],

            -- menu properties
            value            = 1,
            type             = 'slider',
            min              = 1,
            max              = item.limit
        })
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
        title    = _U('shop'),
        align    = 'bottom-right',
        elements = elements
    }, function(data, menu)
        if data.current.license_required then
            ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
                if hasLicense then
                    openConfirmMenu(zone, data)
                else
                    TriggerEvent('mythic_notify:client:SendErrorAlert',
                                 { text = data.current.license_required:gsub("^%l",
                                                                             string.upper) .. ' license required to purchase this item.' })
                end
            end, GetPlayerServerId(PlayerId()), data.current.license_required)
        else
            openConfirmMenu(zone, data)
        end
    end, function(data, menu)
        menu.close()
        CurrentAction     = 'shop_menu'
        CurrentActionMsg  = _U('press_menu')
        CurrentActionData = { zone = zone }
    end)
end

function openConfirmMenu(zone, data)
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
            TriggerServerEvent('esx_shops:buyItem', data.current.item, data.current.value, zone)
        end

        menu2.close()
    end, function(data2, menu2)
        menu2.close()
    end)
end

AddEventHandler('esx_shops:hasEnteredMarker', function(zone)

    CurrentAction     = 'shop_menu'
    CurrentActionMsg  = _U('press_menu')
    CurrentActionData = { zone = zone }

end)

AddEventHandler('esx_shops:hasExitedMarker', function(zone)

    CurrentAction = nil
    ESX.UI.Menu.CloseAll()

end)

-- Create Blips
Citizen.CreateThread(function()
    for k, v in pairs(Config.Zones) do
        for i = 1, #v.Pos, 1 do
            if v.Blip ~= 0 then
                local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
                SetBlipSprite(blip, v.Blip)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 1.0)
                SetBlipColour(blip, v.BlipColor)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(_U('shops'))
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

-- Detect closest shop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        closeToShops = {}
        inShop = nil

        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Pos, 1 do
                if not v.Color then
                    v.Color = Config.Color
                end
                local distance = #(coords - vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z))
                if Config.Type ~= -1 and distance < Config.DrawDistance then
                    table.insert(closeToShops, v)
                    if distance < Config.Size.x then
                        inShop = k
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Pos, 1 do
                local distance = #(coords - vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z))
                if (distance < Config.DrawDistance) then
                    DrawMarker(Config.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z,0.0,0.0,0.0,0.0,0.0,0.0,Config.Size.x, Config.Size.y, Config.Size.z,
                    Config.Color.r, Config.Color.g, Config.Color.b, 100, false,
                    true,
                    2, false, false, false, false)
                end
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

        if inShop ~= nil then
            isInMarker  = true
            ShopItems   = Config.Zones[inShop].Items
            currentZone = inShop
            LastZone    = inShop
        end

        if isInMarker and not HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = true
            TriggerEvent('esx_shops:hasEnteredMarker', currentZone)
        end
        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_shops:hasExitedMarker', LastZone)
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

            if IsControlJustReleased(0, 38) and inShop then

                job = ESX.GetPlayerData().job.name
                if not Config.Zones[CurrentActionData.zone].job or Config.Zones[CurrentActionData.zone].job == nil or Config.Zones[CurrentActionData.zone].job == job then
                    if CurrentAction == 'shop_menu' then
                        OpenShopMenu(CurrentActionData.zone)
                    end
                else
                    ESX.ShowNotification("You do not have the right job for this.")
                end

                CurrentAction = nil

            end

        end
    end
end)