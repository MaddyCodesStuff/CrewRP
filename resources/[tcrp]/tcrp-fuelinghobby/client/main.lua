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


for _, v in ipairs(Config.Processing) do
	if v.onMap then
		local blip = AddBlipForCoord(v.pos)
		SetBlipSprite (blip, v.blip)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, v.colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.Text)
		EndTextCommandSetBlipName(blip)
	end
end

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		-- Sell markers
		for k, v in ipairs(Config.Processing) do
			local dist = #(pedCoords - v.pos)
			if dist < 50.0 then
                local playerInCar = IsPedSittingInAnyVehicle(ped)
				DrawMarker(25, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				if dist < 3.0 then
					ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to '.. v.type)
					if IsControlJustReleased(0, Keys['E']) and v.type == 'Gather Oil' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "gather_oil",
                            duration        = 5000,
                            label           = "Drilling for Oil",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = true,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = 'anim@amb@nightclub@mini@drinking@bar@drink@base',
                                anim = 'outro_bartender',
                            },
                        }, function(status)
                            TriggerServerEvent('fueling:gatherOil')
                        end)
                    elseif IsControlJustReleased(0, Keys['E']) and v.type == 'Refine Oil' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "refine_oil",
                            duration        = 30000,
                            label           = "Refining Oil",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = false,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = "misscarsteal4@vendor",
                                anim     = "idle_b_vendor",
                                flags    = 49,
                            },
                        }, function(status)
                            TriggerServerEvent('fueling:refineOil')
                        end)
                    elseif IsControlJustReleased(0, Keys['E']) and v.type == 'Sell Essence' and playerInCar == false then
                        exports['mythic_progbar']:Progress({
                            name            = "sell_oil",
                            duration        = 30000,
                            label           = "Selling Oil",
                            useWhileDead    = false,
                            canCancel       = false,
                            controlDisables = {
                                disableMovement    = false,
                                disableCarMovement = true,
                                disableMouse       = false,
                                disableCombat      = true,
                            },
                            animation       = {
                                animDict = "misscarsteal4@vendor",
                                anim     = "idle_b_vendor",
                                flags    = 49,
                            },
                        }, function(status)
                            TriggerServerEvent('fueling:sellOil')
                        end)
					end
				end
			end
		end
    end
end)