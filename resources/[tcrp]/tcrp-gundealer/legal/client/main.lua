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


RegisterNetEvent('tcrp-gundealer')
AddEventHandler('tcrp-gundealer', function()



end)

function GunDealerMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gundealer_actions',{
    
       title = "Gun Dealer",
       align = "top-right",
       elements ={
               {label = "Give Weapon", value = "give_weapon"},
           }
       }, function(data, menu)
        if data.current.value == "give_weapon" then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                    print("check1")
                    local recipID = GetPlayerServerId(closestPlayer)
                    TriggerServerEvent('tcrp-gundealer:giveWeapon', recipID)
                else
                    TriggerEvent('mythic_notify:client:SendErrorAlert',
                                 { text = 'No one near by to give a weapon to.' })
                end
            end
        end, function(data,menu)
        menu.close()
    end)
end

-- Handle Key Presses
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if IsControlJustReleased(0, 167) and PlayerData.job ~= nil and PlayerData.job.name == 'gundealer' then
            GunDealerMenu()
        end
    end
end)