ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

----
ESX.RegisterUsableItem('gauze', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('gauze', 1)

    TriggerClientEvent('mythic_hospital:items:gauze', source)
end)

ESX.RegisterUsableItem('bandage', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bandage', 1)

    TriggerClientEvent('mythic_hospital:items:bandage', source)
end)

ESX.RegisterUsableItem('firstaid', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('firstaid', 1)

    TriggerClientEvent('mythic_hospital:items:firstaid', source)
end)

ESX.RegisterUsableItem('medkit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('medkit', 1)

    TriggerClientEvent('mythic_hospital:items:medkit', source)
end)

ESX.RegisterUsableItem('medikit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('medikit', 1)

    TriggerClientEvent('mythic_hospital:items:medikit', source)
end)

ESX.RegisterUsableItem('vicodin', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('vicodin', 1)

    TriggerClientEvent('mythic_hospital:items:vicodin', source)
end)

ESX.RegisterUsableItem('hydrocodone', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hydrocodone', 1)

    TriggerClientEvent('mythic_hospital:items:hydrocodone', source)
end)

ESX.RegisterUsableItem('morphine', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('morphine', 1)

    TriggerClientEvent('mythic_hospital:items:morphine', source)
end)

ESX.RegisterUsableItem('tylenol', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tylenol', 1)

    TriggerClientEvent('mythic_hospital:items:tylenol', source)
end)