
RegisterServerEvent('getRegisterFromPlate')
AddEventHandler('getRegisterFromPlate', function(plate)
    local _source = source
    
    local owner 
    local ownerFirst
    local ownerLast

    local result    = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE plate = @plate", {
        ['@plate'] = plate
    })

    local owner = result[1].owner
    local result2    = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
        ['@identifier'] = owner
    })

    local firstname = result2[1].firstname
    local lastname  = result2[1].lastname
    local vehicle   = result[1].vehicle
    local args = {
        veh = vehicle,
        first = firstname,
        last = lastname,
        vehplate = result[1].plate

    }
    TriggerClientEvent('tcrp_vehiclereg:notify', _source, args)

end)