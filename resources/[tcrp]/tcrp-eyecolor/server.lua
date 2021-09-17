RegisterServerEvent('updateEyecolor')
AddEventHandler('updateEyecolor', function(eyecolor, player)
    _source = source
    id = GetPlayerIdentifier(_source, 0)
    MySQL.Async.fetchAll('UPDATE USERS SET eyecolor = @newcolor WHERE identifier = @identifier',
    {

        ['@newcolor'] = eyecolor,
        ['@identifier'] = id

    })
    TriggerEvent('tcrp-eyecolor:setEyecolor', player, _source)


end)
RegisterServerEvent('tcrp-eyecolor:setEyecolor')
AddEventHandler('tcrp-eyecolor:setEyecolor', function(player, id)
    _id =  id
    print(getEyeColor(_id))
    TriggerClientEvent('tcrp-eyecolor:UpdatePed', id, args)

end)

function getEyeColor(playerId)
    pid = playerId
    id = GetPlayerIdentifier(pid, 0)
    MySQL.Async.fetchAll("SELECT * FROM USERS WHERE identifier = @identifier",{

            ['@identifier'] =  id 
        }, function(results)
            if #results > 0 then
                return results[1].name
            else
                
            end


        end)
        
        
    
end