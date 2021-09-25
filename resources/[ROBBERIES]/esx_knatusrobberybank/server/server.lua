local rob     = false
local robbers = {}
ESX           = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
    return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

function getCopCount()
    local cops     = 0
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
            cops = cops + 1
        end
    end
    return cops
end

RegisterServerEvent('esx_holdupbank:toofar')
AddEventHandler('esx_holdupbank:toofar', function(robb)
    local source   = source
    local xPlayers = ESX.GetPlayers()
    rob            = false
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                               { text = _U('robbery_cancelled_at',
                                           Banks[robb].nameofbank), title = 'Bank Robbery Reported' })
        end
    end
    if (robbers[source]) then
        TriggerClientEvent('esx_holdupbank:toofarlocal', source)
        robbers[source] = nil
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                           { text = _U('robbery_has_cancelled', Banks[robb].nameofbank) })
    end
end)

RegisterServerEvent('esx_holdupbank:toofarhack')
AddEventHandler('esx_holdupbank:toofarhack', function(robb)
    local source   = source
    local xPlayers = ESX.GetPlayers()
    rob            = false
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                               { text = _U('robbery_cancelled_at',
                                           Banks[robb].nameofbank), title = 'Bank Robbery Reported' })
        end
    end
    if (robbers[source]) then
        TriggerClientEvent('esx_holdupbank:toofarlocal', source)
        robbers[source] = nil
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                           { text = _U('robbery_has_cancelled', Banks[robb].nameofbank) })
    end
end)

RegisterServerEvent('esx_holdupbank:rob')
AddEventHandler('esx_holdupbank:rob', function(robb, reward)

    local source   = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if Banks[robb] then

        local bank = Banks[robb]

        if (os.time() - bank.lastrobbed) < Config.Cooldown and bank.lastrobbed ~= 0 then
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                               { text = _U('already_robbed', (1800 - (os.time() - bank.lastrobbed))) })
            return
        end

        cops = getCopCount()

        if rob == false then

            if xPlayer.getInventoryItem('blowtorch').count >= 1 then

                if (cops >= Banks[robb].NumberOfCopsRequired) then
                    xPlayer.removeInventoryItem('blowtorch', 1)
                    rob = true
                    for i = 1, #xPlayers, 1 do
                        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                        if xPlayer and xPlayer.job and xPlayer.job.name == 'police' or xPlayer.job.name == 'journalist' then
                            TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                               { text = 'Vault breach in progress at ' .. bank.nameofbank, title = 'Bank Robbery Reported' })
                            TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Banks[robb].position)
                        end
                    end

                    TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source,
                                       { text = _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move') })
                    TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source,
                                       { text = _U('alarm_triggered') })
                    TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source, { text = _U('hold_pos') })
                    TriggerClientEvent('esx_holdupbank:currentlyrobbing', source, robb)
                    TriggerClientEvent('esx_blowtorch:startblowtorch', source)
                    Banks[robb].lastrobbed = os.time()
                    robbers[source]        = robb
                    local savedSource      = source
                    SetTimeout(bank.timetotorch, function()

                        if (robbers[savedSource]) then
                            rob          = false
                            local reward = 0
                            math.randomseed(os.time())
                            reward = math.random(bank.reward.min, bank.reward.max)
                            TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source,
                                               { text = _U('robbery_complete') .. reward })
                            TriggerClientEvent('esx_holdupbank:robberycomplete', savedSource, job)
                            local pdnote = "Statement from teller:\nApproximately $" .. reward .. " was stolen from the vault."
                            TriggerEvent("server:newNote", pdnote, bank.blipposition.x, bank.blipposition.y,
                                         bank.blipposition.z, true)
                            if (xPlayer) then
                                xPlayer.addMoney(reward)
                                local xPlayers = ESX.GetPlayers()
                                for i = 1, #xPlayers, 1 do
                                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                                    if xPlayer.job.name == 'police' then
                                        TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                                           { text = _U('robbery_complete_at') .. bank.nameofbank, title = 'Bank Robbery Reported' })
                                    end
                                end
                            end
                        end
                    end)
                else
                    TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = _U('min_two_police') })
                end
            else
                TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = _U('blowtorch_needed') })
            end

        else
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = _U('robbery_already') })

        end
    end
end)

RegisterServerEvent('esx_holdupbank:hack')
AddEventHandler('esx_holdupbank:hack', function(robb)

    local source   = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if Banks[robb] then

        local bank = Banks[robb]

        if (os.time() - bank.lastrobbed) < Config.Cooldown and bank.lastrobbed ~= 0 then
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                               { text = _U('already_robbed', (1800 - (os.time() - bank.lastrobbed))) })
            return
        end

        cops = getCopCount()
        if (cops >= Banks[robb].NumberOfCopsRequired) then

            if xPlayer.getInventoryItem('raspberry').count >= 1 then
                for i = 1, #xPlayers, 1 do
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if xPlayer.job.name == 'police' then
                        TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                           { text = 'Hacking in progress at ' .. bank.nameofbank, title = 'Bank Robbery Reported' })
                        TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Banks[robb].position)
                    end
                end
                TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source, { text = _U('alarm_triggered') })
                TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source,
                                   { text = _U('started_to_hack') .. bank.nameofbank .. _U('do_not_move') })
                TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source, { text = _U('hold_pos_hack') })
                TriggerClientEvent('esx_holdupbank:currentlyhacking', source, robb, Banks[robb])
            else
                TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = _U('raspberry_needed') })
            end
        else
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = _U('min_two_police') })
        end
    end
end)

-- Plant a bomb

RegisterServerEvent('esx_holdupbank:plantbomb')
AddEventHandler('esx_holdupbank:plantbomb', function(robb)

    local source   = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if Banks[robb] then

        local bank = Banks[robb]

        if (os.time() - bank.lastrobbed) < Config.Cooldown and bank.lastrobbed ~= 0 then
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                               { text = _U('already_robbed', (1800 - (os.time() - bank.lastrobbed))) })
            return
        end

        cops = getCopCount()
        if (cops >= Banks[robb].NumberOfCopsRequired) then
            if xPlayer.getInventoryItem('c4_bank').count >= 1 then
                xPlayer.removeInventoryItem('c4_bank', 1)
                for i = 1, #xPlayers, 1 do
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if xPlayer.job.name == 'police' or xPlayer.job.name == 'journalist' then
                        -- Send the police notification that a bank alarm has been triggered
                        TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                           { text = 'Explosion reported at ' .. bank.nameofbank, title = 'Bank Robbery In Progress' })
                        TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                           { text = _U('rob_in_prog',
                                                       bank.nameofbank), title = 'Bank Robbery In Progress' })
                        TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source,
                                           { text = _U('alarm_triggered') })
                        TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Banks[robb].position)
                    end
                end

                TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source,
                                   { text = _U('started_to_plantbomb') .. bank.nameofbank .. _U('do_not_move') })
                TriggerClientEvent('mythic_notify:client:SendSuccessAlert', source, { text = _U('hold_pos_plantbomb') })
                TriggerClientEvent('esx_holdupbank:plantingbomb', source, robb, Banks[robb])

                robbers[source]   = robb
                local savedSource = source

                SetTimeout(20000, function()

                    if (robbers[savedSource]) then
                        rob = false
                        TriggerClientEvent('esx_holdupbank:plantbombcomplete', savedSource, Banks[robb])
                        if (xPlayer) then

                            TriggerClientEvent('mythic_notify:client:SendSuccessAlert', xPlayer,
                                               { text = _U('bombplanted_run') })
                            local xPlayers = ESX.GetPlayers()
                            for i = 1, #xPlayers, 1 do
                                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                                if xPlayer.job.name == 'police' then
                                    TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                                       { text = _U('bombplanted_at') .. bank.nameofbank, title = 'Bank Robbery In Progress' })
                                end
                            end
                        end
                    end
                end)
            else
                TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = _U('c4_needed') })
            end
        else
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = _U('min_two_police') })
        end
    end
end)

RegisterServerEvent('esx_holdupbank:clearweld')
AddEventHandler('esx_holdupbank:clearweld', function(x, y, z)
    TriggerClientEvent('esx_blowtorch:clearweld', -1, x, y, z)
end)

RegisterServerEvent('esx_holdupbank:opendoor')
AddEventHandler('esx_holdupbank:opendoor', function(bank)
    TriggerClientEvent('esx_holdupbank:opendoors', -1, bank)
end)

RegisterServerEvent('esx_holdupbank:plantbombtoall')
AddEventHandler('esx_holdupbank:plantbombtoall', function(x, y, z, doortype)
    SetTimeout(20000, function()
        TriggerClientEvent('esx_holdupbank:plantedbomb', -1, x, y, z, doortype)
    end)
end)

RegisterServerEvent('esx_holdupbank:finishclear')
AddEventHandler('esx_holdupbank:finishclear', function()
    TriggerClientEvent('esx_blowtorch:finishclear', -1)
end)

RegisterServerEvent('esx_holdupbank:closedoor')
AddEventHandler('esx_holdupbank:closedoor', function()

    TriggerClientEvent('esx_holdupbank:closedoor', -1)
end)

RegisterServerEvent('esx_holdupbank:plantbomb')
AddEventHandler('esx_holdupbank:plantbomb', function()
    TriggerClientEvent('esx_holdupbank:plantbomb', -1)
end)

RegisterServerEvent('esx_holdupbank:usePI')
AddEventHandler('esx_holdupbank:usePI', function()
    local source   = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('raspberry', 1)
end)
