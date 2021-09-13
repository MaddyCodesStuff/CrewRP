ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)
onRadio = {}
RegisterNetEvent("tcrp-blips:emergencylist")
AddEventHandler("tcrp-blips:emergencylist", function(_src)
    xPlayer = ESX.GetPlayerFromId(_src)
    local src = _src
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
        local firstname = result[1].firstname
        local lastname = result[1].lastname
        local job = result[1].job
        name = firstname .. " " .. lastname

        onRadio[src] = {
            ["source"] = src,
            ["job"] = job, 
            ["name"] = name,
            active = true
        }

    end)
end)

RegisterNetEvent("tcrp-blips:emergencytoggle")
AddEventHandler("tcrp-blips:emergencytoggle", function(toggle)
    TriggerEvent("tcrp-blips:emergencylist", source)
    local src = source
    for k,v in pairs(onRadio) do
        if k == source then
            v = true
        end
    end

    for k, v in pairs(onRadio) do
        TriggerClientEvent("tcrp-blips:emergency", onRadio[k]["source"], onRadio)
    end
end)

RegisterNetEvent("tcrp-blips:businesssign")
AddEventHandler("tcrp-blips:businesssign", function(toggle, id)
    if toggle then
        TriggerClientEvent("tcrp-blips:updateblip", -1, id, {["Info.statusLeft"] = "Status", ["Info.statusRight"] = "~g~Open", ["opacity"] = 255})
    else
        TriggerClientEvent("tcrp-blips:updateblip", -1, id, {["Info.statusLeft"] = "Status", ["Info.statusRight"] = "~r~Closed", ["opacity"] = 100})
    end
end)