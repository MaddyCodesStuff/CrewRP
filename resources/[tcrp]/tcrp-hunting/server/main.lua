ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.debug then
    RegisterCommand('spawnanimals', function(source, args)
        TriggerClientEvent('tcrp-hunting:spawnAnimals', source, args[1])
    end)
end

RegisterServerEvent('tcrp-hunting:reward')
AddEventHandler('tcrp-hunting:reward', function(playerCoords)
    local source   = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if xPlayer.getInventoryItem('leather').count >= 30 then
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You cannot carry anymore leather!')
    else
        xPlayer.addInventoryItem('leather', math.random(3, 10))
    end

    if xPlayer.getInventoryItem('meat').count >= 15 then
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You cannot carry anymore meat!')
    else
        xPlayer.addInventoryItem('meat', math.random(1, 4))
    end 

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer and xPlayer.job and xPlayer.job.name == 'police' or xPlayer.job.name == 'parkranger' then
            local blip = {["x"] = playerCoords.x, ["y"] = playerCoords.y, ["z"] = playerCoords.z, ["longrange"] = true, ["text"] = "Hunting", ["sprite"] = 141, ["color"] = 1, ["scale"] = 1.2, ["duration"] = 60}
            TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                               { text = 'Local Game Warden: Hunting Reported Near This Location'})
            TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
            --TriggerClientEvent('esx_blips:setBlipOnCoord', xPlayers[i], playerCoords, 60, 1, true, 2.0, 141)

        end
    end       
end)

RegisterServerEvent('tcrp-hunting:sell')
AddEventHandler('tcrp-hunting:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local MeatPrice = 50
    local LeatherPrice = 25

    local MeatQuantity = xPlayer.getInventoryItem('meat').count
    local LeatherQuantity = xPlayer.getInventoryItem('leather').count

    if MeatQuantity > 0 or LeatherQuantity > 0 then
        xPlayer.addMoney(MeatQuantity * MeatPrice)
        xPlayer.addMoney(LeatherQuantity * LeatherPrice)

        xPlayer.removeInventoryItem('meat', MeatQuantity)
        xPlayer.removeInventoryItem('leather', LeatherQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. LeatherQuantity + MeatQuantity .. ' and earned $' .. LeatherPrice * LeatherQuantity + MeatPrice * MeatQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have any meat or leather.')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end