ESX           = nil
local display = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

function isWeapon(item)
    local weaponList = ESX.GetWeaponList()
    for i = 1, #weaponList, 1 do
        if weaponList[i].label == item then
            return true
        end
    end
    return false
end

local function craftItem(ingredients)
    local ingredientsPrepped = {}
    for name, count in pairs(ingredients) do
        if count > 0 then
            table.insert(ingredientsPrepped, { item = name, quantity = count })
        end
    end
    TriggerServerEvent('salty_crafting:craftItem', ingredientsPrepped)
end

RegisterNetEvent('salty_crafting:openMenu')
AddEventHandler('salty_crafting:openMenu', function(playerInventory)
    SetNuiFocus(true, true)
    local preppedInventory = {}
    for i = 1, #playerInventory, 1 do
        if playerInventory[i].count > 0 and not isWeapon(playerInventory[i].label) then
            table.insert(preppedInventory, playerInventory[i])
        end
    end
    SendNUIMessage({
                       inventory = preppedInventory,
                       display   = true
                   })
    display = true
end)

RegisterNUICallback('craftItemNUI', function(data, cb)
    craftItem(data)
end)

RegisterNUICallback('NUIFocusOff', function()
    SetNuiFocus(false, false)
    SendNUIMessage({
                       display = false
                   })
    display = false
end)

if Config.Keyboard.useKeyboard then
    -- Handle menu input
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsControlJustReleased(1, Config.Keyboard.keyCode) and GetLastInputMethod(2) then
                TriggerServerEvent('salty_crafting:getPlayerInventory')
            end
        end
    end)
end

if Config.Shop.useShop then
    local inDrawingRange = false
    local function isPlayerInRange(coords1, coords2, range)
        return (Vdist2(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z) < range)
    end

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(250)
            inDrawingRange = isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, 100)
        end
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if inDrawingRange then
                if not display and isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates,
                                                   Config.Shop.zoneSize.x) then
                    SetTextComponentFormat('STRING')
                    AddTextComponentString("Press ~INPUT_CONTEXT~ Talk to Jeff.")
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('salty_crafting:getPlayerInventory')
                    end
                end
            end
        end
    end)
end