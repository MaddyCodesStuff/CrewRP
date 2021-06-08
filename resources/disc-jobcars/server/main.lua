ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback("disc-jobcars:getJobCars", function(source, cb)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM job_cars WHERE owner = @owner and job = @job',
                         {
                             ['@owner'] = player.identifier,
                             ['@job']   = player.job.name
                         },
                         function(results)
                             cb(results)
                         end)
end)

ESX.RegisterServerCallback("disc-jobcars:getClaimableCars", function(source, cb)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM job_cars WHERE owner = @owner and `stored` = false and job = @job',
                         {
                             ['@owner'] = player.identifier,
                             ['@job']   = player.job.name
                         },
                         function(results)
                             cb(results)
                         end)
end)

ESX.RegisterServerCallback("disc-jobcars:canBuyCar", function(source, cb, car)
    local player = ESX.GetPlayerFromId(source)
    if player.getMoney() >= car.price then
        player.removeMoney(car.price)
        cb(1)
    else
        cb(0)
    end
end)

RegisterServerEvent('disc-jobcars:buyCar')
AddEventHandler("disc-jobcars:buyCar", function(car, props, plate)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('INSERT INTO job_cars (model, owner, props, `stored`, plate, job) VALUES (@model, @owner, @props, 1, @plate, @job)',
                        {
                            ['@model'] = car.model,
                            ['@owner'] = player.identifier,
                            ['@props'] = json.encode(props),
                            ['@plate'] = plate,
                            ['@job']   = player.job.name
                        })
end)

RegisterServerEvent('disc-jobcars:ReturnCar')
AddEventHandler("disc-jobcars:ReturnCar", function(plate)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('DELETE FROM job_cars WHERE plate = @plate',
                        {
                            ['@plate'] = plate
                        })
end)

RegisterServerEvent('disc-jobcars:spawnCar')
AddEventHandler("disc-jobcars:spawnCar", function(plate)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE job_cars SET `stored` = 0 WHERE plate = @plate and owner = @owner', {
        ['@plate'] = plate,
        ['@owner'] = player.identifier
    })
end)

RegisterServerEvent('disc-jobcars:payClaim')
AddEventHandler("disc-jobcars:payClaim", function()
    local player = ESX.GetPlayerFromId(source)
    player.removeMoney(Config.ClaimPrice)
end)

RegisterServerEvent('disc-jobcars:storeCar')
AddEventHandler("disc-jobcars:storeCar", function(plate)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE job_cars SET `stored` = 1 WHERE plate = @plate and owner = @owner', {
        ['@plate'] = plate,
        ['@owner'] = player.identifier
    })
end)

RegisterServerEvent('disc-jobcars:getAllAvailableVehicles')
AddEventHandler('disc-jobcars:getAllAvailableVehicles', function(cb)
    local vehicles = {}
    local availableVehicles = {Config.PDCars, Config.FDCars, Config.MDCars, 
                               Config.PDBoats, Config.FDBoats, Config.MDBoats,
                               Config.PDAir, Config.FDAir, Config.MDAir, Config.FDLSIA,
                               Config.DOCCars, Config.ParkRangerCars}
    for i = 1, #availableVehicles, 1 do
        for rank, veh in pairs(availableVehicles[i]) do
            table.insert(vehicles, veh)
        end
    end

    cb(vehicles)
end)

ESX.RegisterServerCallback("disc-jobcars:storeNearbyJobCar", function(source, cb, nearbyVehicles)
    local player = ESX.GetPlayerFromId(source)
    local foundPlate, foundNum, foundProps

    for k, v in ipairs(nearbyVehicles) do
        local result = MySQL.Sync.fetchAll('SELECT plate FROM job_cars WHERE owner = @owner AND plate = @plate', {
            ['@owner'] = player.identifier,
            ['@plate'] = v.plate,
        })

        if result[1] then
            foundPlate, foundNum, foundProps = result[1].plate, k, v.props
            break
        end
    end

    if not foundPlate then
        cb(false)
    else
        MySQL.Async.execute('UPDATE job_cars SET `stored` = true, locked = true, `props` = @props WHERE owner = @owner AND plate = @plate',
                            {
                                ['@owner'] = player.identifier,
                                ['@plate'] = foundPlate,
                                ['@props'] = json.encode(foundProps)
                            }, function(rowsChanged)
                if rowsChanged == 0 then
                    cb(false)
                else
                    cb(true, foundNum)
                end
            end)
    end
end)