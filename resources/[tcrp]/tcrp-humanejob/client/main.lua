local Keys                                               = {
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

ESX                                                      = nil
local PlayerData                                         = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local Blips                   = {}

local isInMarker              = false
local isInPublicMarker        = false
local hintIsShowed            = false
local hintToDisplay           = "no hint to display"

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    Citizen.Wait(5000)
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do

      Wait(0)
      if IsJobTrue() then

          local coords      = GetEntityCoords(GetPlayerPed(-1))
          local isInMarker  = false
          local currentZone = nil

          for k,v in pairs(Config.Zones) do
              if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                  isInMarker  = true
                  currentZone = k
              end
          end

          if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
              HasAlreadyEnteredMarker = true
              LastZone                = currentZone
              TriggerEvent('tcrp-humane:hasEnteredMarker', currentZone)
          end

          if not isInMarker and HasAlreadyEnteredMarker then
              HasAlreadyEnteredMarker = false
              TriggerEvent('tcrp-humane:hasExitedMarker', LastZone)
          end

      end

  end
end)


-- Display markers
Citizen.CreateThread(function()
  while true do
      Wait(0)
      if IsJobTrue() then

          local coords = GetEntityCoords(GetPlayerPed(-1))

          for k,v in pairs(Config.Zones) do
              if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
                  DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
              end
          end
      end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0,  Keys['E']) and IsJobTrue() then

        if CurrentAction == 'menu_vault' then
            OpenVaultMenu()
        end
        
        if CurrentAction == 'menu_boss_actions' and IsGradeBoss() then

          local options = {
            wash      = Config.EnableMoneyWash,
          }

          ESX.UI.Menu.CloseAll()

          TriggerEvent('esx_society:openBossMenu', 'humane', function(data, menu)

            menu.close()
            CurrentAction     = 'menu_boss_actions'
            CurrentActionMsg  = ('Press E to Access Boss Actions')
            CurrentActionData = {}

          end,options)

        end        
        CurrentAction = nil
      end
    end

    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'humane' then
      if IsControlJustReleased(0, Keys['F6']) then
          OpenMobileAmbulanceActionsMenu()
      end
  else
      Citizen.Wait(500)
  end
  end
end)

AddEventHandler('tcrp-humane:hasEnteredMarker', function(zone)
 
  if zone == 'BossActions' and IsGradeBoss() then
    CurrentAction     = 'menu_boss_actions'
    CurrentActionMsg  = ('Press E to Open Boss Actions')
    CurrentActionData = {}
  end

  if Config.EnableVaultManagement then
    if zone == 'Vaults' then
      CurrentAction     = 'menu_vault'
      CurrentActionMsg  = ('Press E to Access Storage')
      CurrentActionData = {}
    end
  end	
end)

AddEventHandler('tcrp-humane:hasExitedMarker', function(zone)

  CurrentAction = nil
  ESX.UI.Menu.CloseAll()

end)

function OpenVaultMenu()

  if Config.EnableVaultManagement then

    local elements = {
      {label = ('Withdraw Weapon'), value = 'get_weapon'},
      {label = ('Deposit Weapon'), value = 'put_weapon'},
      {label = ('Withdraw Item'), value = 'get_stock'},
      {label = ('Deposit Item'), value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault',
      {
        title    = 'Storage',
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'get_weapon' then
          OpenGetWeaponMenu()
        end

        if data.current.value == 'put_weapon' then
          OpenPutWeaponMenu()
        end

        if data.current.value == 'put_stock' then
           OpenPutStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_vault'
        CurrentActionMsg  = ('Press E to Access Storage')
        CurrentActionData = {}
      end
    )

  end

end

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('tcrp-humane:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = 'Humane Item Storage',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = ('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification('quantity_invalid')
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('tcrp-humane:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

  ESX.TriggerServerCallback('tcrp-humane:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = ('inventory'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = ('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification('Invalid Quantity')
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('tcrp-humane:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)


end

function OpenGetWeaponMenu()

  ESX.TriggerServerCallback('tcrp-humane:getVaultWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault_get_weapon',
      {
        title    = "Weapon Inventory",
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('tcrp-humane:removeVaultWeapon', function()
          OpenGetWeaponMenu()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutWeaponMenu()

  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vault_put_weapon',
    {
      title    = 'Deposit Weapon',
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)

      menu.close()

      ESX.TriggerServerCallback('tcrp-humane:addVaultWeapon', function()
        OpenPutWeaponMenu()
      end, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function IsJobTrue()
  if PlayerData ~= nil then
      local IsJobTrue = false
      if PlayerData.job ~= nil and PlayerData.job.name == 'humane' then
          IsJobTrue = true
      end
      return IsJobTrue
  end
end

function IsGradeBoss()
  if PlayerData ~= nil then
      local IsGradeBoss = false
      if PlayerData.job.grade_name == 'boss' then
          IsGradeBoss = true
      end
      return IsGradeBoss
  end
end



function OpenMobileAmbulanceActionsMenu()

	ESX.UI.Menu.CloseAll()

	local menuElements = {
		{ label = ('Humane Menu'), value = 'citizen_interaction' },
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions',
					 {
						 title    = ('Humane'),
						 align    = 'top-right',
						 elements = menuElements
					 }, function(data, menu)

			if data.current.value == 'citizen_interaction' then
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
								 {
									 title    = ('Humane - Treatments'),
									 align    = 'top-right',
									 elements = {
										 { label = ('Perform Field Treatment'), value = 'big' },
										 { label = ('Field Treat Injuries'), value = 'limbs' },
										 { label = ('Field Treat Bleeding'), value = 'bleed' }
									 }
								 }, function(data, menu)
						if IsBusy then
							return
						end

						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

						if closestPlayer == -1 or closestDistance > 5.0 then
							ESX.ShowNotification(('No Players Nearby'))
						else
							if data.current.value == 'limbs' then
								TriggerEvent('esx_ambulancejob:healLimbs', closestPlayer)
							elseif data.current.value == 'bleed' then
								TriggerEvent('esx_ambulancejob:healBleed', closestPlayer)
							elseif data.current.value == 'big' then
								TriggerEvent('esx_ambulancejob:healBig', closestPlayer)
							end
						end
					end, function(data, menu)
						menu.close()
					end
				)
			end

		end, function(data, menu)
			menu.close()
		end
	)
end
