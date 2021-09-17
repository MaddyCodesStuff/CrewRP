RegisterCommand('seteyecolor', function(source, args)
    color = args[1]
    player = GetPlayerPed(-1)
    TriggerServerEvent('updateEyecolor', color, player)
  
end)

RegisterNetEvent('tcrp-eyecolor:UpdatePed')
AddEventHandler('tcrp-eyecolor:UpdatePed', function(args)
    print(args.ped)
    print(args.color)
    SetPedEyeColor(args.ped, 11)

end)