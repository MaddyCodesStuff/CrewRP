ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

local hospitalCheckin  = {}
hospitalCheckin[1]     = { x = 311.99, y = -592.71, z = 43.28, h = 165.13, d = 1.0 }
hospitalCheckin[2]     = { x = 1832.75, y = 3677.09, z = 34.27, h = 64.51, d = 1.6 }
hospitalCheckin[3]     = { x = -251.99, y = 6334.84, z = 32.43, h = 350.55, d = 1.6 }
pillboxTeleports       = {
    { x = 325.48892211914, y = -598.75372314453, z = 43.291839599609, h = 64.513374328613, text = 'Press ~INPUT_CONTEXT~ ~s~to go to lower Pillbox Entrance' },
    { x = 355.47183227539, y = -596.26495361328, z = 28.773477554321, h = 245.85662841797, text = 'Press ~INPUT_CONTEXT~ ~s~to enter Pillbox Hospital' },
    { x = 359.57849121094, y = -584.90911865234, z = 28.817169189453, h = 245.85662841797, text = 'Press ~INPUT_CONTEXT~ ~s~to enter Pillbox Hospital' },
}

local bedOccupying     = nil
local bedObject        = nil
local bedOccupyingData = nil

local inBedDict        = "anim@gangops@morgue@table@"
local inBedAnim        = "ko_front"
local getOutDict       = 'switch@franklin@bed'
local getOutAnim       = 'sleep_getup_rubeyes'
local inBed            = false

ESX                    = nil
local hospital         = 0

RegisterCommand('bed', function()
    TriggerEvent('mythic_hospital:client:RPCheckPos')
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

function PrintHelpText(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function LeaveBed()
    RequestAnimDict(getOutDict)
    while not HasAnimDictLoaded(getOutDict) do
        Citizen.Wait(0)
    end

    SetEntityHeading(PlayerPedId(), bedOccupyingData.h - 90)
    TaskPlayAnim(PlayerPedId(), getOutDict, getOutAnim, 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerServerEvent('mythic_hospital:server:LeaveBed', hospital, bedOccupying)

    FreezeEntityPosition(bedObject, false)

    bedOccupying     = nil
    bedObject        = nil
    bedOccupyingData = nil
end

function CheckIn()
    if (GetEntityHealth(PlayerPedId()) < 200) or (IsInjuredOrBleeding()) then
        exports['mythic_progbar']:Progress({
                                               name            = "hospital_action",
                                               duration        = 10500,
                                               label           = "Checking In",
                                               useWhileDead    = true,
                                               canCancel       = true,
                                               controlDisables = {
                                                   disableMovement    = true,
                                                   disableCarMovement = true,
                                                   disableMouse       = false,
                                                   disableCombat      = true,
                                               },
                                               animation       = {
                                                   animDict = "missheistdockssetup1clipboard@base",
                                                   anim     = "base",
                                                   flags    = 49,
                                               },
                                               prop            = {
                                                   model    = "p_amb_clipboard_01",
                                                   bone     = 18905,
                                                   coords   = { x = 0.10, y = 0.02, z = 0.08 },
                                                   rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                               },
                                               propTwo         = {
                                                   model    = "prop_pencil_01",
                                                   bone     = 58866,
                                                   coords   = { x = 0.12, y = 0.0, z = 0.001 },
                                                   rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                               },
                                           }, function(status)
            if not status then
                TriggerServerEvent('mythic_hospital:server:RequestBed', hospital)
            end
        end)
    else
        exports['mythic_notify']:DoHudText('error', 'You do not need medical attention')
    end
end

RegisterNetEvent('mythic_hospital:client:RPCheckPos')
AddEventHandler('mythic_hospital:client:RPCheckPos', function()
    if hospital > 0 then
        TriggerServerEvent('mythic_hospital:server:RPRequestBed', GetEntityCoords(PlayerPedId()), hospital)
    end
end)

RegisterNetEvent('mythic_hospital:client:RPSendToBed')
AddEventHandler('mythic_hospital:client:RPSendToBed', function(id, data)
    bedOccupying     = id
    bedOccupyingData = data

    bedObject        = GetClosestObjectOfType(data.x, data.y, data.z, 1.0, data.model, false, false, false)
    FreezeEntityPosition(bedObject, true)

    SetEntityCoords(PlayerPedId(), data.x, data.y, data.z)

    RequestAnimDict(inBedDict)
    while not HasAnimDictLoaded(inBedDict) do
        Citizen.Wait(0)
    end

    TaskPlayAnim(PlayerPedId(), inBedDict, inBedAnim, 8.0, -8.0, -1, 1, 0, false, false, false)
    SetEntityHeading(PlayerPedId(), data.h + 180)

    Citizen.CreateThread(function()
        while bedOccupyingData ~= nil do
            Citizen.Wait(1)
            PrintHelpText('Press ~INPUT_VEH_DUCK~ to get up')
            if IsControlJustReleased(0, 73) then
                LeaveBed()
            end
        end
    end)
end)

RegisterNetEvent('mythic_hospital:client:SendToBed')
AddEventHandler('mythic_hospital:client:SendToBed', function(id, data)
    bedOccupying     = id
    bedOccupyingData = data

    inBed            = true

    bedObject        = GetClosestObjectOfType(data.x, data.y, data.z, 1.0, data.model, false, false, false)
    FreezeEntityPosition(bedObject, true)

    SetEntityCoords(PlayerPedId(), data.x, data.y, data.z)
    RequestAnimDict(inBedDict)
    while not HasAnimDictLoaded(inBedDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), inBedDict, inBedAnim, 8.0, -8.0, -1, 1, 0, false, false, false)
    SetEntityHeading(PlayerPedId(), data.h + 180)
    -- Prevents people from being able to break the laying in bed animation
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if inBed then
                DisableControlAction(0, 73, true)
            end
        end
    end)

    Citizen.CreateThread(function()
        Citizen.Wait(5)
        local player = PlayerPedId()
        local emsmultiplier = 0
        exports['mythic_notify']:DoHudText('inform', 'Doctors Are Treating You')
        NeedRevive()
        TriggerServerEvent('mythic_hospital:server:emscounts', lped)
        Citizen.Wait(Config.AIHealTimer * 1000 + emsmultiplier)
        ESX.TriggerServerCallback('mythic_hospital:client:numbersdebug', function(emsnumber, fdnumber, pdnumber, revsrc)
            print ("Debug Check: PD " .. pdnumber .. " EMS " .. emsnumber .. " FD " .. fdnumber .. " revsrc Value " .. revsrc .. " lped Value")
            print (lped)
        end)
        TriggerServerEvent('mythic_hospital:server:EnteredBed', lped)
        -- Uncomment code and move the "EnteredBed" trigger and Wait lines above inside under the trace in the block below to re-enable timer increase per ems on duty
        --[[ ESX.TriggerServerCallback('mythic_hospital:client:emstransfer', function(emsnumber)
            if emsnumber > 0 then
                emsmultiplier = emsnumber * 60000
            end
            --Citizen.Trace('ServerCallback Client: '.. emsnumber)
        end)]]
    end)
end)

RegisterNetEvent('mythic_hospital:client:FinishServices')
AddEventHandler('mythic_hospital:client:FinishServices', function()
    SetEntityMaxHealth(PlayerPedId(), 200)
    SetEntityHealth(GetPlayerPed(-1), GetEntityMaxHealth(GetPlayerPed(-1)))
    TriggerEvent('mythic_hospital:client:RemoveBleed')
    TriggerEvent('mythic_hospital:client:ResetLimbs')
    exports['mythic_notify']:DoHudText('inform', 'You\'ve Been Treated & Billed')
    inBed = false
    LeaveBed()
end)

RegisterNetEvent('mythic_hospital:client:ForceLeaveBed')
AddEventHandler('mythic_hospital:client:ForceLeaveBed', function()
    LeaveBed()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local plyCoords  = GetEntityCoords(PlayerPedId(), 0)
        local atHospital = false
        if not IsPedInAnyVehicle(PlayerPedId(), true) then
            for k, v in pairs(hospitalCheckin) do
                local distance = #(vector3(v.x, v.y, v.z) - plyCoords)
                -- This distance checks if your close to a hospital for /bed
                if distance < 100 then
                    hospital   = k
                    atHospital = true
                    if distance < v.d then
                        ESX.Game.Utils.DrawText3D(vector3(v.x, v.y, v.z + 0.5), '[E] Check in', 0.4)
                        if IsControlJustReleased(0, 54) then
                            CheckIn()
                        end
                        break
                    end
                end
            end
        end
        if not atHospital then
            Citizen.Wait(1000)
        end
    end
end)

function NeedRevive()
    lped = false
    if IsPlayerDead(PlayerId()) then
        lped = true
    end
end