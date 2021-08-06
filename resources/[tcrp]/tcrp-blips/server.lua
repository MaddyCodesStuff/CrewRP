ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)
onRadio = {}
RegisterNetEvent("tcrp-blips:emergencylist")
AddEventHandler("tcrp-blips:emergencylist", function(job, name)
    xPlayer = ESX.GetPlayerFromId(source)
    local src = source
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
        local firstname = result[1].firstname 
        local lastname = result[1].lastname
        name = firstname .. " " .. lastname
        print("nelisabutt")
        onRadio[src] = {
            ["source"] = src,
            ["job"] = job, 
            ["name"] = name,
            ["active"] = false,
        }
    end)
    onRadio[src]["active"] = true
end)

RegisterNetEvent("tcrp-blips:emergencytoggle")
AddEventHandler("tcrp-blips:emergencytoggle", function(toggle)
    local src = source
    print(src)
    print("nelisnotabutt")
    onRadio[src]["active"] = toggle
    for k, v in pairs(onRadio) do
        TriggerClientEvent("tcrp-blips:emergency", onRadio[k]["source"], onRadio)
    end
end)