local Keys                    = {
    ["ESC"]       = 322,
    ["F1"]        = 288,
    ["F2"]        = 289,
    ["F3"]        = 170,
    ["F5"]        = 166,
    ["F6"]        = 167,
    ["F7"]        = 168,
    ["F8"]        = 169,
    ["F9"]        = 56,
    ["F10"]       = 57,
    ["~"]         = 243,
    ["1"]         = 157,
    ["2"]         = 158,
    ["3"]         = 160,
    ["4"]         = 164,
    ["5"]         = 165,
    ["6"]         = 159,
    ["7"]         = 161,
    ["8"]         = 162,
    ["9"]         = 163,
    ["-"]         = 84,
    ["="]         = 83,
    ["BACKSPACE"] = 177,
    ["TAB"]       = 37,
    ["Q"]         = 44,
    ["W"]         = 32,
    ["E"]         = 38,
    ["R"]         = 45,
    ["T"]         = 245,
    ["Y"]         = 246,
    ["U"]         = 303,
    ["P"]         = 199,
    ["["]         = 39,
    ["]"]         = 40,
    ["ENTER"]     = 18,
    ["CAPS"]      = 137,
    ["A"]         = 34,
    ["S"]         = 8,
    ["D"]         = 9,
    ["F"]         = 23,
    ["G"]         = 47,
    ["H"]         = 74,
    ["K"]         = 311,
    ["L"]         = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"]         = 20,
    ["X"]         = 73,
    ["C"]         = 26,
    ["V"]         = 0,
    ["B"]         = 29,
    ["N"]         = 249,
    ["M"]         = 244,
    [","]         = 82,
    ["."]         = 81,
    ["LEFTCTRL"]  = 36,
    ["LEFTALT"]   = 19,
    ["SPACE"]     = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213,
    ["PAGEUP"]    = 10,
    ["PAGEDOWN"]  = 11,
    ["DELETE"]    = 178,
    ["LEFT"]      = 174,
    ["RIGHT"]     = 175,
    ["TOP"]       = 27,
    ["DOWN"]      = 173,
    ["NENTER"]    = 201,
    ["N4"]        = 108,
    ["N5"]        = 60,
    ["N6"]        = 107,
    ["N+"]        = 96,
    ["N-"]        = 97,
    ["N7"]        = 117,
    ["N8"]        = 61,
    ["N9"]        = 118
}

ESX                           = nil
local GUI                     = {}
GUI.Time                      = 0
local OwnedProperties         = {}
local Blips                   = {}
local CurrentProperty         = nil
local CurrentPropertyOwner    = nil
local LastProperty            = nil
local LastPart                = nil
local HasAlreadyEnteredMarker = false
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local FirstSpawn              = true
local HasChest                = false
local closeToProperty         = nil
local inProperty              = nil

function DrawSub(text, time)
    ClearPrints()
    SetTextEntry_2('STRING')
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end

function CreateBlips()

    for i = 1, #Config.Properties, 1 do

        local property = Config.Properties[i]

        if property.entering ~= nil then

            Blips[property.name] = AddBlipForCoord(property.entering.x, property.entering.y, property.entering.z)

            SetBlipSprite(Blips[property.name], 369)
            SetBlipDisplay(Blips[property.name], 4)
            SetBlipScale(Blips[property.name], 1.0)
            SetBlipAsShortRange(Blips[property.name], true)

            BeginTextCommandSetBlipName("STRING")
            -- AddTextComponentString(_U('free_prop'))
            AddTextComponentString(property.label)
            EndTextCommandSetBlipName(Blips[property.name])
        end
    end
end

function GetProperties()
    return Config.Properties
end

function GetProperty(name)

    for i = 1, #Config.Properties, 1 do
        if Config.Properties[i].name == name then
            return Config.Properties[i]
        end
    end
end

function GetGateway(property)

    for i = 1, #Config.Properties, 1 do

        local property2 = Config.Properties[i]

        if property2.isGateway and property2.name == property.gateway then
            return property2
        end
    end
end

function GetGatewayProperties(property)

    local properties = {}

    for i = 1, #Config.Properties, 1 do
        if Config.Properties[i].gateway == property.name then
            table.insert(properties, Config.Properties[i])
        end
    end

    return properties
end

function EnterProperty(name, owner)

    local property       = GetProperty(name)
    local playerPed      = GetPlayerPed(-1)
    CurrentProperty      = property
    CurrentPropertyOwner = owner

    for i = 1, #Config.Properties, 1 do
        if Config.Properties[i].name ~= name then
            Config.Properties[i].disabled = true
        end
    end

    TriggerServerEvent('esx_property:saveLastProperty', name)

    Citizen.CreateThread(function()

        DoScreenFadeOut(800)

        while not IsScreenFadedOut() do
            Citizen.Wait(0)
        end

        for i = 1, #property.ipls, 1 do

            RequestIpl(property.ipls[i])

            while not IsIplActive(property.ipls[i]) do
                Citizen.Wait(0)
            end
        end

        SetEntityCoords(playerPed, property.inside.x, property.inside.y, property.inside.z)

        DoScreenFadeIn(800)

        DrawSub(property.label, 5000)
    end)
end

function ExitProperty(name)

    local property  = GetProperty(name)
    local playerPed = GetPlayerPed(-1)
    local outside   = nil
    CurrentProperty = nil

    if property.isSingle then
        outside = property.outside
    else
        outside = GetGateway(property).outside
    end

    TriggerServerEvent('esx_property:deleteLastProperty')

    Citizen.CreateThread(function()

        DoScreenFadeOut(800)

        while not IsScreenFadedOut() do
            Citizen.Wait(0)
        end

        SetEntityCoords(playerPed, outside.x, outside.y, outside.z)

        for i = 1, #property.ipls, 1 do
            RemoveIpl(property.ipls[i])
        end

        for i = 1, #Config.Properties, 1 do
            Config.Properties[i].disabled = false
        end

        DoScreenFadeIn(800)
    end)
end

function SetPropertyOwned(name, owned)

    local property     = GetProperty(name)
    local entering     = nil
    local enteringName = nil

    if property.isSingle then
        entering     = property.entering
        enteringName = property.name
    else
        local gateway = GetGateway(property)
        entering      = gateway.entering
        enteringName  = gateway.name
    end

    if owned then

        OwnedProperties[name] = true

        RemoveBlip(Blips[enteringName])

        Blips[enteringName] = AddBlipForCoord(entering.x, entering.y, entering.z)

        SetBlipSprite(Blips[enteringName], 357)
        SetBlipAsShortRange(Blips[enteringName], true)

        BeginTextCommandSetBlipName("STRING")
        -- AddTextComponentString(_U('property'))
        AddTextComponentString(property.label)
        EndTextCommandSetBlipName(Blips[enteringName])

    else

        OwnedProperties[name] = nil

        local found           = false

        for k, v in pairs(OwnedProperties) do

            local _property = GetProperty(k)
            local _gateway  = GetGateway(_property)

            if _gateway ~= nil then

                if _gateway.name == enteringName then
                    found = true
                    break
                end
            end
        end

        if not found then

            RemoveBlip(Blips[enteringName])

            Blips[enteringName] = AddBlipForCoord(entering.x, entering.y, entering.z)

            SetBlipSprite(Blips[enteringName], 369)
            SetBlipAsShortRange(Blips[enteringName], true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(_U('free_prop'))
            EndTextCommandSetBlipName(Blips[enteringName])
        end
    end
end

function PropertyIsOwned(property)
    return OwnedProperties[property.name] == true
end

function OpenPropertyMenu(property)

    local elements = {}

    if PropertyIsOwned(property) then

        table.insert(elements, { label = _U('enter'), value = 'enter' })

        if not Config.EnablePlayerManagement then
            table.insert(elements, { label = _U('leave'), value = 'leave' })
        end

    else

        if not Config.EnablePlayerManagement then
            -- table.insert(elements, {label = _U('buy'), value = 'buy'})
            table.insert(elements, { label = _U('rent'), value = 'rent' })
        end

        table.insert(elements, { label = _U('visit'), value = 'visit' })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'property',
                     {
                         title    = property.label,
                         align    = 'top-right',
                         elements = elements,
                     },
                     function(data2, menu)

                         menu.close()

                         if data2.current.value == 'enter' then
                             TriggerEvent('instance:create', 'property',
                                          { property = property.name, owner = ESX.GetPlayerData().identifier })
                         end

                         if data2.current.value == 'leave' then
                             TriggerServerEvent('esx_property:removeOwnedProperty', property.name)
                         end

                         if data2.current.value == 'buy' then
                             TriggerServerEvent('esx_property:buyProperty', property.name)
                         end

                         if data2.current.value == 'rent' then
                             TriggerServerEvent('esx_property:rentProperty', property.name)
                         end

                         if data2.current.value == 'visit' then
                             TriggerEvent('instance:create', 'property',
                                          { property = property.name, owner = ESX.GetPlayerData().identifier })
                         end
                     end,
                     function(data, menu)

                         menu.close()

                         CurrentAction     = 'property_menu'
                         CurrentActionMsg  = _U('press_to_menu')
                         CurrentActionData = { property = property }
                     end)
end

function OpenGatewayMenu(property)

    if Config.EnablePlayerManagement then
        OpenGatewayOwnedPropertiesMenu(gatewayProperties)
    else

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gateway',
                         {
                             title    = property.name,
                             align    = 'top-right',
                             elements = {
                                 { label = _U('owned_properties'), value = 'owned_properties' },
                                 { label = _U('available_properties'), value = 'available_properties' },
                             }
                         },
                         function(data, menu)

                             if data.current.value == 'owned_properties' then
                                 OpenGatewayOwnedPropertiesMenu(property)
                             end

                             if data.current.value == 'available_properties' then
                                 OpenGatewayAvailablePropertiesMenu(property)
                             end
                         end,
                         function(data, menu)

                             menu.close()

                             CurrentAction     = 'gateway_menu'
                             CurrentActionMsg  = _U('press_to_menu')
                             CurrentActionData = { property = property }
                         end)
    end
end

function OpenGatewayOwnedPropertiesMenu(property)

    local gatewayProperties = GetGatewayProperties(property)
    local elements          = {}

    for i = 1, #gatewayProperties, 1 do

        if PropertyIsOwned(gatewayProperties[i]) then
            table.insert(elements, {
                label = gatewayProperties[i].label,
                value = gatewayProperties[i].name
            })
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gateway_owned_properties',
                     {
                         title    = property.name .. ' - ' .. _U('owned_properties'),
                         align    = 'top-right',
                         elements = elements,
                     },
                     function(data, menu)

                         menu.close()

                         local elements = {
                             { label = _U('enter'), value = 'enter' }
                         }

                         if not Config.EnablePlayerManagement then
                             table.insert(elements, { label = _U('leave'), value = 'leave' })
                         end

                         ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gateway_owned_properties_actions',
                                          {
                                              title    = data.current.label,
                                              align    = 'top-right',
                                              elements = elements,
                                          },
                                          function(data2, menu)

                                              menu.close()

                                              if data2.current.value == 'enter' then
                                                  TriggerEvent('instance:create', 'property',
                                                               { property = data.current.value, owner = ESX.GetPlayerData().identifier })
                                              end

                                              if data2.current.value == 'leave' then
                                                  TriggerServerEvent('esx_property:removeOwnedProperty',
                                                                     data.current.value)
                                              end
                                          end,
                                          function(data, menu)
                                              menu.close()
                                          end)
                     end,
                     function(data, menu)
                         menu.close()
                     end)
end

function OpenGatewayAvailablePropertiesMenu(property)

    local gatewayProperties = GetGatewayProperties(property)
    local elements          = {}

    for i = 1, #gatewayProperties, 1 do

        if not PropertyIsOwned(gatewayProperties[i]) then
            table.insert(elements, {
                label = gatewayProperties[i].label .. ' $' .. gatewayProperties[i].price / 52,
                value = gatewayProperties[i].name,
                price = gatewayProperties[i].price
            })
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gateway_available_properties',
                     {
                         title    = property.name .. ' - ' .. _U('available_properties'),
                         align    = 'top-right',
                         elements = elements,
                     },
                     function(data, menu)

                         menu.close()

                         ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gateway_available_properties_actions',
                                          {
                                              title    = property.name,
                                              align    = 'top-right',
                                              elements = {
                                                  -- {label = _U('buy'), value = 'buy'},
                                                  { label = _U('rent'), value = 'rent' },
                                                  { label = _U('visit'), value = 'visit' },
                                              },
                                          },
                                          function(data2, menu)
                                              menu.close()

                                              if data2.current.value == 'buy' then
                                                  TriggerServerEvent('esx_property:buyProperty', data.current.value)
                                              end

                                              if data2.current.value == 'rent' then
                                                  TriggerServerEvent('esx_property:rentProperty', data.current.value)
                                              end

                                              if data2.current.value == 'visit' then
                                                  TriggerEvent('instance:create', 'property',
                                                               { property = data.current.value, owner = ESX.GetPlayerData().identifier })
                                              end
                                          end,
                                          function(data, menu)
                                              menu.close()
                                          end)
                     end,
                     function(data, menu)
                         menu.close()
                     end)
end

function OpenRoomMenu(property, owner)

    local entering = nil
    local elements = {}

    if property.isSingle then
        entering = property.entering
    else
        entering = GetGateway(property).entering
    end

    table.insert(elements, { label = _U('invite_player'), value = 'invite_player' })

    if CurrentPropertyOwner == owner then
        -- Temporarily disable these, and make our own wardrobe
        table.insert(elements, { label = "Outfits", value = 'outfits' })
        -- table.insert(elements, {label = _U('player_clothes'), value = 'player_dressing'})
        -- table.insert(elements, {label = _U('remove_cloth'), value = 'remove_cloth'})
    end

    -- Removed for inventory HUD support
    -- table.insert(elements, {label = _U('remove_object'),  value = 'room_inventory'})
    -- table.insert(elements, {label = _U('deposit_object'), value = 'player_inventory'})
    -- table.insert(elements, {label = "Property inventory", value = "property_inventory"}) -- Disable this until we can fix it better

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room',
                     {
                         title    = property.label,
                         align    = 'top-right',
                         elements = elements,
                     },
                     function(data, menu)

                         if data.current.value == 'invite_player' then

                             local playersInArea = ESX.Game.GetPlayersInArea(entering, 10.0)
                             local elements      = {}

                             for i = 1, #playersInArea, 1 do
                                 if playersInArea[i] ~= PlayerId() then
                                     table.insert(elements,
                                                  { label = GetPlayerName(playersInArea[i]), value = playersInArea[i] })
                                 end
                             end

                             ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_invite',
                                              {
                                                  title    = property.label .. ' - ' .. _U('invite'),
                                                  align    = 'top-right',
                                                  elements = elements,
                                              },
                                              function(data, menu)
                                                  TriggerEvent('instance:invite', 'property',
                                                               GetPlayerServerId(data.current.value),
                                                               { property = property.name, owner = owner })
                                                  ESX.ShowNotification(_U('you_invited',
                                                                          GetPlayerName(data.current.value)))
                                              end,
                                              function(data, menu)
                                                  menu.close()
                                              end)
                         end
                         if data.current.value == 'outfits' then

                             -- Get the outfits for this property

                             outfits         = {}
                             otherProperties = {}

                             ESX.TriggerServerCallback('esx_property:getPropertyWardrobe',
                                                       function(result)

                                                           if #result > 0 then
                                                               for i = 1, #result, 1 do
                                                                   table.insert(outfits,
                                                                                { id = result[i].id, name = result[i].name })
                                                               end
                                                           end
                                                       end,
                                                       property.name)

                             ESX.TriggerServerCallback('esx_property:getOtherProperties',
                                                       function(result)

                                                           if #result > 0 then
                                                               for i = 1, #result, 1 do
                                                                   table.insert(otherProperties,
                                                                                { name = result[i].name, label = result[i].label })
                                                               end
                                                           end
                                                       end,
                                                       property.name)

                             -- local outfits = {}

                             -- for i=1, 5, 1 do
                             --   table.insert(outfits,{id = i, name = 'Outfit '.. i})
                             -- end
                             local elements = {}

                             table.insert(elements, { label = "Save Current Outfit", value = 'save_outfit' })
                             table.insert(elements, { label = "Change Outfits", value = 'change_outfit' })
                             table.insert(elements, { label = "Remove Outfits", value = 'remove_outfit' })
                             table.insert(elements, { label = "Copy Outfits", value = 'copy_outfits' })

                             ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'outfits',
                                              {
                                                  title    = property.label .. ' - Closet',
                                                  align    = 'top-right',
                                                  elements = elements,
                                              },
                                              function(data2, menu2)
                                                  if data2.current.value == 'save_outfit' then

                                                      TriggerEvent('tcrp-input:OpenInput', 'Name of Outfit', 'text',
                                                                   255, function(value)
                                                              local data = {}

                                                              TriggerEvent('skinchanger:getSkin', function(skin)
                                                                  -- TriggerServerEvent('esx_clotheshop:saveOutfit', data3.value, skin)
                                                                  local data    = {}
                                                                  data.name     = value
                                                                  data.skin     = skin
                                                                  data.property = property.name

                                                                  TriggerServerEvent('esx_property:saveWardrobe', data)
                                                              end)
                                                          end)

                                                      -- Do the stuff to save the current outfit
                                                      -- ESX.ShowNotification("You are attempting to save your current outfit")
                                                  elseif data2.current.value == 'change_outfit' then

                                                      local elements = {}

                                                      if outfits then
                                                          for i = 1, #outfits, 1 do
                                                              table.insert(elements,
                                                                           { label = outfits[i].name, value = outfits[i].id })
                                                          end
                                                      end

                                                      ESX.UI.Menu.Open('default', GetCurrentResourceName(),
                                                                       'outfit_list',
                                                                       {
                                                                           title    = property.label .. ' - Outfits',
                                                                           align    = 'top-right',
                                                                           elements = elements,
                                                                       },
                                                                       function(data3, menu3)

                                                                           TriggerEvent('skinchanger:getSkin',
                                                                                        function(skin)
                                                                                            ESX.TriggerServerCallback('esx_property:getOutfit',
                                                                                                                      function(clothes)

                                                                                                                          local change = json.decode(clothes)

                                                                                                                          TriggerEvent('skinchanger:loadClothes',
                                                                                                                                       skin,
                                                                                                                                       change)
                                                                                                                          TriggerEvent('esx_skin:setLastSkin',
                                                                                                                                       skin)
                                                                                                                          TriggerEvent('skinchanger:getSkin',
                                                                                                                                       function(skin)
                                                                                                                                           TriggerServerEvent('esx_skin:save',
                                                                                                                                                              skin)
                                                                                                                                       end)
                                                                                                                      end,
                                                                                                                      data3.current.value)
                                                                                        end)

                                                                           -- Do the stuff to apply the skin and save it
                                                                       end,
                                                                       function(data3, menu3)
                                                                           menu3.close()
                                                                       end)
                                                  elseif data2.current.value == 'remove_outfit' then

                                                      local elements = {}

                                                      if outfits then
                                                          for i = 1, #outfits, 1 do
                                                              table.insert(elements,
                                                                           { label = outfits[i].name, value = outfits[i].id })
                                                          end
                                                      end

                                                      ESX.UI.Menu.Open('default', GetCurrentResourceName(),
                                                                       'remove_outfit',
                                                                       {
                                                                           title    = property.label .. ' - Remove Outfits',
                                                                           align    = 'top-right',
                                                                           elements = elements,
                                                                       },
                                                                       function(data3, menu3)
                                                                           ESX.UI.Menu.Open('default',
                                                                                            GetCurrentResourceName(),
                                                                                            'remove_confirm',
                                                                                            {
                                                                                                title    = 'Are you sure you want to delete outfit ' .. data3.current.label .. '?',
                                                                                                align    = 'top',
                                                                                                elements = {
                                                                                                    { label = 'Yes', value = 'yes' },
                                                                                                    { label = 'No', value = 'no' },
                                                                                                }
                                                                                            },
                                                                                            function(data4, menu4)

                                                                                                menu4.close()

                                                                                                if data4.current.value == 'yes' then
                                                                                                    TriggerServerEvent('esx_property:removeWardrobe',
                                                                                                                       data3.current.value)
                                                                                                end
                                                                                            end,
                                                                                            function(data4, menu4)
                                                                                                menu4.close()
                                                                                            end)
                                                                       end,
                                                                       function(data3, menu3)
                                                                           menu3.close()
                                                                       end)
                                                  elseif data2.current.value == 'copy_outfits' then
                                                      local elements = {}

                                                      if otherProperties then
                                                          for i = 1, #otherProperties, 1 do
                                                              table.insert(elements,
                                                                           { label = otherProperties[i].label, value = otherProperties[i].name })
                                                          end
                                                      end
                                                      ESX.UI.Menu.Open('default', GetCurrentResourceName(),
                                                                       'copy_outfits_select',
                                                                       {
                                                                           title    = property.label .. ' - Copy Outfits',
                                                                           align    = 'top-right',
                                                                           elements = elements,
                                                                       },
                                                                       function(data3, menu3)
                                                                           ESX.TriggerServerCallback('esx_property:copyOutfitsToProperty',
                                                                                                     function()
                                                                                                         TriggerEvent('mythic_notify:client:SendSuccessAlert',
                                                                                                                      { text = 'Clothing successfully copied to ' .. data3.current.label })
                                                                                                     end,
                                                                                                     data3.current.value,
                                                                                                     property.name)
                                                                       end,
                                                                       function(data3, menu3)
                                                                           menu3.close()
                                                                       end)
                                                  end
                                              end,
                                              function(data2, menu2)
                                                  menu2.close()
                                              end)
                         end

                         if data.current.value == 'player_dressing' then

                             ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)

                                 local elements = {}

                                 for i = 1, #dressing, 1 do
                                     table.insert(elements, { label = dressing[i], value = i })
                                 end

                                 ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing',
                                                  {
                                                      title    = property.label .. ' - ' .. _U('player_clothes'),
                                                      align    = 'top-right',
                                                      elements = elements,
                                                  },
                                                  function(data, menu)

                                                      TriggerEvent('skinchanger:getSkin', function(skin)

                                                          ESX.TriggerServerCallback('esx_property:getPlayerOutfit',
                                                                                    function(clothes)

                                                                                        TriggerEvent('skinchanger:loadClothes',
                                                                                                     skin, clothes)
                                                                                        TriggerEvent('esx_skin:setLastSkin',
                                                                                                     skin)

                                                                                        TriggerEvent('skinchanger:getSkin',
                                                                                                     function(skin)
                                                                                                         TriggerServerEvent('esx_skin:save',
                                                                                                                            skin)
                                                                                                     end)
                                                                                    end, data.current.value)
                                                      end)
                                                  end,
                                                  function(data, menu)
                                                      menu.close()
                                                  end)
                             end)
                         end

                         if data.current.value == 'remove_cloth' then
                             ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
                                 local elements = {}

                                 for i = 1, #dressing, 1 do
                                     table.insert(elements, { label = dressing[i].label, value = i })
                                 end

                                 ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth',
                                                  {
                                                      title    = property.label .. ' - ' .. _U('remove_cloth'),
                                                      align    = 'top-right',
                                                      elements = elements,
                                                  },
                                                  function(data, menu)
                                                      menu.close()
                                                      TriggerServerEvent('esx_property:removeOutfit',
                                                                         data.current.value)
                                                      ESX.ShowNotification(_U('removed_cloth'))
                                                  end,
                                                  function(data, menu)
                                                      menu.close()
                                                  end)
                             end)
                         end

                         if data.current.value == "property_inventory" then
                             menu.close()
                             -- OpenNewPropertyInventoryMenu(property.name, owner)
                             OpenPropertyInventoryMenu(property, owner)
                             -- if data.current.value == 'room_inventory' then
                             --   OpenRoomInventoryMenu(property, owner)
                             -- end

                             -- if data.current.value == 'player_inventory' then
                             --   OpenPlayerInventoryMenu(property, owner)
                             -- end
                         end
                     end,
                     function(data, menu)

                         menu.close()

                         CurrentAction     = 'room_menu'
                         CurrentActionMsg  = _U('press_to_menu')
                         CurrentActionData = { property = property, owner = owner }
                     end)
end

function OpenRoomInventoryMenu(property, owner)

    ESX.TriggerServerCallback('esx_property:getPropertyInventory', function(inventory)

        local elements = {}

        table.insert(elements,
                     { label = _U('dirty_money') .. inventory.blackMoney, type = 'item_account', value = 'black_money' })

        for i = 1, #inventory.items, 1 do

            local item = inventory.items[i]

            if item.count > 0 then
                table.insert(elements,
                             { label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name })
            end
        end

        for i = 1, #inventory.weapons, 1 do
            local weapon = inventory.weapons[i]
            table.insert(elements,
                         { label = ESX.GetWeaponLabel(weapon.name) .. ' [' .. weapon.ammo .. ']', type = 'item_weapon', value = weapon.name, ammo = weapon.ammo })
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_inventory',
                         {
                             title    = property.label .. ' - ' .. _U('inventory'),
                             align    = 'top-right',
                             elements = elements,
                         },
                         function(data, menu)

                             if data.current.type == 'item_weapon' then

                                 menu.close()

                                 TriggerServerEvent('esx_property:getItem', owner, data.current.type,
                                                    data.current.value, data.current.ammo)

                                 ESX.SetTimeout(300, function()
                                     OpenRoomInventoryMenu(property, owner)
                                 end)

                             else

                                 ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'get_item_count',
                                                  {
                                                      title = _U('amount'),
                                                  },
                                                  function(data2, menu)

                                                      local quantity = tonumber(data2.value)

                                                      if quantity == nil then
                                                          ESX.ShowNotification(_U('amount_invalid'))
                                                      else

                                                          menu.close()

                                                          TriggerServerEvent('esx_property:getItem', owner,
                                                                             data.current.type, data.current.value,
                                                                             quantity)

                                                          ESX.SetTimeout(300, function()
                                                              OpenRoomInventoryMenu(property, owner)
                                                          end)
                                                      end
                                                  end,
                                                  function(data2, menu)
                                                      menu.close()
                                                  end)
                             end
                         end,
                         function(data, menu)
                             menu.close()
                         end)
    end, owner, property.name)
end

function OpenPlayerInventoryMenu(property, owner)

    ESX.TriggerServerCallback('esx_property:getPlayerInventory', function(inventory)

        local elements = {}

        table.insert(elements,
                     { label = _U('dirty_money') .. inventory.blackMoney, type = 'item_account', value = 'black_money' })

        for i = 1, #inventory.items, 1 do

            local item = inventory.items[i]

            if item.count > 0 then
                table.insert(elements,
                             { label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name })
            end
        end

        local playerPed  = GetPlayerPed(-1)
        local weaponList = ESX.GetWeaponList()

        for i = 1, #weaponList, 1 do

            local weaponHash = GetHashKey(weaponList[i].name)

            if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
                local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                table.insert(elements,
                             { label = weaponList[i].label .. ' [' .. ammo .. ']', type = 'item_weapon', value = weaponList[i].name, ammo = ammo })
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_inventory',
                         {
                             title    = property.label .. ' - ' .. _U('inventory'),
                             align    = 'top-right',
                             elements = elements,
                         },
                         function(data, menu)

                             if data.current.type == 'item_weapon' then

                                 menu.close()

                                 TriggerServerEvent('esx_property:putItem', owner, data.current.type,
                                                    data.current.value, data.current.ammo)

                                 ESX.SetTimeout(300, function()
                                     OpenPlayerInventoryMenu(property, owner)
                                 end)

                             else

                                 ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count',
                                                  {
                                                      title = _U('amount'),
                                                  },
                                                  function(data2, menu)

                                                      menu.close()

                                                      TriggerServerEvent('esx_property:putItem', owner,
                                                                         data.current.type, data.current.value,
                                                                         tonumber(data2.value))

                                                      ESX.SetTimeout(300, function()
                                                          OpenPlayerInventoryMenu(property, owner)
                                                      end)
                                                  end,
                                                  function(data2, menu)
                                                      menu.close()
                                                  end)
                             end
                         end,
                         function(data, menu)
                             menu.close()
                         end)
    end)
end

AddEventHandler('instance:loaded', function()

    TriggerEvent('instance:registerType', 'property',
                 function(instance)
                     EnterProperty(instance.data.property, instance.data.owner)
                 end,
                 function(instance)
                     ExitProperty(instance.data.property)
                 end)
end)

AddEventHandler('playerSpawned', function()

    if FirstSpawn then

        Citizen.CreateThread(function()

            while not ESX.IsPlayerLoaded() do
                Citizen.Wait(0)
            end

            ESX.TriggerServerCallback('esx_property:getLastProperty', function(propertyName)
                if propertyName ~= nil then
                    TriggerEvent('instance:create', 'property',
                                 { property = propertyName, owner = ESX.GetPlayerData().identifier })
                end
            end)
        end)

        FirstSpawn = false
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerLoaded = true
end)

AddEventHandler('esx_property:getProperties', function(cb)
    cb(GetProperties())
end)

AddEventHandler('esx_property:getProperty', function(name, cb)
    cb(GetProperty(name))
end)

AddEventHandler('esx_property:getGateway', function(property, cb)
    cb(GetGateway(property))
end)

RegisterNetEvent('esx_property:setPropertyOwned')
AddEventHandler('esx_property:setPropertyOwned', function(name, owned)
    SetPropertyOwned(name, owned)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)

    ESX.TriggerServerCallback('esx_property:getOwnedProperties', function(ownedProperties)
        for i = 1, #ownedProperties, 1 do
            SetPropertyOwned(ownedProperties[i], true)
        end
    end)
end)

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)

    if instance.type == 'property' then
        TriggerEvent('instance:enter', instance)
    end
end)

RegisterNetEvent('instance:onEnter')
AddEventHandler('instance:onEnter', function(instance)

    if instance.type == 'property' then

        local property = GetProperty(instance.data.property)
        local isHost   = GetPlayerFromServerId(instance.host) == PlayerId()
        local isOwned  = false

        if PropertyIsOwned(property) == true then
            isOwned = true
        end

        if (isOwned or not isHost) then
            HasChest = true
        else
            HasChest = false
        end
    end
end)

RegisterNetEvent('instance:onPlayerLeft')
AddEventHandler('instance:onPlayerLeft', function(instance, player)
    if player == instance.host then
        TriggerEvent('instance:leave')
    end
end)

AddEventHandler('esx_property:hasEnteredMarker', function(name, part)

    local property = GetProperty(name)

    if part == 'entering' then

        if property.isSingle then
            CurrentAction     = 'property_menu'
            CurrentActionMsg  = _U('press_to_menu')
            CurrentActionData = { property = property }
        else
            CurrentAction     = 'gateway_menu'
            CurrentActionMsg  = _U('press_to_menu')
            CurrentActionData = { property = property }
        end
    end

    if part == 'exit' then
        CurrentAction     = 'room_exit'
        CurrentActionMsg  = _U('press_to_exit')
        CurrentActionData = { propertyName = name }
    end

    if part == 'roomMenu' then
        CurrentAction     = 'room_menu'
        CurrentActionMsg  = _U('press_to_menu')
        CurrentActionData = { property = property, owner = CurrentPropertyOwner }
    end
end)

AddEventHandler('esx_property:hasExitedMarker', function(name, part)
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

-- Init
Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    ESX.TriggerServerCallback('esx_property:getProperties', function(properties)
        Config.Properties = properties
        CreateBlips()
    end)
end)

-- Display markers
Citizen.CreateThread(function()
    while true do

        Wait(1)

        local coords = GetEntityCoords(GetPlayerPed(-1))

        if closeToProperty ~= nil then
            local property = closeToProperty
            local isHost   = false

            if (property.entering ~= nil  and #(coords - vector3(property.entering.x,
                                                                 property.entering.y,
                                                                 property.entering.z)) < Config.DrawDistance) then
                DrawMarker(Config.MarkerType, property.entering.x, property.entering.y, property.entering.z, 0.0, 0.0,
                           0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g,
                           Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            end
        elseif inProperty ~= nil then
            local property = inProperty
            local isHost   = false

            if (property.exit ~= nil and #(coords - vector3(property.exit.x,
                                                            property.exit.y,
                                                            property.exit.z)) < Config.DrawDistance) then
                DrawMarker(Config.MarkerType, property.exit.x, property.exit.y, property.exit.z, 0.0, 0.0, 0.0, 0, 0.0,
                           0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100,
                           false, true, 2, false, false, false, false)
            end

            if (property.roomMenu ~= nil and HasChest and #(coords - vector3(property.roomMenu.x,
                                                                             property.roomMenu.y,
                                                                             property.roomMenu.z)) < Config.DrawDistance) then
                DrawMarker(Config.MarkerType, property.roomMenu.x, property.roomMenu.y, property.roomMenu.z, 0.0, 0.0,
                           0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.RoomMenuMarkerColor.r, Config.RoomMenuMarkerColor.g,
                           Config.RoomMenuMarkerColor.b, 100, false, true, 2, false, false, false, false)
            end
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    while true do

        Wait(101)

        local coords          = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker      = false
        local currentProperty = nil
        local currentPart     = nil
        closeToProperty = nil
        inProperty = nil

        for i = 1, #Config.Properties, 1 do

            local property = Config.Properties[i]

            if not property.disabled then
                local dist_to_inside = nil
                local dist_to_outside = nil
                if property.inside ~= nil then
                    dist_to_inside = #(coords - vector3(property.inside.x, property.inside.y, property.inside.z))
                end
                if property.outside ~= nil then
                    dist_to_outside = #(coords - vector3(property.outside.x, property.outside.y, property.outside.z))
                end

                if dist_to_outside ~= nil and dist_to_outside <= 30 then
                    closeToProperty = property
                    if (property.outside ~= nil and dist_to_outside < Config.MarkerSize.x) then
                        isInMarker      = true
                        currentProperty = property.name
                        currentPart     = 'outside'
                    elseif (property.entering ~= nil and #(coords - vector3(property.entering.x,
                                                                            property.entering.y,
                                                                            property.entering.z)) < Config.MarkerSize.x) then
                        isInMarker      = true
                        currentProperty = property.name
                        currentPart     = 'entering'
                    end
                end
                if dist_to_inside ~= nil and dist_to_inside <= 30 then
                    inProperty = property
                    if (property.inside ~= nil and dist_to_inside < Config.MarkerSize.x) then
                        isInMarker      = true
                        currentProperty = property.name
                        currentPart     = 'inside'
                    elseif (property.exit ~= nil and #(coords - vector3(property.exit.x,
                                                                        property.exit.y,
                                                                        property.exit.z)) < Config.MarkerSize.x) then
                        isInMarker      = true
                        currentProperty = property.name
                        currentPart     = 'exit'
                    elseif (property.roomMenu ~= nil and HasChest and #(coords - vector3(property.roomMenu.x,
                                                                                         property.roomMenu.y,
                                                                                         property.roomMenu.z)) < Config.MarkerSize.x) then
                        isInMarker      = true
                        currentProperty = property.name
                        currentPart     = 'roomMenu'
                    end
                end
            end
        end

        if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastProperty ~= currentProperty or LastPart ~= currentPart)) then

            HasAlreadyEnteredMarker = true
            LastProperty            = currentProperty
            LastPart                = currentPart

            TriggerEvent('esx_property:hasEnteredMarker', currentProperty, currentPart)
        end

        if not isInMarker and HasAlreadyEnteredMarker then

            HasAlreadyEnteredMarker = false

            TriggerEvent('esx_property:hasExitedMarker', LastProperty, LastPart)
        end
    end
end)

-- Key controls
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(20)

        if CurrentAction ~= nil then

            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlPressed(0, Keys['E']) and (GetGameTimer() - GUI.Time) > 300 then

                if CurrentAction == 'property_menu' then
                    OpenPropertyMenu(CurrentActionData.property)
                end

                if CurrentAction == 'gateway_menu' then

                    if Config.EnablePlayerManagement then
                        OpenGatewayOwnedPropertiesMenu(CurrentActionData.property)
                    else
                        OpenGatewayMenu(CurrentActionData.property)
                    end
                end

                if CurrentAction == 'room_menu' then
                    OpenRoomMenu(CurrentActionData.property, CurrentActionData.owner)
                end

                if CurrentAction == 'room_exit' then
                    TriggerEvent('instance:leave')
                end

                CurrentAction = nil
                GUI.Time      = GetGameTimer()
            end
        end
    end
end)

-- function NewOpenPropertyInventoryMenu(property.name, owner)
--   ESX.TriggerServerCallback(
--     "esx_property:getNewPropertyInventory",
--     function(inventory)
--       TriggerEvent("esx_inventoryhud:openPropertyInventory", inventory)
--     end,
--     owner, property.name
--   )
-- end

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

function OpenPropertyInventoryMenu(property, owner)
    ESX.TriggerServerCallback("esx_property:getPropertyInventory",
                              function(inventory)
                                  TriggerEvent('esx_inventoryhud:updateProperty', name)
                                  TriggerEvent("esx_inventoryhud:openPropertyInventory", inventory)
                              end,
                              { owner = owner, name = property.name })
end

-- Check for rental payments
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(180000) -- Not sure what a good value is here (Changed this to 30 minutes)
        TriggerServerEvent('esx_property:takeRentalPayments')
    end
end)