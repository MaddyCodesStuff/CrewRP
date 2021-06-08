ESX           = nil
Citizen.CreateThread( function() while ESX == nil do TriggerEvent("esx:getSharedObject",function(obj) ESX = obj end) Citizen.Wait(0) end end)

RegisterNetEvent('tcrp-crime:handleLockpick')
AddEventHandler('tcrp-crime:handleLockpick', function()

    local player = GetPlayerPed(-1)
    local playercoords = GetEntityCoords(player)
    local robbery = nil
    for key, value in pairs(Config.Stores) do 
        
        local dist = GetDistanceBetweenCoords(playercoords, value.registercoords.x, value.registercoords.y, value.registercoords.z, true)
        
        if dist < value.robDistance then

            TriggerServerEvent('tcrp-crime:copCount', 'tcrp-crime:startStore', 'tcrp-crime:lowCopsAlert', Config.StorePDRequirement, true, value )
        
        elseif dist > value.robDistance and dist < 5 then
            TriggerEvent('tcrp:displayGeneral', "Get closer to the register to start the robbery!")
        end
    end
end)
RegisterNetEvent('tcrp-crime:startStore')
AddEventHandler('tcrp-crime:startStore', function(store)
    print(store)
    TriggerEvent('safecracking:start', Config.RegisterDials, 'tcrp-crime:registerSuccess', store)

end)

RegisterNetEvent('tcrp-crime:SafeToggle')
AddEventHandler('tcrp-crime:SafeToggle', function(store)

    store.saferobbable = true
    while store.saferobbable do
        Wait(0)
        local player = GetPlayerPed(-1)
        local playercoords = GetEntityCoords(player)
        local dist = GetDistanceBetweenCoords(playercoords, store.safecoords.x, store.safecoords.y, store.safecoords.z, true)

        if( dist > store.safeCancelDistance) then
            store.saferobbable = false
            TriggerEvent('tcrp:displayGeneral', "You went too far, and the safe was locked down!")
        else 
            if dist < store.robDistance then
                if displayed == false then

                TriggerEvent('tcrp:displayGeneral', "Press E to start cracking the safe.")
                    displayed = true
                end

                if IsControlJustPressed(0, 38) then
                    TriggerEvent('safecracking:start', Config.SafeDials, 'tcrp-crime:safeSuccess', store)
                    break
                end
            else
                displayed = false
            end
        end
    end
end)

