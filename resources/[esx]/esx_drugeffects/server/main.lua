ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

for drug, drug_details in pairs(Config.UsableDrugItems) do
    ESX.RegisterUsableItem(drug, function(source)
        local _source          = source
        local xPlayer          = ESX.GetPlayerFromId(_source)
        local has_requirements = true

        if drug_details.requires then
            for _, requirement in pairs(drug_details.requires) do
                if requirement.items then
                    local match = false
                    for __, req in pairs(requirement.items) do
                        if xPlayer.getInventoryItem(req) then
                            match = true
                            break
                        end
                    end
                    if not match then
                        has_requirements = false
                        TriggerClientEvent("mythic_notify:client:SendErrorAlert", _source,
                                           { text = "You need a " .. requirement.name .. " to do " .. ESX.GetItemLabel(drug) })
                    end
                else
                    if not xPlayer.getInventoryItem(requirement.name) or xPlayer.getInventoryItem(requirement.name).count < 1 then
                        has_requirements = false
                        TriggerClientEvent("mythic_notify:client:SendErrorAlert", _source,
                                           { text = "You need a " .. ESX.GetItemLabel(requirement.name) .. " to do " .. ESX.GetItemLabel(drug) })
                    end
                end
            end
        end

        if has_requirements then
            if drug_details.requires then
                for _, requirement in pairs(drug_details.requires) do
                    if requirement.consumable then
                        xPlayer.removeInventoryItem(requirement.name, 1)
                    end
                end
            end
            xPlayer.removeInventoryItem(drug, 1)
            TriggerClientEvent('esx_status:add', _source, 'drug', drug_details.drug_power)
            TriggerClientEvent('esx_drugeffects:doDrug', source, drug_details.drug)
        end
    end)
end

ESX.RegisterUsableItem('xanax', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('xanax', 1)

    TriggerClientEvent('esx_status:remove', _source, 'drug', 249000)
end)