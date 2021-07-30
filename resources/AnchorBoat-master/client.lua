--[[ 
	AnchorBoat
    Copyright (C) 2018  Thaisen
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ]]

local anchored = false
local boat = nil
Citizen.CreateThread(function()
	while true do

		Wait(0)
		local ped = GetPlayerPed(-1)
		if IsPedInAnyBoat(ped) then
		boat  = GetVehiclePedIsIn(ped, true)
		end
		if IsControlJustPressed(1, 81) and not IsPedInAnyVehicle(ped) and boat ~= nil then
			if not anchored then
				SetBoatAnchor(boat, true)
				TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Citizen.Wait(10000)
				TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Boat anchored.'})
				ClearPedTasks(ped)
			else
				TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Citizen.Wait(10000)
				SetBoatAnchor(boat, false)
				TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Boat anchor removed.'})
				ClearPedTasks(ped)
			end
			anchored = not anchored
		end
				if IsVehicleEngineOn(boat) then
			anchored = false
		end
	end
end)
