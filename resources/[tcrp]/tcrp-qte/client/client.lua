RegisterCommand('qte', function()
        SendNUIMessage({

            action = 'showbar',
            difficulty = 15,
            min = 50,
            max = 65

        })
        SetNuiFocus(true,false)
end)

RegisterNUICallback('finish', function(data, cb)
    print(data)
    SetNuiFocus(false,false)
    cb('ok')

end)