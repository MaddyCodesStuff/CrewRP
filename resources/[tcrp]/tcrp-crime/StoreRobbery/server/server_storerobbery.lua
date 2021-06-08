ESX = nil

TriggerEvent(
    "esx:getSharedObject",
    function(obj)
        ESX = obj
    end
)

ESX.RegisterUsableItem('lockpick', function(source)
        TriggerClientEvent('tcrp-crime:handleLockpick', source)
end)

RegisterServerEvent('tcrp-crime:registerSuccess')
AddEventHandler('tcrp-crime:registerSuccess', function(store)
    _source = source
    local payout = math.random(Config.StorePayout.register.min, Config.StorePayout.register.max)
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addMoney(payout)
    TriggerClientEvent('tcrp:displayGeneral', source, "Success made out with $" .. payout .. "! hit safe too will figure out how to phrase better later")
    TriggerClientEvent('tcrp-crime:SafeToggle', source, store)
    


end)

RegisterServerEvent('tcrp-crime:safeSuccess')
AddEventHandler('tcrp-crime:safeSuccess', function(store)
    _source = source
    player = ESX.GetPlayerFromId(_source)

    loot = {}
    HighValueDrops(loot)
    MedValueDrops(loot)
    for k,v in pairs(loot) do
        print(v)
        player.addInventoryItem(v, 1)
    end
    CashDrop(_source)

    


end)
function HighValueDrops(loot)
    local roll = math.random()
    local lastChance = 0

    for k, v in pairs(Config.StorePayout.lootpool.HighValueItems) do
        if roll > v.dropchance + lastChance then
            table.insert(loot, v.name)
        end
        lastChance = v.dropchance + lastChance
    end
end
function MedValueDrops(loot)
    local roll = math.random()
    local lastChance = 0
    local dropsleft = Config.MediumValueItemDrops
    while dropsleft >= 0 do

        for k, v in pairs(Config.StorePayout.lootpool.MediumValueItems) do
            if roll > v.dropchance + lastChance then
               table.insert(loot, v.name)
                dropsleft = dropsleft - 1
            end
            lastChance = v.dropchance + lastChance
        end
    end
end
function CashDrop(player) 
    local payout = math.random(Config.StorePayout.safe.min, Config.StorePayout.safe.max)
    player = ESX.GetPlayerFromId(player)
    player.addMoney(payout)
end