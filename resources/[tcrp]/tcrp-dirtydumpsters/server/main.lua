ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

MySQL.ready(function()
    EmptyDumpsters()
end)

function EmptyDumpsters()
    print("Cleaning up the local dumpsters.")
    MySQL.Sync.execute("UPDATE `dumpsters` SET items = '{}', weapons = '{}', money = '{}' WHERE `public` = 1")
end

RegisterServerEvent('tcrp_dirtydumps:getDumpsters')
AddEventHandler('tcrp_dirtydumps:getDumpsters', function()
    local _source   = source

    local result    = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters`')
    local dumpsters = {}

    if #result > 0 then
        for k, v in pairs(result) do
            dumpsters[v.id] = {
                coords = v.coords,
                public = v.public,
            }
        end
    end

    TriggerClientEvent('tcrp_dirtydumpsters:updateDumpsters', _source, dumpsters)
end)

ESX.RegisterServerCallback('tcrp_dirtydumpsters:getDumpsterInventory', function(source, cb, data)

    local blackMoney = 0
    local cash       = 0
    local items      = {}
    local weapons    = {}

    -- TriggerEvent('esx_addonaccount:getAccount', 'property_black_money', 'housing_'. data.id, function(account)
    --     blackMoney = account.money
    -- end)

    local result     = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
        ['@id'] = data.id,
    })

    if #result < 1 then
        blackMoney = 0
        cash       = 0
        items      = {}
        weapons    = {}
    else
        local inventory = result

        if inventory ~= nil then
            items   = json.decode(inventory[1].items)
            weapons = json.decode(inventory[1].weapons)
            money   = json.decode(inventory[1].money)

            for k, v in pairs(money) do
                if v.name == "cash" then
                    cash = v.count
                else
                    blackMoney = v.count
                end
            end
        else
            items      = {}
            weapons    = {}
            cash       = 0
            blackMoney = 0
        end
    end

    cb({
           blackMoney = blackMoney,
           money      = cash,
           items      = items,
           weapons    = weapons
       })
end)

RegisterServerEvent('tcrp_dirtydumpsters:putItem')
AddEventHandler('tcrp_dirtydumpsters:putItem', function(id, type, item, count)

    local _source   = source

    local xPlayer   = ESX.GetPlayerFromId(source)

    local inventory = {}

    if type == 'item_standard' then
        -- If it's a normal item, add it to the {items} array
        local targetItem = xPlayer.getInventoryItem(item)

        if targetItem.count < count then
            TriggerClientEvent('esx:showNotification', _source, "~r~Invalid amount")
        else
            local result = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
                ['@id'] = id,
            })

            -- If there is already an inventory
            if #result > 0 then
                inventory = result[1].items

                inv       = json.decode(inventory)
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
                    table.insert(inv, { name = item, count = count, label = ESX.GetItemLabel(item) })
                    xPlayer.removeInventoryItem(item, count)
                end

                found     = false

                inventory = {
                    items = json.encode(inv)
                }
            else
                -- If there's not
                inv             = {
                    {
                        name = item, count = count, label = ESX.GetItemLabel(item)
                    }
                }

                inventory.items = json.encode(inv)
            end

            MySQL.Sync.execute("INSERT INTO `dumpsters` (`id`,`items`) VALUES(@id, @items) ON DUPLICATE KEY UPDATE `items` = @items",
                               {
                                   ['@id']    = id,
                                   ['@items'] = inventory.items,
                               })
        end
    end

    if type == 'item_money' then

        local money = xPlayer.getMoney()

        if count > money then
            TriggerClientEvent('esx:showNotification', _source, "~r~Invalid amount")
        else
            local result = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
                ['@id'] = id,
            })

            if #result > 0 then
                inventory = result[1].money

                inv       = json.decode(inventory)

                for k, v in pairs(inv) do
                    if v.name == item then
                        v.count = v.count + count
                        xPlayer.removeMoney(count)
                        found = true
                        break
                    end
                end

                if not found then
                    table.insert(inv, { name = item, count = count })
                    xPlayer.removeMoney(count)
                end

                found     = false

                inventory = {
                    money = json.encode(inv)
                }
            else
                inv             = {
                    {
                        name = item, count = count
                    }
                }
                inventory.money = json.encode(inv)
            end

            MySQL.Sync.execute("INSERT INTO `dumpsters` (`id`,`money`) VALUES(@id, @money) ON DUPLICATE KEY UPDATE `money` = @money",
                               {
                                   ['@id']    = id,
                                   ['@money'] = inventory.money,
                               })
        end

    end

    if type == 'item_account' then

        local money = xPlayer.getAccount(item).money

        if count > money then
            TriggerClientEvent('esx:showNotification', _source, "~r~Invalid amount")
        else
            local result = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
                ['@id'] = id,
            })

            if #result > 0 then
                inventory = result[1].money

                inv       = json.decode(inventory)

                for k, v in pairs(inv) do
                    if v.name == item then
                        v.count = v.count + count
                        xPlayer.removeAccountMoney(item, count)
                        found = true
                        break
                    end
                end

                if not found then
                    table.insert(inv, { name = item, count = count })
                    xPlayer.removeAccountMoney(item, count)
                end

                found     = false

                inventory = {
                    money = json.encode(inv)
                }
            else
                inv             = {
                    {
                        name = item, ammo = count
                    }
                }
                inventory.money = json.encode(inv)
            end

            MySQL.Sync.execute("INSERT INTO `dumpsters` (`id`,`money`) VALUES(@id, @money) ON DUPLICATE KEY UPDATE `money` = @money",
                               {
                                   ['@id']    = id,
                                   ['@money'] = inventory.money,
                               })
        end

    end

    if type == 'item_weapon' then
        local result = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
            ['@id']    = id,
            ['@owner'] = owner,
        })

        -- If there is already an inventory
        if #result > 0 then
            inventory = result[1].weapons

            inv       = json.decode(inventory)
            -- Go through every item and see if it already exists

            for k, v in pairs(inv) do
                if v.name == item then
                    if count <= v.ammo then
                        v.ammo = v.ammo + count
                        xPlayer.removeWeapon(item)
                        found = true

                        if v.ammo == 0 then
                            table.remove(inv, k)
                        end
                        break
                    else
                        TriggerClientEvent('esx:showNotification', _source, "~r~Invalid amount")
                    end
                end
            end

            if not found then
                local loadout, weapon = xPlayer.getWeapon(item)

                if xPlayer.loadout[loadout].ammo <= count then
                    table.insert(inv, { name = item, ammo = count, label = ESX.GetItemLabel(item) })
                    xPlayer.removeWeapon(item)
                else
                    TriggerClientEvent('esx:showNotification', _source, "~r~Invalid amount")
                end
            end

            found     = false

            inventory = {
                weapons = json.encode(inv)
            }
        else
            inv               = {
                {
                    name = item, ammo = count, label = ESX.GetWeaponLabel(item)
                }
            }

            inventory.weapons = json.encode(inv)
        end

        MySQL.Sync.execute("INSERT INTO `dumpsters` (`id`,`weapons`) VALUES(@id, @weapons) ON DUPLICATE KEY UPDATE `weapons` = @weapons",
                           {
                               ['@id']      = id,
                               ['@weapons'] = inventory.weapons,
                           })
    end
end)

RegisterServerEvent('tcrp_dirtydumpsters:getItem')
AddEventHandler('tcrp_dirtydumpsters:getItem', function(id, type, item, count)
--
    local _source   = source

    local inventory = {}

    local xPlayer   = ESX.GetPlayerFromId(source)

    if type == 'item_standard' then
        local result = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
            ['@id'] = id,
        })

        if #result > 0 then
            inventory = result[1].items

            inv       = json.decode(inventory)

            for k, v in pairs(inv) do
                if v.name == item then
                    local sourceItem = xPlayer.getInventoryItem(item)
                    local currentcount = sourceItem.count
                    if currentcount + count <= sourceItem.limit then
                        if count <= v.count then
                            v.count = v.count - count
                            xPlayer.addInventoryItem(item, count)
                            found = true

                            if v.count == 0 then
                                table.remove(inv, k)
                            end
                            break
                        else
                            TriggerClientEvent('esx:showNotification', _source, "~r~Invalid amount")
                        end
                    else
                        TriggerClientEvent('esx:showNotification', _source, "You can't carry anymore of those")
                    end
                end
            end

            found     = false

            inventory = {
                items = json.encode(inv)
            }
        else
            inventory = {
                items = json.encode({})
            }
        end

        MySQL.Sync.execute("INSERT INTO `dumpsters` (`id`,`items`) VALUES(@id, @items) ON DUPLICATE KEY UPDATE `items` = @items",
                           {
                               ['@id']    = id,
                               ['@items'] = inventory.items,
                           })
    end

    if type == 'item_money' then
        local result = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
            ['@id'] = id,
        })

        if #result > 0 then
            inventory = result[1].money

            inv       = json.decode(inventory)

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
                        TriggerClientEvent('esx:showNotification', _source, "~r~Invalid amount")
                    end
                end
            end

            found     = false

            inventory = {
                money = json.encode(inv)
            }
        else
            inventory = {
                money = json.encode({})
            }
        end

        MySQL.Sync.execute("INSERT INTO `dumpsters` (`id`,`money`) VALUES(@id, @money) ON DUPLICATE KEY UPDATE `money` = @money",
                           {
                               ['@id']    = id,
                               ['@money'] = inventory.money,
                           })

    end

    if type == 'item_account' then

        local result = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
            ['@id'] = id,
        })

        if #result > 0 then
            inventory = result[1].money

            inv       = json.decode(inventory)

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
                        TriggerClientEvent('esx:showNotification', _source, "~r~Invalid amount")
                    end
                end
            end

            found     = false

            inventory = {
                money = json.encode(inv)
            }
        else
            inventory = {
                money = json.encode({})
            }
        end

        MySQL.Sync.execute("INSERT INTO `dumpsters` (`id`,`money`) VALUES(@id, @money) ON DUPLICATE KEY UPDATE `money` = @money",
                           {
                               ['@id']    = id,
                               ['@money'] = inventory.money,
                           })

    end

    if type == 'item_weapon' then
        local result = MySQL.Sync.fetchAll('SELECT * FROM `dumpsters` WHERE `id` = @id', {
            ['@id'] = id,
        })

        if #result > 0 then
            inventory = result[1].weapons

            inv       = json.decode(inventory)

            for k, v in pairs(inv) do
                --if v.name == item then
                --if count <= v.ammo then
                xPlayer.addWeapon(item, v.ammo)
                v.ammo = 0
                found  = true

                if v.ammo == 0 then
                    table.remove(inv, k)
                end
                break
                --else
                --	TriggerClientEvent('esx:showNotification',_source,"~r~Invalid amount")
                --end
                --end
            end

            found     = false

            inventory = {
                weapons = json.encode(inv)
            }
        else
            inventory = {
                weapons = json.encode({})
            }
        end

        MySQL.Sync.execute("INSERT INTO `dumpsters` (`id`,`weapons`) VALUES(@id, @weapons) ON DUPLICATE KEY UPDATE `weapons` = @weapons",
                           {
                               ['@id']      = id,
                               ['@weapons'] = inventory.weapons,
                           })
    end
end)