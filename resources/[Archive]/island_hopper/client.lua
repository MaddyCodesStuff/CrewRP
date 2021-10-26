local islandVec = vector3(4840.571, -5174.425, 2.0)
local loadIsland = false

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(1)
		if loadIsland then
			Citizen.InvokeNative("0x9A9D1BA639675CF1", "HeistIsland", true)  -- load the map and removes the city
			Citizen.InvokeNative("0x5E1460624D194A38", true) -- load the minimap/pause map and removes the city minimap/pause map

			-- misc natives
			Citizen.InvokeNative(0xF74B1FFA4A15FBEA, true)
			Citizen.InvokeNative(0x53797676AD34A9AA, false)    
			SetScenarioGroupEnabled('Heist_Island_Peds', true)

			-- audio stuff
			SetAudioFlag('PlayerOnDLCHeist4Island', true)
			SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Zones', true, true)
			SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Disabled_Zones', false, true)
		else
			Citizen.InvokeNative("0x9A9D1BA639675CF1", "HeistIsland", false)
			Citizen.InvokeNative("0x5E1460624D194A38", false)

			-- misc natives
			Citizen.InvokeNative(0xF74B1FFA4A15FBEA, false)
			Citizen.InvokeNative(0x53797676AD34A9AA, true)    
			SetScenarioGroupEnabled('Heist_Island_Peds', false)

			-- audio stuff
			SetAudioFlag('PlayerOnDLCHeist4Island', false)
			SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Zones', true, true)
			SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Disabled_Zones', false, true)
		end
    end
end)

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(1)
		local pCoords = GetEntityCoords(GetPlayerPed(-1))		
			local distance1 = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, 4840.571, -5174.425, 2.0, false)
			if distance1 < 2000.0 then
				loadIsland = true
			else
				loadIsland = false
			end
    end
end)

function GoToIsland()
	loadIsland = true
	SetEntityCoords(PlayerPedId(-1),3953.56, -4692.22, 4.18)
	SetEntityHeading(PlayerPedId(-1),290.74)
end

function LeaveIsland()
	loadIsland = false
	SetEntityCoords(PlayerPedId(-1),1293.10, -3341.82,5.90)
	SetEntityHeading(PlayerPedId(-1),280.54)
end

RegisterCommand('gotoisland',function() 
	GoToIsland()
end)

RegisterCommand('leaveisland', function() 
	LeaveIsland()
end)