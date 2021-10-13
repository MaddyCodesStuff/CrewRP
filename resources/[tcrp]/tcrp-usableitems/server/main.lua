ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local xPlayer = ESX.GetPlayerFromId(source)

---------------------------------------------------------------------------
-- Delete Spikestrips --
---------------------------------------------------------------------------
RegisterServerEvent("usableitems:TriggerDeleteSpikes")
AddEventHandler("usableitems:TriggerDeleteSpikes", function(netid)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("usableitems:DeleteSpikes", source, netid)
    xPlayer.addInventoryItem('spikestrips', 0.5)
end)

---------------------------------------------------------------------------
-- Usable Items --
---------------------------------------------------------------------------
ESX.RegisterUsableItem('spikestrips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local src = source

    xPlayer.removeInventoryItem('spikestrips', 1)
    TriggerClientEvent("usableitems:SpawnSpikes", src)
    TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = "Press Z to Pick Up Spike Strips"})
end)

ESX.RegisterUsableItem('lighter', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local src = source

    TriggerClientEvent("usableitems:lighter", source)
end)