ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

local beds            = {}
beds[1]               = {
    -- ICU (Autodoc places in beds down the list from top to bottom if beds are occupied, so ICU should alwyas be first in lists)
    { x = 324.27, y = -582.65, z = 44.2, h = 338.00, taken = false, model = 1631638868 },
    { x = 322.62, y = -587.23, z = 44.2, h = 158.00, taken = false, model = 1631638868 },
    { x = 319.42, y = -581.00, z = 44.2, h = 338.00, taken = false, model = 1631638868 },
    { x = 317.66, y = -585.47, z = 44.2, h = 158.00, taken = false, model = 1631638868 },
    { x = 314.45, y = -584.25, z = 44.2, h = 158.00, taken = false, model = 1631638868 },
    { x = 313.94, y = -578.93, z = 44.2, h = 338.00, taken = false, model = 1631638868 },
    { x = 311.03, y = -583.07, z = 44.2, h = 158.00, taken = false, model = 1631638868 },
    { x = 309.39, y = -577.25, z = 44.2, h = 338.00, taken = false, model = 1631638868 },
    { x = 307.68, y = -581.86, z = 44.2, h = 158.00, taken = false, model = 1631638868 },
    -- Private Room 369
    { x = 361.46, y = -581.33, z = 44.19, h = 248.00, taken = false, model = 1631638868 },
    -- Private Room 370
    { x = 359.68, y = -586.26, z = 44.21, h = 248.00, taken = false, model = 1631638868 },
     -- Patient Room 371
    { x = 363.93, y = -589.15, z = 44.21, h = 248.00, taken = false, model = 1631638868 },
    { x = 365.08, y = -585.99, z = 44.21, h = 248.00, taken = false, model = 1631638868 },
    { x = 366.62, y = -581.69, z = 44.21, h = 248.00, taken = false, model = 1631638868 },
    -- Private Room 374
    { x = 354.48, y = -600.18, z = 44.21, h = 248.00, taken = false, model = 1631638868 },
    -- Upper Ward B Hallway
    { x = 330.65, y = -570.20, z = 43.98, h = 340.00, taken = false, model = 1631638868 },
    -- Elevator Chamber
    { x = 325.65, y = -601.98, z = 44.00, h = 161.93, taken = false, model = 1631638868 },
    -- Upper Lobby
    { x = 322.16, y = -589.44, z = 43.99, h = 70.05, taken = false, model = 1631638868 },
    -- Upper OR1
    { x = 315.50, y = -566.15, z = 44.28, h = 338.00, taken = false, model = 1631638868 },
    -- Upper OR2
    { x = 321.00, y = -568.00, z = 44.26, h = 339.61, taken = false, model = 1631638868 },
    -- Upper OR3
    { x = 326.87, y = -570.83, z = 44.26, h = 338.00, taken = false, model = 1631638868 },
    -- Upper MRI
    { x = 337.09, y = -575.03, z = 44.19, h = 338.00, taken = false, model = 1631638868 },
    -- Upper X-Ray
    { x = 348.47, y = -579.29, z = 44.20, h = 338.00, taken = false, model = 1631638868 },
    -- Lower Lobby
    { x = 348.41, y = -596.18, z = 29.50, h = 75.62, taken = false, model = 1631638868 },
    { x = 341.38, y = -574.51, z = 29.84, h = 338.00, taken = false, model = 1631638868 },
    -- Lower ICU (Behind locked doors, or I'd put them up higher in the list, or make them a seperate autodoc list alltogether)
    { x = 351.81, y = -568.82, z = 29.72, h = 160.00, taken = false, model = 1631638868 },
    { x = 355.26, y = -570.02, z = 29.72, h = 160.00, taken = false, model = 1631638868 },
    { x = 358.60, y = -571.28, z = 29.72, h = 160.00, taken = false, model = 1631638868 },
    { x = 361.14, y = -564.41, z = 29.72, h = 338.00, taken = false, model = 1631638868 },
    { x = 357.76, y = -563.16, z = 29.72, h = 338.00, taken = false, model = 1631638868 },
    { x = 354.35, y = -561.95, z = 29.72, h = 338.00, taken = false, model = 1631638868 },
    -- Lower Hallways
    { x = 325.64, y = -586.09, z = 29.50, h = 67.29, taken = false, model = 1631638868 },
    { x = 327.54, y = -562.97, z = 29.76, h = 249.08, taken = false, model = 1631638868 },
    { x = 318.71, y = -572.73, z = 29.84, h = 160.68, taken = false, model = 1631638868 },
    -- Lower Lookout Room/Quarantine
    { x = 346.77, y = -576.03, z = 29.84, h = 70.00, taken = false, model = 1631638868 },
    { x = 348.60, y = -571.08, z = 29.50, h = 70.00, taken = false, model = 1631638868 },
    { x = 355.30, y = -573.38, z = 29.78, h = 70.00, taken = false, model = 1631638868 },
    { x = 366.64, y = -568.27, z = 29.50, h = 248.00, taken = false, model = 1631638868 },
    { x = 365.15, y = -572.05, z = 29.50, h = 248.00, taken = false, model = 1631638868 },
    -- Lower OR1
    { x = 336.60, y = -574.91, z = 29.78, h = 157.00, taken = false, model = 1631638868 },
    -- Lower OR2
    { x = 330.13, y = -572.61, z = 29.78, h = 157.00, taken = false, model = 1631638868 },
    -- Lower Morgue Slabs
    { x = 307.23, y = -574.53, z = 29.84, h = 157.00, taken = false, model = 1631638868 },
    { x = 310.22, y = -575.65, z = 29.84, h = 157.00, taken = false, model = 1631638868 },
    { x = 304.12, y = -573.27, z = 29.84, h = 157.00, taken = false, model = 1631638868 },
    { x = 303.57, y = -567.52, z = 29.84, h = 70.00, taken = false, model = 1631638868 },
    -- Lower Autopsy Rooms
    { x = 323.47, y = -576.72, z = 29.78, h = 70.00, taken = false, model = 1631638868 },
    { x = 322.25, y = -580.27, z = 29.78, h = 70.00, taken = false, model = 1631638868 },
}
-- Sandy Medical
beds[2]               = {
    -- ICU
    { x = 1819.98, y = 3669.52, z = 35.2, h = 119.36, taken = false, model = 2117668672 },
    { x = 1818.49, y = 3672.25, z = 35.2, h = 119.36, taken = false, model = 2117668672 },
    { x = 1817.02, y = 3674.62, z = 35.2, h = 119.36, taken = false, model = 2117668672 },
    { x = 1818.23, y = 3677.90, z = 35.2, h = 30.00, taken = false, model = 2117668672 },
    { x = 1820.85, y = 3679.35, z = 35.2, h = 30.00, taken = false, model = 2117668672 },
    { x = 1823.34, y = 3680.86, z = 35.2, h = 30.00, taken = false, model = 2117668672 },
    -- Hallway Surgey Tabel
    { x = 1834.12, y = 3685.64, z = 35.32, h = 207.0, taken = false, model = 2117668672 },
    -- OR 1
    { x = 1825.73, y = 3685.48, z = 35.25, h = 152.00, taken = false, model = 2117668672 },
    -- OR 2
    { x = 1834.77, y = 3691.29, z = 35.25, h = 288.00, taken = false, model = 2117668672 },
    { x = 1835.89, y = 3689.06, z = 35.25, h = 278.00, taken = false, model = 2117668672 },
}
-- Paleto Medical
beds[3]               = {
    -- ICU
    { x = -257.67, y = 6321.85, z = 33.35, h = 133.00, taken = false, model = 2117668672 },
    { x = -260.16, y = 6324.15, z = 33.35, h = 133.00, taken = false, model = 2117668672 },
    { x = -262.39, y = 6326.53, z = 33.35, h = 133.00, taken = false, model = 2117668672 },
    { x = -258.78, y = 6330.05, z = 33.35, h = 313.73, taken = false, model = 2117668672 },
    { x = -256.49, y = 6327.79, z = 33.35, h = 313.72, taken = false, model = 2117668672 },
    -- Hallway Beds
    { x = -256.32, y = 6319.34, z = 33.13, h = 134.00, taken = false, model = 2117668672 },
    { x = -259.66, y = 6312.22, z = 33.35, h = 134.00, taken = false, model = 2117668672 },
    -- Surgery Tabels
    { x = -248.44, y = 6316.45, z = 33.36, h = 225.40, taken = false, model = 2117668672 },
    { x = -250.64, y = 6314.14, z = 33.36, h = 226.40, taken = false, model = 2117668672 },
}

local bedsTaken       = {}
local injuryBasePrice = 25

AddEventHandler('playerDropped', function()
    if bedsTaken[source] ~= nil then
        beds[bedsTaken[source]["hospital"]][bedsTaken[source]["bed"]].taken = false
    end
end)

RegisterServerEvent('mythic_hospital:server:RequestBed')
AddEventHandler('mythic_hospital:server:RequestBed', function(hospital)
    for k, v in pairs(beds[hospital]) do
        if not v.taken then
            v.taken                       = true
            bedsTaken[source]             = {}
            bedsTaken[source]["bed"]      = k
            bedsTaken[source]["hospital"] = hospital
            TriggerClientEvent('mythic_hospital:client:SendToBed', source, k, v)
            return
        end
    end

    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'No Beds Available' })
end)

RegisterServerEvent('mythic_hospital:server:RPRequestBed')
AddEventHandler('mythic_hospital:server:RPRequestBed', function(plyCoords, hospital)
    local foundbed = false
    for k, v in pairs(beds[hospital]) do
        local distance = #(vector3(v.x, v.y, v.z) - plyCoords)
        if distance < 2 then
            if not v.taken then
                v.taken  = true
                foundbed = true
                TriggerClientEvent('mythic_hospital:client:RPSendToBed', source, k, v)
                return
            else
                TriggerEvent('mythic_chat:server:System', source, 'That Bed Is Taken')
            end
        end
    end

    if not foundbed then
        TriggerEvent('mythic_chat:server:System', source, 'Not Near A Hospital Bed')
    end
end)

RegisterServerEvent('mythic_hospital:server:EnteredBed')
AddEventHandler('mythic_hospital:server:EnteredBed', function(lped)
    local src       = source
    local injuries  = GetCharsInjuries(src)
    local totalBill = injuryBasePrice
    if injuries ~= nil then
        for k, v in pairs(injuries.limbs) do
            if v.isDamaged then
                totalBill = totalBill + (injuryBasePrice * v.severity)
            end
        end
        if injuries.isBleeding > 0 then
            totalBill = totalBill + (injuryBasePrice * injuries.isBleeding)
        end
    end
    -- Uncomment to enable price increase per EMS on duty and extra cost for a revive if no EMS are on duty
    --[[if lped and emsnumber == 0 then
        totalBill = totalBill + 100
    end
    
    --if emsnumber > 0 then
        totalBill = totalBill + (emsnumber * 100)
    end]]

    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeBank(totalBill)
    TriggerRevive()
    TriggerClientEvent('esx:showNotification', src,
                       'You Were Billed $' .. totalBill .. ' For Medical Services & Expenses')
    TriggerClientEvent('mythic_hospital:client:FinishServices', src)
end)

RegisterServerEvent('mythic_hospital:server:LeaveBed')
AddEventHandler('mythic_hospital:server:LeaveBed', function(hospital, id)
    beds[hospital][id].taken = false
end)
-- Checks if any PD/EMS/FD are on duty, if not, Revives the player
RegisterServerEvent('mythic_hospital:server:emscounts')
AddEventHandler('mythic_hospital:server:emscounts', function(lped)
    revsrc = source
    emsnumber    = 0
    fdnumber     = 0
    pdnumber     = 0
	local playerList = ESX.GetPlayers()
	for i = 1, #playerList, 1 do
		local _source   = playerList[i]
		local xPlayer   = ESX.GetPlayerFromId(_source)
		local playerjob = xPlayer.job.name
		if playerjob == 'ambulance' then
			emsnumber = emsnumber + 1
        elseif playerjob == 'fireman' then
            fdnumber = fdnumber + 1
        elseif playerjob == 'police' then
            pdnumber = pdnumber + 1
		end
        --print ("Event check: PD " .. pdnumber .. " EMS " .. emsnumber .. " FD " .. fdnumber)
	end
    function TriggerRevive()
        --print ("Function Check: PD " .. pdnumber .. " EMS " .. emsnumber .. " FD " .. fdnumber)
        if emsnumber + fdnumber + pdnumber <= 0 and lped then
            Citizen.Wait(4400)
            TriggerClientEvent('esx_ambulancejob:revive', revsrc)
        end
    end
end)
-- Uncomment to enable Time increase per ems on duty
--[[ESX.RegisterServerCallback('mythic_hospital:client:emstransfer', function(source, cb)
    --Citizen.Trace('Server Callback Function: ' ..emsnumber)
    cb(emsnumber)
 end)]]

 ESX.RegisterServerCallback('mythic_hospital:client:numbersdebug', function(source, cb)
    --Citizen.Trace('Server Callback Function: ' ..emsnumber)
    cb(emsnumber, fdnumber, pdnumber, revsrc)
 end)