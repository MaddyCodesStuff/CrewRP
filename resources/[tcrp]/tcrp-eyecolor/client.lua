RegisterCommand('seteyecolor', function(source, args)
    color = args[1]

    TriggerServeEvent('updateEyeColor', color)

end)