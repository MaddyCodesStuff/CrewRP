Keys                       = {
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
ESX                        = nil
local in_breakdown_station = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

-- Track position relative to stations
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed   = PlayerPedId()
        local coords      = GetEntityCoords(playerPed)
        local _in_station = nil

        for station, details in pairs(Config.Zones) do
            if GetDistanceBetweenCoords(coords, details.coords, true) < details.range then
                _in_station = station
                Citizen.Wait(500)
            end
        end
        if _in_station then
            in_breakdown_station = _in_station
        else
            in_breakdown_station = nil
        end
    end
end)

-- Track keypress
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300)
        if in_breakdown_station and IsControlJustReleased(0, Keys['E']) then
            openBreakdownStation()
        elseif not in_breakdown_station and ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(),
                                                               'breakdown_menu') then
            ESX.UI.Menu.Close('default', GetCurrentResourceName(), 'breakdown_menu')
        end
    end
end)

-- Open Breakdown Station Menu
function openBreakdownStation()
    local elements   = {}
    local break_into = {}
    local station    = in_breakdown_station
    ESX.TriggerServerCallback("tcrp-crafting:getPlayerInventory", function(inventory)
        for i = 1, #Config.Zones[station].breakdown_item_types, 1 do
            local item_type = Config.Zones[station].breakdown_item_types[i]
            if Config.BreakdownItems[item_type] then
                for item, details in pairs(Config.BreakdownItems[item_type]) do
                    for j = 1, #inventory, 1 do
                        if inventory[j].name == item and inventory[j].count > 0 then
                            local limit = inventory[j].count
                            if details.limit and details.limit <= inventory[item].count then
                                limit = details.limit
                            end
                            table.insert(elements,
                                         { label = "Breakdown " .. inventory[j].label, src_item = item, dst_item = details.breaks_into, dst_qty = details.count, type = 'slider', value = 1, min = 1, max = limit })
                        end
                    end
                end
            end
        end

        if #elements > 0 then
            ESX.UI.Menu.CloseAll()

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'breakdown_menu',
                             {
                                 title    = "Breakdown Station",
                                 align    = 'top-right',
                                 elements = elements,
                             }, function(data, menu)
                    menu.close()
                    for i = 1, data.current.value, 1 do
                        exports['mythic_progbar']:Progress({
                                                               name            = "breakdown_action",
                                                               duration        = 10500,
                                                               label           = "Breaking down items",
                                                               useWhileDead    = false,
                                                               canCancel       = true,
                                                               controlDisables = {
                                                                   disableMovement    = true,
                                                                   disableCarMovement = true,
                                                                   disableMouse       = false,
                                                                   disableCombat      = true,
                                                               },
                                                               animation       = {
                                                                   animDict = "mini@strip_club@drink@four",
                                                                   anim     = "four_bartender",
                                                                   flags    = 49,
                                                               },
                                                           }, function(status)
                            if not status then
                                TriggerServerEvent("tcrp-crafting:breakdownItem", data.current.src_item,
                                                   data.current.value, data.current.dst_item,
                                                   (data.current.dst_qty * data.current.value))
                            end
                        end)
                    end
                end,
                             function(data, menu)
                                 menu.close()
                             end)
        else
            TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'You have nothing to use here.' })
        end
    end)
end