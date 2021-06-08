ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)
TriggerEvent('esx_society:registerSociety', 'cityclerk', 'City Clerk', 'society_cityclerk', 'society_cityclerk',
             'society_cityclerk', { type = 'public' })