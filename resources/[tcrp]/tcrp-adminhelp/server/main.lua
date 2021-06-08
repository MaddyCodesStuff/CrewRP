ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

local DISCORD_WEBHOOK = "https://discordapp.com/api/webhooks/747862357547548783/qoq5H528WmvfOLsGHNB1ywS0ZnsjKV6Nu3PKIJAz3u1Z0ForOfjmnV_5WEdSodQl3opm"
local DISCORD_NAME    = "Ticketmaster"
local ROLE_ID         = "<@&711575318435069983>" -- Needed so we can @mention the server-admins role (To get in-game, use \@Rolename)

RegisterServerEvent('tcrp-adminhelp:submit')
AddEventHandler('tcrp-adminhelp:submit', function(message)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local coords  = xPlayer.getCoords()

    if message == nil or string.len(message) < 10 then
        TriggerClientEvent('tcrp:displayGeneral', _source, "Message not long enough.")
    else
        local content = "**Player:** " .. xPlayer.name .. "\r\n" .. "**Player ID:** " .. _source .. "\r\n" .. "**Coordinates:** " .. coords.x .. ", " .. coords.y .. ", " .. coords.z .. "\r\n" .. "**Message:**\r\n " .. message

        local embed   = {
            {
                ["color"]       = 10104574,
                ["title"]       = "** In-Game Help Request**",
                ["description"] = content,
                ["footer"]      = {
                    ["text"] = "TheCrewRp Ticketmaster",
                },
            }
        }

        SendMessage({ embed = embed })
        TriggerClientEvent('tcrp:displayGeneral', _source, "Message sent.")
    end
end)

function SendMessage(data)
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers)
    end, 'POST',
                       json.encode({ username = DISCORD_NAME, embeds = data.embed, content = ROLE_ID, avatar_url = DISCORD_IMAGE}),
                       { ['Content-Type'] = 'application/json' })
end