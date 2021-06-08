ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Do the stuff here to generate the items from smelting
RegisterServerEvent('esx_miningjob:smelt')
AddEventHandler('esx_miningjob:smelt', function()
    local _src         = source
    local xPlayer      = ESX.GetPlayerFromId(_src)

    local level        = GetProficiencyLevel(xPlayer.identifier, 'mining')
    local source       = _src

    local smeltingItem = xPlayer.getInventoryItem(Config.Smelting.item)
    if smeltingItem.count < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Not enough ~y~' .. smeltingItem.label)
    else
        local fail = math.random(1, 100)

        failChance = Config.MiningFailChance - (level * Config.LevelChanceBonus)

        if failChance < 0 then
            failChance = 0
        end

        -- We have a chance of failure here
        if fail > failChance then
            -- Generate an item
            for k, v in pairs(Config.SmeltingMinerals) do
                local random = math.random(1, 100)

                if random <= v.chance then
                    local targetItem = xPlayer.getInventoryItem(v.name)

                    local count      = math.random(v.maximum)
                    local count      = count + (level * v.bonus)
                    local newCount   = targetItem.count + count

                    -- Item was generated. Move on. Let's see if they can carry the item, first
                    if targetItem.limit ~= -1 and newCount > targetItem.limit then
                        xPlayer.addInventoryItem(v.name, targetItem.limit)
                        xPlayer.removeInventoryItem(smeltingItem.name, 1)
                        TriggerClientEvent('esx:showNotification', source,
                                           "Cannot carry anymore ~g~" .. targetItem.label)
                    else
                        xPlayer.removeInventoryItem(smeltingItem.name, 1)
                        xPlayer.addInventoryItem(v.name, newCount)
                        TriggerClientEvent('esx:showNotification', source,
                                           'Obtained ~g~' .. xPlayer.getInventoryItem(v.name).label)
                        break
                    end
                end
            end
        else
            TriggerClientEvent('esx:showNotification', source, 'The smelting process produced no useful materials.')
            xPlayer.removeInventoryItem(smeltingItem.name, 1)
        end
    end
end)

function GetProficiencyLevel(source, proficiency)
    local result = MySQL.Sync.fetchAll('SELECT * FROM `characters_proficiencies_xp` WHERE `owner` = @identifier AND `proficiency` = @proficiency',
                                       {
                                           ['@identifier']  = source,
                                           ['@proficiency'] = proficiency,
                                       })

    -- return 0
    if #result > 0 then
        return result[1].level
    else
        return 0
    end
end

RegisterServerEvent('esx_miningjob:giveItems')
AddEventHandler('esx_miningjob:giveItems', function()
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    level         = GetProficiencyLevel(xPlayer.identifier, 'mining')

    local source  = _src

    local random  = math.random(1, 100)

    local fail    = math.random(1, 100)

    failChance    = Config.MiningFailChance - (level * Config.LevelChanceBonus)

    if failChance < 0 then
        failChance = 0
    end

    if fail > failChance then

        for k, v in ipairs(Config.MiningMinerals) do
            local random     = math.random(1, 100)

            local targetItem = xPlayer.getInventoryItem(v.name)

            if random <= v.chance then
                -- Item was received, let's make sure they can hold it

                local count    = math.random(v.maximum)
                local count    = count + (level * v.bonus)
                local newCount = targetItem.count + count

                -- If over the limit, give exactly the amount to reach their limit
                if targetItem.limit ~= -1 and newCount > targetItem.limit then
                    TriggerClientEvent('esx:showNotification', source, "Cannot carry anymore ~g~" .. targetItem.label)
                else
                    xPlayer.addInventoryItem(v.name, count)
                    TriggerClientEvent('esx:showNotification', source,
                                       "Received ~g~" .. count .. " ~w~" .. targetItem.label)
                end
            end
        end
    else
        TriggerClientEvent('esx:showNotification', source, "The rock had no ore")
    end
end)

-- Moved to the smelter
-- for k,v in ipairs(Config.Minerals) do
-- 		local random = math.random(1,100)

-- 		local targetItem = xPlayer.getInventoryItem(v.name)

-- 		if random <= v.chance then
-- 			-- Item was received, let's make sure they can hold it

-- 			local count = math.random(v.maximum)
-- 			local newCount = targetItem.count + count

-- 			if targetItem.limit ~= -1 and newCount > targetItem.limit then
-- 				TriggerClientEvent('esx:showNotification',source,"Cannot carry anymore ~g~".. targetItem.label)
-- 			else
-- 				xPlayer.addInventoryItem(v.name, count)
-- 				TriggerClientEvent('esx:showNotification',source,"Received ~g~".. count .. " ~w~".. targetItem.label)
-- 			end
-- 		end
-- 	end

ESX.RegisterServerCallback('esx_miningjob:getProficiencyLevel', function(source, cb)
    local _src    = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    level         = GetProficiencyLevel(xPlayer.identifier, 'mining')
    local source  = src

    cb(level)
end)

ESX.RegisterServerCallback('esx_miningjob:checkItem', function(source, cb, item)
    local _src     = source
    local xPlayer  = ESX.GetPlayerFromId(_src)
    local hasItem  = false

    local testItem = xPlayer.getInventoryItem(item)
    local count    = testItem.count

    if count > 0 then
        hasItem = true
    else
        hasItem = false
    end

    cb(hasItem)
end)

ESX.RegisterUsableItem('jackhammer', function(source)
    TriggerClientEvent('esx_miningjob:jackhammer', source)
end)

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end