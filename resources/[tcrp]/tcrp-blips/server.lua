ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)
onRadio = {}
adminblips = {}
RegisterNetEvent("tcrp-blips:emergencylist")
AddEventHandler("tcrp-blips:emergencylist", function(job)
    xPlayer = ESX.GetPlayerFromId(source)
    local src = source
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
        local firstname = result[1].firstname 
        local lastname = result[1].lastname
        local name = firstname .. " " .. lastname
        onRadio[src] = {
            ["source"] = src,
            ["job"] = job, 
            ["name"] = name,
        }
        for k, v in pairs(onRadio) do
            TriggerClientEvent("tcrp-blips:emergency", onRadio)
        end
    end)
end)

RegisterNetEvent('tcrp-blips:removeEmergency')
AddEventHandler('tcrp-blips:removeEmergency', function()
    local src = source
    onRadio[src] = nil
    for key, value in pairs(onRadio) do 
        TriggerClientEvent('tcrp-blips:emergency', onRadio)
    end



end)

RegisterNetEvent("tcrp-blips:emergencydisable")
AddEventHandler("tcrp-blips:emergencydisable", function()
    for k, v in pairs(onRadio) do
        TriggerClientEvent("tcrp-blips:emergencyoff", source, onRadio[k]["source"])
        TriggerClientEvent("tcrp-blips:emergencyoff", onRadio[k]["source"], source)
    end
end)