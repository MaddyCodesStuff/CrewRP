active = false
local qteKeys = {44,32,38,45}
RegisterCommand('qte', function()
        SendNUIMessage({

            action = 'showbar',
            difficulty = 15

        })
        SetNuiFocus(true,false)
end)

RegisterNUICallback('finish', function(data, cb)
    SetNuiFocus(false,false)
    cb('ok')

end)