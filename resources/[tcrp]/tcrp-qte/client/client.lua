local visible = false

RegisterCommand('qte', function()
    if visible == false then
        SendNUIMessage({

            action = 'showbar',
            difficulty = 3

        })
        visible = true
    else
        visible = false
        SendNUIMessage({

            action = 'hidebar'

        })
    end 
end)