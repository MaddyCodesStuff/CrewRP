local ragdoll = false

function SetRagdoll(flag)
    ragdoll = flag
end

Citizen.CreateThread(function()
    while true do

        ped = GetPlayerPed(-1)
        Citizen.Wait(0)

        if ragdoll then
            SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0)
            ResetPedRagdollTimer(ped)
        end

        if IsControlJustPressed(1, 303) and not IsPedInAnyVehicle(ped, false) then
            if ragdoll then
                SetRagdoll(false)
            else
                SetRagdoll(true)
            end
        end
    end
end)
