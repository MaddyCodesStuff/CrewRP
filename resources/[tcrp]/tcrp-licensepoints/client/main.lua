function getLabel(license_name)
    return Config.Licenses[license_name].label and Config.Licenses[license_name].label or license_name:gsub("^%l", string.upper)
end
RegisterNetEvent('tcrp-licensepoints:notifyNoLicense')
AddEventHandler('tcrp-licensepoints:notifyNoLicense', function()
    local nMsg =  'They do not have a valid license.'
    TriggerEvent('tcrp:displayGeneral', nMsg)
end)
RegisterNetEvent('tcrp-licensepoints:notifyPoints')
AddEventHandler('tcrp-licensepoints:notifyPoints', function(license_name, points)
    license_name = getLabel(license_name)
    local pMsg = license_name..' license now has '..points..' points.'
    TriggerEvent('tcrp:displayGeneral', pMsg)
end)

RegisterNetEvent('tcrp-licensepoints:notifySuspend')
AddEventHandler('tcrp-licensepoints:notifySuspend', function(license_name)
    license_name = getLabel(license_name)
    local sMsg = license_name .. ' license is suspended.'
    TriggerEvent('tcrp:displayGeneral', sMsg)
end)