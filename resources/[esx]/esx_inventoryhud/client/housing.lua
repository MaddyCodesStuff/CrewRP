local propertyName

AddEventHandler('esx_inventoryhud:updateProperty', function(name)
    propertyName = name
end)

RegisterNetEvent("esx_inventoryhud:openHousingInventory")
AddEventHandler("esx_inventoryhud:openHousingInventory", function(data, id, owner)
    setHousingInventoryData(data)
    openHousingInventory(id, owner)
end)

function refreshHousingInventory(id, owner)
    ESX.TriggerServerCallback(
        "tcrp_properties:getHousingInventory",
        function(inventory)
            setHousingInventoryData(inventory)
        end,
        { owner = owner, id = id }
    )
end

function setHousingInventoryData(data)
    items                 = {}

    local blackMoney      = data.blackMoney
    local cash            = data.money
    local propertyItems   = data.items
    local propertyWeapons = data.weapons

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

function openHousingInventory(id, owner)
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action   = "display",
            type     = "housing_property",
            property = id,
            owner    = owner, -- Do we need this?
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoHousing",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            TriggerServerEvent("tcrp_properties:putHousingItem", data.property, data.owner, data.item.type,
                               data.item.name, count)
        end

        Wait(150)
        refreshHousingInventory(data.property, data.owner)
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromHousing",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("tcrp_properties:getHousingItem", data.property, data.owner, data.item.type,
                               data.item.name, tonumber(data.number))
        end

        Wait(150)
        refreshHousingInventory(data.property, data.owner)
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)
