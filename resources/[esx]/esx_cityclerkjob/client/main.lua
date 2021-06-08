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

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
ESX                           = nil

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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    Citizen.Wait(5000)
end)

AddEventHandler('esx_cityclerkjob:hasEnteredMarker', function(station, part, partNum)
    if part == 'BossActions' then
        CurrentAction     = 'menu_boss_actions'
        CurrentActionMsg  = "Press ~INPUT_CONTEXT~ to open the menu"
        CurrentActionData = {}
    end
end)

AddEventHandler('esx_cityclerkjob:hasExitedMarker', function(station, part, partNum)
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

function CityClerkMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cityclerk_actions',
                     {
                         title    = 'City Clerk',
                         align    = 'top-right',
                         elements = {
                             { label = "Issue Invoice", value = 'issue_invoice' },
                             { label = "Issue License", value = 'issue_license' },
                             { label = "Revoke License", value = 'revoke_license' },
                         }
                     }, function(data, menu)
            if data.current.value == 'issue_invoice' then
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                    IssueInvoice(closestPlayer)
                else
                    TriggerEvent('mythic_notify:client:SendErrorAlert',
                                 { text = 'You must be next to someone to issue an invoice.' })
                end
            elseif data.current.value == 'issue_license' then
                TriggerEvent('esx_license:showIssueMenu', Config.LicenseTypes)
            elseif data.current.value == 'revoke_license' then
                TriggerEvent('esx_license:showRevokeMenu', Config.LicenseTypes)
            end
        end, function(data, menu)
            menu.close()
        end)
end

-- Invoice player
function IssueInvoice(player)
    function issueInvoiceCallback(value)
        local fine_amount = tonumber(value)

        if fine_amount == nil then
            ESX.ShowNotification("Please specify a dollar value.")
            TriggerEvent('tcrp-input:OpenInput', 'Invoice Amount', 'number', 11, issueInvoiceCallback)
        else
            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_cityclerk',
                               'Invoice: City Clerk Office', fine_amount)
        end
    end

    TriggerEvent('tcrp-input:OpenInput', 'Invoice Amount', 'number', 11, issueInvoiceCallback)
end

-- Display markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if PlayerData.job ~= nil and PlayerData.job.name == 'cityclerk' then
            local playerPed = PlayerPedId()
            local coords    = GetEntityCoords(playerPed)

            for k, v in pairs(Config.ClerkOffices) do
                if PlayerData.job.grade_name == 'boss' then
                    for i = 1, #v.BossActions, 1 do
                        if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords, v.BossActions[i].x,
                                                                                      v.BossActions[i].y,
                                                                                      v.BossActions[i].z,
                                                                                      true) < Config.DrawDistance then
                            DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z,
                                       0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y,
                                       Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g,
                                       Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                        end
                    end
                end
            end
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

    while true do

        Citizen.Wait(10)

        if PlayerData.job ~= nil and PlayerData.job.name == 'cityclerk' then

            local playerPed      = PlayerPedId()
            local coords         = GetEntityCoords(playerPed)
            local isInMarker     = false
            local currentStation = nil
            local currentPart    = nil
            local currentPartNum = nil

            for k, v in pairs(Config.ClerkOffices) do

                for i = 1, #v.BossActions, 1 do
                    if GetDistanceBetweenCoords(coords, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z,
                                                true) < Config.MarkerSize.x and PlayerData.job.grade_name == 'boss' then
                        isInMarker     = true
                        currentStation = k
                        currentPart    = 'BossActions'
                        currentPartNum = i
                    end
                end
            end

            local hasExited = false

            if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

                if
                (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
                    (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
                then
                    TriggerEvent('esx_cityclerkjob:hasExitedMarker', LastStation, LastPart, LastPartNum)
                    hasExited = true
                end

                HasAlreadyEnteredMarker = true
                LastStation             = currentStation
                LastPart                = currentPart
                LastPartNum             = currentPartNum

                TriggerEvent('esx_cityclerkjob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
            end

            if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent('esx_cityclerkjob:hasExitedMarker', LastStation, LastPart, LastPartNum)
            end

        else
            Citizen.Wait(500)
        end
    end
end)

-- Handle Key Presses
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)

            if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'cityclerk' then
                if CurrentAction == 'menu_boss_actions' and PlayerData.job.grade_name == 'boss' then
                    ESX.UI.Menu.CloseAll()
                    TriggerEvent('esx_society:openBossMenu', 'cityclerk', function(data, menu)
                        menu.close()
                        CurrentAction     = 'menu_boss_actions'
                        CurrentActionMsg  = "Press ~INPUT_CONTEXT~ to open the menu"
                        CurrentActionData = {}
                    end, { wash = false }) -- disable washing money
                end

                CurrentAction = nil
            end
        end

        if IsControlJustReleased(0, Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'cityclerk' then
            CityClerkMenu()
        end
    end
end)