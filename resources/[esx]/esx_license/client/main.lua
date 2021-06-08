Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx_license:showRevokeMenu')
AddEventHandler('esx_license:showRevokeMenu', function(license_types)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'revoke_license_list',
                     {
                         title    = "Revoke Licenses",
                         align    = 'top-right',
                         elements = license_types
                     }, function(data, menu)
            local license_type  = data.current.value
            local license_label = data.current.label
            ESX.TriggerServerCallback('esx_license:getLicensesByType', function(licenses)
                local elements2 = {
                    head = { 'Owner', 'Action' },
                    rows = {},
                }
                for i = 1, #licenses, 1 do
                    local name = licenses[i].firstname .. ' ' .. licenses[i].lastname
                    table.insert(elements2.rows, {
                        data = { owner = licenses[i].owner, license = licenses[i].type, name = name },
                        cols = {
                            name,
                            '{{Revoke|revoke}}'
                        }
                    })
                end
                if #elements2.rows > 0 then
                    ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'revoke_license', elements2,
                                     function(data2, menu2)
                                         if data2.value == 'revoke' then
                                             menu2.close()
                                             TriggerServerEvent('esx_license:removeLicense', data2.data.owner,
                                                                data2.data.license)
                                             TriggerEvent('mythic_notify:client:SendSuccessAlert',
                                                          { text = "Revoked " .. data2.data.license .. " license from " .. data2.data.name })
                                         end
                                     end, function(data2, menu2)
                            menu2.close()
                        end)
                else
                    TriggerEvent('mythic_notify:client:SendErrorAlert',
                                 { text = "No licenses of type: " .. license_type })
                end
            end, license_type)
        end, function(data, menu)
            menu.close()
        end)
end)

RegisterNetEvent('esx_license:showIssueMenu')
AddEventHandler('esx_license:showIssueMenu', function(license_types)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'issue_licenses',
                     {
                         title    = "Issue Licenses",
                         align    = 'top-right',
                         elements = license_types
                     }, function(data, menu)
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                local license_type  = data.current.value
                local license_label = data.current.label

                ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
                    if hasLicense then
                        TriggerEvent('mythic_notify:client:SendErrorAlert',
                                     { text = "This person already has their " .. license_label })
                    else
                        TriggerServerEvent('esx_license:addLicense', GetPlayerServerId(closestPlayer), license_type)
                        TriggerEvent('mythic_notify:client:SendSuccessAlert', { text = license_label .. " issued." })
                    end
                end, GetPlayerServerId(closestPlayer), license_type)
            else
                TriggerEvent('mythic_notify:client:SendErrorAlert', { text = "No one nearby." })
            end
        end, function(data, menu)
            menu.close()
        end)
end)