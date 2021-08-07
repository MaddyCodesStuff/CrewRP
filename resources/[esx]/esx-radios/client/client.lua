ESX                = nil

cbRadiosActive     = {}
local channelNames = {}

for i = 1, 25 do
    cbRadiosActive["cb"..i] = false
    channelNames["cb"..i] = "CB Radio Ch."..i
end

dedicatedDispatch  = false
activeRadios       = {}

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

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent("esx-radios:toggleCB")
AddEventHandler("esx-radios:toggleCB", function(channel)
    
end)

RegisterNetEvent("esx-radios:toggleDedicatedDispatch")
AddEventHandler("esx-radios:toggleDedicatedDispatch", function()
    
  
end)

function disableAllRadios(cb)
    for i = 1, #activeRadios do
        setRadioChannel(function(id)
            exports.tokovoip_script:removePlayerFromRadio(id)
        end, activeRadios[i])
    end
    activeRadios = {};
    cb()
end

RegisterNetEvent("esx-radios:toggleRadio")
AddEventHandler("esx-radios:toggleRadio", function()
    ESX.PlayerData = ESX.GetPlayerData()
    local job      = string.lower(ESX.PlayerData.job.name)

    if radioActive then
        radioActive = false

        if job == 'police' or job == 'ambulance' or job == 'fireman' or job == 'corrections' then
            TriggerServerEvent('esx-radios:disableBlip', job)
        end

        for _, v in ipairs(radio_channels[job]) do
            exports.tokovoip_script:removePlayerFromRadio(v)
        end
    else
        radioActive = true
        if job == 'police' or job == 'ambulance' or job == 'fireman' or job == 'corrections' then
            TriggerServerEvent('esx-radios:enableBlip', job)
        end

        for _, v in ipairs(radio_channels[job]) do
            exports.tokovoip_script:addPlayerToRadio(v)
        end
    end
end)

RegisterNetEvent("esx-radios:toggleRadioByName")
AddEventHandler("esx-radios:toggleRadioByName", function(name, showAlert)
    ESX.PlayerData = ESX.GetPlayerData()
    local job      = string.lower(ESX.PlayerData.job.name)

    if showAlert == nil then
        showAlert = true;
    end

    if #activeRadios == 0 then
        if (job == 'police' or job == 'ambulance' or job == 'fireman' or job == 'corrections' or job == 'parkranger') and not dedicatedDispatch then
            TriggerServerEvent('esx-radios:enableBlip', job)
        end
    end
    if #activeRadios == 1 and tableHasValue(activeRadios, name) then
        if job == 'police' or job == 'ambulance' or job == 'fireman' or job == 'corrections' or job == 'parkranger' then
            TriggerServerEvent('esx-radios:disableBlip', job)
        end
    end

    if tableHasValue(activeRadios, name) then
        activeRadios = removeValueFromTable(activeRadios, name)

        setRadioChannel(function(id, actualName)
            exports.tokovoip_script:removePlayerFromRadio(id)
            if showAlert then
                TriggerEvent('mythic_notify:client:SendAlert',
                             { type = 'error', text = 'Disabled ' .. actualName, length = 1000 })
            end
        end, name)
    else
        table.insert(activeRadios, name)

        setRadioChannel(function(id, actualName)
            exports.tokovoip_script:addPlayerToRadio(id)
            if showAlert then
                TriggerEvent('mythic_notify:client:SendAlert',
                             { type = 'success', text = 'Enabled ' .. actualName, length = 1000 })
            end
        end, name)
    end
end)

function setRadioChannel(cb, name)
    if name == 'dispatch' then
        cb(4, 'Dispatch')
    elseif name == 'pd_radio_1' then
        cb(1, 'PD Radio 1')
    elseif name == 'pd_radio_2' then
        cb(16, 'PD Radio 2')
    elseif name == 'pd_radio_3' then
        cb(17, 'PD Radio 3')
    elseif name == 'pd_radio_4' then
        cb(18, 'PD Radio 4')
    elseif name == 'ems_radio_1' then
        cb(2, 'EMS Radio 1')
    elseif name == 'ems_radio_2' then
        cb(19, 'EMS Radio 2')
    elseif name == 'ems_radio_3' then
        cb(20, 'EMS Radio 3')
    elseif name == 'ems_radio_4' then
        cb(21, 'EMS Radio 4')
    elseif name == 'fd_radio_1' then
        cb(3, 'FD Radio 1')
    elseif name == 'fd_radio_2' then
        cb(22, 'FD Radio 2')
    elseif name == 'fd_radio_3' then
        cb(23, 'FD Radio 3')
    elseif name == 'fd_radio_4' then
        cb(24, 'FD Radio 4')
    elseif name == 'doc_radio_1' then
        cb(12, 'DOC Radio 1')
    elseif name == 'doc_radio_2' then
        cb(13, 'DOC Radio 2')
    elseif name == 'doc_radio_3' then
        cb(14, 'DOC Radio 3')
    elseif name == 'doc_radio_4' then
        cb(15, 'DOC Radio 4')
    elseif name == 'mutual_aid_1' then
        cb(25, 'Mutual Aid 1')
    elseif name == 'mutual_aid_2' then
        cb(26, 'Mutual Aid 2')
    elseif name == 'mutual_aid_3' then
        cb(27, 'Mutual Aid 3')
    elseif name == 'mutual_aid_4' then
        cb(28, 'Mutual Aid 4')
    elseif name == 'parkranger' then
        cb(49, 'Park Ranger')
    end
end

function isDedicatedDispatch()
    return dedicatedDispatch;
end
exports("isDedicatedDispatch", isDedicatedDispatch);

function tableHasValue(tab, value)
    for _, v in ipairs(tab) do
        if v == value then
            return true
        end
    end

    return false
end

function removeValueFromTable(tab, value)
    local newTable = {}

    for _, v in ipairs(tab) do
        if v ~= value then
            table.insert(newTable, value)
        end
    end

    return newTable
end