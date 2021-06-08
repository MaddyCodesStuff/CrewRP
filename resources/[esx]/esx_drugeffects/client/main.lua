ESX                   = nil
local IsAlreadyDrug   = false
local DrugLevel       = -1
local speed           = 1
local currentDrug     = nil
local doingDrug       = nil
local shake_intensity = 0

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

-- Sets de-chill pill to default damage modifier from tcrp-weapons
Citizen.CreateThread(function()
    while GetResourceState('tcrp-weapons') ~= "started" do
        Wait(500)
    end

    Config.DrugEffects.dechill_pill.weapon_damage_modifier = exports['tcrp-weapons']:getDefaultDamageModifier()
end)

AddEventHandler('esx_status:loaded', function(status)

    TriggerEvent('esx_status:registerStatus', 'drug', 0, '#9ec617', function(status) return false end, function(status)
        status.remove(2500)
    end)

    Citizen.CreateThread(function()
        while true do
            Wait(1000)
            TriggerEvent('esx_status:getStatus', 'drug', function(status)
                if status.val > 0 then

                    local start = true
                    if IsAlreadyDrug then
                        start = false
                    end

                    local level = 0

                    if status.val <= 999999 and (doingDrug == currentDrug or status.val <= 750000) then
                        level       = 0
                        currentDrug = doingDrug
                    else
                        --overdose() -- Will overdose at 1000000 status OR when mixing drugs at high levels of intoxication
                        TriggerEvent('esx_status:set', 'drug', 0)
                    end

                    if level ~= DrugLevel then
                    end

                    IsAlreadyDrug          = true
                    DrugLevel              = level

                    local _shake_intensity = status.val / 1000000 * 2
                    if shake_intensity == 0 or shake_intensity - _shake_intensity > 0.1 then
                        shake_intensity = _shake_intensity
                        ShakeGameplayCam('DRUNK_SHAKE', shake_intensity)
                    end
                else
                    if IsAlreadyDrug then
                        Normal()
                    end

                    IsAlreadyDrug = false
                    DrugLevel     = -1
                    speed         = 1
                    currentDrug   = nil
                    doingDrug     = nil
                    StatSetInt("MP0_STAMINA", 10, true)
                    shake_intensity = 0
                    StopGameplayCamShaking(false)
                    cleareffects()
                end
            end)
        end
    end)
end)

--Set movement speed
Citizen.CreateThread(function()
    while true do
        Wait(1)
        if speed ~= 1.0 then
            local playerPed = GetPlayerPed(-1)
            SetPedMoveRateOverride(playerPed, speed)
        end
    end
end)

-- Calculate movement speed
Citizen.CreateThread(function ()
    while true do
        if speed > 1.0 then
            speed = speed - 0.005
            if speed < 1.0 then
                speed = 1.0
            end
        elseif speed < 1.0 then
            speed = speed + 0.005
            if speed > 1.0 then
                speed = 1.0
            end
        end
        Wait(10000)
    end
end)

--When effects ends go back to normal
function Normal()
    Citizen.CreateThread(function()
        local playerPed = GetPlayerPed(-1)
        ResetPedMovementClipset(playerPed, 0) -- <- it might cause the push of the vehicles
        cleareffects()
    end)
end

--In case too much drugs dies of overdose set everything back
function overdose()
    Citizen.CreateThread(function()
        local playerPed = GetPlayerPed(-1)
        SetEntityHealth(playerPed, 0)
        cleareffects(playerPed)
        TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'You have overdosed!' })
    end)
end

--Clear effects
function cleareffects(playerPed)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
end

--Drugs Effects
RegisterNetEvent('esx_drugeffects:doDrug')
AddEventHandler('esx_drugeffects:doDrug', function(drug)
    doingDrug        = drug
    local playerPed  = GetPlayerPed(-1)
    local player     = PlayerId()
    local health     = GetEntityHealth(playerPed)
    local maxHealth  = GetEntityMaxHealth(playerPed)
    local drugConfig = Config.DrugEffects[drug]

    if drugConfig then
        if drugConfig.start_scenario then
            TaskStartScenarioInPlace(playerPed, drugConfig.start_scenario.name, 0, 1)
            Citizen.Wait(drugConfig.start_scenario.duration)
            ClearPedTasksImmediately(playerPed)
        end

        if drugConfig.timecycle_modifier then
            SetTimecycleModifier(drugConfig.timecycle_modifier)
        end

        if drugConfig.motion_blur then
            SetPedMotionBlur(playerPed, true)
        end

        if drugConfig.animation_set then
            RequestAnimSet(drugConfig.animation_set)
            while not HasAnimSetLoaded(drugConfig.animation_set) do
                Citizen.Wait(0)
            end
            SetPedMovementClipset(playerPed, drugConfig.animation_set, true)
        end

        if drugConfig.is_drunk then
            SetPedIsDrunk(playerPed, true)
        end

        if drugConfig.health then
            if drugConfig.health > 0 and (health + drugConfig.health) >= 200 then
                SetEntityHealth(playerPed, 200)
            else
                SetEntityHealth(playerPed, health + drugConfig.health)
            end
        end

        if drugConfig.armor then
            AddArmourToPed(GetPlayerPed(-1), drugConfig.armor)
        end

        if drugConfig.speed then
            speed = speed + drugConfig.speed - 1
            if speed < Config.Limits.speed.min then
                speed = Config.Limits.speed.min
            elseif speed > Config.Limits.speed.max then
                speed = Config.Limits.speed.max
            end
        end

        if drugConfig.stamina then
            StatSetInt("MP0_STAMINA", drugConfig.stamina, true)
        end

        if drugConfig.weapon_damage_modifier then
            TriggerEvent('tcrp-weapons:setDamageModifier', drugConfig.weapon_damage_modifier)
        end
    else
        TriggerEvent('mythic_notify:client:SendErrorAlert',
                     { text = 'These drugs must be crap. They don\'t do anything.' })
    end
end)