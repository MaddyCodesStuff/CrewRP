-- ESX crap
local ESX

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end
end)

-- Start action for local client
RegisterNetEvent('tcrp-carrypiggy:start')
AddEventHandler('tcrp-carrypiggy:start', function(action)
    local targetPlayer, dist = ESX.Game.GetClosestPlayer()

    if targetPlayer > 0 and dist <= 3.0 then
        local targetPed = GetPlayerPed(targetPlayer)
        -- If already in an action, cancel it
        if IsEntityAttachedToEntity(targetPed, GetPlayerPed(-1)) then
            TriggerServerEvent('tcrp-carrypiggy:stopTarget', GetPlayerServerId(targetPlayer))
            TriggerEvent('emote:cancel')
        else
            TriggerServerEvent('tcrp-carrypiggy:startTarget', GetPlayerServerId(targetPlayer), action)
            TriggerEvent('emote:do', Config.ActionEmotes[action].source)
            -- Chancel sprint if configured to
            if Config.ActionDetails[action].disableSprint then
                Citizen.CreateThread(function()
                    Wait(1000)
                    while IsEntityAttachedToEntity(targetPed, GetPlayerPed(-1)) do
                        DisableControlAction(0, 21)
                        Wait(1)
                    end
                end)
            end
        end
    end
end)

-- Starts the action for the target client
RegisterNetEvent('tcrp-carrypiggy:startTarget')
AddEventHandler('tcrp-carrypiggy:startTarget', function(sourcePlayer, action)
    local conf = Config.ActionDetails[action]
    if Config.ActionEmotes[action].target then
        TriggerEvent('emote:do', Config.ActionEmotes[action].target)
    end
    AttachEntityToEntity(GetPlayerPed(-1), GetPlayerPed(GetPlayerFromServerId(sourcePlayer)), 0, conf.pos.x, conf.pos.y, conf.pos.z,
        conf.rot.x, conf.rot.y, conf.rot.z, false, false, false, conf.fixed, 2, conf.fixed)
end)