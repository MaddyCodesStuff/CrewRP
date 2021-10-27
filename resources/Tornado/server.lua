--FILE EDITED BY SPJESTER
-- Note: New Wording in chat for active Tornado.
local IsTornadoActive = false
local TornadoPosition = nil
local TornadoDestination = nil
local TornadoGirth = 8.0
local ace_perm = "rhys19.tornado"
local debug = false
isAdmin = false
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function checkPerms(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return (xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin')
end

RegisterServerEvent("tornado:summon")
AddEventHandler("tornado:summon", function(source)
	local player = source
    ped = GetPlayerPed(player)
    pos = GetEntityCoords(ped)
    print(ped)
    print(source)
    print(pos)
    local start = pos
    local destination = pos
    if start==destination then
        destination = pos
    end
    TornadoPosition = pos, heading
    TornadoDestination = pos, heading
    IsTornadoActive = true
    TriggerClientEvent("tornado:spawn", -1, pos, heading)
 end)

RegisterServerEvent("tornado:move_here")
AddEventHandler("tornado:move_here", function(x,y,z)
    if x~=nil and y~=nil and z~=nil then
        TornadoDestination = x,y,z, heading
        if not IsTornadoActive then
            TornadoPosition = x,y,z, heading
           if debug then print("[TORNADO WARNING!!] A tornado has been spotted at " .. TornadoPosition.x .. ", " .. TornadoPosition.y .. ", " .. TornadoPosition.z) end
        end
        IsTornadoActive = true
        TriggerClientEvent("tornado:spawn", -1, TornadoPosition, TornadoDestination)
       if debug then print("[TORNADO WARNING!!] A tornado is moving towards " .. x .. ", " .. y .. ", " .. z) end
    end
end)

RegisterServerEvent("tornado:summon_right_her")
AddEventHandler("tornado:summon_right_here", function(x,y,z)
	  x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(source), 0.0, 8.0, 0.5))
    if x~=nil and y~=nil and z~=nil then
        TornadoPosition = x,y,z, heading
        if not IsTornadoActive then
            TornadoDestination = x,y,z, heading
        end
        IsTornadoActive = true
        TriggerClientEvent("tornado:spawn", -1, x,y,z, heading)		
    end
end)





AddEventHandler("onResourceStart", function(name)
    if name == GetCurrentResourceName() then
        ProcessAces()
        if debug then print("[DEBUG][" .. GetCurrentResourceName() .. "] ^6Resource [ " .. GetCurrentResourceName() .. " ] was (re)started, syncing aces to all players.^0") end
    end
end)


Citizen.CreateThread(function()
    while true do
        ProcessAces()
        Citizen.Wait(60000) -- lets check every minute
    end
end)

function ProcessAces()
	if GetNumPlayerIndices() > 0 then -- don't do it when there aren't any players
        for i=0, GetNumPlayerIndices()-1 do -- loop through all players
            player = tonumber(GetPlayerFromIndex(i))
            Citizen.Wait(0)
            if IsPlayerAceAllowed(player, ace_perm) then
                TriggerClientEvent("sendAcePermissionToClient", player, true)
                TriggerEvent("admincheck", player, true)
                if debug then print("[DEBUG][" .. GetCurrentResourceName() .. "] ^5Syncronising player aces, sending to client...^0") end
            end
        end
    end
	
end

RegisterNetEvent("admincheck")
AddEventHandler("admincheck", function(state)
    isAdmin = state
end)

RegisterServerEvent("tornado:delete")
AddEventHandler("tornado:delete", function()
    IsTornadoActive = false
    TriggerClientEvent("tornado:delete", -1)
end)
RegisterServerEvent("tornado:update")
AddEventHandler("tornado:update", function()
    return vec3(10000.0, 10000.0, 0.0)
end)

RegisterCommand('tornado:summon', function(source, args, raw)
    local player = source
    if checkPerms(source) then
        print(source)
        
        TriggerEvent("tornado:summon", player)
    end
end)

RegisterCommand('tornado:delete', function(source, args, raw)
    if checkPerms(source) then
        TriggerEvent("tornado:delete")
    end
end)