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

function checkPerms(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return (xPlayer.getGroup() == 'superadmin')
end

RegisterServerEvent('adminCmnd:notifyPD')
AddEventHandler('adminCmnd:notifyPD', function(message)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local coords  = xPlayer.getCoords()
    local xPlayers = ESX.GetPlayers()
    local default = 'Suspicious Activity Reported in the Area'

    if message == nil or string.len(message) < 10 then
        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
                local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, 
                                ["text"] = "[PD] Suspicious Activity", ["sprite"] = 161, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 120}
                TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                { text = default })
                TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
            end
        end
    else
        for i = 1, #xPlayers, 1 do
            print('goodbye')
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
                local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, 
                                ["text"] = "[PD] Suspicious Activity", ["sprite"] = 161, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 120}
                TriggerClientEvent('mythic_notify:client:SendCopAlert', xPlayers[i],
                                { text = message })
                TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
            end
        end
    end
end)

RegisterServerEvent('adminCmnd:notifyFD')
AddEventHandler('adminCmnd:notifyFD', function(message)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local coords  = xPlayer.getCoords()
    local xPlayers = ESX.GetPlayers()
    local default = 'Fire Reported in the Area'

    if message == nil or string.len(message) < 10 then
        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer and xPlayer.job and xPlayer.job.name == 'fireman' then
                local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, 
                                ["text"] = "[FD] Fire Reported", ["sprite"] = 436, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 120}
                TriggerClientEvent('mythic_notify:client:SendFireAlert', xPlayers[i],
                                { text = default })
                TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
            end
        end
    else
        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer and xPlayer.job and xPlayer.job.name == 'fireman' then
                local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, 
                                ["text"] = "[FD] Fire Reported", ["sprite"] = 436, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 120}
                TriggerClientEvent('mythic_notify:client:SendFireAlert', xPlayers[i],
                                { text = message })
                TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
            end
        end
    end
end)

RegisterServerEvent('adminCmnd:notifyEMS')
AddEventHandler('adminCmnd:notifyEMS', function(message)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local coords  = xPlayer.getCoords()
    local xPlayers = ESX.GetPlayers()
    local default = 'Medical Emergency in the Area'

    if message == nil or string.len(message) < 10 then
        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer and xPlayer.job and xPlayer.job.name == 'ambulance' then
                local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, 
                                ["text"] = "[EMS] Medical Emergency", ["sprite"] = 621, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 120}
                TriggerClientEvent('mythic_notify:client:SendEMSAlert', xPlayers[i],
                                { text = default })
                TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
            end
        end
    else
        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer and xPlayer.job and xPlayer.job.name == 'ambulance' then
                local blip = {["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["longrange"] = true, 
                                ["text"] = "[EMS] Medical Emergency", ["sprite"] = 621, ["color"] = 1, ["scale"] = 2.0, ["duration"] = 120}
                TriggerClientEvent('mythic_notify:client:SendEMSAlert', xPlayers[i],
                                { text = message })
                TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
            end
        end
    end     
end)

RegisterServerEvent('admin:chaos')
AddEventHandler('admin:chaos', function(message)
    if checkPerms(source) then
        TriggerClientEvent('admin:toggleChaos', -1, true)
    else
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                                { text = "You do not have the necessary permissions."})
    end
end)

RegisterServerEvent('admin:peace')
AddEventHandler('admin:peace', function(message)
    if checkPerms(source) then
        TriggerClientEvent('admin:toggleChaos', -1, false)
    else
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                                { text = "Peace was never an option."})
    end
end)

TriggerEvent('es:addGroupCommand', 'givearmor', 'admin', function(source, args, user)
	if args[1] ~= nil then
		if GetPlayerName(tonumber(args[1])) ~= nil then
			SetPedArmour(tonumber(args[1]), 100)
		end
	else
		SetPedArmour(source, 100)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, { help = ('Give Armor to player'), params = { { name = 'id' } } })