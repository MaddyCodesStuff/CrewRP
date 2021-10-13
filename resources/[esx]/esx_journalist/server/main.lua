ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'journalist', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'journalist', 'Journalist', true, true)
TriggerEvent('esx_society:registerSociety', 'journalist', 'journalist', 'society_journalist', 'society_journalist', 'society_journalist', {type = 'public'})
