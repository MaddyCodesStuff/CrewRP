ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local xPlayer = ESX.GetPlayerFromId(source)

---------------------------------------------------------------------------
-- Delete Spikestrips --
---------------------------------------------------------------------------
RegisterServerEvent("Spikes:TriggerDeleteSpikes")
AddEventHandler("Spikes:TriggerDeleteSpikes", function(netid)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("Spikes:DeleteSpikes", source, netid)
    xPlayer.addInventoryItem('spikestrips', 0.5)
end)

---------------------------------------------------------------------------
-- Usable Item --
---------------------------------------------------------------------------
ESX.RegisterUsableItem('spikestrips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local src = source

    xPlayer.removeInventoryItem('spikestrips', 1)
    TriggerClientEvent("Spikes:SpawnSpikes", src)
    TriggerClientEvent('mythic_notify:client:SendErrorAlert', source, { text = "Press Z to Pick Up Spike Strips"})
end)