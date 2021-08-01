ESX               = nil
Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(10)
      end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer ~= nil then
              if xPlayer.getInventoryItem('radio').count == 0 then
                local source = xPlayers[i]
                TriggerClientEvent('ls-radio:onRadioDrop', source)
                break
              end
            end
        end
    end
end)