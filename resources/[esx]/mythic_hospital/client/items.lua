ESX = nil
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
    ESXLoaded      = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent("mythic_hospital:items:gauze")
AddEventHandler("mythic_hospital:items:gauze", function(item)
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 1500,
                                           label           = "Packing Wounds",
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "missheistdockssetup1clipboard@idle_a",
                                               anim     = "idle_a",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model = "prop_paper_bag_small",
                                           }
                                       }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:FieldTreatBleed')
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:bandage")
AddEventHandler("mythic_hospital:items:bandage", function(item)
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 5000,
                                           label           = "Using Bandage",
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "missheistdockssetup1clipboard@idle_a",
                                               anim     = "idle_a",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model = "prop_paper_bag_small",
                                           }
                                       }, function(status)
        if not status then
            local maxHealth = 200
            local health    = GetEntityHealth(PlayerPedId())
            local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 16))
            SetEntityHealth(PlayerPedId(), newHealth)
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:firstaid")
AddEventHandler("mythic_hospital:items:firstaid", function(item)
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 10000,
                                           label           = "Using First Aid",
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "missheistdockssetup1clipboard@idle_a",
                                               anim     = "idle_a",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model = "prop_stat_pack_01"
                                           },
                                       }, function(status)
        if not status then
            local job = ESX.PlayerData.job.name
            if math.random(3) == 1 or job == "ambulance" or job == "fireman" or job == "police" then
                TriggerEvent('mythic_hospital:client:RemoveBleed')
                SetEntityHealth(PlayerPedId(), 200)
            else
                TriggerEvent('mythic_notify:client:SendErrorAlert',
                             { text = 'You were not steady enough to fix your injuries!' })
            end
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:medkit")
AddEventHandler("mythic_hospital:items:medkit", function(item)
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 20000,
                                           label           = "Using Medkit",
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "missheistdockssetup1clipboard@idle_a",
                                               anim     = "idle_a",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model = "prop_ld_health_pack"
                                           },
                                       }, function(status)
        if not status then
            local job = ESX.PlayerData.job.name
            if math.random(3) == 1 or job == "ambulance" or job == "fireman" or job == "police" then
                TriggerEvent('mythic_hospital:client:ResetLimbs')
                SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
            else
                TriggerEvent('mythic_notify:client:SendErrorAlert',
                             { text = 'You were not steady enough to fix your injuries!' })
            end
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:medikit")
AddEventHandler("mythic_hospital:items:medikit", function(item)
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 10000,
                                           label           = "Using Medical Kit",
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "missheistdockssetup1clipboard@idle_a",
                                               anim     = "idle_a",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model = "prop_stat_pack_01"
                                           },
                                       }, function(status)
        if not status then
            local job = ESX.PlayerData.job.name
            if math.random(3) == 1 or job == "ambulance" or job == "fireman" or job == "police" then
                SetEntityHealth(PlayerPedId(), 200)
            else
                TriggerEvent('mythic_notify:client:SendErrorAlert',
                             { text = 'You were not steady enough to fix your injuries!' })
            end
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:vicodin")
AddEventHandler("mythic_hospital:items:vicodin", function(item)
    local item = {
        label = "Vicodin"
    }
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 1000,
                                           label           = "Taking " .. item.label,
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "mp_suicide",
                                               anim     = "pill",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model    = "prop_cs_pills",
                                               bone     = 58866,
                                               coords   = { x = 0.1, y = 0.0, z = 0.001 },
                                               rotation = { x = -60.0, y = 0.0, z = 0.0 },
                                           },
                                       }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 1)
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:hydrocodone")
AddEventHandler("mythic_hospital:items:hydrocodone", function(item)
    local item = {
        label = 'Hydrocodone'
    }
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 1000,
                                           label           = "Taking " .. item.label,
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "mp_suicide",
                                               anim     = "pill",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model    = "prop_cs_pills",
                                               bone     = 58866,
                                               coords   = { x = 0.1, y = 0.0, z = 0.001 },
                                               rotation = { x = -60.0, y = 0.0, z = 0.0 },
                                           },
                                       }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 2)
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:morphine")
AddEventHandler("mythic_hospital:items:morphine", function(item)
    local item = {
        label = "Morphine"
    }
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 2000,
                                           label           = "Taking " .. item.label,
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "mp_suicide",
                                               anim     = "pill",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model    = "prop_cs_pills",
                                               bone     = 58866,
                                               coords   = { x = 0.1, y = 0.0, z = 0.001 },
                                               rotation = { x = -60.0, y = 0.0, z = 0.0 },
                                           },
                                       }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 6)
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:tylenol")
AddEventHandler("mythic_hospital:items:tylenol", function(item)
    local item = {
        label = "Tylenol"
    }
    exports['mythic_progbar']:Progress({
                                           name            = "firstaid_action",
                                           duration        = 2000,
                                           label           = "Taking " .. item.label,
                                           useWhileDead    = false,
                                           canCancel       = true,
                                           controlDisables = {
                                               disableMovement    = false,
                                               disableCarMovement = false,
                                               disableMouse       = false,
                                               disableCombat      = true,
                                           },
                                           animation       = {
                                               animDict = "mp_suicide",
                                               anim     = "pill",
                                               flags    = 49,
                                           },
                                           prop            = {
                                               model    = "prop_cs_pills",
                                               bone     = 58866,
                                               coords   = { x = 0.1, y = 0.0, z = 0.001 },
                                               rotation = { x = -60.0, y = 0.0, z = 0.0 },
                                           },
                                       }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 1)
        end
    end)
end)