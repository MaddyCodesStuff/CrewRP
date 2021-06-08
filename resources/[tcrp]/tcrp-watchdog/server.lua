ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('tcrp-watchdog:save')
AddEventHandler('tcrp-watchdog:save', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Async.execute('INSERT INTO `watchdog` (`timestamp`,`user`,`type`,`message`) VALUES (@time,@source,@type,@message)',
                        {
                            ['@time']    = os.time(),
                            ['@source']  = xPlayer.identifier,
                            ['@type']    = data.type or 'misc',
                            ['@message'] = data.message,
                        })
end)

-- Added in a discord callback to be able to send commands to Discord on actions
RegisterServerEvent('tcrp-watchdog:auditlog')
AddEventHandler('tcrp-watchdog:auditlog', function(message)
    --if Config.EnableAuditLog then
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        local content = message

    local embed   = {
        {
            ["color"]       = 10104574,
            ["title"]       = "** In-Game Command Usage**",
            ["description"] = content,
            ["footer"]      = {
                ["text"] = "TheCrewRP Logmaster",
            },
        }
    }

    SendMessage({ embed = embed, content = content })
    --end
end)

function SendMessage(data)
    PerformHttpRequest(Config.DISCORD_WEBHOOK, function(err, text, headers) end, 'POST',json.encode({ username = Config.DISCORD_NAME, embeds = '', content = data.content, avatar_url = Config.DISCORD_IMAGE}),{ ['Content-Type'] = 'application/json' })
end
