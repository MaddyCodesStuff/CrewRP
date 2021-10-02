ESX             = nil
local ShopItems = {}
local hasSqlRun = false

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Load items
AddEventHandler('onMySQLReady', function()
    hasSqlRun = true
    LoadShop()
end)

-- extremely useful when restarting script mid-game
Citizen.CreateThread(function()
    Citizen.Wait(20000) -- hopefully enough for connection to the SQL server

    if not hasSqlRun then
        LoadShop()
        hasSqlRun = true
    end
end)

function LoadShop()
    local itemResult      = MySQL.Sync.fetchAll('SELECT * FROM items')
    local shopResult      = MySQL.Sync.fetchAll('SELECT * FROM shops')

    local itemInformation = {}
    for i = 1, #itemResult, 1 do
        if itemInformation[itemResult[i].name] == nil then
            itemInformation[itemResult[i].name] = {}
        end

        itemInformation[itemResult[i].name].label = itemResult[i].label
        itemInformation[itemResult[i].name].limit = itemResult[i].limit
    end

    for i = 1, #shopResult, 1 do
        if ShopItems[shopResult[i].store] == nil then
            ShopItems[shopResult[i].store] = {}
        end

        table.insert(ShopItems[shopResult[i].store], {
            label = itemInformation[shopResult[i].item].label,
            item  = shopResult[i].item,
            price = shopResult[i].price,
            limit = itemInformation[shopResult[i].item].limit
        })
    end
end

ESX.RegisterServerCallback('bar:requestDBItems', function(source, cb)
    if not hasSqlRun then
        TriggerClientEvent('esx:showNotification', source,
                           'The shop database has not been loaded yet, try again in a few moments.')
    end

    cb(ShopItems)
end)

RegisterServerEvent('bar:buyItem')
AddEventHandler('bar:buyItem', function(itemName, amount, zone)
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem(itemName)

    -- is the player trying to exploit?
    if amount < 0 then
        print('bar: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
        return
    end

    -- get price
    local price     = 0
    local itemLabel = ''
    for i = 1, #ShopItems[zone], 1 do
        if ShopItems[zone][i].item == itemName then
            price     = ShopItems[zone][i].price
            itemLabel = ShopItems[zone][i].label
            break
        end
    end
    price = price * amount

    -- can the player afford this item?
    if xPlayer.getMoney() >= price then
        -- can the player carry the said amount of x item?
        if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
            TriggerClientEvent('esx:showNotification', _source, _U('player_cannot_hold'))
        else
            xPlayer.removeMoney(price)
            xPlayer.addInventoryItem(itemName, amount)
            TriggerClientEvent('esx:showNotification', _source, _U('bought', amount, itemLabel, price))
        end
    else
        local missingMoney = price - xPlayer.getMoney()
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough', missingMoney))
    end
end)

--[[
    Usable bar items (except wine, see [esx]/esx_winery for those)
--]]
ESX.RegisterUsableItem('beer_1', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('beer_1', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.beer_1.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_amb_beer_bottle')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.beer_1.label)
end)

ESX.RegisterUsableItem('beer_2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('beer_2', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.beer_2.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_beer_blr')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.beer_2.label)
end)

ESX.RegisterUsableItem('beer_3', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('beer_3', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.beer_3.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_beer_pride')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.beer_3.label)
end)

ESX.RegisterUsableItem('bourbon', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bourbon', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.bourbon.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_cs_whiskey_bottle')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.bourbon.label)
end)

ESX.RegisterUsableItem('rye', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('rye', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.rye.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_bottle_richard')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.rye.label)
end)

ESX.RegisterUsableItem('scotch', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('scotch', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.scotch.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'ba_prop_battle_whiskey_bottle_s')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.scotch.label)
end)

ESX.RegisterUsableItem('tequila', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tequila', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.tequila.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_tequila_bottle')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.tequila.label .. ' - Drink of The Champs')
end)

ESX.RegisterUsableItem('moonshine', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('moonshine', 1)

    local randomNumber = math.random(1, 100);
    if randomNumber <= Config.Items.moonshine.poisonChance then
        TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.moonshine.drunk)
        TriggerClientEvent('esx_status:add', source, 'poison', Config.Items.moonshine.poison)
        TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_ceramic_jug_01')
        TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Jug of ' .. Config.Items.moonshine.label .. ' - And were Poisoned!')
    else
        TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.moonshine.drunk)
        TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_ceramic_jug_01')
        TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Jug of ' .. Config.Items.moonshine.label .. ' - That\'ll Put Some Hair on Your Chest' )
    end
end)

ESX.RegisterUsableItem('vodka', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('vodka', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.vodka.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_vodka_bottle')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.vodka.label)
end)

ESX.RegisterUsableItem('gin', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('gin', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.gin.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'ng_proc_brkbottle_02a')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.gin.label)
end)

ESX.RegisterUsableItem('martini', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('martini', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.martini.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_tequila')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a ' .. Config.Items.martini.label)
end)

ESX.RegisterUsableItem('shirley_temple', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('shirley_temple', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', Config.Items.shirley_temple.thirst)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_tequila')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a ' .. Config.Items.shirley_temple.label)
end)

ESX.RegisterUsableItem('margarita', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('margarita', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.margarita.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_tequila')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a ' .. Config.Items.margarita.label)
end)

ESX.RegisterUsableItem('grand_cru', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('grand_cru', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.grand_cru.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_ceramic_jug_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.grand_cru.label)
end)

ESX.RegisterUsableItem('rum', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('rum', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.rum.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_rum_bottle')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.rum.label)
end)

ESX.RegisterUsableItem('bloodymary', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bloodymary', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.bloodymary.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_tequila')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a ' .. Config.Items.bloodymary.label)
end)

ESX.RegisterUsableItem('darkale', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('darkale', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.darkale.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_amb_beer_bottle')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.darkale.label)
end)

ESX.RegisterUsableItem('paleale', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('paleale', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.paleale.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_amb_beer_bottle')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of ' .. Config.Items.paleale.label)
end)

ESX.RegisterUsableItem('tequi-la-sunrise', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tequi-la-sunrise', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', Config.Items.sunrise.drunk)
    TriggerClientEvent('esx_optionalneeds:onDrink', source, 'prop_amb_beer_bottle')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a ' .. Config.Items.sunrise.label)
end)