ESX = nil

TriggerEvent(
    "esx:getSharedObject",
    function(obj)
        ESX = obj
    end
)

RegisterServerEvent('tcrp-gundealer:giveWeapon')
AddEventHandler('tcrp-gundealer:giveWeapon', function(recId)
    _source = source
    local canBuy = CheckTime(recId, _source)
    if canBuy then
        local xPlayer = ESX.GetPlayerFromId(recId)
        xPlayer.addWeapon('weapon_pistol', 200)
        UpdateTime(recId)
        TriggerClientEvent('tcrp:displayGeneral', _source, "You gave out a pistol.")
    else
        TriggerClientEvent('tcrp:displayGeneral', _source, "Buyer cannot buy another gun yet. They need to come back later.")
    end
end)

function CheckTime(recId, sender)
    local steamid = GetPlayerIdentifier( recId, 0 )
    
    local result = MySQL.Sync.fetchAll("SELECT * FROM USER_LICENSES WHERE owner= @id AND type = 'weapon'", {
        ['@id'] = steamid
        })
        if result then
            time = result[1].lastPurchase
            cooldownTime = time + Config.Cooldown
            print(cooldownTime)
            print(os.time())
           if os.time() >= cooldownTime then
               return true
           else
              return false
          end
       else
         TriggerClientEvent('tcrp:displayGeneral', sender, "Buyer does not have a weapons license.")
      end
end
function UpdateTime(recId)
    local id = GetPlayerIdentifier(recId, 0)
    MySQL.Async.execute("UPDATE USER_LICENSES SET lastPurchase = @time WHERE OWNER = @id and TYPE = 'weapon'", {
        ['@id'] = id,
        ['@time'] = os.time()
    }
    )

end

