
-- Good testing tool
RegisterCommand('qte', function()
    test = math.random(1,5)
    TriggerEvent('tcrp-qte:startQTE', test, 'tcrp-qte:testFinisher')   

end)

RegisterNUICallback('finish', function(data, cb)
    SetNuiFocus(false,false)
    TriggerEvent(data.callbackfunc, data.success)


    cb('ok')

end)

RegisterNetEvent('tcrp-qte:startQTE')
AddEventHandler('tcrp-qte:startQTE', function(difficulty, callback)
    --to start, 5 difficuties
    SetNuiFocus(true,false)
    if difficulty < Config.MinDifficulty then difficulty = Config.MinDifficulty
    elseif difficulty > Config.MaxDifficulty then difficulty = Config.MaxDifficulty
    end

    if difficulty == 1 then
        speed = Config.Difficulty.one    
    elseif difficulty == 2 then
        speed = Config.Difficulty.two
    elseif difficulty == 3 then
        speed = Config.Difficulty.three
    elseif difficulty == 4 then
        speed = Config.Difficulty.four
    else
        speed = Config.Difficulty.five
    
    end

    start = math.random(Config.MinStartRange.min, Config.MinStartRange.max)
    width = math.random(Config.GoalWidth.min, Config.GoalWidth.max)
    SendNUIMessage({
        action = 'showbar',
        difficulty = speed,
        min = start,
        max = start + width,
        width = width,
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