ESX  = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end
end)

local activeVespucciHeist = false
local activeUPowerHeist = false
local activeLPowerHeist = false
--local activeHeist = false

function copsRequired()
    local xPlayers = ESX.GetPlayers()
    local cops = 0
    for _, player in ipairs(xPlayers) do
        local xPlayer = ESX.GetPlayerFromId(player)
        local job = xPlayer.getJob()
        if job.name == 'police' then
            cops = cops + 1
        end
    end
    return (cops >= Config.CopsRequired)
end

RegisterNetEvent('constructionHeist:scavenge')
AddEventHandler('constructionHeist:scavenge', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    
    for k, v in pairs(Config.guarenteedItems) do
        local randomCount = math.random(v.min, v.max)
        local inventoryItem = xPlayer.getInventoryItem(k)
        
        if inventoryItem.count <= inventoryItem.limit then
            xPlayer.addInventoryItem(k, randomCount)
        else
            TriggerClientEvent('tcrp:displayGeneral', source, "Cannot Hold Anymore " .. k)
        end
    end
    local itemNumber = math.random(1, 35)
    for k, v in pairs(Config.chanceItems) do
        local randomCount = math.random(v.min, v.max)
        
        if itemNumber == v.itemNumber then
            if string.match(string.lower(k), "weapon_") then
                xPlayer.addWeapon(k, 1)
            else
                xPlayer.addInventoryItem(k, randomCount)
            end
        end
    end
end)

RegisterNetEvent('constructionHeist:startHeist')
AddEventHandler('constructionHeist:startHeist', function(loc, nodeCoords, heistTime)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nodes = nodeCoords
    local time = heistTime
    local location = loc
    if location == 'Vespucci' then
        activeHeist = activeVespucciHeist
    elseif location == 'lowerPower' then
        activeHeist = activeLPowerHeist
    elseif location == 'upperPower' then
        activeHeist = activeUPowerHeist
    end
    if copsRequired() and not activeHeist then
        activeHeist = true
        if location == 'Vespucci' then
            activeVespucciHeist = true
        elseif location == 'lowerPower' then
            activeLPowerHeist = true
        elseif location == 'upperPower' then 
            activeUPowerHeist = true
        end
        TriggerClientEvent('constructionHeist:beginHeist', source, location, nodes, time)
    else
        TriggerClientEvent('tcrp:displayGeneral', source, "Nothing to Scavenge Nearby")
    end
end)

RegisterNetEvent('constructionHeist:endHeist')
AddEventHandler('constructionHeist:endHeist', function(coords, loc)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nodes = nodeCoords
    local time = heistTime
    local location = loc
    activeHeist = false
    if location == 'Vespucci' then
        activeVespucciHeist = false
    elseif location == 'lowerPower' then
        activeLPowerHeist = false
    elseif location == 'upperPower' then 
        activeUPowerHeist = false
    end
    
end)

RegisterServerEvent('constructionHeist:fence')
    AddEventHandler('constructionHeist:fence', function(itemName, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        local price   = Config.fenceItems[itemName]
        local xItem   = xPlayer.getInventoryItem(itemName)

        if xItem.count < amount then
            TriggerClientEvent('mythic_notify:client:SendAlert', source,
                               { type = 'error', text = 'You do not have enough of that item!', length = 10000 })
            return
        end

        price = ESX.Math.Round(price * amount)
        xPlayer.addMoney(price)
        xPlayer.removeInventoryItem(xItem.name, amount)
        TriggerClientEvent('esx:showNotification', source, 'You sold ' .. amount .. ' ' .. xItem.label .. ' for $' .. price)
end)

RegisterNetEvent('constructionHeist:notifyPD')
AddEventHandler('constructionHeist:notifyPD', function(coords)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
            local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, 
                            ["text"] = "[PD] Construction Heist", ["sprite"] = 161, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 120}
            TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                            { text = 'Suspicious Activity Reported in the Area' })
            TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
        end
    end
end)

