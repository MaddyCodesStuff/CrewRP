ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

AddEventHandler('esx:playerLoaded', function(source)
    local _source = source
    local xPlayer = nil
    while not xPlayer do
        xPlayer = ESX.GetPlayerFromId(_source)
    end

    MySQL.Async.fetchAll(
        'SELECT * FROM healtharmour WHERE player = @player',
        {
            ['@player'] = xPlayer.identifier
        },
        function(result)
            if result[1] then
                TriggerClientEvent('esx_healtharmour:setHealth', _source, result[1].health)
                TriggerClientEvent('esx_healtharmour:setArmour', _source, result[1].armour)
            else
                MySQL.Async.execute(
                    'INSERT INTO healtharmour (`health`, `armour`, `player`) VALUES (@health, @armour, @player)',
                    {
                        ['@health'] = "200",
                        ['@armour'] = "0",
                        ['@player'] = xPlayer.identifier
                    }
                )
                TriggerClientEvent('esx_healtharmour:setHealth', _source, 200)
                TriggerClientEvent('esx_healtharmour:setArmour', _source, 0)
            end
        end
    )
end)

function setLevels(source, health, armour)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then

        MySQL.Async.execute(
            'UPDATE healtharmour SET `health` = @health, `armour` = @armour WHERE `player` = @player',
            {
                ['@health'] = health,
                ['@armour'] = armour,
                ['@player'] = xPlayer.identifier
            }
        )

        if health == 0 then
            TriggerClientEvent('esx_status:clearDrugs', _source)
        end
    end
end

RegisterServerEvent('esx_healtharmour:setLevels')
AddEventHandler('esx_healtharmour:setLevels', function(health, armour)
    setLevels(source, health, armour)
end)