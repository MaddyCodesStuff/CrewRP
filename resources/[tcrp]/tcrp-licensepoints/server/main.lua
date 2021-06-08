-- Get license points & status for license_id
function getLicensePoints(license_id)
    local licensepoints = {
        points = 0,
        suspended_until = 0,
    }
    local result = MySQL.Sync.fetchAll(
        "SELECT points, suspended_until FROM user_license_points WHERE license_id = @license_id", {
            ['@license_id'] = license_id
        }
    )
    if #result > 0 then
        licensepoints = result[1]
    end
    return licensepoints
end

-- Add points to license & return license status. Suspend if necessary
function addLicensePoints(license_id, points)
    MySQL.Sync.execute(
        [[
            INSERT INTO user_license_points (license_id, points) VALUES (
                @license_id, @points
            )
            ON DUPLICATE KEY UPDATE
                points = points + @points
        ]], {
            ['@license_id'] = license_id,
            ['@points'] = points
        }
    )
    local license = getLicensePoints(license_id)
    local license_type = getLicenseType(license_id)
    local conf = Config.Licenses[license_type]

    -- Suspend license if needbe
    if conf and license.points >= conf.suspend_points then
        local suspend_days = conf.suspend_days[getLicenseSuspendCount(license_id) + 1]
        license.suspended_until = -1

        if suspend_days == nil then
            suspend_days = conf.suspend_days[#conf.suspend_days]
        end

        if suspend_days > 0 then
            license.suspended_until = os.time() + (suspend_days * 24 * 60 * 60)
        end

        setLicenseSuspended(license_id, license.suspended_until)
    end

    return license
end

-- Set license to suspended
function setLicenseSuspended(license_id, suspended_until)
    MySQL.Async.execute(
        "UPDATE user_license_points SET suspended_until = @suspended_until WHERE license_id = @license_id", {
            ['@suspended_until'] = suspended_until,
            ['@license_id'] = license_id,
        }
    )
    MySQL.Async.execute(
        "INSERT INTO user_license_suspensions (license_id, suspended) VALUES (@license_id, @suspended)", {
            ['@license_id'] = license_id,
            ['@suspended'] = os.time()
        }
    )
end

-- Get license type
function getLicenseType(license_id)
    local license_type
    local result = MySQL.Sync.fetchAll(
        "SELECT type FROM user_licenses WHERE id = @license_id", {
            ['@license_id'] = license_id,
        }
    )
    if #result > 0 then
        license_type = result[1].type
    end
    return license_type
end

-- Get suspension count for license
function getLicenseSuspendCount(license_id)
    local result = MySQL.Sync.fetchAll(
        "SELECT * FROM user_license_suspensions WHERE license_id = @license_id", {
            ['@license_id'] = license_id,
        }
    )
    return #result
end

-- Print debug logs
function printDebug(msg)
    if Config.Debug then
        print(msg)
    end
end

-- Net events
RegisterNetEvent('tcrp-licensepoints:addPoints')
AddEventHandler('tcrp-licensepoints:addPoints', function(license_id, points, cb)
    cb(addLicensePoints(license_id, points))
end)

RegisterNetEvent('tcrp-licensepoints:addPointsByType')
AddEventHandler('tcrp-licensepoints:addPointsByType', function(target, license_type, points)
    local _source = source
    TriggerEvent('esx_license:getLicenseID', target, license_type, function(license_id)
        local license = addLicensePoints(license_id, points)
        if license and license.points then
            for _, player in ipairs({_source, target}) do
                TriggerClientEvent('tcrp-licensepoints:notifyPoints', player, license_type, license.points)
                if license.suspended_until ~= 0 then
                    TriggerClientEvent('tcrp-licensepoints:notifySuspend', player, license_type)
                end
            end
        end
    end)
end)

RegisterNetEvent('tcrp-licensepoints:getStatus')
AddEventHandler('tcrp-licensepoints:getStatus', function(license_id, cb)
    if license_id >= 0 then
        cb(getLicensePoints(license_id))
    else
        cb(nil)
    end
end)

RegisterNetEvent('tcrp-licensepoints:getStatuses')
AddEventHandler('tcrp-licensepoints:getStatuses', function(licenses, cb)
    for _, license in ipairs(licenses) do
        if license.id then
            license.status = getLicensePoints(license.id)
        end
    end
    cb(licenses)
end)

-- Handle license unsuspension & cleanup of old suspensions
Citizen.CreateThread(function()
    while true do
        local curDateTime = os.time()

        -- Unsuspend licenses
        MySQL.Async.fetchAll(
            "SELECT * FROM user_license_points", {}, function(results)
                local count = 0
                for _, license in ipairs(results) do
                    if license.suspended_until > 0 and license.suspended_until <= curDateTime then
                        MySQL.Async.execute(
                            "UPDATE user_license_points SET suspended_until = 0, points = 0 WHERE license_id = @license_id", {
                                ['@license_id'] = license.license_id,
                            }
                        )
                        count = count + 1
                    end
                end
                if count > 0 then
                    printDebug("Unsuspended "..count.." license(s)")
                end
            end
        )

        -- Cleanup old suspensions
        MySQL.Async.execute(
            "DELETE FROM user_license_suspensions WHERE suspended < @expiretime", {
                ['@expiretime'] = curDateTime - (Config.ExpireSuspension * 24 * 60 * 60)
            }, function(rowsChanged)
                if rowsChanged > 0 then
                    printDebug("Cleaned up "..rowsChanged.." suspensions")
                end
            end
        )

        Wait(Config.TaskTimer * 60 * 1000)
    end
end)