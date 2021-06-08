ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function AddLicense(target, type, cb)

    local xPlayer = ESX.GetPlayerFromId(target)

    MySQL.Async.execute(
        'INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)',
        {
            ['@type']  = type,
            ['@owner'] = xPlayer.identifier
        },
        function(rowsChanged)
            TriggerClientEvent('mythic_notify:client:SendSuccessAlert', target,
                               { text = "You have received your " .. type .. " license." })
            if cb ~= nil then
                cb()
            end
        end
    )

end

function RemoveLicense(target, type, cb)

    local xPlayer = ESX.GetPlayerFromIdentifier(target)

    MySQL.Async.execute(
        'DELETE FROM user_licenses WHERE type = @type AND owner = @owner',
        {
            ['@type']  = type,
            ['@owner'] = target
        },
        function(rowsChanged)
            if xPlayer then
                TriggerClientEvent('mythic_notify:client:SendErrorAlert', xPlayer.source,
                                   { text = "You have had your " .. type .. " license revoked." })
            end
            if cb ~= nil then
                cb()
            end
        end
    )

end

function GetLicense(type, cb)

    MySQL.Async.fetchAll(
        'SELECT * FROM licenses WHERE type = @type',
        {
            ['@type'] = type
        },
        function(result)

            local data = {
                type  = type,
                label = result[1].label
            }

            cb(data)

        end
    )

end

function GetLicenses(target, cb)

    local xPlayer = ESX.GetPlayerFromId(target)

    MySQL.Async.fetchAll(
        'SELECT * FROM user_licenses WHERE owner = @owner',
        {
            ['@owner'] = xPlayer.identifier
        },
        function(result)

            local licenses   = {}
            local asyncTasks = {}

            for i = 1, #result, 1 do

                local scope = function(type)

                    table.insert(asyncTasks, function(cb)

                        MySQL.Async.fetchAll(
                            'SELECT * FROM licenses WHERE type = @type',
                            {
                                ['@type'] = type
                            },
                            function(result2)

                                if #result2 >= 1 then
                                    table.insert(licenses, {
                                        type  = type,
                                        label = result2[1].label
                                    })
                                else
                                    print("Broken license type:")
                                    print(type)
                                end

                                cb()

                            end
                        )

                    end)

                end

                scope(result[i].type)

            end

            Async.parallel(asyncTasks, function(results)
                cb(licenses)
            end)

        end
    )

end

function GetLicensesByType(cb, license_type)

    MySQL.Async.fetchAll(
        'SELECT t1.owner, t1.type, t2.firstname, t2.lastname FROM user_licenses AS t1 INNER JOIN `users` as t2 ON t1.owner = t2.identifier WHERE t1.`type` = @license_type ORDER BY t2.lastname ASC',
        {
            ['@license_type'] = license_type
        },
        function(result)
            cb(result)
        end)
end

function CheckLicense(target, type, cb)
    local xPlayer = ESX.GetPlayerFromId(target)

    MySQL.Async.fetchAll(
        'SELECT id FROM user_licenses WHERE type = @type AND owner = @owner',
        {
            ['@type']  = type,
            ['@owner'] = xPlayer.identifier
        },
        function(result)

            if #result > 0 then
                cb(result[1].id)
            else
                cb(false)
            end

        end
    )

end

function GetLicensesList(cb)

    MySQL.Async.fetchAll(
        'SELECT * FROM licenses',
        {
            ['@type'] = type
        },
        function(result)

            local licenses = {}

            for i = 1, #result, 1 do
                table.insert(licenses, {
                    type  = result[i].type,
                    label = result[i].label
                })
            end

            cb(licenses)

        end
    )

end

RegisterNetEvent('esx_license:addLicense')
AddEventHandler('esx_license:addLicense', function(target, type, cb)
    AddLicense(target, type, cb)
end)

RegisterNetEvent('esx_license:removeLicense')
AddEventHandler('esx_license:removeLicense', function(target, type, cb)
    RemoveLicense(target, type, cb)
end)

RegisterNetEvent('esx_license:getLicenseID')
AddEventHandler('esx_license:getLicenseID', function(target, type, cb)
    CheckLicense(target, type, cb)
end)

AddEventHandler('esx_license:getLicense', function(type, cb)
    GetLicense(type, cb)
end)

AddEventHandler('esx_license:getLicenses', function(target, cb)
    GetLicenses(target, cb)
end)

AddEventHandler('esx_license:checkLicense', function(target, type, cb)
    CheckLicense(target, type, function(id)
        cb((id ~= false))
    end)
end)

AddEventHandler('esx_license:getLicensesList', function(cb)
    GetLicensesList(cb)
end)

ESX.RegisterServerCallback('esx_license:getLicense', function(source, cb, type)
    GetLicense(type, cb)
end)

ESX.RegisterServerCallback('esx_license:getLicenses', function(source, cb, target)
    GetLicenses(target, cb)
end)

ESX.RegisterServerCallback('esx_license:checkLicense', function(source, cb, target, type)
    CheckLicense(target, type, function(id)
        cb((id ~= false))
    end)
end)

ESX.RegisterServerCallback('esx_license:getLicensesList', function(source, cb)
    GetLicensesList(cb)
end)

ESX.RegisterServerCallback('esx_license:getLicensesByType', function(source, cb, license_type)
    GetLicensesByType(cb, license_type)
end)