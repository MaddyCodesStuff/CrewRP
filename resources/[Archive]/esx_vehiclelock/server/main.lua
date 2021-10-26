ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback('esx_vehiclelock:requestPlayerCars', function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE owner = @owner AND plate = @plate UNION SELECT 1 FROM job_cars WHERE owner = @owner AND plate = @plate',
                         {
                             ['@owner'] = xPlayer.identifier,
                             ['@plate'] = plate
                         }, function(result)
            cb(result[1] ~= nil)
        end)
end)

RegisterServerEvent('esx_vehiclelock:toggleLock')
AddEventHandler('esx_vehiclelock:toggleLock', function(plate, status)
    MySQL.Async.execute('UPDATE `owned_vehicles` SET locked = @status WHERE plate = @plate', {
        ['@status'] = tonumber(status),
        ['@plate']  = plate
    })
    MySQL.Async.execute('UPDATE `job_cars` SET locked = @status WHERE plate = @plate', {
        ['@status'] = tonumber(status),
        ['@plate']  = plate
    })
end)

ESX.RegisterServerCallback('esx_vehiclelock:getLockStatus', function(source, cb, plate)
    MySQL.Async.fetchAll('SELECT locked FROM owned_vehicles WHERE plate = @plate UNION SELECT locked FROM job_cars WHERE plate = @plate',
                         {
                             ['@plate'] = plate
                         }, function(result)
            if result[1] ~= nil then
                cb(result[1]["locked"] == 1)
            else
                cb(nil)
            end
        end)
end)