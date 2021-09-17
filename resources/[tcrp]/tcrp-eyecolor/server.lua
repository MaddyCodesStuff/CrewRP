RegisterServerEvent('updateEyecolor')
AddEventHandler('updateEyecolor', function(eyecolor)
    _source = source

    MySQL.Async.execute('UPDATE USERS SET eyecolor = @newcolor WHERE identifier = @identifier',
    {

        ['@newcolor'] = eyecolor,
        identifier = GetPlayerIdentifier(_source, 1)

    })
    TriggerEvent('tcrp-eyecolor:setEyecolor', source)


end)
RegisterServerEvent('tcrp-eyecolor:setEyecolor')
AddEventHandler('tcrp-eyecolor:setEyecolor', function()

    _source = source
    ped = GetPlayerPed(_source)
    SetPedEyeColor(ped, getEyeColor(_source))

end)

function getEyeColor(playerId)
    
    MySQL.Async.execute('SELECT eyecolor FROM USERS WHERE `identifier` = @identifier',
    {

        ['@newcolor'] = eyecolor,
        identifier = GetPlayerIdentifier(_source, 1)

    })
end