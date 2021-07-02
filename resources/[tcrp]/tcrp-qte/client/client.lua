local visible = false

RegisterCommand('qte', function()
    if visible == false then 
        print('im here mom')
        SendNUIMessage({

            action = 'showbar'

        })
        visible = true
    else
        visible = false
        SendNUIMessage({

            action = 'hidebar'

        })
    end 
end)