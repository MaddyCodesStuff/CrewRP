ESX                 = nil

last_property       = 0

local Keys          = {
    ["ESC"]       = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"]         = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"]       = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"]      = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"]  = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"]      = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

local propertyBlips = {}
local keyBlips      = {}
local showBlips     = {}

local properties    = {}

PropertyTourBlip    = nil

local in_property   = 0

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.PlayerData == nil do
        Citizen.Wait(0)
        ESX.PlayerData = ESX.GetPlayerData()
    end

    while ESX.PlayerData.job == nil do
        Citizen.Wait(0)
        ESX.PlayerData.job = ESX.GetPlayerData().job
    end

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
    Citizen.Wait(1)

    -- We only have one real estate office right now
    realEstateBlip = AddBlipForCoord(Config.AgentZones[1].x, Config.AgentZones[1].y, Config.AgentZones[1].z)
    SetBlipSprite(realEstateBlip, 475)
    SetBlipColour(realEstateBlip, 59)
    SetBlipDisplay(realEstateBlip, 4)
    SetBlipScale(realEstateBlip, 0.8)
    SetBlipAsShortRange(realEstateBlip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Real Estate Office")
    EndTextCommandSetBlipName(realEstateBlip)
end)

-- Get all owned properties and keys
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent('tcrp_properties:SyncProperties')
    TriggerServerEvent('tcrp_properties:checkInProperty')
end)

RegisterNetEvent('tcrp_properties:SyncProperties')
AddEventHandler('tcrp_properties:SyncProperties', function(houses, property)

    properties  = {}
    in_property = property

    if #houses > 0 then
        -- Add the properties you own to the local table
        for k, v in pairs(houses) do
            table.insert(properties, v)
        end
    end

    if #properties > 0 then
        SyncProperties()
    end
end)

-- Some logic to make sure that players are updated in properties correctly
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        if last_property ~= in_property then
            TriggerServerEvent('tcrp_properties:updateInProperty', in_property)
            last_property = in_property
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local coords = GetEntityCoords(GetPlayerPed(-1))

        if properties then

            for i = 1, #properties, 1 do
                property = properties[i]
                local zDiff = property.inside.z - coords.z
                local zCheck = 2 --This may not be high enough

                -- Radius to make sure a player is inside of a property (in case they were TPd in, or TPd out)
                if in_property ~= i and #(coords - vector3(property.inside.x, property.inside.y,
                                                           property.inside.z)) < 30 and zDiff < zCheck and zDiff > (zCheck * -1) then 
                    in_property   = i
                    last_property = i
                end

                if in_property == i then
                    -- Exit marker (available for all properties)
                    if #(coords - vector3(property.out.x, property.out.y, property.out.z)) < 10 then
                        DrawMarker(27, property.out.x, property.out.y, property.out.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0,
                                   1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)

                        if #(coords - vector3(property.out.x, property.out.y, property.out.z)) < 1.5 then
                            --if property.owned == 1 then
                            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to ~y~Exit ~b~" .. property.name)

                            if IsControlJustReleased(0, Keys['E']) then
                                ExitProperty(i)
                            end
                            --end
                        end
                    end

                    -- Wardrobe and storage (only available to owned properties and keyed properties)
                    if property.owned == 1 or property.owned == 2 or property.owned == 3 then
                        if property.wardrobe then
                            if #(coords - vector3(property.wardrobe.x, property.wardrobe.y, property.wardrobe.z)) < 10 then
                                if property.owned == 1 or property.owned == 2 then
                                    DrawMarker(27, property.wardrobe.x, property.wardrobe.y, property.wardrobe.z, 0.0, 0.0,
                                               0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false,
                                               false, false, false)
                                elseif property.owned == 3 then
                                    DrawMarker(25, property.wardrobe.x, property.wardrobe.y, property.wardrobe.z, 0.0, 0.0,
                                               0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 250, 133, 0, 100, false, true, 2, false,
                                               false, false, false)
                                end

                                if #(coords - vector3(property.wardrobe.x, property.wardrobe.y,property.wardrobe.z)) < 1.5 then
                                    if property.owned == 1 or property.owned == 2 then
                                        ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to access ~y~The Closet")

                                        if IsControlJustReleased(0, Keys['E']) then
                                            AccessWardrobe(i)
                                        end
                                    else
                                        ESX.ShowHelpNotification("Property Wardrobe")
                                    end
                                end
                            end
                        end

                        -- Storage marker
                        if property.storage then
                            if #(coords - vector3(property.storage.x, property.storage.y, property.storage.z)) < 10 then
                                if property.owned == 1 or property.owned == 2 then
                                    DrawMarker(27, property.storage.x, property.storage.y, property.storage.z, 0.0, 0.0,
                                               0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false,
                                               false, false, false)
                                elseif property.owned == 3 then
                                    DrawMarker(25, property.storage.x, property.storage.y, property.storage.z, 0.0, 0.0,
                                               0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 250, 133, 0, 100, false, true, 2, false,
                                               false, false, false)
                                end

                                if #(coords - vector3(property.storage.x, property.storage.y, property.storage.z)) < 1.5 then
                                    if property.owned == 1 or property.owned == 2 then
                                        ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to access ~y~Storage")

                                        if IsControlJustReleased(0, Keys['E']) then
                                            AccessStorage(property.id)
                                        end
                                    else
                                        ESX.ShowHelpNotification("Property Storage")
                                    end
                                end
                            end
                        end

                        -- Owner menu
                        if property.owneractions then
                            if #(coords - vector3(property.owneractions.x, property.owneractions.y, property.owneractions.z)) < 10 then
                                if property.owned == 1 or property.owned == 2 then
                                    DrawMarker(27, property.owneractions.x, property.owneractions.y,
                                               property.owneractions.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255,
                                               255, 100, false, true, 2, false, false, false, false)
                                else
                                    DrawMarker(25, property.owneractions.x, property.owneractions.y,
                                               property.owneractions.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 250, 133,
                                               0, 100, false, true, 2, false, false, false, false)
                                end

                                if #(coords - vector3(property.owneractions.x, property.owneractions.y, property.owneractions.z)) < 1.5 then
                                    if property.owned == 1 or property.owned == 2 then
                                        ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to access ~y~Property Actions")

                                        if IsControlJustReleased(0, Keys['E']) then
                                            AccessOwnerMenu(property.id)
                                        end
                                    else
                                        ESX.ShowHelpNotification("Property Actions")
                                    end
                                end
                            end
                        end
                    end
                -- Entrance  marker (available for all properties)
                elseif #(coords - vector3(property.entrance.x, property.entrance.y, property.entrance.z)) < 10 then
                    DrawMarker(27, property.entrance.x, property.entrance.y, property.entrance.z, 0.0, 0.0, 0.0, 0, 0.0,
                               0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)

                    if #(coords - vector3(property.entrance.x, property.entrance.y, property.entrance.z)) < 1.5 then
                        if property.owned == 1 or property.owned == 2 or ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'fireman' then
                            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to ~y~Enter ~b~" .. property.name)

                            if IsControlJustReleased(0, Keys['E']) then
                                EnterProperty(i)
                            end
                        elseif property.owned == 0 then
                            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to ~y~Ring Doorbell~w~ at ~b~" .. property.name)

                            if IsControlJustReleased(0, Keys['E']) then
                                RingBuzzer(properties[i].id)
                            end
                        elseif property.owned == 3 then
                            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to ~y~Tour ~b~" .. property.name)

                            if IsControlJustReleased(0, Keys['E']) then
                                EnterProperty(i)
                            end
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('tcrp_properties:ringBuzzer')
AddEventHandler('tcrp_properties:ringBuzzer', function(playerName)
    exports['mythic_notify']:DoLongHudText('inform', playerName .. ' is ringing the doorbell')
    TriggerEvent('InteractSound_CL:PlayOnOne', "0160", 0.125)
end)

function RingBuzzer(id)
    if not isRinging then
        exports['mythic_notify']:DoHudText('inform', 'Ringing doorbell')
        TriggerServerEvent('tcrp_properties:ringBuzzer', id)
        TriggerEvent('InteractSound_CL:PlayOnOne', "0160", 0.025)
        isRinging = true

        Citizen.SetTimeout(5000, function()
            isRinging = false
        end)
    else
        exports['mythic_notify']:DoHudText('inform', 'You have to wait longer.')
    end
end

-- Function to synchronize properties with server (update the on-screen blips and markers)
function SyncProperties()
    Citizen.CreateThread(function()

        for k, v in pairs(propertyBlips) do
            RemoveBlip(propertyBlips[k])
        end

        for k, v in pairs(keyBlips) do
            RemoveBlip(keyBlips[k])
        end

        for k, v in pairs(showBlips) do
            RemoveBlip(showBlips[k])
        end

        propertyBlips = {}
        keyBlips      = {}
        showBlips     = {}

        for k, v in pairs(properties) do
            if v.owned == 1 then
                local entrance      = v.entrance
                propertyBlips[v.id] = AddBlipForCoord(entrance.x, entrance.y, entrance.z)
                SetBlipSprite(propertyBlips[v.id], 492)
                SetBlipDisplay(propertyBlips[v.id], 4)
                SetBlipScale(propertyBlips[v.id], 0.8)
                SetBlipAsShortRange(propertyBlips[v.id], true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Owned Property")
                EndTextCommandSetBlipName(propertyBlips[v.id])
            elseif v.owned == 2 then
                local entrance = v.entrance
                keyBlips[v.id] = AddBlipForCoord(entrance.x, entrance.y, entrance.z)
                SetBlipSprite(keyBlips[v.id], 492)
                SetBlipColour(keyBlips[v.id], 76)
                SetBlipDisplay(keyBlips[v.id], 4)
                SetBlipScale(keyBlips[v.id], 0.8)
                SetBlipAsShortRange(keyBlips[v.id], true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Accessible Property")
                EndTextCommandSetBlipName(keyBlips[v.id])
            elseif v.owned == 3 and Config.ShowSaleBlips then
                local entrance  = v.entrance
                showBlips[v.id] = AddBlipForCoord(entrance.x, entrance.y, entrance.z)
                SetBlipSprite(showBlips[v.id], 374)
                SetBlipColour(showBlips[v.id], 2)
                SetBlipDisplay(showBlips[v.id], 4)
                SetBlipScale(showBlips[v.id], 0.5)
                SetBlipAsShortRange(showBlips[v.id], true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Property For Sale")
                EndTextCommandSetBlipName(showBlips[v.id])
            end
        end
    end)
end

RegisterCommand('syncproperties', function()
    TriggerServerEvent('tcrp_properties:SyncProperties')
end)

RegisterCommand('fixui', function()
    SetNuiFocus(false)
    SendNUIMessage({

        action = "hide"
    })

end)
 
function EnterProperty(id)
    -- Check if an entity is attached to an entity. If it is, we need to set that attached entities property to the entered property as well

    local inside = properties[id].inside

    if properties[id].owned == 1 or properties[id].owned == 2 or properties[id].owned == 3 or ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'fireman' then
        SetEntityCoords(PlayerPedId(), inside.x, inside.y, inside.z)
        SetEntityHeading(PlayerPedId(), inside.h)

        in_property = properties[id].id

        TriggerServerEvent('tcrp_properties:EnterProperty', in_property)
    end
end

function enterRequestedProperty(property)
    local inside = properties[property].inside
    SetEntityCoords(PlayerPedId(), inside.x, inside.y, inside.z)
    in_property = property
    TriggerServerEvent('tcrp_properties:EnterProperty', property)
end

function ExitProperty(id)
    outside = properties[id].outside
    SetEntityCoords(PlayerPedId(), outside.x, outside.y, outside.z)
    SetEntityHeading(PlayerPedId(), outside.h)

    in_property = 0

    TriggerServerEvent('tcrp_properties:ExitProperty', id)
end

function AccessWardrobe(id)
    if properties[id] and properties[id].owned == 1 or properties[id].owned == 2 then

        elements = {
            {
                label = "Store Current Outfit",
                value = "save_outfit",
            },
            {
                label = "Change Clothes",
                value = "change_outfit",
            }
        }

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wardrobe', {
            title    = 'Wardrobe',
            align    = 'top-right',
            elements = elements,
        },
                         function(data, menu)
                             if data.current.value == 'save_outfit' then
                                 TriggerEvent('tcrp-input:OpenInput',
                                              "Name your outfit. Using an existing name will overwrite the item.",
                                              "text", 60, function(result)

                                         TriggerEvent('skinchanger:getSkin', function(skin)
                                             -- TriggerServerEvent('esx_clotheshop:saveOutfit', data3.value, skin)
                                             local data = {}
                                             data.name  = result
                                             data.skin  = skin

                                             TriggerServerEvent('tcrp_properties:saveWardrobe', data)

                                             exports['mythic_notify']:DoLongHudText('inform',
                                                                                    'Outfit added to your closet as ' .. result)
                                         end)
                                     end)
                             elseif data.current.value == 'change_outfit' then
                                 elements = {}

                                 ESX.TriggerServerCallback('tcrp_properties:getWardrobe', function(wardrobe)
                                     for k, v in pairs(wardrobe) do
                                         table.insert(elements, { label = v.name, value = v.id })
                                     end

                                     if #elements == 0 then
                                         elements = {
                                             {
                                                 label = "No outfits in your closet",
                                                 value = -1,
                                             }
                                         }
                                     end

                                     ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wardrobe_list', {
                                         title    = 'Change Clothes',
                                         align    = 'top-right',
                                         elements = elements,
                                     },
                                                      function(data, menu)
                                                          if data.current.value ~= -1 then
                                                              elements = {
                                                                  {
                                                                      label = "Put On",
                                                                      value = "change_into",
                                                                      id    = data.current.value
                                                                  },
                                                                  {
                                                                      label = "Delete Outfit",
                                                                      value = "delete",
                                                                      id    = data.current.value
                                                                  }
                                                              }

                                                              ESX.UI.Menu.Open('default', GetCurrentResourceName(),
                                                                               'wardrobe_options', {
                                                                                   title    = data.current.label .. ' Options',
                                                                                   align    = 'top-right',
                                                                                   elements = elements,
                                                                               },
                                                                               function(data, menu)
                                                                                   if data.current.value == 'change_into' then
                                                                                       -- Do the skin changer stuff

                                                                                       TriggerEvent('skinchanger:getSkin',
                                                                                                    function(skin)
                                                                                                        ESX.TriggerServerCallback('tcrp_properties:getOutfit',
                                                                                                                                  function(clothes)

                                                                                                                                      local change = json.decode(clothes.skin)

                                                                                                                                      exports['mythic_notify']:DoLongHudText('inform',
                                                                                                                                                                             'Changed into ' .. clothes.name)

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
                                                                                                                                  data.current.id)
                                                                                                    end)

                                                                                   else
                                                                                       elements = {
                                                                                           {
                                                                                               value = "yes",
                                                                                               label = "Yes",
                                                                                               id    = data.current.id
                                                                                           },
                                                                                           {
                                                                                               label = "No",
                                                                                               value = "no",
                                                                                           }
                                                                                       }

                                                                                       ESX.UI.Menu.Open('default',
                                                                                                        GetCurrentResourceName(),
                                                                                                        'wardrobe_delete',
                                                                                                        {
                                                                                                            title    = 'Confirm Delete',
                                                                                                            align    = 'top-right',
                                                                                                            elements = elements,
                                                                                                        },
                                                                                                        function(data,
                                                                                                                 menu)
                                                                                                            if data.current.value == 'yes' then
                                                                                                                local id = data.current.id
                                                                                                                TriggerServerEvent('tcrp_properties:deleteWardrobe',
                                                                                                                                   id)

                                                                                                                exports['mythic_notify']:DoLongHudText('inform',
                                                                                                                                                       'Outfit removed')
                                                                                                                ESX.UI.Menu.Close('default',
                                                                                                                                  GetCurrentResourceName(),
                                                                                                                                  'wardrobe_options')
                                                                                                                ESX.UI.Menu.Close('default',
                                                                                                                                  GetCurrentResourceName(),
                                                                                                                                  'wardrobe_list')
                                                                                                                menu.close()
                                                                                                            else
                                                                                                                menu.close()
                                                                                                            end
                                                                                                        end,
                                                                                                        function(data,
                                                                                                                 menu)
                                                                                                            menu.close()
                                                                                                        end)
                                                                                   end
                                                                               end,
                                                                               function(data, menu)
                                                                                   menu.close()
                                                                               end)
                                                          end
                                                      end,
                                                      function(data, menu)
                                                          menu.close()
                                                      end)
                                 end,
                                                           { identifier = ESX.GetPlayerData().identifier })
                             end
                         end,
                         function(data, menu)
                             menu.close()
                         end)
    end
end

--[[
Function to access storage
]]--

function AccessStorage(id)
    local elements = {
        { label = 'Shared Storage', value = 'shared_storage' },
        { label = 'Personal Storage', value = 'personal_storage' }
    }

    pid            = findProperty(id)

    id             = properties[pid].id

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'storage', {
        title    = '',
        align    = 'top-right',
        elements = elements,
    },
                     function(data, menu)
                         if data.current.value == 'shared_storage' then
                             -- Shared storage
                             ESX.TriggerServerCallback("tcrp_properties:getHousingInventory",
                                                       function(inventory)
                                                           TriggerEvent('esx_inventoryhud:updateProperty', "test")
                                                           TriggerEvent("esx_inventoryhud:openHousingInventory",
                                                                        inventory, id, -1)
                                                       end,
                                                       { id = id, owner = -1 }
                             )
                         elseif data.current.value == 'personal_storage' then
                             -- Personal storage
                             ESX.TriggerServerCallback("tcrp_properties:getHousingInventory",
                                                       function(inventory)
                                                           TriggerEvent('esx_inventoryhud:updateProperty', name)
                                                           TriggerEvent("esx_inventoryhud:openHousingInventory",
                                                                        inventory, id, ESX.GetPlayerData().identifier)
                                                       end,
                                                       { id = id, owner = ESX.GetPlayerData().identifier }
                             )
                         end
                     end,
                     function(data, menu)
                         menu.close()
                     end)
end

-- Placeholder; For future police raids
--[[
function AccessRaidMenu(id)
	-- Is in the raid, is a police officer, and has the required item
	if in_raid and ESX.PlayerData.job.name == 'police' and hasitem then
	
	end
end
]]--

-- Placeholder: For future robberies
--[[
function AccessRobberyMenu(id)
	-- If this player is the one who is committing the robbery for this house
	if in_robbery then

	end
end
]]--

function AccessOwnerMenu(id)
    elements = {}

    pid      = findProperty(id)

    if properties[pid].owned == 1 then
        elements = {
            { label = 'Give Keys', value = 'give_keys' },
            { label = 'Take Keys', value = 'take_keys' },
            --{label = 'Purchase Options', value = 'purchase_options'}, Later patch
        }
    end
    if properties[pid].type == 'home' then
        table.insert(elements, { label = "Invite Player", value = "invite_player" })
    end
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'owner_actions', {
        title    = 'Property Actions',
        align    = 'top-right',
        elements = elements,
    },
                     function(data, menu)
                         if data.current.value == 'invite_player' then

                             local players = ESX.Game.GetPlayers()

                             playerList    = {}

                             pid           = findProperty(id)

                             entrance      = properties[pid].entrance

                             for i = 1, #players, 1 do
                                 local coords = GetEntityCoords(GetPlayerPed(players[i]))
                                 if GetDistanceBetweenCoords(coords, entrance.x, entrance.y, entrance.z,
                                                             true) <= 2.5 then
                                     table.insert(playerList, GetPlayerServerId(players[i]))
                                 end
                             end

                             ESX.TriggerServerCallback("tcrp_properties:getPlayerNames", function(elements, id)
                                 ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'invite_player', {
                                     title    = 'Nearby People',
                                     align    = 'top-right',
                                     elements = elements,
                                 },
                                                  function(data2, menu2)
                                                      TriggerServerEvent('tcrp_properties:allowPlayer',
                                                                         data2.current.value, id)
                                                      menu2.close()
                                                  end,
                                                  function(data2, menu2)
                                                      menu2.close()
                                                  end)
                             end, { players = playerList, id = id })
                         end

                         if data.current.value == 'give_keys' then
                             elements            = {}

                             local coords        = GetEntityCoords(PlayerPedId())
                             local playersInArea = {}

                             local players       = GetActivePlayers()

                             for k, v in pairs(players) do
                                 if v ~= PlayerId() then
                                     local otherPlayer  = GetPlayerServerId(v)
                                     local playerCoords = GetEntityCoords(GetPlayerPed(v))

                                     if GetDistanceBetweenCoords(coords, playerCoords, true) < 5 then
                                         table.insert(playersInArea, otherPlayer)
                                     end
                                 end
                             end

                             ESX.TriggerServerCallback("tcrp_properties:getPlayerNames", function(elements, id)
                                 ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_keys', {
                                     title    = 'Nearby People',
                                     align    = 'top-right',
                                     elements = elements,
                                 },
                                                  function(data2, menu2)
                                                      TriggerServerEvent('tcrp_properties:giveKeys', id,
                                                                         data2.current.value)
                                                      menu2.close()
                                                  end,
                                                  function(data2, menu2)
                                                      menu2.close()
                                                  end)
                             end, { players = playersInArea, id = id })

                             playersInArea = {}
                         elseif data.current.value == 'take_keys' then
                             ESX.TriggerServerCallback("tcrp_properties:getPropertyKeys", function(elements, id)
                                 ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'take_keys', {
                                     title    = 'Shared Housing Members',
                                     align    = 'top-right',
                                     elements = elements,
                                 },
                                                  function(data2, menu2)
                                                      TriggerServerEvent('tcrp_properties:takeKeys', id,
                                                                         data2.current.value)
                                                      menu2.close()
                                                  end,
                                                  function(data2, menu2)
                                                      menu2.close()
                                                  end)

                             end, { id = id })
                         end
                     end,
                     function(data, menu)
                         menu.close()
                     end)
end

-- Show the real estate agent markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'realestateagent' then
            local coords   = GetEntityCoords(PlayerPedId())

            if ESX.PlayerData.job.grade == 3 then
                local distance = #(coords - vector3(Config.BossMenu.x, Config.BossMenu.y, Config.BossMenu.z))

                if distance < 10 then
                    DrawMarker(27, Config.BossMenu.x, Config.BossMenu.y, Config.BossMenu.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0,
                               1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)

                    if distance <= 1.5 then
                        ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to access ~g~Boss Menu~w~")

                        if IsControlJustReleased(0, Keys['E']) then
                            TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data, menu)
                                menu.close()
                            end, { wash = false }) -- disable washing money
                        end
                    end
                end
            end

            for k, v in pairs(Config.AgentZones) do
                local distance = #(coords - vector3(v.x, v.y, v.z))

                if distance < 10 then
                    DrawMarker(27, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false,
                               true, 2, false, false, false, false)

                    if distance < 1.5 then
                        ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to access the ~g~Real Estate Portal~w~")

                        if IsControlJustReleased(0, Keys['E']) then

                            -- Get the most up to date list of properties
                            ESX.TriggerServerCallback('tcrp_properties:getPropertyListings', function(result)
                                local sold     = {}
                                local forSale  = {}
                                local active   = {}
                                local inActive = {}

                                for k, v in pairs(result) do
                                    if v.owner ~= nil and v.owner ~= '' then
                                        if not v.firstname then
                                            v.firstname = 'Unknown'
                                        end

                                        if not v.lastname then
                                            v.lastname = 'Unknown'
                                        end

                                        table.insert(sold, {
                                            id      = v.id,
                                            address = v.name,
                                            zone    = v.zone,
                                            price   = v.price,
                                            owner   = v.firstname .. " " .. v.lastname,
                                        })
                                    else
                                        if v.status == 0 then
                                            -- property is not activated
                                            table.insert(inActive,
                                                         {
                                                             id      = v.id,
                                                             address = v.name,
                                                             zone    = v.zone,
                                                             price   = v.price,
                                                         })
                                        else
                                            table.insert(forSale,
                                                         {
                                                             id      = v.id,
                                                             address = v.name,
                                                             zone    = v.zone,
                                                             price   = v.price,
                                                         })
                                        end
                                    end
                                end

                                if ESX.PlayerData.job.name == 'realestateagent' and ESX.PlayerData.job.grade == 3 then
                                    jobtype = 'property-manager'
                                else
                                    jobtype = 'real-estate-agent'
                                end

                                TriggerEvent('tcrp_properties:openUI', jobtype, forSale, sold, forSale, inActive)
                            end)
                        end
                    end
                end
            end
        else
            Citizen.Wait(30000)
        end
    end
end)

RegisterNetEvent('tcrp_properties:updatePropertiesUI')
AddEventHandler('tcrp_properties:updatePropertiesUI', function()

    ESX.TriggerServerCallback('tcrp_properties:getPropertyListings', function(result)
        local sold     = {}
        local forSale  = {}
        local active   = {}
        local inActive = {}

        for k, v in pairs(result) do
            if v.owner ~= nil and v.owner ~= '' then
                if v.firstname and v.lastname then
                    firstname = v.firstname
                    lastname = v.lastname
                else
                    firstname = v.firstname or 'Unknown'
                    lastname = v.lastname or 'Unknown'
                end
                table.insert(sold, {
                    id      = v.id,
                    address = v.name,
                    zone    = v.zone,
                    price   = v.price,
                    owner   = firstname .. " " .. lastname,
                })
            else
                if v.status == 0 then
                    -- property is not activated
                    table.insert(inActive,
                                 {
                                     id      = v.id,
                                     address = v.name,
                                     zone    = v.zone,
                                     price   = v.price,
                                 })
                else
                    table.insert(forSale,
                                 {
                                     id      = v.id,
                                     address = v.name,
                                     zone    = v.zone,
                                     price   = v.price,
                                 })
                end
            end
        end

        if ESX.PlayerData.job.name == 'realestateagent' and ESX.PlayerData.job.grade == 3 then
            jobtype = 'property-manager'
        else
            jobtype = 'real-estate-agent'
        end

        TriggerEvent('tcrp_properties:updateUI', jobtype, forSale, sold, forSale, inActive)
    end)

end)

RegisterNetEvent('tcrp_properties:RemoveFromProperty')
AddEventHandler('tcrp_properties:RemoveFromProperty', function(data)
    local outside = data.outside
    local name    = data.name

    SetEntityCoords(GetPlayerPed(-1), outside.x, outside.y, outside.z)
    SetEntityHeading(GetPlayerPed(-1), outside.h)

    in_property = 0
end)

RegisterNetEvent('tcrp_properties:updateProperties')
AddEventHandler('tcrp_properties:updateProperties', function()
    TriggerServerEvent('tcrp_properties:SyncProperties')
end)

RegisterNetEvent('tcrp_properties:resetProperty')
AddEventHandler('tcrp_properties:resetProperty', function()
    in_property = 0
end)

-- Event to display the 'show property' gps marker on your map
RegisterNetEvent('tcrp_properties:showProperty')
AddEventHandler('tcrp_properties:showProperty', function(property)
    id           = findProperty(property)

    local coords = properties[id].entrance

    SetNewWaypoint(coords.x, coords.y)

    exports['mythic_notify']:DoLongHudText('inform', 'Property marked on your GPS.')
end)

-- Helper function to find the property root key inside of the properties array based on the database id
function findProperty(id)
    for i = 1, #properties, 1 do
        if properties[i].id == id then
            found = i
        end
    end

    if found then
        return found
    else
        return nil
    end
end

RegisterNetEvent('tcrp_properties:allowPlayer')
AddEventHandler('tcrp_properties:allowPlayer', function(id)
    pid = findProperty(id)
    SetEntityCoords(PlayerPedId(-1), properties[pid].inside.x, properties[pid].inside.y, properties[pid].inside.z)
    SetEntityHeading(PlayerPedId(-1), properties[pid].inside.h)
end)

-- NUI Stuff

RegisterNetEvent('tcrp_properties:openUI')
AddEventHandler('tcrp_properties:openUI',
                function(role, propertiesForSale, soldProperties, activeProperties, inactiveProperties)
                    SetNuiFocus(true, true);
                    SendNUIMessage({
                                       action   = "show",
                                       forSale  = propertiesForSale,
                                       sold     = soldProperties,
                                       active   = activeProperties,
                                       inactive = inactiveProperties,
                                       role     = role
                                   })
                end)

RegisterNetEvent('tcrp_properties:updateUI')
AddEventHandler('tcrp_properties:updateUI',
                function(role, propertiesForSale, soldProperties, activeProperties, inactiveProperties)
                    SetNuiFocus(true, true);
                    SendNUIMessage({
                                       action   = "update",
                                       forSale  = propertiesForSale,
                                       sold     = soldProperties,
                                       active   = activeProperties,
                                       inactive = inactiveProperties,
                                       role     = role
                                   })
                end)

RegisterNUICallback('save', function(data)
    TriggerServerEvent('tcrp_properties:saveProperty', data)
    exports['mythic_notify']:DoLongHudText('inform', 'Property ' .. data.address .. ' updated.')
    TriggerEvent('tcrp_properties:updatePropertiesUI')
end)

RegisterNUICallback('activate', function(data)
    TriggerServerEvent('tcrp_properties:activateProperty', data.id)
    exports['mythic_notify']:DoLongHudText('inform', 'Property now marked for sale.')
    TriggerEvent('tcrp_properties:updatePropertiesUI')
end)

RegisterNUICallback('deactivate', function(data)
    TriggerServerEvent('tcrp_properties:deactivateProperty', data.id)
    exports['mythic_notify']:DoLongHudText('inform', 'Property no longer marked for sale.')
    TriggerEvent('tcrp_properties:updatePropertiesUI')
end)

RegisterNUICallback('showhouse', function(data)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 10.0 then
        TriggerServerEvent('tcrp_properties:showProperty', GetPlayerServerId(closestPlayer), data.id)
    end
    TriggerEvent('tcrp_properties:showProperty', data.id)
end)

RegisterNUICallback('show', function()
    SetNuiFocus(true, true)
end)
RegisterNUICallback('hide', function()
    SetNuiFocus(false)
end)

RegisterNUICallback('sell', function(data)
    pid         = findProperty(data.id)
    sale_amount = properties[pid].price
    TriggerEvent('tcrp-input:OpenInput', "Please provide a sell price. (Minimum " .. sale_amount .. ")", "text", 60,
                 function(result)
                     if result ~= nil then
                        if result == 'voucher' then
                            TriggerEvent('tcrp-input:OpenInput',"Is there any additional funding being used?","text",60, function (result2) 
                                if result2 == '' or result2  == 0 then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer ~= -1 and closestDistance <= 2.0 then
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer),
                                                           'society_realestateagent', 'Invoice: Los Santos Housing Authority',
                                                           0)
                                        TriggerServerEvent('tcrp_properties:sellProperty', GetPlayerServerId(closestPlayer),
                                                           data.id, 0, 0)
                                        exports['mythic_notify']:DoLongHudText('inform', 'Property sold.')
                                    else
                                        TriggerEvent('mythic_notify:client:SendErrorAlert',
                                                     { text = 'You must be next to someone to issue an invoice.' })
                                    end
       
                                    TriggerEvent('tcrp_properties:updatePropertiesUI')
                                else
                                    local percent                 = Config.Commissions[ESX.PlayerData.job.grade + 1]
                                    local final_cost              = math.floor(result2 - (result2 * (percent / 100)))
                                    local commission              = math.floor(result2 * (percent/100))
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer ~= -1 and closestDistance <= 2.0 then
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer),
                                                           'society_realestateagent', 'Invoice: Los Santos Housing Authority',
                                                           tonumber(result2))
                                        TriggerServerEvent('tcrp_properties:sellProperty', GetPlayerServerId(closestPlayer),
                                                           data.id, commission, result2)
                                        exports['mythic_notify']:DoLongHudText('inform', 'Property sold.')
                                    else
                                        TriggerEvent('mythic_notify:client:SendErrorAlert',
                                                     { text = 'You must be next to someone to issue an invoice.' })
                                    end
       
                                    TriggerEvent('tcrp_properties:updatePropertiesUI')
                                end
                            end)
                        elseif result >= sale_amount then
                             local percent                        = Config.Commissions[ESX.PlayerData.job.grade + 1]
                             local final_cost                     = math.floor(result - (result * (percent / 100)))
                             local commission                     = math.floor(result * (percent / 100))
                             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                             if closestPlayer ~= -1 and closestDistance <= 2.0 then
                                 TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer),
                                                    'society_realestateagent', 'Invoice: Los Santos Housing Authority',
                                                    tonumber(result))
                                 TriggerServerEvent('tcrp_properties:sellProperty', GetPlayerServerId(closestPlayer),
                                                    data.id, commission, result)
                                 exports['mythic_notify']:DoLongHudText('inform', 'Property sold.')
                             else
                                 TriggerEvent('mythic_notify:client:SendErrorAlert',
                                              { text = 'You must be next to someone to issue an invoice.' })
                             end
                         else
                             TriggerEvent('mythic_notify:client:SendErrorAlert',
                                          { text = 'Invalid sell amount specified!' })
                             SetNuiFocus(true, true)
                         end
                     else
                         TriggerEvent('mythic_notify:client:SendErrorAlert',
                                      { text = 'Invalid sell amount specified!' })
                         SetNuiFocus(true, true)
                     end
                    end)
end)

RegisterNUICallback('buy', function(data)
    pid         = findProperty(data.id)
    
    if properties[pid].sell_price == '' or properties[pid].sell_price == NULL then
        sell_price = properties[pid].price
    else
        sell_price = properties[pid].sell_price
    end

    TriggerEvent('tcrp-input:OpenInput','How much should this property be bought back for? (Maximum '.. sell_price ..')',"text",60, function( result)
        if result == '' then
            exports['mythic_notify']:DoLongHudText('error', 'No buy back value entered.')
        elseif result <= sell_price then
            TriggerServerEvent('tcrp_properties:buyBackProperty', data.id, sell_price, properties[pid].owner)
            TriggerEvent('tcrp_properties:updatePropertiesUI')
            exports['mythic_notify']:DoLongHudText('inform', 'Property repurchased.')
        else
            exports['mythic_notify']:DoLongHudText('error', 'Cannot buy back for more than the sell price.')
        end

        SetNuiFocus(true, true)

        TriggerEvent('tcrp_properties:updatePropertiesUI')
    end)
end)