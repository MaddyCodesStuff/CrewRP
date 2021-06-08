ESX = nil

local properties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('tcrp_properties:SyncProperties')
AddEventHandler('tcrp_properties:SyncProperties', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    properties = {}

    -- Do all owned properties

    result = MySQL.Sync.fetchAll(
                 'SELECT * FROM `housing` WHERE `owner` = @identifier AND `status` = 1',
                 {['@identifier'] = xPlayer.identifier})

    if #result > 0 then
        for k, v in pairs(result) do
            table.insert(properties, {
                id = v.id,
                entrance = json.decode(v.entrance),
                outside = json.decode(v.outside),
                name = v.name,
                interior = v.int_name,
                out = json.decode(v.exit_out),
                inside = json.decode(v.inside),
                wardrobe = json.decode(v.wardrobe),
                storage = json.decode(v.storage),
                garage = v.garage_out,
                store = v.garage_in,
                spawn = v.garage_spawn,
                owneractions = json.decode(v.owner_actions),
                owned = 1, -- Designates an owned property
                price = v.price,
                owner = v.owner,
                zone = v.zone,
                sell_price = v.sell_price
            })
        end
    end

    -- Do all keyed properties
    result = MySQL.Sync.fetchAll(
                 'SELECT * FROM `owner_keys` RIGHT JOIN `housing` ON `owner_keys`.`id` = `housing`.`id` WHERE NOT `housing`.`owner` = @identifier AND `owner_keys`.`receiver` = @identifier AND `status` = 1',
                 {['@identifier'] = xPlayer.identifier})

    if #result > 0 then
        for k, v in pairs(result) do
            if not findProperty(v.id) then
                table.insert(properties, {
                    id = v.id,
                    entrance = json.decode(v.entrance),
                    outside = json.decode(v.outside),
                    name = v.name,
                    interior = v.int_name,
                    out = json.decode(v.exit_out),
                    inside = json.decode(v.inside),
                    wardrobe = json.decode(v.wardrobe),
                    storage = json.decode(v.storage),
                    garage = v.garage_out,
                    store = v.garage_in,
                    spawn = v.garage_spawn,
                    owneractions = json.decode(v.owner_actions),
                    owned = 2, -- Designates a keyed property
                    price = v.price,
                    owner = v.owner,
                    zone = v.zone,
                    sell_price = v.sell_price
                })
            end
        end
    end

    -- Finally, do all other properties
    -- Need to make sure we aren't including properties that the player has keys for
    -- RIGHT JOIN `owner_keys` ON `owner_keys`.`id` = `housing`.`id` WHERE NOT `owner_keys`.`receiver` = @identifier
    result = MySQL.Sync.fetchAll(
                 "SELECT * FROM `housing` WHERE NOT `housing`.`owner` = @identifier AND NOT `housing`.`owner` = '' AND `status` = 1",
                 {['@identifier'] = xPlayer.identifier})

    if #result > 0 then
        for k, v in pairs(result) do
            if not findProperty(v.id) then
                table.insert(properties, {
                    id = v.id,
                    entrance = json.decode(v.entrance),
                    outside = json.decode(v.outside),
                    name = v.name,
                    interior = v.int_name,
                    out = json.decode(v.exit_out),
                    inside = json.decode(v.inside),
                    wardrobe = json.decode(v.wardrobe),
                    storage = json.decode(v.storage),
                    garage = v.garage_out,
                    store = v.garage_in,
                    spawn = v.garage_spawn,
                    owneractions = json.decode(v.owner_actions),
                    owned = 0, -- Designates somebody elses property
                    price = v.price,
                    owner = v.owner,
                    zone = v.zone,
                    sell_price = v.sell_price
                })
            end
        end
    end

    -- Finally, do all for sale properties
    result = MySQL.Sync.fetchAll(
                 "SELECT * FROM `housing` WHERE `owner` = '' AND `status` = 1",
                 {})

    if #result > 0 then
        for k, v in pairs(result) do
            if not findProperty(v.id) then
                -- If the property is already added, don't add it again
                table.insert(properties, {
                    id = v.id,
                    entrance = json.decode(v.entrance),
                    outside = json.decode(v.outside),
                    name = v.name,
                    interior = v.int_name,
                    out = json.decode(v.exit_out),
                    inside = json.decode(v.inside),
                    wardrobe = json.decode(v.wardrobe),
                    storage = json.decode(v.storage),
                    garage = v.garage_out,
                    store = v.garage_in,
                    spawn = v.garage_spawn,
                    owneractions = json.decode(v.owner_actions),
                    owned = 3, -- Designates a property for sale
                    price = v.price,
                    owner = v.owner,
                    zone = v.zone,
                    sell_price = v.sell_price
                })
            end
        end
    end

    result = MySQL.Sync.fetchAll(
                 'SELECT * FROM `users` WHERE `identifier` = @identifier',
                 {['@identifier'] = xPlayer.identifier})

    if #result > 0 then
        in_property = result[1].in_property
    else
        in_property = 0
    end

    if #properties > 0 then
        TriggerClientEvent('tcrp_properties:SyncProperties', _source,
                           properties, in_property)
        SyncGarages(_source, properties)
    end

    properties = {}
end)

function findProperty(id)
    for i = 1, #properties, 1 do
        if properties[i].id == id then return true end
    end

    return false
end

RegisterServerEvent('tcrp_properties:EnterProperty')
AddEventHandler('tcrp_properties:EnterProperty', function(propertyid)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Sync.execute(
        'UPDATE `users` SET `in_property` = @property_id WHERE `identifier` = @identifier',
        {['@property_id'] = propertyid, ['@identifier'] = xPlayer.identifier})
end)

RegisterServerEvent('tcrp_properties:ExitProperty')
AddEventHandler('tcrp_properties:ExitProperty', function(propertyid)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Sync.execute(
        'UPDATE `users` SET `in_property` = 0 WHERE `identifier` = @identifier',
        {['@identifier'] = xPlayer.identifier})
end)

RegisterServerEvent('tcrp_properties:checkInProperty')
AddEventHandler('tcrp_properties:checkInProperty', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local result = MySQL.Sync.fetchAll(
                       'SELECT * FROM `users` WHERE `identifier` = @identifier',
                       {['@identifier'] = xPlayer.identifier})

    in_property = result[1].in_property

    if in_property ~= nil and in_property ~= 0 then

        local result = MySQL.Sync.fetchAll(
                           'SELECT * FROM `housing` LEFT JOIN `owner_keys` ON `housing`.`id` = `owner_keys`.`id` WHERE `housing`.`id` = @id AND `housing`.`owner` = @identifier OR `receiver` = @identifier',
                           {
                ['@identifier'] = xPlayer.identifier,
                ['@id'] = in_property
            })

        -- The player doesn't have keys nor own this instance
        if result[1] == nil then
            -- Player doesn't belong in this instance. Kick them out.

            local property = MySQL.Sync.fetchAll(
                                 'SELECT * FROM `housing` WHERE `id` = @id',
                                 {['@id'] = in_property})

            MySQL.Sync.execute(
                'UPDATE `users` SET `in_property` = 0 WHERE `identifier` = @identifier',
                {['@identifier'] = xPlayer.identifier})

            TriggerClientEvent('tcrp_properties:RemoveFromProperty', _source, {
                name = property[1].name,
                outside = json.decode(property[1].outside)
            })
        end
    end
end)

RegisterServerEvent('tcrp_properties:updateInProperty')
AddEventHandler('tcrp_properties:updateInProperty', function(id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Sync.execute(
        'UPDATE `users` SET `in_property` = @property WHERE `identifier` = @identifier',
        {['@property'] = id, ['@identifier'] = xPlayer.identifier})
end)

--[[ We need to send an event to the esx_advancedgarage resource so we can tell it to update garages 

	We should do this every time a garage is added (a player is granted keys, or a player owns a house), 
	or when a garage is removed (players keys are taken away, or a player sells a house)
]] --


function SyncGarages(source, properties, keys)
    local garages = {}

    for k, v in pairs(properties) do
        if v.owned == 1 or v.owned == 2 then
            garages[v.id] = {
                Private = false,
                PrivateAddon = true,
                PrivateName = "housing",
                SpawnPoint = json.decode(v.spawn),
                DeletePoint = json.decode(v.store),
                GaragePoint = json.decode(v.garage)
            }
        end
    end

    -- TriggerClientEvent('esx_advancedgarage:syncGarages', source, garages,
    --                    "private")
    TriggerClientEvent('AS_SimpleGarage-main:updateOwnedProperties',
        source)
end

ESX.RegisterServerCallback('tcrp_properties:getHousingInventory',
                           function(source, cb, data)
    local owner = 0

    if data.owner ~= -1 then
        owner = data.owner
    else
        owner = -1 -- Accessing shared inventory
    end

    local blackMoney = 0
    local cash = 0
    local items = {}
    local weapons = {}

    -- TriggerEvent('esx_addonaccount:getAccount', 'property_black_money', 'housing_'. data.id, function(account)
    --     blackMoney = account.money
    -- end)

    local result = MySQL.Sync.fetchAll(
                       'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
                       {['@id'] = data.id, ['@owner'] = owner})

    if #result < 1 then
        blackMoney = 0
        cash = 0
        items = {}
        weapons = {}
    else
        local inventory = result

        if inventory ~= nil then
            items = json.decode(inventory[1].items)
            weapons = json.decode(inventory[1].weapons)
            money = json.decode(inventory[1].money)

            for k, v in pairs(money) do
                if v.name == "cash" then
                    cash = v.count
                else
                    blackMoney = v.count
                end
            end
        else
            items = {}
            weapons = {}
            cash = 0
            blackMoney = 0
        end
    end

    cb({blackMoney = blackMoney, money = cash, items = items, weapons = weapons})
end)

function dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then k = '"' .. k .. '"' end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end

RegisterServerEvent('tcrp_properties:ringBuzzer')
AddEventHandler('tcrp_properties:ringBuzzer', function(id)
    local _source = source

    local xPlayer = ESX.GetPlayerFromId(source)
    local name = getCharacterName(_source)

    local playerName = name.first .. " " .. name.last

    local result = MySQL.Sync.fetchAll(
                       "SELECT * FROM `users` WHERE `in_property` = @id AND `identifier` LIKE 'steam%'",
                       {['@id'] = id})

    for i = 1, #result, 1 do
        for k, v in pairs(ESX.GetPlayers()) do
            player = ESX.GetPlayerFromId(v)
            if player.identifier == result[i].identifier then
                TriggerClientEvent('tcrp_properties:ringBuzzer', v, playerName)
            end
        end
    end

end)

RegisterServerEvent('tcrp_properties:putHousingItem')
AddEventHandler('tcrp_properties:putHousingItem',
                function(property, owner, type, item, count)

    local _source = source

    local inventory = {}

    if owner ~= -1 then
        xPlayer = ESX.GetPlayerFromIdentifier(owner)
        owner = xPlayer.identifier
    else
        owner = owner
        xPlayer = ESX.GetPlayerFromId(_source)
    end

    if type == 'item_standard' then
        -- If it's a normal item, add it to the {items} array
        local targetItem = xPlayer.getInventoryItem(item)

        if targetItem.count < count then
            TriggerClientEvent('esx:showNotification', _source,
                               "~r~Invalid amount")
        else
            local result = MySQL.Sync.fetchAll(
                               'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
                               {['@id'] = property, ['@owner'] = owner})

            -- If there is already an inventory
            if #result > 0 then
                inventory = result[1].items

                inv = json.decode(inventory)
                -- Go through every item and see if it already exists

                for k, v in pairs(inv) do
                    if v.name == item then
                        v.count = v.count + count
                        xPlayer.removeInventoryItem(item, count)
                        found = true
                        break
                    end
                end

                if not found then
                    table.insert(inv, {
                        name = item,
                        count = count,
                        label = ESX.GetItemLabel(item)
                    })
                    xPlayer.removeInventoryItem(item, count)
                end

                found = false

                inventory = {items = json.encode(inv)}
            else
                -- If there's not
                inv = {
                    {name = item, count = count, label = ESX.GetItemLabel(item)}
                }

                inventory.items = json.encode(inv)
            end

            MySQL.Sync.execute(
                "INSERT INTO `housing_inventory` (`id`,`items`,`owner`) VALUES(@id, @items, @owner) ON DUPLICATE KEY UPDATE `items` = @items",
                {
                    ['@id'] = property,
                    ['@items'] = inventory.items,
                    ['@owner'] = owner
                })
        end
    end

    if type == 'item_money' then

        local money = xPlayer.getMoney()

        if count > money then
            TriggerClientEvent('esx:showNotification', _source,
                               "~r~Invalid amount")
        else
            local result = MySQL.Sync.fetchAll(
                               'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
                               {['@id'] = property, ['@owner'] = owner})

            if #result > 0 then
                inventory = result[1].money

                inv = json.decode(inventory)

                for k, v in pairs(inv) do
                    if v.name == item then
                        v.count = v.count + count
                        xPlayer.removeMoney(count)
                        found = true
                        break
                    end
                end

                if not found then
                    table.insert(inv, {name = item, count = count})
                    xPlayer.removeMoney(count)
                end

                found = false

                inventory = {money = json.encode(inv)}
            else
                inv = {{name = item, ammo = count}}
                inventory.money = json.encode(inv)
            end

            MySQL.Sync.execute(
                "INSERT INTO `housing_inventory` (`id`,`money`,`owner`) VALUES(@id, @money, @owner) ON DUPLICATE KEY UPDATE `money` = @money",
                {
                    ['@id'] = property,
                    ['@money'] = inventory.money,
                    ['@owner'] = owner
                })
        end

    end

    if type == 'item_account' then

        local money = xPlayer.getAccount(item).money

        if count > money then
            TriggerClientEvent('esx:showNotification', _source,
                               "~r~Invalid amount")
        else
            local result = MySQL.Sync.fetchAll(
                               'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
                               {['@id'] = property, ['@owner'] = owner})

            if #result > 0 then
                inventory = result[1].money

                inv = json.decode(inventory)

                for k, v in pairs(inv) do
                    if v.name == item then
                        v.count = v.count + count
                        xPlayer.removeAccountMoney(item, count)
                        found = true
                        break
                    end
                end

                if not found then
                    table.insert(inv, {name = item, count = count})
                    xPlayer.removeAccountMoney(item, count)
                end

                found = false

                inventory = {money = json.encode(inv)}
            else
                inv = {{name = item, ammo = count}}
                inventory.money = json.encode(inv)
            end

            MySQL.Sync.execute(
                "INSERT INTO `housing_inventory` (`id`,`money`,`owner`) VALUES(@id, @money, @owner) ON DUPLICATE KEY UPDATE `money` = @money",
                {
                    ['@id'] = property,
                    ['@money'] = inventory.money,
                    ['@owner'] = owner
                })
        end

    end

    if type == 'item_weapon' then
        local result = MySQL.Sync.fetchAll(
                           'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
                           {['@id'] = property, ['@owner'] = owner})

        -- If there is already an inventory
        if #result > 0 then
            inventory = result[1].weapons

            inv = json.decode(inventory)
            -- Go through every item and see if it already exists

            -- for k, v in pairs(inv) do
            --     if v.name == item then
            --         v.ammo = v.ammo + v.ammo
            --         xPlayer.removeWeaponItem(item)
            --         found = true
            --         break
            --     end
            -- end

            -- if not found then
            --     table.insert(inv, { name = item, ammo = count, label = ESX.GetItemLabel(item) })
            --     xPlayer.removeWeapon(item)
            -- end

            table.insert(inv, {
                name = item,
                ammo = count,
                label = ESX.GetItemLabel(item)
            })
            xPlayer.removeWeapon(item)

            found = false

            inventory = {weapons = json.encode(inv)}
        else
            inv = {
                {name = item, ammo = count, label = ESX.GetWeaponLabel(item)}
            }

            xPlayer.removeWeapon(item)

            inventory.weapons = json.encode(inv)
        end

        MySQL.Sync.execute(
            "INSERT INTO `housing_inventory` (`id`,`weapons`,`owner`) VALUES(@id, @weapons, @owner) ON DUPLICATE KEY UPDATE `weapons` = @weapons",
            {
                ['@id'] = property,
                ['@weapons'] = inventory.weapons,
                ['@owner'] = owner
            })
    end
end)

RegisterServerEvent('tcrp_properties:getHousingItem')
AddEventHandler('tcrp_properties:getHousingItem',
                function(property, owner, type, item, count)

    local _source = source

    local inventory = {}

    if owner ~= -1 then
        xPlayer = ESX.GetPlayerFromIdentifier(owner)
        owner = xPlayer.identifier
    else
        owner = owner
        xPlayer = ESX.GetPlayerFromId(_source)
    end

    if type == 'item_standard' then
        local result = MySQL.Sync.fetchAll(
                           'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
                           {['@id'] = property, ['@owner'] = owner})

        if #result > 0 then
            inventory = result[1].items

            inv = json.decode(inventory)

            for k, v in pairs(inv) do
                if v.name == item then
                    if count <= v.count then
                        v.count = v.count - count
                        xPlayer.addInventoryItem(item, count)
                        found = true

                        if v.count == 0 then
                            table.remove(inv, k)
                        end
                        break
                    else
                        TriggerClientEvent('esx:showNotification', _source,
                                           "~r~Invalid amount")
                    end
                end
            end

            found = false

            inventory = {items = json.encode(inv)}
        else
            inventory = {items = json.encode({})}
        end

        MySQL.Sync.execute(
            "INSERT INTO `housing_inventory` (`id`,`items`,`owner`) VALUES(@id, @items, @owner) ON DUPLICATE KEY UPDATE `items` = @items",
            {
                ['@id'] = property,
                ['@items'] = inventory.items,
                ['@owner'] = owner
            })
    end

    if type == 'item_money' then

        local result = MySQL.Sync.fetchAll(
            'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
            {['@id'] = property, ['@owner'] = owner})

        if #result > 0 then
            inventory = result[1].money

            inv = json.decode(inventory)

            for k, v in pairs(inv) do
                if v.name == item then
                    if count <= v.count then
                        v.count = v.count - count
                        xPlayer.addMoney(count)
                        found = true

                        if v.count == 0 then
                            table.remove(inv, k)
                        end
                        break
                    else
                        TriggerClientEvent('esx:showNotification', _source,
                                           "~r~Invalid amount")
                    end
                end
            end

            found = false

            inventory = {money = json.encode(inv)}
        else
            inventory = {money = json.encode({})}
        end

        MySQL.Sync.execute(
            "INSERT INTO `housing_inventory` (`id`,`money`,`owner`) VALUES(@id, @money, @owner) ON DUPLICATE KEY UPDATE `money` = @money",
            {
                ['@id'] = property,
                ['@money'] = inventory.money,
                ['@owner'] = owner
            })

    end

    if type == 'item_account' then

        local result = MySQL.Sync.fetchAll(
                           'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
                           {['@id'] = property, ['@owner'] = owner})

        if #result > 0 then
            inventory = result[1].money

            inv = json.decode(inventory)

            for k, v in pairs(inv) do
                if v.name == item then
                    if count <= v.count then
                        v.count = v.count - count
                        xPlayer.addAccountMoney('black_money', count)
                        found = true

                        if v.count == 0 then
                            table.remove(inv, k)
                        end
                        break
                    else
                        TriggerClientEvent('esx:showNotification', _source,
                                           "~r~Invalid amount")
                    end
                end
            end

            found = false

            inventory = {money = json.encode(inv)}
        else
            inventory = {money = json.encode({})}
        end

        MySQL.Sync.execute(
            "INSERT INTO `housing_inventory` (`id`,`money`,`owner`) VALUES(@id, @money, @owner) ON DUPLICATE KEY UPDATE `money` = @money",
            {
                ['@id'] = property,
                ['@money'] = inventory.money,
                ['@owner'] = owner
            })

    end

    if type == 'item_weapon' then
        local result = MySQL.Sync.fetchAll(
            'SELECT * FROM `housing_inventory` WHERE `id` = @id AND `owner` = @owner',
            {['@id'] = property, ['@owner'] = owner})

        if #result > 0 then
            inventory = result[1].weapons

            inv = json.decode(inventory)

            for k, v in pairs(inv) do
                if v.name == item then
                    xPlayer.addWeapon(item, v.ammo)
                    table.remove(inv,k)
                    break                    
                end
            end

            inventory = {weapons = json.encode(inv)}
        else
            inventory = {weapons = json.encode({})}
        end

        MySQL.Sync.execute(
            "INSERT INTO `housing_inventory` (`id`,`weapons`,`owner`) VALUES(@id, @weapons, @owner) ON DUPLICATE KEY UPDATE `weapons` = @weapons",
            {
                ['@id'] = property,
                ['@weapons'] = inventory.weapons,
                ['@owner'] = owner
            })
    end
end)

RegisterServerEvent('tcrp_properties:getPlayerName')
AddEventHandler('tcrp_properties:getPlayerName', function(player, cb)

    if player == 0 then player = source end

    xPlayer = ESX.GetPlayerFromId(player)

    return cb(xPlayer.identifier)

end)

ESX.RegisterServerCallback('tcrp_properties:getPlayerNames',
                           function(source, cb, data)
    local elements = {}

    players = data.players
    id = data.id

    for i = 1, #players, 1 do

        local name = getCharacterName(players[i])

        if name then
            table.insert(elements, {
                label = name.first .. " " .. name.last,
                value = players[i]
            })
        end

    end

    cb(elements, id)

end)

ESX.RegisterServerCallback('tcrp_properties:getCharacterName',
                           function(source, cb, id)
    -- local xPlayer = ESX.GetPlayerFromId(id)

    character = getCharacterName(id)

    cb(character)

end)

function getCharacterName(id)
    local xPlayer = ESX.GetPlayerFromId(tonumber(id))

    if xPlayer then
        local result = MySQL.Sync.fetchAll(
                           'SELECT * FROM `users` WHERE `identifier` = @identifier',
                           {['@identifier'] = xPlayer.identifier})

        local firstname = result[1].firstname
        local lastname = result[1].lastname

        return {first = firstname, last = lastname}
    end
end

ESX.RegisterServerCallback('tcrp_properties:getPropertyKeys',
                           function(source, cb, data)
    local elements = {}

    local property = data.id
    local owner = ESX.GetPlayerFromId(source)

    local result = MySQL.Sync.fetchAll(
                       'SELECT * FROM `owner_keys` JOIN `users` ON `users`.`identifier` = `owner_keys`.`receiver` WHERE `id` = @id AND `type` = @type',
                       {['@id'] = property, ['@type'] = "property"})

    if #result > 0 then
        for i = 1, #result, 1 do

            table.insert(elements, {
                label = result[i].firstname .. " " .. result[i].lastname,
                value = result[i].receiver
            })
        end
    end

    cb(elements, property)

end)

RegisterServerEvent('tcrp_properties:giveKeys')
AddEventHandler('tcrp_properties:giveKeys', function(id, player)
    TriggerClientEvent("mythic_notify:client:SendAlert", source, {
        type = "inform",
        text = "You've given keys to your property"
    })
    TriggerClientEvent("mythic_notify:client:SendAlert", player, {
        type = "inform",
        text = "You've been given keys to a property"
    })
    TriggerClientEvent('tcrp_properties:updateProperties', player)
    GiveKeys(source, id, player)
end)

RegisterServerEvent('tcrp_properties:takeKeys')
AddEventHandler('tcrp_properties:takeKeys', function(id, player)
    if ESX.GetPlayerFromIdentifier(player) ~= nil then
        xPlayer = ESX.GetPlayerFromIdentifier(player)
    end

    TriggerClientEvent("mythic_notify:client:SendAlert", source, {
        type = "inform",
        text = "You've taken keys away from your property"
    })
    if xPlayer then
        TriggerClientEvent("mythic_notify:client:SendAlert", xPlayer.source, {
            type = "inform",
            text = "You've had keys taken away from a property"
        })
        TriggerClientEvent('tcrp_properties:updateProperties', xPlayer.source)
    end

    TakeKeys(source, id, player)
end)

function GiveKeys(source, id, player)
    local owner = ESX.GetPlayerFromId(source)
    local otherPlayer = ESX.GetPlayerFromId(player)

    MySQL.Sync.execute(
        'INSERT INTO `owner_keys` (`id`,`receiver`,`owner`,`type`) VALUES (@id, @receiver, @owner, @type) ON DUPLICATE KEY UPDATE `receiver` = @receiver, `owner` = @owner, `id` = @id',
        {
            ['@receiver'] = otherPlayer.identifier,
            ['@id'] = id,
            ['@owner'] = owner.identifier,
            ['@type'] = 'property'
        })
end

function TakeKeys(source, id, player)
    local owner = ESX.GetPlayerFromId(source)
    local otherPlayer = player

    MySQL.Async.execute(
        'DELETE FROM `owner_keys` WHERE `id` = @id AND `receiver` = @receiver AND `type` = @type',
        {['@receiver'] = otherPlayer, ['@id'] = id, ['@type'] = "property"})

end

-- Commands

-- This command can be used by admins to reset a players in_property value in the db, which will fix the edge case instancing problems.
-- This can be used as an alternative to fixing a players broken state in the edge case it happens. The best way to use this, is to /bring the player to outside of an interior and then use /resetproperty <playerid>
RegisterCommand('resetproperty', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    local id = nil

    if args[1] == nil then
        id = source
    else
        id = args[1]
    end

    if xPlayer.getGroup() == "superadmin" then
        local sPlayer = ESX.GetPlayerFromId(id)

        if sPlayer then
            MySQL.Sync.execute(
                'UPDATE `users` SET `in_property` = 0 WHERE `identifier` = @identifier',
                {['@identifier'] = sPlayer.identifier})

            TriggerClientEvent('tcrp_properties:resetProperty', id)
            TriggerClientEvent('tcrp_properties:updateProperties', id)
            -- TriggerEvent('watchdog:record',xPlayer.identifier .. " has reset player ".. sPlayer.identifer .. " property")
        end
    end
end)

-- This command is used for superadmins to update a players in_property value in the database. 
-- Times this would be used is if a player is inside of a property, and their local in_property gets out of sync (Edge case),
--   An alternative to the above issue, is to /bring the player just outside of the interior entrance, and then use /resetproperty

-- An admin uses /bring to bring a player into a property they are in. 
-- An alternative to using the above, would be to make sure you are outside of a property when you /bring, then have the player enther the property like normal.

RegisterCommand('setproperty', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() == "superadmin" then
        local sPlayer = ESX.GetPlayerFromId(args[1])
        local property = args[2]

        MySQL.Sync.execute(
            'UPDATE `users` SET `in_property` = @property WHERE `identifier` = @identifier',
            {['@identifier'] = sPlayer.identifier, ['@property'] = property})

        TriggerClientEvent('tcrp_properties:updateProperties', args[1])
        -- TriggerEvent('watchdog:record',xPlayer.identifier .. " has updated player ".. sPlayer.identifer .. " to be in property ".. property)
    end
end)

function IsPlayerInside(identifier, property)

    local result = MySQL.Sync.fetchAll(
                       'SELECT * FROM `users` WHERE `identifier` = @identifier AND `in_property` = @property',
                       {['@identifier'] = identifier, ['@property'] = property})

    if #result < 1 then
        return false
    else
        return true
    end
end

RegisterServerEvent('tcrp_properties:deleteWardrobe')
AddEventHandler('tcrp_properties:deleteWardrobe', function(id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Sync.execute('DELETE FROM `users_wardrobe` WHERE `id` = @id',
                       {['@id'] = id})
end)

RegisterServerEvent('tcrp_properties:saveWardrobe')
AddEventHandler('tcrp_properties:saveWardrobe', function(data, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Sync.execute(
        "INSERT INTO `users_wardrobe` (`name`,`skin`,`identifier`) VALUES (@name,@skin,@identifier) ON DUPLICATE KEY UPDATE `skin` = @skin",
        {
            ['@name'] = data.name,
            ['@skin'] = json.encode(data.skin),
            ['@identifier'] = xPlayer.identifier
        })
end)

ESX.RegisterServerCallback('tcrp_properties:getPropertyListings',
                           function(source, cb)
    local _source = source

    local result = MySQL.Sync.fetchAll(
                       'SELECT `housing`.*, `users`.`firstname`, `users`.`lastname` FROM `housing` LEFT JOIN `users` AS `users` ON `users`.`identifier` = `housing`.`owner`',
                       {})

    cb(result)
end)

ESX.RegisterServerCallback('tcrp_properties:getWardrobe',
                           function(source, cb, data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local result = MySQL.Sync.fetchAll(
                       'SELECT * FROM `users_wardrobe` WHERE `identifier` = @identifier ORDER BY `name`',
                       {['@identifier'] = xPlayer.identifier})

    cb(result)
end)

ESX.RegisterServerCallback('tcrp_properties:getOutfit',
                           function(source, cb, data)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM `users_wardrobe` WHERE id = @id',
                         {['@id'] = data},
                         function(result) if result then cb(result[1]) end end)
end)

function trim(s) return (s:gsub("^%s*(.-)%s*$", "%1")) end

RegisterCommand('syncall', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() == "superadmin" then sendSyncProperties() end
end)

RegisterServerEvent('tcrp_properties:activateProperty')
AddEventHandler('tcrp_properties:activateProperty', function(id)

    MySQL.Sync.execute('UPDATE `housing` SET `status` = 1 WHERE `id` = @id',
                       {['@id'] = id})

    sendSyncProperties()
end)

RegisterServerEvent('tcrp_properties:deactivateProperty')
AddEventHandler('tcrp_properties:deactivateProperty', function(id)

    MySQL.Sync.execute('UPDATE `housing` SET `status` = 0 WHERE `id` = @id',
                       {['@id'] = id})

    sendSyncProperties()
end)

RegisterServerEvent('tcrp_properties:saveProperty')
AddEventHandler('tcrp_properties:saveProperty', function(data)

    MySQL.Sync.execute(
        'UPDATE `housing` SET `price` = @price, `zone` = @zone, `name` = @name WHERE `id` = @id',
        {
            ['@id'] = data.id,
            ['@price'] = data.price,
            ['@zone'] = data.zone,
            ['@name'] = data.address
        })

    sendSyncProperties()
end)

RegisterServerEvent('tcrp_properties:showProperty')
AddEventHandler('tcrp_properties:showProperty', function(player, id)

    TriggerClientEvent('tcrp_properties:showProperty', player, id)
end)

RegisterServerEvent('tcrp_properties:allowPlayer')
AddEventHandler('tcrp_properties:allowPlayer', function(player, id)
    TriggerClientEvent('tcrp_properties:allowPlayer', player, id)
end)

RegisterServerEvent('tcrp_properties:sellProperty')
AddEventHandler('tcrp_properties:sellProperty',
                function(player, id, commission, price)
    local xPlayer = ESX.GetPlayerFromId(player)
    local sPlayer = ESX.GetPlayerFromId(source)

    MySQL.Sync.execute(
        'UPDATE `housing` SET `owner` = @owner, `sell_price` = @sell_price WHERE `id` = @id',
        {['@owner'] = xPlayer.identifier, ['@id'] = id, ['@sell_price'] = price})

    if commission >= 0 or commission >= nil then
        TriggerEvent('esx_addonaccount:getSharedAccount',
                     'society_realestateagent', function(account)
            if account.money >= commission then
                account.removeMoney(commission)
                sPlayer.addMoney(commission)
                TriggerClientEvent('mythic_notify:client:SendAlert',
                                   sPlayer.source, {
                    type = 'inform',
                    text = 'You\'ve received ' .. commission ..
                        ' commission pay.'
                })
            else
                TriggerClientEvent('mythic_notify:client:SendErrorAlert',
                                   sPlayer.source, {
                    type = 'error',
                    text = 'Not enough funds to pay your commission!'
                })
            end
        end)
    end

    sendSyncProperties()
    TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, {
        type = 'inform',
        text = 'You\'ve been given keys to a house.'
    })
end)

RegisterServerEvent('tcrp_properties:buyBackProperty')
AddEventHandler('tcrp_properties:buyBackProperty',
                function(id, sell_price, owner)
    local source = _source
    local sPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Sync.execute("UPDATE `housing` SET `owner` = '' WHERE `id` = @id",
                       {['@id'] = id})

    MySQL.Sync.execute("UPDATE owned_vehicles o SET o.impounded = 1, o.impoundprice = 1000, o.garage = 'BUS STATION (PUBLIC)' WHERE o.garage = (SELECT h.name FROM housing h WHERE h.id = @id)",
                       {['@id'] = id})

    MySQL.Sync.execute("DELETE FROM `housing_inventory` WHERE `id` = @id",
                       {['@id'] = id})

    MySQL.Sync.execute(
        "DELETE FROM `owner_keys` WHERE `id` = @id AND `type` = 'property'",
        {['@id'] = id})

    if sell_price ~= 0 then
        players = ESX.GetPlayers()
        for i = 1, #players, 1 do
            player = ESX.GetPlayerFromId(players[i])

            if player then
                if player.identifier == owner then
                    found = players[i]
                    break
                end
            end
        end

        local refund_amount = math.floor(sell_price - (sell_price * (30 / 100)))

        TriggerEvent('esx_addonaccount:getSharedAccount',
                     'society_realestateagent', function(account)
            if account.money >= refund_amount then
                account.removeMoney(refund_amount)
            else
                TriggerClientEvent('mythic_notify:client:SendErrorAlert',
                                   sPlayer.source, {
                    type = 'error',
                    text = 'Not enough funds to pay your commission!'
                })
            end
        end)

        if found then
            local xPlayer = ESX.GetPlayerFromId(found)
            xPlayer.addMoney(refund_amount)
            TriggerClientEvent('mythic_notify:client:SendAlert', found, {
                type = 'inform',
                text = 'You\'ve been given ' .. refund_amount ..
                    ' for your house.'
            })
        else
            UpdatePlayerBank(owner, refund_amount)
        end
    end

    sendSyncProperties()
end)

-- Update an offline players bank account for buying back a house
function UpdatePlayerBank(identifier, amount)
    local result = MySQL.Sync.fetchAll(
        'SELECT `bank` FROM `users` WHERE `identifier` = @identifier',
        {['@identifier'] = identifier})

    local bank = result[1].bank + amount

    MySQL.Sync.execute(
        'UPDATE `users` SET `bank` = @bank WHERE `identifier` = @identifier',
        {['@identifier'] = identifier, ['@bank'] = bank})
end

function sendSyncProperties()
    for i = 1, GetNumPlayerIndices(), 1 do
        Citizen.Wait(500)
        TriggerClientEvent('tcrp_properties:updateProperties', i)
    end
end
