--===============================================================================
--=== Edited By skiddle pumpkin#0001 4 MERCURY RP================================
--===================== Direitos Reservados ao Mercury RP =======================
--===============================================================================


-- ESX

ESX = nil
local PlayerData                = {}
local radioChannel = 0
local radioMenu = false
local lastEmote = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

function PrintChatMessage(text)
    TriggerEvent('chatMessage', "system", { 255, 0, 0 }, text)
end

function enableRadio(enable)
  if enable then
    lastEmote = exports['krz_personalmenu']:getCurrentEmote()
    if IsPedInAnyVehicle(PlayerPedId(), false) then
      TriggerEvent('emote:do', 'radiohand2')
    else
      TriggerEvent('emote:do', 'radiohand')
    end

  else
    TriggerEvent('emote:cancel', true)
    if lastEmote then
        TriggerEvent('emote:do', lastEmote)
    end
  end

  SetNuiFocus(true, true)
  radioMenu = enable
  SendNUIMessage({
    type = "enableui",
    enable = enable
  })

end

-- Checks to see if user has a services job
function isServicesJob(job)
    for i = 1, #Config.ServicesJobs, 1 do
        if job == Config.ServicesJobs[i] then
            return true
        end
    end
    return false
end



RegisterNUICallback('joinRadio', function(data, cb)
    local channel = tonumber(data.channel)
    if channel ~= radioChannel then
        radioChannel = channel
        if channel <= Config.RestrictedChannels and PlayerData.job and isServicesJob(PlayerData.job.name) then -- Restricted radio
            exports["pma-voice"]:SetRadioChannel(channel)

            TriggerEvent("tcrp-displayGeneral",  'Joined to radio' .. data.channel .. '.00 MHz </b>')
            TriggerServerEvent("tcrp-blips:emergencylist", PlayerData.job.name)

        elseif channel > Config.RestrictedChannels then -- Civ radio
            exports["pma-voice"]:SetRadioChannel(channel)
            TriggerEvent("notification",  Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 1)
        else -- Handle invalid channels for user
            exports['mythic_notify']:SendAlert('error', Config.messages['restricted_channel_error'])
            TriggerEvent("notification",  Config.messages['restricted_channel_error'], 2)
        end
    end

    cb('ok')
end)

RegisterNUICallback('leaveRadio', function(data, cb)
    local _source = data
    local PlayerData = ESX.GetPlayerData(_source)

    TriggerServerEvent("tcrp-blips:emergencytoggle", false)

    TriggerEvent("notification",  Config.messages['you_leave'], 3)
    exports["pma-voice"]:SetRadioChannel(0)
    radioChannel = 0

   cb('ok')

end)

RegisterNUICallback('escape', function(data, cb)
    enableRadio(false)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNetEvent('ls-radio:use')
AddEventHandler('ls-radio:use', function()
    enableRadio(true)
end)

RegisterNetEvent('ls-radio:onRadioDrop')
AddEventHandler('ls-radio:onRadioDrop', function()
    exports["pma-voice"]:SetRadioChannel(0)
    radioChannel = 0
end)

Citizen.CreateThread(function()
    while true do
        if radioMenu then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown
            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate
            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride
            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
        else
            Citizen.Wait(1500)
        end
        Citizen.Wait(10)
    end
end)