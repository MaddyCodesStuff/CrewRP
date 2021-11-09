--FILE EDITED BY SPJESTER
-- Note: Custom Sound System for Tornado, Added Siren Sound
local IsTornadoActive = false


Citizen.CreateThread(function()
    local Script = MainScript:new()
    Script:MainScript()
    IsTornadoActive = false
    local Tornado = nil

    RegisterNetEvent("tornado:spawn")
    AddEventHandler("tornado:spawn", function(pos, dest)
        IsTornadoActive = true
        dest = pos
        Tornado = Script._factory:CreateVortex(pos)
        Tornado._position = pos
        Tornado._destination = dest
    end)

    RegisterNetEvent("tornado:setPosition")
    AddEventHandler("tornado:setPosition", function(pos)
        pos = pos
        Tornado = Script._factory:CreateVortex(pos)
        Tornado._position = pos
    end)

    RegisterNetEvent("tornado:setDestination")
    AddEventHandler("tornado:setDestination", function(dest)
        dest = dest
        Tornado = Script._factory:CreateVortex(dest)
        Tornado._destination = dest
    end)

    RegisterNetEvent("tornado:delete")
    AddEventHandler("tornado:delete", function()
        IsTornadoActive = false
    end)

    while true do
        if IsTornadoActive and Tornado then
		Script:OnUpdate(GetGameTimer())
        else
            if Tornado then		
				--Tornado._position = vec3(10000.0, 10000.0, 0.0)
                --print('hi')
                Tornado._position = TriggerServerEvent("tornado:update")
               -- print(Tornado._position)
                Script:OnUpdate(GetGameTimer())
                Tornado = nil
            end
        end
        Wait(15)
    end

end)