local animSet = "move_lester_CaneUp"
local prop = GetHashKey("prop_cs_walking_stick")
local toggle = false
--Load Clipset
function loadClipset(animSet)
    Citizen.CreateThread(function()
        while not HasAnimSetLoaded(animSet) do
            RequestAnimSet(animSet)
            Citizen.Wait(20)
        end
    end)
end

function loadModel(model)
    Citizen.CreateThread(function()
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(20)
        end
    end)
end

--Event to Toggle Walk Style and put in cane
AddEventHandler("tcrp-cane:toggle", function()
    toggle = not toggle
    local ped = PlayerPedId()
    loadClipset(animSet)
    loadModel(prop)
    Citizen.Wait(50)
    if toggle then
        SetPedMovementClipset(ped, animSet, 0.55)
        object = CreateObject(prop, 1.0, 1.0, 1.0, true, true, false)
        AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, 6286), 0.06, 0.01, -0.015, 15.0, 280.0, -210.0, true, false, false, true, 1, true)
        Citizen.CreateThread(function()
            while toggle do
                if IsControlJustPressed(0, 73) then
                    TriggerEvent("tcrp-cane:toggle")
                else
                    Citizen.Wait(0)
                end
            end
        end)
    else
        ResetPedMovementClipset(ped, 0.55) 
        DeleteObject(object)
    end
end) 

AddEventHandler("tcrp-cane:delete", function()
    DeleteObject(object)
    toggle = not toggle
end) 

RegisterCommand("canetoggle", function()
    TriggerEvent("tcrp-cane:toggle")
end)