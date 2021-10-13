ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function checkPerms(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return (xPlayer.getGroup() == 'superadmin')
end

local function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {};
    i       = 1
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        t[i] = str
        i    = i + 1
    end
    return t
end

RegisterServerEvent("alert:sv")
AddEventHandler("alert:sv", function(msg, msg2)
    if checkPerms(source) then
        TriggerClientEvent("SendAlert", -1, msg, msg2)
    else
        TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                                { text = "You do not have the necessary permissions."})
    end
end)

AddEventHandler('chatMessage', function(source, name, msg)
    if checkPerms(source) then
        local command = stringsplit(msg, " ")[1];

        if command == "/alert" then
            CancelEvent()
            TriggerClientEvent("alert:Send", source, string.sub(msg, 8), Config.EAS.Departments)
        end
    else
        if command == "/alert" then
            local command = stringsplit(msg, " ")[1];
            TriggerClientEvent('mythic_notify:client:SendErrorAlert', source,
                                    { text = "You do not have the necessary permissions."})
        end
    end
end)
