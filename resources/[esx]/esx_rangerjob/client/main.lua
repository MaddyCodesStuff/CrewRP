local Keys                                               = {
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

ESX                                                      = nil
local PlayerData                                         = {}

local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastStore, LastPart, LastPartNum
local isBusy                                             = false

local canTrigger                                         = true

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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    Citizen.Wait(5000)
end)

function OpenCloakroomMenu()
    local playerPed = PlayerPedId()

    local elements  = {
        { label = 'Civilian Clothes', value = 'citizen_wear' },
        { label = 'Work Wear', value = 'job_wear' }
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
        title    = 'Cloakroom',
        align    = 'top-right',
        elements = elements
    }, function(data, menu)
        cleanPlayer(playerPed)

        if data.current.value == 'citizen_wear' then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        elseif data.current.value == 'job_wear' then
            setUniform(data.current.value, playerPed)
        end
    end, function(data, menu)
        menu.close()

        CurrentAction     = 'Cloakroom'
        CurrentActionMsg  = 'Cloakroom'
        CurrentActionData = {}
    end)
end

function OpenInventoryMenu()
    ESX.UI.Menu.CloseAll()

    elements = {}

    for _, v in pairs(Config.Items) do
        table.insert(elements,
                     { label = v.name .. ' $[<font color="green">' .. v.price .. '</font>]', item = v.item, type = 'slider', value = 1, min = 1, max = v.max })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'inventory', {
        title    = 'Shop Inventory',
        align    = 'top-right',
        elements = elements,
    }, function(data, menu)
        TriggerServerEvent('esx_rangerjob:giveItem', data.current.item, data.current.value)
    end, function(data, menu)
        menu.close()
    end)
end

-- Park Ranger Job Menu
function ParkRangerMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'parkranger_actions',
                     {
                         title    = 'Park Ranger',
                         align    = 'top-right',
                         elements = {
                             { label = "Issue Invoice", value = 'issue_invoice' },
                             { label = "Issue License", value = 'issue_license' },
                             { label = "Revoke License", value = 'revoke_license' },
                             { label = "Flamingo", value = 'flamingo'}
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
            elseif data.current.value == 'parkranger' then
                TriggerEvent("esx-radios:toggleRadioByName", data.current.value)
            elseif data.current.value == 'dispatch_menu' then
                TriggerEvent("esx-radios:toggleRadioByName", 'dispatch')
             elseif data.current.value == 'flamingo' then

						local playerPed = PlayerPedId()
						local coords    = GetEntityCoords(playerPed)
						local forward   = GetEntityForwardVector(playerPed)
						local x, y, z   = table.unpack(coords + forward * 1.0)
						ESX.Game.SpawnObject('prop_flamingo', {
							x = x,
							y = y,
							z = z
						}, function(obj)
							SetEntityHeading(obj, GetEntityHeading(playerPed))
							PlaceObjectOnGroundProperly(obj)
						end)
					
            end
        end, function(data, menu)
            menu.close()
        end)
end

AddEventHandler('esx_rangerjob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job ~= nil and PlayerData.job.name == 'parkranger' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = ('remove_prop')
		CurrentActionData = { entity = entity }
	end
end)

AddEventHandler('esx_rangerjob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)

Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_flamingo'
		
	}

	while true do
		Citizen.Wait(500)

		local playerPed       = PlayerPedId()
		local coords          = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i = 1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey(trackedEntities[i]),
												  false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, objCoords.x, objCoords.y,
														   objCoords.z, true)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_rangerjob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity ~= nil then
				TriggerEvent('esx_rangerjob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)

-- Invoice player
function IssueInvoice(player)
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'custom_ranger_invoice_menu',
        {
            title = 'Invoice Amount'
        },
        function(data, menu)
            local fine_amount = tonumber(data.value)

            if fine_amount == nil then
                ESX.ShowNotification("Please specify a dollar value.")
            else
                menu.close()
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_rangerjob',
                                   'Invoice: Park Rangers', fine_amount)
            end
        end
    )
end

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)

            if IsControlJustReleased(0,
                                     Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'parkranger' then
                if CurrentAction == 'Inventory' then
                    OpenInventoryMenu()
                elseif CurrentAction == 'Cloakroom' then
                    OpenCloakroomMenu()
                elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
                elseif CurrentAction == 'Alarm' then
                    local store = CurrentActionData.store
                    if canTrigger then
                        canTrigger = false
                        TriggerServerEvent('esx_rangerjob:panicAlarm', store)
                        ESX.Streaming.RequestAnimDict("oddjobs@shop_robbery@rob_till", function()
                            TaskPlayAnim(PlayerPedId(), "oddjobs@shop_robbery@rob_till", "enter", 8.0, -8.0, -1, 16, 0,
                                         false, false, false)
                        end)

                        ESX.ShowNotification('The silent alarm has been triggered, cops are on their way!')
                        ESX.SetTimeout(5000, function()
                            canTrigger = true
                        end)
                    else
                        ESX.ShowNotification('The silent alarm has already been triggered.')
                    end
                end
                CurrentAction = nil
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(GetPlayerPed(-1))
        local currentStore, currentPart, currentPartNum

        if PlayerData.job ~= nil and PlayerData.job.name == 'parkranger' then
            for storeNum, store in pairs(Config.Shops) do

                -- Cloakroom

                local distance = GetDistanceBetweenCoords(playerCoords, store.Cloakroom.x, store.Cloakroom.y,
                                                          store.Cloakroom.z, true)

                if distance < Config.DrawDistance then
                    DrawMarker(Config.MarkerType, store.Cloakroom.x, store.Cloakroom.y, store.Cloakroom.z, 0.0, 0.0,
                               0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z,
                               Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2,
                               false, false, false, false)
                    letSleep = false
                end

                -- if distance < 3 then
                -- 	isInMarker, currentStore, currentPart, currentPartNum = true, storeNum, 'Cloakroom', k
                -- end

                -- Inventory
                -- local distance = GetDistanceBetweenCoords(playerCoords, store.Inventory.x, store.Inventory.y, store.Inventory.z, true)

                -- if distance < Config.DrawDistance then
                -- 	DrawMarker(Config.MarkerType, store.Inventory.x, store.Inventory.y, store.Inventory.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                -- 	letSleep = false
                -- end

                -- if distance < 3 then
                -- 	isInMarker, currentStore, currentPart, currentPartNum = true, storeNum, 'Inventory', k
                -- end

                -- Panic Button
                local distance = GetDistanceBetweenCoords(playerCoords, store.PanicButton.x, store.PanicButton.y,
                                                          store.PanicButton.z, true)

                if distance < Config.DrawDistance then
                    DrawMarker(Config.MarkerType, store.PanicButton.x, store.PanicButton.y, store.PanicButton.z, 0.0,
                               0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z,
                               Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2,
                               false, false, false, false)
                    letSleep = false
                end

                -- if distance < 3 then
                -- 	isInMarker, currentStore, currentPart, currentPartNum = true, storeNum, 'Alarm', k
                -- end
            end
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

    while true do

        Citizen.Wait(10)

        if PlayerData.job ~= nil and PlayerData.job.name == 'parkranger' then

            local playerPed      = PlayerPedId()
            local coords         = GetEntityCoords(playerPed)
            local isInMarker     = false
            local currentStation = nil
            local currentPart    = nil
            local currentPartNum = nil

            for k, v in pairs(Config.Shops) do

                if GetDistanceBetweenCoords(coords, v.Cloakroom.x, v.Cloakroom.y, v.Cloakroom.z,
                                            true) < Config.MarkerSize.x then
                    isInMarker   = true
                    currentStore = k
                    currentPart  = 'Cloakroom'
                    -- currentPartNum = i
                end

                -- if GetDistanceBetweenCoords(coords, v.Inventory.x, v.Inventory.y, v.Inventory.z, true) < Config.MarkerSize.x then
                -- 	isInMarker     = true
                -- 	currentStore = k
                -- 	currentPart    = 'Inventory'
                -- 	currentPartNum = i
                -- end

                if GetDistanceBetweenCoords(coords, v.PanicButton.x, v.PanicButton.y, v.PanicButton.z,
                                            true) < Config.MarkerSize.x then
                    isInMarker   = true
                    currentStore = k
                    currentPart  = 'Alarm'
                    -- currentPartNum = i
                end

                local hasExited = false

                if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStore ~= currentStore or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

                    if
                    (LastStore ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
                        (LastStore ~= currentStore or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
                    then
                        TriggerEvent('esx_rangerjob:hasExitedMarker')
                        hasExited = true
                    end

                    HasAlreadyEnteredMarker = true
                    LastStore               = currentStore
                    LastPart                = currentPart
                    LastPartNum             = currentPartNum

                    TriggerEvent('esx_rangerjob:hasEnteredMarker', currentStore, currentPart, currentPartNum)
                end

                if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
                    HasAlreadyEnteredMarker = false
                    TriggerEvent('esx_rangerjob:hasExitedMarker')
                end
            end

        end

    end
end)

AddEventHandler('esx_rangerjob:hasEnteredMarker', function(store, part, partNum)
    if part == 'Inventory' then

        CurrentAction     = part
        CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to open the inventory menu'
        CurrentActionData = {}

    elseif part == 'Cloakroom' then

        CurrentAction     = 'Cloakroom'
        CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to Open Cloakroom'
        CurrentActionData = {}

    elseif part == 'Alarm' then

        CurrentAction     = part
        CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to trigger silent alarm'
        CurrentActionData = { store = store }

    end
end)

AddEventHandler('esx_rangerjob:hasExitedMarker', function(store, part, partNum)
    -- ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

-- Handle Key Presses
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if IsControlJustReleased(0, Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'parkranger' then
            ParkRangerMenu()
        end
    end
end)

function setUniform(job, playerPed)
    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
            if Config.Uniforms.male then
                TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.male)
            else
                ESX.ShowNotification(_U('no_outfit'))
            end
        else
            if Config.Uniforms.female then
                TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.female)
            else
                ESX.ShowNotification(_U('no_outfit'))
            end
        end
    end)
end

function cleanPlayer(playerPed)
    --	SetPedArmour(playerPed, 0)
    ClearPedBloodDamage(playerPed)
    ResetPedVisibleDamage(playerPed)
    ClearPedLastWeaponDamage(playerPed)
    ResetPedMovementClipset(playerPed, 0)
end

function OpenGetStocksMenu()
    ESX.TriggerServerCallback('esx_rangerjob:getStockItems', function(items)


        local elements = {}

        for i = 1, #items, 1 do
            table.insert(elements, { label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name })
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
                         {
                             title    = 'Store Stock',
                             align    = 'top-right',
                             elements = elements
                         }, function(data, menu)

                local itemName = data.current.value

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
                    title = 'Quantity'
                }, function(data2, menu2)

                    local count = tonumber(data2.value)

                    if count == nil then
                        ESX.ShowNotification(_U('quantity_invalid'))
                    else
                        menu2.close()
                        menu.close()
                        TriggerServerEvent('esx_rangerjob:getStockItem', itemName, count)

                        Citizen.Wait(300)
                        OpenGetStocksMenu()
                    end

                end, function(data2, menu2)
                    menu2.close()
                end)

            end, function(data, menu)
                menu.close()
            end)

    end)
end