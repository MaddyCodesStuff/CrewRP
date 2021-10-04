-- Default key is E if you wish to change the key then go here: https://docs.fivem.net/game-references/controls/
--This does not have any permissions in it at all, you'll have to add that yourself.
oncooldown = false
local cooldown = 2000
RegisterCommand('tackle', function()
	if not oncooldown then
		local ped = PlayerPedId()
		oncooldown = true
		if not IsPedInAnyVehicle(ped, true) then
			if IsPedRunning(ped) or IsPedSprinting(ped) then
				local ForwardVector = GetEntityForwardVector(ped)
				SetPedToRagdollWithFall(ped, 1000, 0, 0, ForwardVector, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) --how long the tackler will remain down.
				local Tackled = {}
				while IsPedRagdoll(ped) do
					Citizen.Wait(0)
					for Key, Value in ipairs(getTouchedPlayers()) do
						if not Tackled[Value] then
							Tackled[Value] = true
							TriggerServerEvent('Tackle:Server:TacklePlayer', GetPlayerServerId(Value), ForwardVector, GetPlayerName(PlayerId()))
						end
					end
				end
			end
		end
	end
	Citizen.Wait(cooldown)
	oncooldown = false
end)

RegisterKeyMapping('tackle', "Tackle", 'keyboard', 'E')

RegisterNetEvent('Tackle:Client:TacklePlayer')
AddEventHandler('Tackle:Client:TacklePlayer',function(ForwardVector)
	SetPedToRagdollWithFall(PlayerPedId(), 3000, 3000, 0, ForwardVector, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) --how long the person being tackled will remain down.
end)

function getTouchedPlayers()
    local touchedPlayer = {}
    for Key, Value in ipairs(GetActivePlayers()) do
		if IsEntityTouchingEntity(PlayerPedId(), GetPlayerPed(Value)) then
			table.insert(touchedPlayer, Value)
		end
    end
    return touchedPlayer
end