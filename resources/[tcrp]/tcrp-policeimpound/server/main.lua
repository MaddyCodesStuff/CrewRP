-- ESX junk
ESX  = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end
end)

-- Return a character name from a player's steam ID
function getCharacterName(identifier)
    local result    = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    })

    local firstname = result[1].firstname
    local lastname  = result[1].lastname

    return { first = firstname, last = lastname }
end

-- Add vehicle to impound
function addVehicle(source, vehicle, plate)
    MySQL.Async.fetchAll(
        "SELECT * FROM owned_vehicles WHERE plate = @plate",
        {
            ['@plate'] = plate,
        }, function(result)
            if #result >= 1 then
                local vehicleData = result[1]
                MySQL.Async.execute([[
                    INSERT INTO police_impound (plate, previous_owner, vehicle, type) VALUES (
                        @plate, @owner, @vehicle, @type
                    )
                ]], {
                    ['@plate'] = vehicleData.plate,
                    ['@owner'] = vehicleData.owner,
                    ['@vehicle'] = vehicleData.vehicle,
                    ['@type'] = vehicleData.type,
                }, function(rowsChanged)
                    if rowsChanged > 0 then -- Only remove from garage once we've inserted it
                        MySQL.Async.execute(
                            "DELETE FROM owned_vehicles WHERE plate = @plate", {
                                ['@plate'] = plate,
                            }, function(_)
                                TriggerClientEvent('tcrp-policeimpound:deleteVehicle', source, vehicle)
                            end
                        )
                    end
                end)
            else
                TriggerClientEvent('tcrp:displayGeneral', source, "Cannot impound a local vehicle.")
            end
        end
    )
end

-- Retreive vehicle from impound
function getVehicle(plate)
    local vehicle = MySQL.Sync.fetchAll(
        "SELECT * FROM police_impound WHERE plate = @plate",
        {
            ['@plate'] = plate
        }
    )

    if #vehicle > 0 then
        vehicle = vehicle[1]
        vehicle.vehicle = json.decode(vehicle.vehicle)
        return vehicle
    end

    return nil
end

-- Get list of vehicles in impound
function getVehicles()
    local vehicles = MySQL.Sync.fetchAll("SELECT * FROM police_impound")
    for _, vehicleData in ipairs(vehicles) do
        vehicleData.vehicle = json.decode(vehicleData.vehicle)
    end
    return vehicles
end

-- Remove a vehicle from the impound lot
function removeVehicle(plate)
    MySQL.Async.execute(
        "DELETE FROM police_impound WHERE plate = @plate", {
            ['@plate'] = plate,
        }, function (rowsChanged) end
    )
end

-- Register a vehicle
function registerVehicle(plate, vehicleData, owner)
    local rowsChanged = MySQL.Sync.execute(
        "INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)", {
            ['@owner']   = owner,
            ['@plate']   = plate,
            ['@vehicle'] = json.encode(vehicleData),
        }
    )
    return (rowsChanged > 0)
end

-- Net Events
RegisterNetEvent('tcrp-policeimpound:impoundVehicle')
AddEventHandler('tcrp-policeimpound:impoundVehicle', function(vehicle, plate)
    addVehicle(source, vehicle, plate)
end)

RegisterNetEvent('tcrp-policeimpound:retreiveVehicle')
AddEventHandler('tcrp-policeimpound:retreiveVehicle', function(plate, notifyPolice)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source) -- ESX
    local vehicle = getVehicle(plate)
    local registered = false

    if vehicle then
        registered = registerVehicle(plate, vehicle.vehicle, xPlayer.identifier)
        if registered then
            TriggerClientEvent('tcrp-policeimpound:spawnVehicle', _source, vehicle)
            TriggerClientEvent('tcrp:displayGeneral', _source, "Vehicle has been registered to you.")
            removeVehicle(plate)
            if notifyPolice then
                TriggerEvent('tcrp-policeimpound:resetHack') -- Relock the computer
                TriggerClientEvent('tcrp-policeimpound:alertPolice', -1, "A vehicle has been removed from the impound lot.") -- Notify police
            end
        end
    end
    if vehicle == nil or not registered then
        TriggerClientEvent('tcrp:displayGeneral', _source, "Couldn't register vehicle.")
    end
end)

RegisterNetEvent('tcrp-policeimpound:retreiveLocalVehicle')
AddEventHandler('tcrp-policeimpound:retreiveLocalVehicle', function(vehicle, notifyPolice)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source) -- ESX
    local registered = registerVehicle(vehicle.plate, vehicle.vehicle, xPlayer.identifier)

    if registered then
        TriggerClientEvent('tcrp-policeimpound:spawnVehicle', _source, vehicle)
        TriggerClientEvent('tcrp:displayGeneral', _source, "Vehicle has been registered to you.")
        if notifyPolice then
            TriggerEvent('tcrp-policeimpound:resetHack') -- Relock the computer
            TriggerClientEvent('tcrp-policeimpound:alertPolice', -1, "A vehicle has been removed from the impound lot.") -- Notify police
        end
    else
        TriggerClientEvent('tcrp:displayGeneral', _source, "Couldn't register vehicle.")
    end
end)

RegisterNetEvent('tcrp-policeimpound:getVehicles')
AddEventHandler('tcrp-policeimpound:getVehicles', function(cb)
    cb(getVehicles())
end)

RegisterNetEvent('tcrp-policeimpound:removeVehicle')
AddEventHandler('tcrp-policeimpound:removeVehicle', function(plate)
    removeVehicle(plate)
end)