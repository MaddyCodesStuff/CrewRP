
-- Good testing tool
-- RegisterCommand('qte', function()
--     test = math.random(1,5)
--     TriggerEvent('tcrp-qte:startQTE', test, 'tcrp-qte:testFinisher')   

-- end)

RegisterNUICallback('finish', function(data, cb)
    SetNuiFocus(false,false)
    TriggerEvent(data.callbackfunc, data.success)


    cb('ok')

end)

RegisterNetEvent('tcrp-qte:startQTE')
AddEventHandler('tcrp-qte:startQTE', function(difficulty, callback)
    --to start, 5 difficuties
    SetNuiFocus(true,false)
    if difficulty < 1 then difficulty = 1
    elseif difficulty > 5 then difficulty = 5
    end

    if difficulty == 1 then
        speed = 30    
    elseif difficulty == 2 then
        speed = 25
    elseif difficulty == 3 then
        speed = 20
    elseif difficulty == 4 then
        speed = 17
    else
        speed = 15
    
    end

    start = math.random(Config.MinStartRange.min, Config.MinStartRange.max)
    width = math.random(Config.GoalWidth.min, Config.GoalWidth.max)
    SendNUIMessage({
        action = 'showbar',
        difficulty = speed,
        min = start,
        max = start + width,
        func = callback

    })

end)
RegisterNetEvent('tcrp-qte:testFinisher')
AddEventHandler('tcrp-qte:testFinisher', function(result)

    if(result == true) then
        TriggerEvent('tcrp:displayGeneral', "Passed the vibe check")
    else
        TriggerEvent('tcrp:displayGeneral', "Failed the vibe check")
    end

end)