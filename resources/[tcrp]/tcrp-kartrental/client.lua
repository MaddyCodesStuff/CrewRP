ESX = nil
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if ESX ~= nil then
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local Keys = {
	["1"] = 185, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["E"] = 38, ["X"] = 73
}
		
for _, info in pairs(Config.MarkerZones) do
	info.blip = AddBlipForCoord(info.Marker)
	SetBlipSprite(info.blip, 17)
	SetBlipDisplay(info.blip, 0)
	SetBlipScale(info.blip, 0.8)
	SetBlipColour(info.blip, 74)
	SetBlipAsShortRange(info.blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Vehicle Rental")
	EndTextCommandSetBlipName(info.blip)
end
	
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		-- Rental Markers
		for k, v in pairs(Config.MarkerZones) do
			local dist = #(pedCoords - v.Marker)
			if dist < 10.0 then
				DrawMarker(1, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.1, 255, 255, 0, 150, 0, 0, 0, 0)
				if dist <= 1.40 then
					DisplayHelpText('Press ~INPUT_CONTEXT~ to rent a vehicle')
					
					if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
						OpenVehicleMenu(v.Spawn, v.SpawnHeading)
					end 
				elseif dist < 1.45 then
					ESX.UI.Menu.CloseAll()
				end	
			end
			dist = #(pedCoords - v.Return)
			if dist < 15.0 and IsPedInAnyVehicle(ped) then
				DrawMarker(1, v.Return, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.1, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if dist < 2.0 then
					if DoesEntityExist(veh) and GetVehiclePedIsIn(ped) == veh then
						DisplayHelpText('Press ~INPUT_CONTEXT~ to return the vehicle')
						if IsControlJustReleased(0, Keys['E']) then
							SetEntityAsMissionEntity(veh)
							DeleteEntity(veh)
							TriggerServerEvent("deleteThisEntity", NetworkGetNetworkIdFromEntity(veh))
							SetEntityCoords(ped, v.Marker)
						end
					else
						DisplayHelpText('This is not a rented vehicle')
					end
				end
			end
		end
    end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('rental:RentVehicle')
AddEventHandler('rental:RentVehicle', function(model, xyz, h)
	RequestTheModel(model)
	veh = CreateVehicle(model, xyz, h, true, false)
	while not DoesEntityExist(veh) do
		Citizen.Wait(10)
	end
	TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
	DecorSetInt(veh, "ControlCar", 1)
	ESX.ShowNotification("You have paid a $" .. Config.RentalPrice .. " rental fee.")
	SetVehicleFuelLevel(veh, 100.0)
    DecorSetFloat(veh, "_FUEL_LEVEL",  GetVehicleFuelLevel(veh))
	SetModelAsNoLongerNeeded(model)
end)

function OpenVehicleMenu(xyz, h)
	local ped = PlayerPedId()
	PlayerData = ESX.GetPlayerData()
	local elements = {}

	for k, v in ipairs(Config.RentalVehicle) do
		table.insert(elements, {
			label = ('%s - $%s'):format(GetLabelText(GetMakeNameFromVehicleModel(v)), ESX.Math.GroupDigits(Config.RentalPrice)),
			value = v
		})
	end
	
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = 'Rent a vehicle',
		align    = 'top-right',
		elements = elements,
    },
	
	function(data, menu)
		local model = data.current.value
		ESX.UI.Menu.CloseAll()
		TriggerServerEvent("rental:RentVehicle", Config.RentalPrice, model, xyz, h)
    end,
	function(data, menu)
		menu.close()
		end
	)
end

function RequestTheModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end