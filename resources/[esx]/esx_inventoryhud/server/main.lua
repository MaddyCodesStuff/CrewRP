ESX = nil

TriggerEvent(
    "esx:getSharedObject",
    function(obj)
        ESX = obj
    end
)

ESX.RegisterServerCallback(
    "esx_inventoryhud:getPlayerInventory",
    function(source, cb, target)
        local targetXPlayer = ESX.GetPlayerFromId(target)

        if targetXPlayer ~= nil then
            cb({ inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout })
        else
            cb(nil)
        end
    end
)
-- only putting this here because ls-radio and mumble-voip resources didnt wanna play nice and i didn't wanna lose my last will to live by messing with it, so here it stays
ESX.RegisterUsableItem('radio', function(source)
    TriggerClientEvent('ls-radio:use', source )
  end)
RegisterServerEvent("esx_inventoryhud:tradePlayerItem")
AddEventHandler(
    "esx_inventoryhud:tradePlayerItem",
    function(from, target, type, itemName, itemCount)
        local _source       = from

        local sourceXPlayer = ESX.GetPlayerFromId(_source)
        local targetXPlayer = ESX.GetPlayerFromId(target)

        if type == "item_standard" then
            local sourceItem = sourceXPlayer.getInventoryItem(itemName)
            local targetItem = targetXPlayer.getInventoryItem(itemName)

            if itemCount > 0 and sourceItem.count >= itemCount then
                if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
                else
                    sourceXPlayer.removeInventoryItem(itemName, itemCount)
                    targetXPlayer.addInventoryItem(itemName, itemCount)
                end
            end
        elseif type == "item_money" then
            if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
                sourceXPlayer.removeMoney(itemCount)
                targetXPlayer.addMoney(itemCount)
            end
        elseif type == "item_account" then
            if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
                sourceXPlayer.removeAccountMoney(itemName, itemCount)
                targetXPlayer.addAccountMoney(itemName, itemCount)
            end
        elseif type == "item_weapon" then
            if not targetXPlayer.hasWeapon(itemName) then
                sourceXPlayer.removeWeapon(itemName)
                targetXPlayer.addWeapon(itemName, itemCount)
            end
        end
    end
)

function getCharacterName(serverID)
    local xPlayer = ESX.GetPlayerFromId(serverID)

    if xPlayer then
        local result    = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
            ['@identifier'] = xPlayer.identifier
        })

        local firstname = result[1].firstname
        local lastname  = result[1].lastname

        return { first = firstname, last = lastname }
    end
end

ESX.RegisterServerCallback("esx_inventoryhud:getCharacterNames", function(source, cb, players)
    local elements = {}

    for i = 1, #players, 1 do
        local name = getCharacterName(players[i])
        table.insert(
            elements,
            {
                label  = name.first .. " " .. name.last,
                player = players[i]
            }
        )
    end

    sPlayer = getCharacterName(source)
    cb(elements, sPlayer)
end)

RegisterCommand(
    "openinventory",
    function(source, args, rawCommand)
        if IsPlayerAceAllowed(source, "inventory.openinventory") then
            local target        = tonumber(args[1])
            local targetXPlayer = ESX.GetPlayerFromId(target)

            if targetXPlayer ~= nil then
                TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
            else
                TriggerClientEvent("chatMessage", source, "^1" .. _U("no_player"))
            end
        else
            TriggerClientEvent("chatMessage", source, "^1" .. _U("no_permissions"))
        end
    end
)
