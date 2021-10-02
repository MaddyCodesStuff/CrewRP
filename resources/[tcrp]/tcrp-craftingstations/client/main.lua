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

		for k, v in pairs(Config.Stations) do
            local dist = #(pedCoords - v.pos)
            --DrawMarker(23, v.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 0, 100, 0, 0, 0, 0) --for testing
            if dist <= 1.40 then
                DisplayHelpText('Press ~INPUT_CONTEXT~ to ' .. v.Text)
                
                if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
                    OpenCraftingMenu(v.type)
                    TriggerEvent('emote:do', 'mechanic4')
                end 
            elseif dist < 1.45 then
                ESX.UI.Menu.CloseAll()
            end              		
		end
    end
end)

function OpenCraftingMenu(type)
	local ped = PlayerPedId()
	PlayerData = ESX.GetPlayerData()
	local elements = {}
    local CraftingType
    if type == "handguns" then
        CraftingType = Config.handguns
    elseif type == "shotguns" then
        CraftingType = Config.shotguns
    elseif type == "automaticRifles" then
        CraftingType = Config.automaticRifles
    elseif type == "longRifles" then
        CraftingType = Config.longRifles
    elseif type == "explosives" then
        CraftingType = Config.explosives
    elseif type == "components" then
        CraftingType = Config.components
    elseif type == "armor" then
        CraftingType = Config.armor
    elseif type == "medicine" then
        CraftingType = Config.medicine
    elseif type == "general" then
        CraftingType = Config.general
    elseif type == "electronics" then
        CraftingType = Config.electronics
    elseif type == "marijuana" then
        CraftingType = Config.marijuana
    elseif type == "drugs" then
        CraftingType = Config.drugs
    end

	for k, v in ipairs(CraftingType) do
		table.insert(elements, {
			label = v.label,
			value = v.type,
		})
	end
	
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = 'Crafting',
		align    = 'top-right',
		elements = elements,
    },
	
	function(data, menu)
		local spawnCode = data.current.value
        local name = data.current.label
		ESX.UI.Menu.CloseAll()
		TriggerServerEvent("crafting:CraftItem", name, spawnCode)
        TriggerEvent('emote:cancel')
    end,
	function(data, menu)
		menu.close()
        TriggerEvent('emote:cancel')
		end
	)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

