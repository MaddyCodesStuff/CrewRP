ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)
			
RegisterNetEvent('mining:smelt')
AddEventHandler('mining:smelt', function()
	local _source = source
	local item
    local label
    local amount
	local rnd = math.random(1,100)
	--rnd = 85 --for testing
	local xPlayer = ESX.GetPlayerFromId(_source)
    local smeltingItem = xPlayer.getInventoryItem(Config.Smelting.item)

    if smeltingItem.count < 1 then
        TriggerClientEvent('esx:showNotification', _source, 'Not enough ' .. smeltingItem.label)
    else
        if rnd < 51 then
            item = "copper"
            label = "Copper"
            amount = math.random(10, 20)
        elseif rnd > 50 and rnd < 81 then
            item = "iron"
            label = "Iron"
            amount = math.random(5, 10)
        elseif rnd > 80 and rnd < 96 then
            item = "gold"
            label = "Gold"
            amount = math.random(1, 5)
        else
            item = "diamond"
            label = "diamond"
            amount = 1
        end

        local inventoryItem = xPlayer.getInventoryItem(item)

		if (inventoryItem.count) >= inventoryItem.limit then
			TriggerClientEvent('esx:showNotification', _source, "You can't hold anymore " .. label)
        else
            xPlayer.addInventoryItem(item, amount)
            xPlayer.removeInventoryItem(smeltingItem.name, 1)
            TriggerClientEvent('esx:showNotification', _source, 'Obtained ' .. amount .." ".. label)
        end
    end
end)

--To Be Used for Future QTE
RegisterNetEvent('mining:shiny')
AddEventHandler('mining:shiny', function()
	local _source = source
	local item
    local label
    local amount
	local rnd = math.random(1,100)
	--rnd = 85 --for testing
	local xPlayer = ESX.GetPlayerFromId(_source)

    if rnd < 21 then
        item = "gold"
        label = "Gold"
        amount = 1
    elseif rnd > 20 and rnd < 31 then
        item = "diamond"
        label = "Diamond"
        amount = 1
    else
        amount = 0
    end

    if amount == 0 then     
        TriggerClientEvent('esx:showNotification', _source, "It was just a bug...gross.")
    else
        local inventoryItem = xPlayer.getInventoryItem(item)

        if (inventoryItem.count) >= inventoryItem.limit then
            TriggerClientEvent('esx:showNotification', _source, "You can't hold anymore " .. label)
        else
            xPlayer.addInventoryItem(item, amount)
            xPlayer.removeInventoryItem(smeltingItem.name, 1)
            TriggerClientEvent('esx:showNotification', _source, 'Obtained ' .. amount .." ".. label)
        end
    end
end)

RegisterServerEvent('mining:giveItems')
AddEventHandler('mining:giveItems', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = "washed_stone"
    local label = "Mineral Ore"
    local inventoryItem = xPlayer.getInventoryItem(item)

    if (inventoryItem.count) >= inventoryItem.limit then
        TriggerClientEvent('esx:showNotification', _source, "You can't hold anymore " .. label)
    else
        xPlayer.addInventoryItem(item, 2)
        xPlayer.addInventoryItem("clay", 1)
        TriggerClientEvent('esx:showNotification', _source,
                                    'Obtained ' .. label)
    end
end)

ESX.RegisterServerCallback('mining:checkItem', function(source, cb, item)
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
    TriggerClientEvent('mining:jackhammer', source)
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


RegisterServerEvent('mining:startSelling')
AddEventHandler('mining:startSelling', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local types = {"copper", "iron", "gold", "diamond"}
	for i = 1, #types do
		local type = types[i]
		local quantity = xPlayer.getInventoryItem(type).count
		if quantity >= 1 then
			local payment = Config.prices[type] * quantity
			xPlayer.addMoney(payment)
			xPlayer.removeInventoryItem(type, quantity)
			TriggerClientEvent('esx:showNotification', source, 'You sold ' .. quantity .. ' ' .. type .. ' for $' .. payment)	
		end
	end
end)