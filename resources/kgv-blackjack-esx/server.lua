ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function SetExports()
    exports["kgv-blackjack"]:SetGetChipsCallback(function(source)
        local cash = 0
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer ~= nil then
            cash = xPlayer.getMoney()
        end

        return cash or 0
    end)

    exports["kgv-blackjack"]:SetTakeChipsCallback(function(source, amount)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer ~= nil then
            xPlayer.removeMoney(amount)
        end
    end)

    exports["kgv-blackjack"]:SetGiveChipsCallback(function(source, amount)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer ~= nil then
            xPlayer.addMoney(amount)
        end
    end)
end

AddEventHandler("onResourceStart", function(resourceName)
	if ("kgv-blackjack" == resourceName) then
        Citizen.Wait(1000)
        SetExports()
    end
end)

SetExports()