ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)
local Vehicles = nil

RegisterServerEvent('esx_lscustom:buyMod')
AddEventHandler('esx_lscustom:buyMod', function(price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    price         = tonumber(price)
    if price > xPlayer.getMoney() then
        TriggerClientEvent('esx_lscustom:cancelInstallMod', _source)
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
    else
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx_lscustom:installMod', _source)
        TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
    end
end)

RegisterServerEvent('esx_lscustom:refreshOwnedVehicle')
AddEventHandler('esx_lscustom:refreshOwnedVehicle', function(myCar)

    MySQL.Async.execute(
        'UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `vehicle` LIKE "%' .. myCar['plate'] .. '%"',
        {
            ['@vehicle'] = json.encode(myCar)
        }
    )
end)

ESX.RegisterServerCallback('esx_lscustom:getVehiclesPrices', function(source, cb)

    if Vehicles == nil then
        MySQL.Async.fetchAll(
            'SELECT `model`, `price` FROM `vehicles`',
            {},
            function(result)
                local vehicles = {}
                for i = 1, #result, 1 do
                    table.insert(vehicles, {
                        model = result[i].model,
                        price = result[i].price
                    })
                end
                TriggerEvent('disc-jobcars:getAllAvailableVehicles', function(emergVehicles)
                    for j = 1, #emergVehicles, 1 do
                        for i = 1, #emergVehicles[j], 1 do
                            table.insert(vehicles, {
                                model = emergVehicles[j][i].model,
                                price = emergVehicles[j][i].price
                            })
                        end
                    end
                end)
                Vehicles = vehicles
                cb(Vehicles)
            end
        )
    else
        cb(Vehicles)
    end
end)

RegisterServerEvent('esx_lscustom:checkEntrance')
AddEventHandler('esx_lscustom:checkEntrance', function(shop)
    local _src = source

    if Config.Zones[shop].locked then
        TriggerClientEvent('esx:showNotification', _src, "This garage is in use right now.")
    else
        TriggerClientEvent('esx_lscustom:doEntrance', _src, shop)
        Config.Zones[shop].locked = true
        print("Locking garage")
    end
end)

RegisterServerEvent('esx_lscustom:openGarage')
AddEventHandler('esx_lscustom:openGarage', function(shop)
    Config.Zones[shop].locked = false
    print("Unlocking garage")
end)