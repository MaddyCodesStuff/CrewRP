local ragdoll = false
ESX = nil
local shownHelp = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

RegisterCommand('ragdoll', function()
    --print(IsPedGettingIntoAVehicle(GetPlayerPed(-1)))
    if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        ragdoll = not ragdoll
        Citizen.CreateThread(function()
            while ragdoll do
                SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
            end
        end)
        if not ragdoll then
            shownHelp = false
        end
    end
    -- Don't ragdoll if player is dead
    --if IsPlayerDead(PlayerId()) and ragdoll == true then
        --  ragdoll = false
        --shownHelp = false
    --end
    --if ragdoll == true and not shownHelp then
        --  ESX.ShowHelpNotification("Press ~INPUT_VEH_PREV_RADIO~ to stand up")
        --shownHelp = true
    --end
end)

RegisterNetEvent('ragdoll:toggle')
AddEventHandler('ragdoll:toggle', function()
    ragdoll = not ragdoll
    if not ragdoll then
        shownHelp = false
    end
end)

RegisterNetEvent('ragdoll:set')
AddEventHandler('ragdoll:set', function(value)
    ragdoll = value
    if not ragdoll then
        shownHelp = false
    end
end)

RegisterKeyMapping('ragdoll','Ragdoll', 'keyboard', 'U')