Citizen.CreateThread( function()
  while true do
    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
      Citizen.Wait(500)
	    SetPedConfigFlag(PlayerPedId(), 35, false)
    else
      Citizen.Wait(500)
    end
  end
end)