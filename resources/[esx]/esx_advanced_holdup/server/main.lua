ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

local copsConnected     = 0
local robberPlayers     = {}
local isCurrentlyRobbed = false
local lastRobbed        = 0

function CountCops()

	local xPlayers = ESX.GetPlayers()
	copsConnected  = 0

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			copsConnected = copsConnected + 1
		end
	end
	TriggerClientEvent('esx_advanced_holdup:copsConnected', -1, copsConnected)

	SetTimeout(60000, CountCops)

end

function AddMoneyToStores()

	for _, v in pairs(Config.Zones) do
		if v.MoneyRegeneration ~= nil then
			local MaxMoney   = v.MaxMoney
			local MoneyRegen = v.MoneyRegeneration
			if v.CurrentMoney < MaxMoney then
				v.CurrentMoney = v.CurrentMoney + MoneyRegen
			else
				v.CurrentMoney = MaxMoney
			end
		end
	end

	SetTimeout(Config.AddMoneyToStoresTimeOut * 60000, AddMoneyToStores)

end

function AddMoneyToBanks()

	for _, v in pairs(Config.Zones) do
		if v.MoneyRegeneration ~= nil then
			local partOfCurrentMoney                   = ESX.Round(v.CurrentMoney * Config.PercentCurrentMoney / 100)
			local randomMoneyToBank                    = math.random(partOfCurrentMoney,
																															 partOfCurrentMoney * Config.MaxRandomMultiplier)
			v.CurrentMoney                             = v.CurrentMoney - randomMoneyToBank
			Config.Zones[v.BankToDeliver].CurrentMoney = Config.Zones[v.BankToDeliver].CurrentMoney + randomMoneyToBank
			if Config.Zones[v.BankToDeliver].CurrentMoney > Config.Zones[v.BankToDeliver].MaxMoney then
				Config.Zones[v.BankToDeliver].CurrentMoney = Config.Zones[v.BankToDeliver].MaxMoney
			end
		end
	end

	SetTimeout(Config.AddMoneyToBanksTimeOut * 60000, AddMoneyToBanks)

end

RegisterServerEvent('esx_advanced_holdup:robberyCanceled')
AddEventHandler('esx_advanced_holdup:robberyCanceled', function(zone)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_advanced_holdup:robCompleteAtNotification', xPlayer.source, zone, false)
		end
	end

	if robberPlayers[_source] then
		robberPlayers[_source] = nil
		TriggerClientEvent('mythic_notify:client:SendErrorAlert', xPlayer.source, { text = _U('robbery_has_cancelled') })
	end

end)

RegisterServerEvent('esx_advanced_holdup:robberyInProgress')
AddEventHandler('esx_advanced_holdup:robberyInProgress', function(mainZone)

	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	if Config.Zones[mainZone] then

		local zone = Config.Zones[mainZone]

		if os.time() > (lastRobbed + Config.TimeBetweenRobs * 60) then

			if zone.Robbed ~= 0 and (os.time() - zone.Robbed) < zone.TimeBeforeNewRob then
				local timerNewRob = zone.TimeBeforeNewRob - (os.time() - zone.Robbed)
				TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source, { text = _U('already_robbed_1') })
				TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source,
													 { text = _U('already_robbed_2', timerNewRob) })
				return
			elseif copsConnected < zone.PoliceRequired then
				TriggerClientEvent('mythic_notify:client:SendErrorAlert', _source,
													 { text = _U('police_required', zone.PoliceRequired) })
				return
			end

			for i = 1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				local blip = {["x"] = Config.Zones[mainZone].Pos.x, ["y"] = Config.Zones[mainZone].Pos.y, ["z"] = Config.Zones[mainZone].Pos.z, ["longrange"] = true, ["text"] = "[PD] " .. mainZone .. " Robbery", ["sprite"] = 161, ["color"] = 1, ["scale"] = 2.0, ["duration"] = Config.Zones[mainZone].TimeToRob}
				if xPlayer.job.name == 'police' or xPlayer.job.name == 'journalist' then
					TriggerClientEvent('esx_advanced_holdup:robPoliceNotification', xPlayer.source, mainZone)
					TriggerClientEvent("tcrp-blips:addblip", xPlayers[i], blip)
				end
			end

			TriggerClientEvent('mythic_notify:client:SendSuccessAlert', _source, { text = _U('started_to_rob') })
			TriggerClientEvent('esx_advanced_holdup:startRobberingTimer', _source, mainZone)
			TriggerClientEvent('esx_advanced_holdup:setCooldown', _source)

			Config.Zones[mainZone].Robbed = os.time()
			robberPlayers[_source]        = mainZone
			local savedSource             = _source

			SetTimeout(zone.TimeToRob * 1000, function()

				if robberPlayers[savedSource] then
					if xPlayer then
						local payout = math.random(zone.CurrentMoney, zone.MaxMoney)
						xPlayer.addMoney(payout)
						TriggerClientEvent('esx_advanced_holdup:robCompleteNotification', xPlayer.source, payout)
						local pdnote = "Statement from store clerk:\nApproximately $" .. payout .. " was stolen from the safe."
						TriggerEvent("server:newNote", pdnote, zone.NotePos.x, zone.NotePos.y, zone.NotePos.z, true)

						for i = 1, #xPlayers, 1 do
							local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
							if xPlayer.job.name == 'police' then
								TriggerClientEvent('esx_advanced_holdup:robCompleteAtNotification', xPlayer.source,
																	 robberPlayers[savedSource], true)
							end
						end
					end
				end

			end)

			lastRobbed = os.time()

		else
			TriggerClientEvent('mythic_notify:client:SendErrorAlert', xPlayer.source,
												 { text = _U('robbery_already_in_progress') })
		end

	end

end)

CountCops()
AddMoneyToStores()
AddMoneyToBanks()
