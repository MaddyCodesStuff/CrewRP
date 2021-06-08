ESX               = nil
local ItemsLabels = {}

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('esx_SodaMachine:buyItem')
AddEventHandler('esx_SodaMachine:buyItem', function(itemName, price)
    local _source    = source
    local xPlayer    = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem(itemName)

    if price < 0 then
        print('esx_SodaMachine: ' .. xPlayer.identifier .. ' attempted to cheat money!')
        return
    end

    if xPlayer.getMoney() >= price then
        if itemName == 'coffee' then
            TriggerClientEvent('esx_SodaMachine:Coffee', source)
        elseif itemName == 'water' then
            TriggerClientEvent('esx_SodaMachine:Water', source)
        else
            TriggerClientEvent('esx_SodaMachine:Random', source)
        end
    else
        local missingMoney = price - xPlayer.getMoney()
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough', missingMoney))
    end

end)

RegisterServerEvent('esx_SodaMachine:TakeMoney')
AddEventHandler('esx_SodaMachine:TakeMoney', function(price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeMoney(price)
end)

RegisterServerEvent('esx_SodaMachine:DrankProduct')
AddEventHandler('esx_SodaMachine:DrankProduct', function()
    local _source = source
    TriggerClientEvent('esx_status:add', _source, 'thirst', 100000)
end)