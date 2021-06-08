local propertyName

AddEventHandler('esx_inventoryhud:updateDumpster', function(name)
    propertyName = name
end)

RegisterNetEvent("esx_inventoryhud:openDumpsterInventory")
AddEventHandler("esx_inventoryhud:openDumpsterInventory", function(data, id)
    setDumpsterInventoryData(data)
    openDumpsterInventory(id)
end)

function refreshDumpsterInventory(id)
    ESX.TriggerServerCallback(
        "tcrp_dirtydumpsters:getDumpsterInventory",
        function(inventory)
            setDumpsterInventoryData(inventory)
        end,
        { id = id }
    )
end

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

function setDumpsterInventoryData(data)
    items                 = {}

    local blackMoney      = data.blackMoney
    local cash            = data.money
    local propertyItems   = data.items
    local propertyWeapons = data.weapons

    if cash ~= nil and cash > 0 then
        moneyData = {
            label     = _U("cash"),
            name      = "cash",
            type      = "item_money",
            count     = cash,
            usable    = false,
            rare      = false,
            limit     = -1,
            canRemove = true
        }

        table.insert(items, moneyData)
    end

    if blackMoney > 0 then
        accountData = {
            label     = _U("black_money"),
            count     = blackMoney,
            type      = "item_account",
            name      = "black_money",
            usable    = false,
            rare      = false,
            limit     = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    if propertyItems ~= nil then
        for i = 1, #propertyItems, 1 do
            local item = propertyItems[i]

            if item.count > 0 then
                item.type      = "item_standard"
                item.usable    = false
                item.rare      = false
                item.limit     = -1
                item.canRemove = false

                table.insert(items, item)
            end
        end
    end

    for i = 1, #propertyWeapons, 1 do
        local weapon = propertyWeapons[i]

        if propertyWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label     = ESX.GetWeaponLabel(weapon.name),
                    count     = weapon.ammo,
                    limit     = -1,
                    type      = "item_weapon",
                    name      = weapon.name,
                    usable    = false,
                    rare      = false,
                    canRemove = false
                }
            )
        end
    end

    SendNUIMessage(
        {
            action   = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openDumpsterInventory(id)
    loadPlayerInventory()

    isInInventory = true

    SendNUIMessage(
        {
            action   = "display",
            type     = "dumpster",
            dumpster = id
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoDumpster",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            TriggerServerEvent("tcrp_dirtydumpsters:putItem", data.id, data.item.type, data.item.name, count)
        end

        Wait(150)
        refreshDumpsterInventory(data.id)
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromDumpster",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("tcrp_dirtydumpsters:getItem", data.id, data.item.type, data.item.name,
                               tonumber(data.number))
        end

        Wait(150)
        refreshDumpsterInventory(data.id)
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)
