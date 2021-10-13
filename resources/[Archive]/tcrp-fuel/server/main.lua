-- ESX crap
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Network sync vehicle fuel level
RegisterNetEvent('tcrp-fuel:setFuel')
AddEventHandler('tcrp-fuel:setFuel', function(vehicle, fuel)
    TriggerClientEvent('tcrp-fuel:setFuel', -1, vehicle, fuel)
end)

-- Pay for fueling & set vehicle fuel level
RegisterNetEvent('tcrp-fuel:finishedFueling')
AddEventHandler('tcrp-fuel:finishedFueling', function(vehicle, fuel, cost)
    local xPlayer = ESX.GetPlayerFromId(source)
    local paid = chargeMoney(xPlayer, cost)

    if paid then
        TriggerEvent('tcrp-fuel:setFuel', vehicle, fuel)
        TriggerClientEvent('tcrp:displayGeneral', source, string.format("Paid $%.2f for fuel", cost))
    end
end)

-- Buy a jerry can
RegisterNetEvent('tcrp-fuel:buyJerryCan')
AddEventHandler('tcrp-fuel:buyJerryCan', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer.hasWeapon('WEAPON_PETROLCAN') and chargeMoney(xPlayer, Config.Prices.jerrycan) then
        xPlayer.addWeapon('WEAPON_PETROLCAN', 0)
        TriggerClientEvent('tcrp:displayGeneral', source, string.format("Purchased a jerry can for $%.2f", Config.Prices.jerrycan))
    end
end)

-- Take money from player
function chargeMoney(xPlayer, cost)
    cost = math.ceil(cost)

    if xPlayer.getMoney() >= cost then
        xPlayer.removeMoney(cost)
        return true
    elseif xPlayer.getBank() >= cost then
        xPlayer.removeBank(cost)
        return true
    end

    return false
end