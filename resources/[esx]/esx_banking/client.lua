-- Tunnel = module("vrp", "lib/Tunnel")
-- Proxy = module("vrp", "lib/Proxy")

-- local cvRP = module("vrp","client/vRP")
-- vRP = cvRP()

-- function Banking:__construct()
--   vRP.Extension.__construct(self)
-- end
local bankOpen = false
local atmOpen  = false
local nearBank = false
local nearATM  = false
local atBank   = false

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz       = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.55, 0.55) --0.35
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

function openGui()
    SetNuiFocus(true, true)
    SendNUIMessage({ openBank = true })
end

function closeGui()
    SendNUIMessage({ openBank = false })
    SetNuiFocus(false)
    bankOpen = false
    atmOpen  = false
end

-- This should be all the client related stuff we need for the UI
-- TODO: Build the IsNearATM() function
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if (nearBank == true) then
            atBank = true
            if IsControlJustReleased(1, 51) then
                -- IF INPUT_PICKUP Is pressed
                TriggerServerEvent('banking:updateBalance')
                Citizen.Wait(10)
                openGui()
            end
        else
            if (atmOpen or bankOpen) then
                closeGui()
            end
            atBank   = false
            atmOpen  = false
            bankOpen = false
        end
    end
end)

atms          = {
    [1] = -870868698,
    [2] = -1126237515,
    [3] = -1364697528,
    [4] = 506770882
}

local atmsLoc = {}

-- Second thread for enabling ATM interactions
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if IsControlJustReleased(1, 51) then
            local myCoords = GetEntityCoords(GetPlayerPed(-1))
            for i = 1, #atms do
                local closestATM = GetClosestObjectOfType(myCoords.x, myCoords.y, myCoords.z, 1.0, atms[i], false, false)
                if closestATM ~= nil and closestATM ~= 0 then
                    local coords   = GetEntityCoords(closestATM)
                    local distance = GetDistanceBetweenCoords(myCoords.x, myCoords.y, myCoords.z, coords.x, coords.y,
                                                              coords.z)
                    if distance < 1 then
                        atmsLoc = { ['x'] = coords.x, ['y'] = coords.y, ['z'] = coords.z }
                        atBank = true
                        TriggerServerEvent('banking:updateBalance')
                        Citizen.Wait(10)
                        openGui()
                    end
                else
                    if (atmOpen or bankOpen) then
                        closeGui()
                    end
                    atBank   = false
                    atmOpen  = false
                    bankOpen = false
                    nearATM  = false
                end
            end
        end
    end
end)

-- Need to make the callback method to display the balance and name of the character

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
    closeGui()
    cb('ok')
end)

-- Open the withdraw window
RegisterNUICallback('withdraw', function(data, cb)
    SendNUIMessage({ openSection = "withdraw" })
    cb('ok')
end)

-- Open the home window
RegisterNUICallback('home', function(data, cb)
    SendNUIMessage({ openSection = "home" })
    TriggerServerEvent('banking:updateBalance')
    cb('ok')
end)

-- Open the deposit window
RegisterNUICallback('deposit', function(data, cb)
    SendNUIMessage({ openSection = "deposit" })
    cb('ok')
end)

-- Open the transfer window
RegisterNUICallback('transfer', function(data, cb)
    SendNUIMessage({ openSection = "transfer" })
    cb('ok')
end)

-- Open the transfer window
RegisterNUICallback('quickwithdraw', function(data, cb)
    TriggerServerEvent('banking:quickWithdraw')
    cb('ok')
end)

RegisterNUICallback('withdrawSubmit', function(data, cb)
    TriggerEvent('bank:withdraw', data.amount)
    cb('ok')
end)

RegisterNUICallback('depositSubmit', function(data, cb)
    TriggerEvent('bank:deposit', data.amount)
    cb('ok')
end)

RegisterNUICallback('transferSubmit', function(data, cb)
    TriggerServerEvent('banking:transfer', data)
    cb('ok')
end)

-- Process withdraw if conditions met
-- RegisterNetEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
    TriggerServerEvent("banking:withdraw", tonumber(amount))
end)

AddEventHandler('bank:deposit', function(amount)
    TriggerServerEvent("banking:deposit", tonumber(amount))
end)

-- Handle the display of errors/messages in the banking UI
RegisterNetEvent('bank:showWarning')
AddEventHandler('bank:showWarning', function(msg)
    SendNUIMessage({
                       showmessage = true,
                       message     = msg
                   })
end)

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('vRP:banking:opengui')
AddEventHandler('vRP:banking:opengui', function(data, cb)
    if data.location == 'bank' then
        DisplayHelpText("Press ~INPUT_PICKUP~ to access the bank.")
        nearBank = true
    elseif data.location == 'atm' then
        DisplayHelpText("Press ~INPUT_PICKUP~ to access the ATM.")
        nearATM = true
    end
    if data.balance == nil then
        data.balance = 0
    end

    SendNUIMessage({
                       updateBalance = true,
                       playerName    = data.player,
                       balance       = data.amount,
                       wallet        = data.wallet
                   })
end)

RegisterNetEvent('vRP:banking:closegui')
AddEventHandler('vRP:banking:closegui', function()
    nearBank = false
    nearATM  = false
end)

RegisterNetEvent('bank:updateBalance')
AddEventHandler('bank:updateBalance', function(data, cb)
    SendNUIMessage({
                       updateBalance = true,
                       playerName    = data.player,
                       balance       = data.amount,
                       wallet        = data.wallet
                   })
end)