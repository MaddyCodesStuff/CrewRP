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

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		-- Rental Markers
		for k, v in pairs(Config.MarkerZones) do
			local dist = #(pedCoords - v.Menu)
			if dist < 10.0 then
                if v.Type == "boats" then
                    DrawMarker(1, v.Menu, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 255, 0, 100, 0, 0, 0, 0)
                else
				    DrawMarker(23, v.Menu, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 0, 100, 0, 0, 0, 0)
                end
				if dist <= 1.40 then
					DisplayHelpText('Press ~INPUT_CONTEXT~ to rent a vehicle.')
					
					if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
                        OpenRentalMenu(v.Spawn, v.SpawnHeading, v.Type)
					end 
				elseif dist < 1.45 then
					ESX.UI.Menu.CloseAll()
				end	
			end
		end
    end
end)

RegisterNetEvent('rentals:RentVehicle')
AddEventHandler('rentals:RentVehicle', function(model, xyz, h)
	RequestTheModel(model)
	veh = CreateVehicle(model, xyz, h, true, false)
	while not DoesEntityExist(veh) do
		Citizen.Wait(10)
	end
	TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
	DecorSetInt(veh, "ControlCar", 1)
	SetVehicleFuelLevel(veh, 100.0)
    DecorSetFloat(veh, "_FUEL_LEVEL",  GetVehicleFuelLevel(veh))
	SetModelAsNoLongerNeeded(model)
end)

function OpenRentalMenu(xyz, h, type)
	local ped = PlayerPedId()
	PlayerData = ESX.GetPlayerData()
	local elements = {}
    local rentalType
    if type == "car1" then
        rentalType = Config.PDMRentals
    elseif type == "car2" then
        rentalType = Config.LarrysRentals
    elseif type == "car3" then
        rentalType = Config.HelmutsRentals
    elseif type == "car4" then
        rentalType = Config.LSIARentals
    elseif type == "plane" then
        rentalType = Config.PlaneRentals
    elseif type == "karts" then
        rentalType = Config.KartRentals
    elseif type == "boats" then
        rentalType = Config.BoatRentals
    elseif type == "bikes" then
        rentalType = Config.BikeRentals
    end

	for k, v in ipairs(rentalType) do
		table.insert(elements, {
			label = ('%s - $%s'):format(GetLabelText(GetDisplayNameFromVehicleModel(v.car)), v.price),
			value = v.car,
            price = v.price
		})
	end
	
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = 'Rent a Vehicle',
		align    = 'top-right',
		elements = elements,
    },
	
	function(data, menu)
		local model = data.current.value
        local price = data.current.price
		ESX.UI.Menu.CloseAll()
		TriggerServerEvent("rentals:RentVehicle", price, model, xyz, h)
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

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end