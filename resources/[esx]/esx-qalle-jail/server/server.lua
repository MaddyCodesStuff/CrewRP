ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterCommand("jail", function(src, args, raw)

    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer["job"]["name"] == "police" then

        local jailPlayer = args[1]
        local jailTime   = tonumber(args[2])
        local jailReason = args[3]

        if GetPlayerName(jailPlayer) ~= nil then

            if jailTime ~= nil then
                JailPlayer(jailPlayer, jailTime)

                TriggerClientEvent("esx:showNotification", src,
                                   GetPlayerName(jailPlayer) .. " Jailed for " .. jailTime .. " minutes!")

                if args[3] ~= nil then
                    GetRPName(jailPlayer, function(Firstname, Lastname)
                        -- TriggerClientEvent('chat:addMessage', -1, { args = { "JUDGE",  Firstname .. " " .. Lastname .. " Is now in jail for the reason: " .. args[3] }, color = { 249, 166, 0 } })
                    end)
                end
            else
                TriggerClientEvent("esx:showNotification", src, "This time is invalid!")
            end
        else
            TriggerClientEvent("esx:showNotification", src, "This ID is not online!")
        end
    else
        TriggerClientEvent("esx:showNotification", src, "You are not an officer!")
    end
end)

RegisterCommand("unjail", function(src, args)

    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer["job"]["name"] == "police" then

        local jailPlayer = args[1]

        if GetPlayerName(jailPlayer) ~= nil then
            UnJail(jailPlayer)
        else
            TriggerClientEvent("esx:showNotification", src, "This ID is not online!")
        end
    else
        TriggerClientEvent("esx:showNotification", src, "You are not an officer!")
    end
end)

RegisterServerEvent("esx-qalle-jail:jailPlayer")
AddEventHandler("esx-qalle-jail:jailPlayer", function(targetSrc, jailTime, jailReason)
    local src       = source
    local targetSrc = tonumber(targetSrc)

    JailPlayer(targetSrc, jailTime)

    -- GetRPName(targetSrc, function(Firstname, Lastname)
    -- 	TriggerClientEvent('chat:addMessage', -1, { args = { "JUDGE",  Firstname .. " " .. Lastname .. " Is now in jail for the reason: " .. jailReason }, color = { 249, 166, 0 } })
    -- end)

    TriggerClientEvent("esx:showNotification", src,
                       GetPlayerName(targetSrc) .. " Jailed for " .. jailTime .. " minutes!")
end)

RegisterServerEvent("esx-qalle-jail:unJailPlayer")
AddEventHandler("esx-qalle-jail:unJailPlayer", function(targetIdentifier)
    local src     = source
    local xPlayer = nil
    if targetIdentifier ~= nil then
        xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)
        TriggerClientEvent("esx:showNotification", src, "Unjailing " .. xPlayer.name .. "...")
    else
        xPlayer = ESX.GetPlayerFromId(src)
        TriggerClientEvent("esx:showNotification", src, "You have served your time. Releasing you from prison.")
    end

    if xPlayer ~= nil then
        UnJail(xPlayer.source)
    end

end)

RegisterServerEvent("esx-qalle-jail:updateJailTime")
AddEventHandler("esx-qalle-jail:updateJailTime", function(newJailTime)
    local src = source

    EditJailTime(src, newJailTime)
end)
RegisterServerEvent("esx-qalle-jail:lowertime")
AddEventHandler("esx-qalle-jail:lowertime", function(source, time)
    lowertime(source, time)
end)
RegisterServerEvent("esx-qalle-jail:prisonWorkReward")
AddEventHandler("esx-qalle-jail:prisonWorkReward", function()
    local src     = source

    local xPlayer = ESX.GetPlayerFromId(src)

    xPlayer.addMoney(math.random(1, 2))

    TriggerClientEvent("esx:showNotification", src, "Thanks! You've been given some money for the prison commissary.")
end)

function MinutesLeft(from_number)
    local secs_left    = tonumber(from_number) - os.time()
    local minutes_left = math.floor(tonumber(secs_left / 60))
    if minutes_left < 0 then
        return 0
    end

    return minutes_left
end

function JailPlayer(jailPlayer, jailTime)
    TriggerClientEvent("esx-qalle-jail:jailPlayer", jailPlayer, jailTime)

    EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
    TriggerClientEvent("esx-qalle-jail:unJailPlayer", jailPlayer)

    EditJailTime(jailPlayer, 0)
end

function lowertime(player, amount)

    local xPlayer = ESX.GetPlayerFromId(player)
    local Identifier = tostring(xPlayer.identifier)
    local newjail
        
        MySQL.Async.fetchAll('SELECT `JAIL` FROM `users` WHERE `identifier` = @identifier',{
            ['@identifier'] = Identifier
          }, function(result)
            if result then
                newjail = MinutesLeft(result[1].JAIL) - amount           
                EditJailTime(player, newjail)
            end
          end)
end


function EditJailTime(source, jailTime)
    local src        = source
    local xPlayer    = ESX.GetPlayerFromId(src)
    local Identifier = xPlayer.identifier
    local unJailedAt = 0

    if jailTime > 0 then
        unJailedAt = os.time() + (tonumber(jailTime) * 60)
    end

    MySQL.Async.execute(
        "UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
        {
            ['@identifier']  = Identifier,
            ['@newJailTime'] = tonumber(unJailedAt)
        }
    )
end

function GetRPName(playerId, data)
    local Identifier = ESX.GetPlayerFromId(playerId).identifier

    
    MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier",
                         { ["@identifier"] = Identifier }, function(result)

            data(result[1].firstname, result[1].lastname)

        end)
end

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailedPlayers", function(source, cb)

    local jailedPersons = {}

    MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail",
                         { ["@jail"] = os.time() }, function(result)

            for i = 1, #result, 1 do
                table.insert(jailedPersons,
                             { name = result[i].firstname .. " " .. result[i].lastname, jailTime = MinutesLeft(result[i].jail), identifier = result[i].identifier })
            end

            cb(jailedPersons)
        end)
end)

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailTime", function(source, cb)

    local src        = source

    local xPlayer    = ESX.GetPlayerFromId(src)
    local Identifier = xPlayer.identifier

    MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier },
                         function(result)
                             if result[1] then
                                 local jailTime = tonumber(result[1].jail)
                                 local timeleft = MinutesLeft(jailTime)

                                 if timeleft > 0 then
                                     cb(true, timeleft)
                                 elseif timeleft == 0 and jailTime > 0 then
                                     cb(true, 0)
                                 else
                                     cb(false, 0)
                                 end
                             end
                         end)
end)