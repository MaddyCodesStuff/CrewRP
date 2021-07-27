local Keys = {
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

ESX        = nil

RegisterNetEvent('esx_lawyers:sendIdentity')
AddEventHandler('esx_lawyers:sendIdentity', function(id)
    identity = id
end)

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

    PlayerData = ESX.GetPlayerData()
end)

-- Key Controls

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        -- if IsControlJustReleased(0, Keys['F6']) and PlayerData.job ~= 'mecano' and PlayerData.job ~= 'police' and PlayerData.job ~= 'ambulance' then
        -- 	-- Open invoice menu for lawyers
        -- 	OpenInvoiceMenu()
        -- end
    end
end)

function OpenInvoiceMenu()
    local elements  = {
        {
            label = 'Create New Invoice',
            value = 'create_invoice',
        },
        {
            label = 'View Unpaid Invoices',
            value = 'view_invoices',
        },

    }

    local playerPed = PlayerPedId()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'invoice_menu',
                     {
                         title    = 'Invoices',
                         align    = 'top-right',
                         elements = elements
                     }, function(data, menu)
            if data.current.value == 'create_invoice' then

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'invoice_description',
                                 {
                                     title = 'Invoice Description',
                                 }, function(data2, menu2)
                        local length = string.len(data2.value)
                        if data2.value == nil then
                            ESX.ShowNotification('Invalid text entry')
                        else
                            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'invoice_amount',
                                             {
                                                 title = 'Invoice Amount',
                                             }, function(data3, menu3)
                                    local length = string.len(data3.value)
                                    if data3.value == nil then
                                        ESX.ShowNotification('Invalid Amount')
                                    else
                                        ESX.ShowNotification("Invoicing " .. data2.current.value .. " for " .. data3.current.value)
                                        menu3.close()
                                    end
                                end, function(data3, menu3)
                                    menu3.close()
                                end)
                            menu2.close()
                        end
                    end, function(data2, menu2)
                        menu2.close()
                    end)

            elseif data.current.value == 'view_invoices' then
                elements = {}

                ESX.TriggerServerCallback('esx_lawyers:getUnpaidInvoices', function(invoices)
                    if invoices ~= 'empty' then
                        for i = 1, #invoices, 1 do
                            table.insert(elements,
                                         { label = invoices[i].label .. ' - <span style="color: red;">$' .. invoices[i].amount .. '</span>', value = invoices[i].id })
                        end
                    else
                        ESX.ShowNotification("No invoices")
                        table.insert(elements, { label = 'No unpaid invoices', value = '' })
                    end

                    OpenUnpaidInvoices(elements)
                end)
            end
        end, function(data, menu)
            menu.close()
        end)
end

-- Draw marker & trigger
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

        -- Outside blip
        if GetDistanceBetweenCoords(coords, -66.63, -802.33, 43.23, true) < 100 then
            DrawMarker(27, -66.63, -802.33, 43.23, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 0, 128, 128, 100, false,
                       true, 2, false, false, false, false)

            if GetDistanceBetweenCoords(coords, -66.63, -802.33, 43.23, true) < 1.5 then
                inMarker = true
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to access the law offices")
            else
                inMarker = false
            end
        end

        -- Inside blip (private practice)
        if GetDistanceBetweenCoords(coords, -78.4, -829.68, 242.39, true) < 100 then
            DrawMarker(27, -78.4, -829.68, 242.39, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 0, 128, 128, 100, false,
                       true, 2, false, false, false, false)

            if GetDistanceBetweenCoords(coords, -78.4, -829.68, 242.39, true) < 1.5 then
                tpOut = true
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to leave the law offices")
            else
                tpOut = false
            end
        end

        -- Inside blip (public defenders office)
        if GetDistanceBetweenCoords(coords, -1580.16, -561.31, 108.52, true) < 100 then
            DrawMarker(27, -1580.16, -561.31, 107.6, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 0, 128, 128, 100, false,
                       true, 2, false, false, false, false)

            if GetDistanceBetweenCoords(coords, -1580.16, -561.31, 107.6, true) < 1.5 then
                tpOut = true
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to leave the law offices")
            else
                tpOut = false
            end
        end

        -- Inside blip (prosecutors office)
        if GetDistanceBetweenCoords(coords, -1396.18, -478.98, 72.04, true) < 100 then
            DrawMarker(27, -1396.18, -478.98, 71.10, 0.0, 0.0, 0.0, 0, 0.0, 0.0, .5, .5, .5, 0, 128, 128, 100, false,
                       true, 2, false, false, false, false)

            if GetDistanceBetweenCoords(coords, -1396.18, -478.98, 72.04, true) < 1.5 then
                tpOut = true
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to leave the law offices")
            else
                tpOut = false
            end
        end

        if IsControlJustReleased(0, Keys['E']) and inMarker then
            ShowTeleportMenu()
        end

        if IsControlJustReleased(0, Keys['E']) and tpOut then
            -- Teleport to outside of the law offices
            ESX.Game.Teleport(playerPed, { x = -65.88, y = -801.15, z = 44.23 })
            tpOut = false
        end
    end
end)

-- Draw blip
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-66.63, -802.33, 44.23)

    SetBlipSprite(blip, 525)
    SetBlipDisplay(blip, 0)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 62)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Law Offices')
    EndTextCommandSetBlipName(blip)
    local blip2 = AddBlipForCoord(-534.88, -221.66, 37.65)

    SetBlipSprite(blip2, 498)
    SetBlipDisplay(blip2, 0)
    SetBlipScale(blip2, 1.0)
    SetBlipColour(blip2, 62)
    SetBlipAsShortRange(blip2, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('City Hall')
    EndTextCommandSetBlipName(blip2)
end)

function OpenInvoiceDetails(id)
    elements = {}

    print(identity)
    ESX.TriggerServerCallback('esx_lawyers:getInvoiceDetails', function(details)
        if details ~= 'empty' then
            for i = 1, #details, 1 do
                -- if identity ~= nil then
                table.insert(elements, { label = 'Name: ' .. identity, value = '' })
                -- end
                table.insert(elements, { label = 'Description: ' .. details[i].label, value = '' })
                table.insert(elements, { label = 'Amount: ' .. details[i].amount, value = '' })

                table.insert(elements, { label = '- Mark Invoice Paid -', value = 'pay_invoice' })
                table.insert(elements, { label = '- Cancel Invoice -', value = 'cancel_invoice' })

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'invoice_details',
                                 {
                                     title    = 'Invoice Details',
                                     align    = 'top-right',
                                     elements = elements
                                 }, function(data, menu)


                    end, function(data, menu)
                        menu.close()
                    end)
            end
        else
            ESX.ShowNotification('~r~Error~w~ Unable to find invoice')
        end
    end,
                              id)
end

function OpenUnpaidInvoices(items)

    local elements = {}

    for i = 1, #items, 1 do
        table.insert(elements, { label = items[i].label, value = items[i].value })
    end

    local playerPed = PlayerPedId()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'unpaid_invoices',
                     {
                         title    = 'Unpaid Invoices',
                         align    = 'top-right',
                         elements = elements
                     }, function(data, menu)

            if data.current.value ~= '' then
                OpenInvoiceDetails(data.current.value)
            end

        end, function(data, menu)
            menu.close()
        end)
end

function ShowTeleportMenu()

    local elements  = {
        {
            label = 'Prosecutor',
            value = 'prosecutor',
        },
        {
            label = 'Public Defender',
            value = 'public_defender',
        },
        {
            label = 'Private Practice',
            value = 'private_practice',
        },

    }

    local playerPed = PlayerPedId()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'teleport_menu',
                     {
                         title    = 'Law Offices',
                         align    = 'top-right',
                         elements = elements
                     }, function(data, menu)

            if data.current.value == 'prosecutor' then
                -- Teleport to prosecutors office
                inMarker = false
                ESX.Game.Teleport(playerPed, { x = -1392.667, y = -480.4736, z = 72.04217 })
                menu.close()
            elseif data.current.value == 'public_defender' then
                -- Teleport to the public defenders office
                inMarker = false
                ESX.Game.Teleport(playerPed, { x = -1579.756, y = -565.0661, z = 108.523 })
                menu.close()
            elseif data.current.value == 'private_practice' then
                -- Teleport to the private practices office
                inMarker = false
                ESX.Game.Teleport(playerPed, { x = -78.6, y = -829.94, z = 242.39 })
                menu.close()
            end
        end, function(data, menu)
            menu.close()
        end)
end
