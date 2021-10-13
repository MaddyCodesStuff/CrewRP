---------------------------------------------------------------------------
-- Important Variables --
---------------------------------------------------------------------------
local SpawnedSpikes = {}
local SpawnedGurney = {}
local spikemodel = "P_ld_stinger_s"
local gurneymodel = "v_med_bed2"
local nearGurney = false
local gurneySpawned = false
local nearSpikes = false
local spikesSpawned = false
local ped = PlayerPedId()
local chickenhash = GetHashKey('a_c_hen')

---------------------------------------------------------------------------
-- Checking Distance To Spikestrips --
---------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        if IsPedInAnyVehicle(LocalPed(), false) then
            local vehicle = GetVehiclePedIsIn(LocalPed(), false)
            if GetPedInVehicleSeat(vehicle, -1) == LocalPed() then
                local vehiclePos = GetEntityCoords(vehicle, false)
                local spikes = GetClosestObjectOfType(vehiclePos.x, vehiclePos.y, vehiclePos.z, 80.0, GetHashKey(spikemodel), 1, 1, 1)
                local spikePos = GetEntityCoords(spikes, false)
                local distance = Vdist(vehiclePos.x, vehiclePos.y, vehiclePos.z, spikePos.x, spikePos.y, spikePos.z)

                if spikes ~= 0 then
                    nearSpikes = true
                else
                    nearSpikes = false
                end
            else
                nearSpikes = false
            end
        else
            nearSpikes = false
        end

        Citizen.Wait(0)
    end
end)

---------------------------------------------------------------------------
-- Tire Popping --
---------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        if nearSpikes then
            local tires = {
                {bone = "wheel_lf", index = 0},
                {bone = "wheel_rf", index = 1},
                {bone = "wheel_lm", index = 2},
                {bone = "wheel_rm", index = 3},
                {bone = "wheel_lr", index = 4},
                {bone = "wheel_rr", index = 5}
            }

            for a = 1, #tires do
                local vehicle = GetVehiclePedIsIn(LocalPed(), false)
                local tirePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tires[a].bone))
                local spike = GetClosestObjectOfType(tirePos.x, tirePos.y, tirePos.z, 15.0, GetHashKey(spikemodel), 1, 1, 1)
                local spikePos = GetEntityCoords(spike, false)
                local distance = Vdist(tirePos.x, tirePos.y, tirePos.z, spikePos.x, spikePos.y, spikePos.z)

                if distance < 1.8 then
                    if not IsVehicleTyreBurst(vehicle, tires[a].index, true) or IsVehicleTyreBurst(vehicle, tires[a].index, false) then
                        SetVehicleTyreBurst(vehicle, tires[a].index, false, 1000.0)
                    end
                end
            end
        end

        Citizen.Wait(0)
    end
end)

---------------------------------------------------------------------------
-- Keypresses Deletion Event --
---------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        if spikesSpawned then
            if IsControlPressed(1, 20) then
                RemoveSpikes()
                spikesSpawned = false
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        if gurneySpawned then
            if IsControlPressed(1, 20) then
                RemoveGurney()
                gurneySpawned = false
            end
        end
        Citizen.Wait(0)
    end
end)

---------------------------------------------------------------------------
-- Spawn Spikes Event --
---------------------------------------------------------------------------
RegisterNetEvent("usableitems:SpawnSpikes")
AddEventHandler("usableitems:SpawnSpikes", function(config)
        TriggerEvent('emote:do', 'pickup')
        CreateSpikes(2)
end)

---------------------------------------------------------------------------
-- Delete Spikes Event --
---------------------------------------------------------------------------
RegisterNetEvent("usableitems:DeleteSpikes")
AddEventHandler("usableitems:DeleteSpikes", function(netid)
    TriggerEvent('emote:do', 'pickup')
    Citizen.CreateThread(function()
        local spike = NetworkGetEntityFromNetworkId(netid)
        DeleteEntity(spike)
    end)
end)

---------------------------------------------------------------------------
-- Extra Functions - Spikes --
---------------------------------------------------------------------------
function CreateSpikes(amount)
    local spawnCoords = GetOffsetFromEntityInWorldCoords(LocalPed(), 0.0, 2.0, 0.0)
    for a = 1, amount do
        local spike = CreateObject(GetHashKey(spikemodel), spawnCoords.x, spawnCoords.y, spawnCoords.z, 1, 1, 1)
        local netid = NetworkGetNetworkIdFromEntity(spike)
        SetNetworkIdExistsOnAllMachines(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        SetEntityHeading(spike, GetEntityHeading(LocalPed()))
        PlaceObjectOnGroundProperly(spike)
        spawnCoords = GetOffsetFromEntityInWorldCoords(spike, 0.0, 4.0, 0.0)
        table.insert(SpawnedSpikes, netid)
    end
    spikesSpawned = true
end

Citizen.CreateThread(function()
    while true do
        local dev = false

        if dev then
            local plyOffset = GetOffsetFromEntityInWorldCoords(LocalPed(), 0.0, 2.0, 0.0)
            DrawMarker(0, plyOffset.x, plyOffset.y, plyOffset.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0)
            local spike = GetClosestObjectOfType(plyOffset.x, plyOffset.y, plyOffset.z, 80.0, GetHashKey(spikemodel), 1, 1, 1)
            Citizen.Trace("NETID: " .. ObjToNet(spike))
        end
        Citizen.Wait(0)
    end
end)

function RemoveSpikes()
    for a = 1, #SpawnedSpikes do
        TriggerServerEvent("usableitems:TriggerDeleteSpikes", SpawnedSpikes[a])
    end
    SpawnedSpikes = {}
end

function LocalPed()
    return GetPlayerPed(PlayerId())  
end

function DisplayNotification(string)
	SetTextComponentFormat("STRING")
	AddTextComponentString(string)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

---------------------------------------------------------------------------
-- Lighter --
---------------------------------------------------------------------------
RegisterNetEvent("usableitems:lighter")
AddEventHandler("usableitems:lighter", function(source)
        TriggerEvent('emote:do', 'pickup')
        StartLighterFire(source)
end)

function StartLighterFire(source)
    local spawnCoords = GetOffsetFromEntityInWorldCoords(LocalPed(), 0.0, 2.0, 0.0)
      Wait(2000)
      StartScriptFire(spawnCoords.x, spawnCoords.y, spawnCoords.z-1, 3, true)
end

---------------------------------------------------------------------------
-- Spawn Gurney Event --
---------------------------------------------------------------------------
RegisterNetEvent("usableitems:SpawnGurney")
AddEventHandler("usableitems:SpawnGurney", function(Source)
        TriggerEvent('emote:do', 'pickup')
        CreateGurney(1)
end)

function CreateGurney(amount)
    local spawnCoords = GetOffsetFromEntityInWorldCoords(LocalPed(), 0.0, 2.0, 0.0)
    for a = 1, amount do
        local gurney = CreateObject(GetHashKey(gurneymodel), spawnCoords.x, spawnCoords.y, spawnCoords.z, 1, 1, 1)
        local netid = NetworkGetNetworkIdFromEntity(gurney)
        SetNetworkIdExistsOnAllMachines(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        SetEntityHeading(gurney, GetEntityHeading(LocalPed()))
        PlaceObjectOnGroundProperly(gurney)
        spawnCoords = GetOffsetFromEntityInWorldCoords(gurney, 0.0, 4.0, 0.0)
        table.insert(SpawnedGurney, netid)
    end
    gurneySpawned = true
end

---------------------------------------------------------------------------
-- Delete Gurney Event --
---------------------------------------------------------------------------
RegisterNetEvent("usableitems:DeleteGurney")
AddEventHandler("usableitems:DeleteGurney", function(netid)
    TriggerEvent('emote:do', 'pickup')
    Citizen.CreateThread(function()
        local gurney = NetworkGetEntityFromNetworkId(netid)
        DeleteEntity(gurney)
    end)
end)

function RemoveGurney()
    for a = 1, #SpawnedGurney do
        TriggerServerEvent("usableitems:TriggerDeleteGurney", SpawnedGurney[a])
    end
    SpawnedGurney = {}
end

---------------------------------------------------------------------------
-- Spawn Chicken Event --
---------------------------------------------------------------------------
RequestModel(chickenhash)
while not HasModelLoaded(chickenhash) do Citizen.Wait(0) end

RegisterNetEvent("usableitems:chicken")
AddEventHandler("usableitems:chicken", function(source)
        TriggerEvent('emote:do', 'pickup')
        CreateChicken(source)
end)

function CreateChicken(source)
    Wait(1000)
    local spawnCoords = GetOffsetFromEntityInWorldCoords(LocalPed(), 0.0, 2.0, 0.0)
    local chickenped = CreatePed(28, chickenhash, spawnCoords.x, spawnCoords.y, spawnCoords.z-1, 0.0, true, true)
    TaskWanderStandard(chickenped,10.0,10)
end