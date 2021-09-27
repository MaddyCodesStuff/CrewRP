local PlayerData              = {}

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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    Citizen.Wait(5000)
end)


function GunDealerMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gundealer_actions',{
    
       title = "Gun Dealer",
       align = "top-right",
       elements ={
               {label = "Give Weapon", value = "give_weapon"},
               { label = "Issue Invoice", value = 'issue_invoice' }
           }
       }, function(data, menu)
        if data.current.value == "give_weapon" then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                    local recipID = GetPlayerServerId(closestPlayer)
                    TriggerServerEvent('tcrp-gundealer:giveWeapon', recipID)
                else
                    TriggerEvent('mythic_notify:client:SendErrorAlert',
                                 { text = 'No one near by to give a weapon to.' })
                end
            elseif data.current.value == "issue_invoice" then
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                    IssueInvoice(closestPlayer)
                else
                    TriggerEvent('mythic_notify:client:SendErrorAlert',
                                 { text = 'You must be next to someone to issue an invoice.' })
                end
            end
        end, function(data,menu)
        menu.close()
    end)
end

-- Invoice player
function IssueInvoice(player)
    function issueInvoiceCallback(value)
        local fine_amount = tonumber(value)

        if fine_amount == nil then
            ESX.ShowNotification("Please specify a dollar value.")
            TriggerEvent('tcrp-input:OpenInput', 'Invoice Amount', 'number', 11, issueInvoiceCallback)
        else
            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_gundealer',
                               'Invoice: Ammunation', fine_amount)
        end
    end

    TriggerEvent('tcrp-input:OpenInput', 'Invoice Amount', 'number', 11, issueInvoiceCallback)
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