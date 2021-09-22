-- SHOW DIRT LEVEL IN CONSOLE - NOTE: THIS WILL SPAM EVERY 0.2 SECONDS WHILE USING HOSE
local printDirtLevel = false

local hoseHash = GetHashKey("WEAPON_HOSE")
local aiming = nil
local targetVeh	= nil

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local playerID = PlayerId()
		local playerPed = GetPlayerPed(-1)
	
		local curWeapon = GetSelectedPedWeapon(playerPed)

		--if player has the fire hose out, then start checking if they are aiming at a vehicle
		if curWeapon == hoseHash then
		
			aiming, targetVeh = GetEntityPlayerIsFreeAimingAt(playerID)
			if aiming then
				if DoesEntityExist(targetVeh) and IsEntityAVehicle(targetVeh) then
				
					local dirtLevel = GetVehicleDirtLevel(targetVeh)
					local newDirtLevel = dirtLevel - 0.05
					
					while IsControlPressed(0, 142) and dirtLevel > 0.00 do
						 
						Wait(10)
						dirtLevel = GetVehicleDirtLevel(targetVeh)
						newDirtLevel = dirtLevel - 0.01
					
						SetVehicleDirtLevel(targetVeh, newDirtLevel)

						if printDirtLevel then print(dirtLevel) end
						
						--once the dirt level is low enough, set it to zero so we don't end up on 0.09
						if dirtLevel <= 0.1 then SetVehicleDirtLevel(targetVeh, 0.0) end
						
					end
					
					-- trigger server sync when the player stops firing the hose
					if IsControlJustReleased(0, 142) then
					
						dirtLevel = GetVehicleDirtLevel(targetVeh)				
						TriggerServerEvent('wash_car:sync', targetVeh, dirtLevel)
					end

				end
			end
			
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Set vehicle dirt level (called from server)
-----------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setDirt')
AddEventHandler('setDirt', function(vehicle, dirtLevel)	
	
	SetVehicleDirtLevel(vehicle, dirtLevel)

end )