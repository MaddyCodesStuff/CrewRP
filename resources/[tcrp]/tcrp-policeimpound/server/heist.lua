local lastHeist = 0
local locked = true
local hacked = false

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

-- Start lockpicking
RegisterNetEvent('tcrp-policeimpound:breakIn')
AddEventHandler('tcrp-policeimpound:breakIn', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source) -- ESX
    local item = xPlayer.getInventoryItem('lockpick')
    if item.count > 0 and copsRequired() then
        xPlayer.removeInventoryItem('lockpick', 1)
        TriggerClientEvent('tcrp-policeimpound:breakIn', _source)
       else
       TriggerClientEvent('tcrp:displayGeneral', _source, "Not enough police or not the right tool.")
    end
end)

-- End lockpicking
RegisterNetEvent('tcrp-policeimpound:brokeIn')
AddEventHandler('tcrp-policeimpound:brokeIn', function()
    locked = false

    TriggerClientEvent('tcrp:displayGeneral', source, "Successfully picked lock.")
    TriggerClientEvent('tcrp-policeimpound:alertPolice', -1, "Someone is breaking into the police impound lot.") -- Notify police
    TriggerClientEvent('tcrp-policeimpound:playAlarm', source)

    Citizen.CreateThread(function()
        local unlockAt = os.time() + (Config.DoorUnlockTimer * 60)
        while os.time() < unlockAt do
            Wait(10000)
        end
        locked = true
        hacked = false
    end)
end)

-- Start hack
RegisterNetEvent('tcrp-policeimpound:startHack')
AddEventHandler('tcrp-policeimpound:startHack', function()
    if checkCooldown() then
        local xPlayer = ESX.GetPlayerFromId(source) -- ESX
        local item = xPlayer.getInventoryItem('raspberry')

        if item.count and item.count > 0 then
            xPlayer.removeInventoryItem('raspberry', 1)
            TriggerClientEvent('tcrp-policeimpound:startHack', source)
            TriggerClientEvent('tcrp-policeimpound:alertPolice', -1, "Someone is hacking into the impound computer.") -- Notify police
        else
            TriggerClientEvent('tcrp:displayGeneral', source, "Need a raspberry pi to hack.")
        end
    else
        TriggerClientEvent('tcrp:displayGeneral', source, "IT has locked down the computer systems. Come back later.")
    end
end)

-- End hack
RegisterNetEvent('tcrp-policeimpound:hacked')
AddEventHandler('tcrp-policeimpound:hacked', function(success)
    lastHeist = os.time()
    if success then
        TriggerClientEvent('tcrp:displayGeneral', source, "Hack succeeded.")
        hacked = true
    else
        TriggerClientEvent('tcrp:displayGeneral', source, "Hack failed.")
    end
end)

-- Access computer
RegisterNetEvent('tcrp-policeimpound:accessComputer')
AddEventHandler('tcrp-policeimpound:accessComputer', function()
    local _source = source
    local vehicles = getVehicles()
    for _, vehicleData in ipairs(vehicles) do
        vehicleData.previous_owner = getCharacterName(vehicleData.previous_owner)
    end
    TriggerClientEvent('tcrp-policeimpound:accessComputer', _source, vehicles)
end)

-- Reset hack status
RegisterNetEvent('tcrp-policeimpound:resetHack')
AddEventHandler('tcrp-policeimpound:resetHack', function()
    hacked = false
end)

-- Handle door lock & computer status sync
Citizen.CreateThread(function()
    while true do
        TriggerClientEvent('tcrp-policeimpound:setStatus', -1, locked, hacked)
        Wait(100)
    end
end)