---------------------------------------------------------------------------------------
-- Edit this table to all the database tables and columns
-- where identifiers are used (such as users, owned_vehicles, owned_properties etc.)
---------------------------------------------------------------------------------------
ESX                    = nil

local IdentifierTables = {
    { table = "users", column = "identifier" },
    { table = "owned_vehicles", column = "owner" },
    { table = "owned_properties", column = "owner" },
    { table = "rented_vehicles", column = "owner" },
    { table = "user_accounts", column = "identifier" },
    { table = "user_inventory", column = "identifier" },
    { table = "user_parkings", column = "identifier" },
    { table = "user_contacts", column = "identifier" },
    { table = "characters", column = "identifier" },
    { table = "billing", column = "identifier" },
    { table = "user_inventory", column = "identifier" },
    { table = "society_moneywash", column = "identifier" },
    { table = "phone_users_contacts", column = "identifier" },
    { table = "datastore_data", column = "owner" },
    { table = "addon_inventory_items", column = "owner" },
    { table = "communityservice", column = "identifier" },
    { table = "properties_wardrobe", column = "owner" },
    { table = "healtharmour", column = "player" },
    { table = "user_licenses", column = "owner" },
    { table = "housing", column = "owner" },
    { table = "owner_keys", column = "owner" },
    { table = "owner_keys", column = "receiver" },
    { table = "users_wardrobe", column = "identifier" },
    { table = "police_impound", column = "previous_owner" },
}

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('tcrp-character-creator:SetupCharacters')
AddEventHandler('tcrp-character-creator:SetupCharacters', function()
    local src        = source
    local LastCharId = GetLastCharacter(src)
    SetIdentifierToChar(GetPlayerIdentifiers(src)[1], LastCharId)
    local Characters = GetPlayerCharacters(src)

    TriggerClientEvent('tcrp-character-creator:SetupUI', src, Characters)
end)

RegisterServerEvent('tcrp-character-creator:ReloadCharacters')
AddEventHandler('tcrp-character-creator:ReloadCharacters', function()
    local src        = source
    local Characters = GetPlayerCharacters(src)

    TriggerClientEvent('tcrp-character-creator:Reload', src, Characters)
end)

RegisterServerEvent("tcrp-character-creator:CharacterChosen")
AddEventHandler('tcrp-character-creator:CharacterChosen', function(charid, ischar)
    local src   = source
    local spawn = {}
    SetLastCharacter(src, tonumber(charid))
    SetCharToIdentifier(GetPlayerIdentifiers(src)[1], tonumber(charid))
    if ischar == true then
        spawn = GetSpawnPos(src)
    else
        TriggerClientEvent('skinchanger:loadSkin', src, {sex = 0})
        spawn = { x = -1037.72, y = -2738.0, z = 20.17 } -- Spawn at the airport at arrivals
    end

    TriggerClientEvent("tcrp-character-creator:spawnPlayer", src, spawn, ischar)
end)

ESX.RegisterServerCallback('tcrp-character-creator:getSavedPed', function(source, cb)
    xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll(
        'SELECT * FROM users WHERE identifier = @identifier',
        {
            ['@identifier'] = xPlayer.identifier
        },
        function(users)
            local user = users[1]
            local ped  = nil

            if user.ped ~= nil then
                ped = user.ped
            end
            cb(ped)
        end
    )
end)

function GetPlayerCharacters(source)
    local identifier = GetIdentifierWithoutSteam(GetPlayerIdentifiers(source)[1])
    local Chars      = MySQLAsyncExecute("SELECT * FROM `users` WHERE identifier LIKE '%" .. identifier .. "%' ORDER BY CAST(`identifier` AS UNSIGNED INTEGER)")
    return Chars
end

function GetLastCharacter(source)
    local LastChar = MySQLAsyncExecute("SELECT `charid` FROM `user_lastcharacter` WHERE `steamid` = '" .. GetPlayerIdentifiers(source)[1] .. "'")
    if LastChar[1] ~= nil and LastChar[1].charid ~= nil then
        return tonumber(LastChar[1].charid)
    else
        MySQLAsyncExecute("INSERT INTO `user_lastcharacter` (`steamid`, `charid`) VALUES('" .. GetPlayerIdentifiers(source)[1] .. "', 1)")
        return 1
    end
end

function SetLastCharacter(source, charid)
    MySQLAsyncExecute("UPDATE `user_lastcharacter` SET `charid` = '" .. charid .. "' WHERE `steamid` = '" .. GetPlayerIdentifiers(source)[1] .. "'")
end

function SetIdentifierToChar(identifier, charid)
    for _, itable in pairs(IdentifierTables) do
        local query = "UPDATE `" .. itable.table .. "` SET `" .. itable.column .. "` = 'Char" .. charid .. GetIdentifierWithoutSteam(identifier) .. "' WHERE `" .. itable.column .. "` = '" .. identifier .. "'"
        MySQLAsyncExecute(query)
    end
end

function SetCharToIdentifier(identifier, charid)
    for _, itable in pairs(IdentifierTables) do
        MySQLAsyncExecute("UPDATE `" .. itable.table .. "` SET `" .. itable.column .. "` = '" .. identifier .. "' WHERE `" .. itable.column .. "` = 'Char" .. charid .. GetIdentifierWithoutSteam(identifier) .. "'")
    end
end

function DeleteCharacter(identifier, charid)
    for _, itable in pairs(IdentifierTables) do
        MySQLAsyncExecute("DELETE FROM `" .. itable.table .. "` WHERE `" .. itable.column .. "` = 'Char" .. charid .. GetIdentifierWithoutSteam(identifier) .. "'")
    end
end

function GetIdentifierWithoutSteam(Identifier)
    return string.gsub(Identifier, "steam", "")
end

RegisterServerEvent("tcrp-character-creator:DeleteCharacter")
AddEventHandler('tcrp-character-creator:DeleteCharacter', function(charid)
    local src = source
    DeleteCharacter(GetPlayerIdentifiers(src)[1], charid)
    TriggerClientEvent("tcrp-character-creator:ReloadCharacters", src)
end)

function MySQLAsyncExecute(query)
    local IsBusy = true
    local result = nil
    MySQL.Async.fetchAll(query, {}, function(data)
        result = data
        IsBusy = false
    end)
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

function GetIdentifierWithoutSteam(Identifier)
    return string.gsub(Identifier, "steam", "")
end

function GetSpawnPos(source)
    local SpawnPos = MySQLAsyncExecute("SELECT `position` FROM `users` WHERE `identifier` = '" .. GetPlayerIdentifiers(source)[1] .. "'")
    return json.decode(SpawnPos[1].position)
end

--[ Helpful debugging function to dump tables to console ]--
function dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end