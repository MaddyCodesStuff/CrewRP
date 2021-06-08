Citizen.CreateThread(function() 
    while true do
        InvalidateIdleCam()
        InvalidateVehicleIdleCam()
        Wait(30000)
    end 
  end)