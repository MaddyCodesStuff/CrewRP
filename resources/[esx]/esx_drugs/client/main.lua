Keys                   = {
	["ESC"]       = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"]         = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"]       = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"]      = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"]  = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"]      = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"]      = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"]    = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                    = nil
local menuOpen         = false
local wasOpen          = false
local informantSpawned = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.DrugDealer.coords, true) < 0.5 then
			if not menuOpen then
				ESX.ShowHelpNotification(_U('dealer_prompt'))

				if IsControlJustReleased(0, Keys['E']) then
					wasOpen = true
					OpenDrugShop()
				end
			else
				Citizen.Wait(500)
			end
		else
			if wasOpen then
				wasOpen = false
				ESX.UI.Menu.CloseAll()
			end

			Citizen.Wait(500)
		end
	end
end)

function OpenDrugShop()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen       = true

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.DrugDealerItems[v.name]

		if price and v.count > 0 then
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(v.label,
																			 _U('dealer_item',
																				ESX.Math.GroupDigits(price))),
				name  = v.name,
				price = price,

				-- menu properties
				type  = 'slider',
				value = 1,
				min   = 1,
				max   = v.count
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = _U('dealer_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('esx_drugs:sellDrug', data.current.name, data.current.value)
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

function OpenBuyLicenseMenu(licenseName)
	menuOpen       = true
	local license  = Config.LicensePrices[licenseName]

	local elements = {
		{
			label = _U('license_no'),
			value = 'no'
		},

		{
			label       = ('%s - <span style="color:green;">%s</span>'):format(license.label,
																			   _U('dealer_item',
																				  ESX.Math.GroupDigits(license.price))),
			value       = licenseName,
			price       = license.price,
			licenseName = license.label
		}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'license_shop', {
		title    = _U('license_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		if data.current.value ~= 'no' then
			ESX.TriggerServerCallback('esx_drugs:buyLicense', function(boughtLicense)
				if boughtLicense then
					ESX.ShowNotification(_U('license_bought', data.current.licenseName,
											ESX.Math.GroupDigits(data.current.price)))
				else
					ESX.ShowNotification(_U('license_bought_fail', data.current.licenseName))
				end
			end, data.current.value)
		else
			menu.close()
		end

	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

function CreateBlipCircle(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 1)
	SetBlipAlpha(blip, 128)

	-- create a blip in the middle
	blip = AddBlipForCoord(coords)

	SetBlipHighDetail(blip, true)
	SetBlipSprite(blip, sprite)
	SetBlipScale(blip, 1.0)
	SetBlipColour(blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

-- Updated function to make sure police/ems dont see the blips
Citizen.CreateThread(function()
	for k, zone in pairs(Config.CircleZones) do
		Citizen.Wait(1000)
		while not ESX.PlayerData.job do
			Citizen.Wait(500)
		end
		if ESX.PlayerData.job.name ~= 'police' and ESX.PlayerData.job.name ~= 'ambulance' and ESX.PlayerData.job.name ~= 'offpolice' and ESX.PlayerData.job.name ~= 'offambulance' then
			CreateBlipCircle(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
		end
	end
end)


-- Needs work. Not quite working as intended. Will fix.
function spawnInformant()
	local rand = math.random(#Config.Informant.Peds)
	local ped  = Config.Informant.Peds[rand]

	RequestModel(-459818001)
	while (not HasModelLoaded(-459818001)) do
		Citizen.Wait(1)
	end
	Citizen.Wait(100)
	informantPed = CreatePed(4, -459818001, ped.Spawnpoint.x, ped.Spawnpoint.y, ped.Spawnpoint.z, 90.0, true, true)
	TaskWanderStandard(informantPed, 10, 10)

	ForcePedMotionState(informantPed, "motionstate_walk", 0, 0, 0)

	if informantBlip then
		RemoveBlip(informantBlip)
	end

	informantSpawned = true

	informantBlip    = AddBlipForEntity(informantPed)
	SetBlipSprite(informantBlip, 133)
	SetBlipScale(informantBlip, 1)
	SetBlipColour(informantBlip, 11)
	SetBlipAlpha(informantBlip, 175)
	SetBlipDisplay(informantBlip, 4)
	SetBlipAsShortRange(informantBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Informant')
	EndTextCommandSetBlipName(informantBlip)
end

function despawnInformant()
	RemovePedElegantly(informantPed)
	informantSpawned = false

	RemoveBlip(informantBlip)
end

function updateInformantBlip()
	SetBlipCoords(informantBlip, GetEntityCoords(informantPed))
end

function TalkToPed()
	-- FreezeEntityPosition(informantPed,true)
	TaskTurnPedToFaceEntity(informantPed, PlayerPedId(), -1)
	TaskTurnPedToFaceEntity(PlayerPedId(), informantPed, 1000)
	Citizen.Wait(1000)
	OpenInformantMenu()
end

function UntalkToPed()
	ESX.UI.Menu.Close('default', GetCurrentResourceName(), 'informant')
	ClearPedTasksImmediately(informantPed)
	FreezeEntityPosition(informantPed, false)
end

function OpenInformantMenu()

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.DrugDealerItems[v.name]

		if price and v.count > 0 then
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(v.label,
																			 _U('dealer_item',
																				ESX.Math.GroupDigits(price))),
				name  = v.name,
				price = price,

				-- menu properties
				type  = 'slider',
				value = 1,
				min   = 1,
				max   = v.count
			})
		end
	end

	local elements = {}

	for k, v in pairs(Config.CircleZones) do
		table.insert(elements, {
			label = _U(v.name),
		})
	end
	local elements = {
		{ label = _U('marijuana_harvesting'), value = 'marijuana_harvesting' },
		{ label = _U('marijuana_processing'), value = 'marijuana_processing' },
		{ label = _U('cocaine_harvesting'), value = 'cocaine_harvesting' },
		{ label = _U('marijuana_processing'), value = 'cocaine_processing', }
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'informant',
					 {
						 title    = _U('menu_informer'),
						 align    = 'top',
						 elements = elements
					 }, function(data, menu)

			if data.current.value == 'marijuana_processing' then

			end

			ESX.ShowNotification(_U('map_marked'))

		end)
end
