ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local lastHeist = 0

function checkCooldown()
    return (lastHeist + (Config.GlobalCooldown * 60) <= os.time())
end

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

-- Start hack
RegisterNetEvent('tcrp-ATMRobbery:startHack')
AddEventHandler('tcrp-ATMRobbery:startHack', function(hackerCoords)
    if checkCooldown() and copsRequired() then
        local xPlayer = ESX.GetPlayerFromId(source)
        local item = xPlayer.getInventoryItem('raspberry')
    
        if item.count and item.count > 0 then
            xPlayer.removeInventoryItem('raspberry', 1)
            TriggerClientEvent('tcrp-ATMRobbery:startHack', source, hackerCoords)
        else
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                                { text = "Need a raspberry pi to hack."})
        end
    else
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                                { text = "IT has locked down the computer systems. Come back later."})
    end
end)

-- End hack
RegisterNetEvent('tcrp-ATMRobbery:hacked')
AddEventHandler('tcrp-ATMRobbery:hacked', function(success, hackerCoords)
    local xPlayer = ESX.GetPlayerFromId(source)
    local payout = math.random(Config.minPayout, Config.maxPayout)
    lastHeist = os.time()
    if success then
        TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source,
                            { text = "Hack succeeded. Received $" .. payout })
        xPlayer.addMoney(payout)
        local policeText = string.format([[
            Detected Successful ATM Hacking
            Amount Stolen: %s
        ]], payout)
        TriggerEvent('esx_addons_gcphone:startCall', 'police', policeText, hackerCoords, true)
    else
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                                { text = "Hack Failed"})
    end
end)

RegisterNetEvent('tcrp-ATMRobbery:checkPI')
AddEventHandler('tcrp-ATMRobbery:checkPI', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source) 
    local item = xPlayer.getInventoryItem('raspberry')
    if item.count > 0 and checkCooldown() then --Check for Raspberry Pi AND if Heist off Cooldown
        TriggerClientEvent('tcrp-ATMRobbery:truePI', _source, true)
    else
        TriggerClientEvent('tcrp-ATMRobbery:truePI', _source, false)
    end
end)

RegisterNetEvent('tcrp-ATMRobbery:notifyPD')
AddEventHandler('tcrp-ATMRobbery:notifyPD', function(hackerCoords, streetName, playerGender)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
            local blip = {["x"] = hackerCoords.x, ["y"] = hackerCoords.y, ["z"] = hackerCoords.z, ["longrange"] = true, 
                            ["text"] = "[PD] ATM Robbery", ["sprite"] = 161, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 120}
            TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                            { text = 'A ' .. playerGender .. ' Was Spotted Hacking An ATM Near ' .. streetName })
            TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
        end
    end
end)