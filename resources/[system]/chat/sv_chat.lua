RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
    end
end)

function getIdentity(source)
    local identifier = ESX.GetPlayerFromId(source)

    ESX.TriggerServerCallback('esx_identity:getIdentity', function(result)
        if result[1] ~= nil then
            local identity = result[1]

            return {
                identifier  = identity['identifier'],
                firstname   = identity['firstname'],
                lastname    = identity['lastname'],
                dateofbirth = identity['dateofbirth'],
                sex         = identity['sex'],
                height      = identity['height']

            }
        else
            return nil
        end
    end, identifier.identifier)
end

-- AddEventHandler('_chat:messageEntered', function(author, color, message)
--     if not message or not author then
--         return
--     end

--     TriggerEvent('chatMessage', source, author, message)

--     if not WasEventCanceled() then
--         --TriggerClientEvent('chatMessage', -1, author,  { 255, 255, 255 }, message)
--         local playerName = GetPlayerName(source)
--         local msg = message
--         local name = getIdentity(source)
--         TriggerClientEvent('chat:addMessage', -1, {
--             template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
--             args = { playerName, msg }
--         })
--     end

--     print(author .. '^7: ' .. message .. '^7')
-- end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        -- TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, '/' .. command) 
    end

    CancelEvent()
end)

-- player join messages
AddEventHandler('chat:init', function()
    --TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) .. ' joined.')
end)

AddEventHandler('playerDropped', function(reason)
    --TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
end)

-- RegisterCommand('say', function(source, args, rawCommand)
--     TriggerClientEvent('chatMessage', -1, (source == 0) and 'console' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
-- end)

-- RegisterCommand('say', function(source, args, rawCommand)
--     TriggerClientEvent('chatMessage', -1, (source == 0) and 'console' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
-- end)


-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions        = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)
