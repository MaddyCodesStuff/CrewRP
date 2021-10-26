ESX                  = nil
local PlayerData     = {}

local informantModel = -459818001
local vehicle        = nil
local freeze         = false
local informantPed   = nil
local informantBlip  = nil
local chopBlip       = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData() == nil do
        Citizen.Wait(100)
    end

    PlayerData = ESX.GetPlayerData()

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        local coords   = GetEntityCoords(informantPed)
        local distance = Vdist(myCoords.x, myCoords.y, myCoords.z, coords.x, coords.y, coords.z)
        if distance < 2 then
            DrawText3Ds(coords.x, coords.y, coords.z, "Press ~g~E~w~ to talk to The Boost")
            if IsControlJustReleased(1, 51) then
                exports.pNotify:SendNotification({ text = "I sent you a text with the list. Get it done quick!", layout = "centerRight", type = "alert", timeout = 5000 })
                self.remote._send_sms()
                self.despawnPed()
            end
        end
    end
end)

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz       = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35) --0.35
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

function getVehicleData()

    local playerPed = GetPlayerPed(-1)
    vehicle         = GetVehiclePedIsIn(playerPed, false)

    if IsPedInAnyVehicle(playerPed, false) then

        local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        return model

    end

end

function spawnPed(informer)

    x, y, z = table.unpack(informer)

    RequestModel(informantModel)
    while (not HasModelLoaded(informantModel)) do
        Citizen.Wait(1)
    end
    Citizen.Wait(100)
    informantPed  = CreatePed(4, informantModel, x, y, z, 90.0, false, true)

    informantBlip = AddBlipForEntity(informantPed)
    SetBlipSprite(informantBlip, 490)
    SetBlipScale(informantBlip, 0.75)
    SetBlipColour(informantBlip, 59)
    SetBlipAlpha(informantBlip, 175)
    SetBlipAsShortRange(informantBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('The Boost')
    EndTextCommandSetBlipName(informantBlip)

end

function despawnPed()

    RemoveBlip(informantBlip)
    SetPedAsNoLongerNeeded(informantPed)

end

function getOutTheDamnCar()

    local playerPed = GetPlayerPed(-1)
    vehicle         = GetVehiclePedIsIn(playerPed, false)

    if IsPedInAnyVehicle(playerPed, false) then
        SetVehicleHalt(vehicle, 3.0, 1, false)
        SetVehicleEngineOn(vehicle, false, true, false)
        TaskLeaveVehicle(playerPed, vehicle, 0)
        SetVehicleDoorsShut(vehicle, true)
        SetVehicleDoorsLocked(vehicle, 2)
    end

end

function setProgressBar(timeout, message)
    exports['progressBars']:startUI(30000, "Chopping Car")
end

function markMap(informer)
    local x, y, z = table.unpack(informer)
    chopBlip      = AddBlipForCoord(x, y, z)
    SetBlipSprite(chopBlip, 490)
    SetBlipScale(chopBlip, 0.75)
    SetBlipColour(chopBlip, 59)
    SetBlipAlpha(chopBlip, 175)
    SetBlipAsShortRange(chopBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Recycling Center')
    EndTextCommandSetBlipName(chopBlip)
end

function unmarkMap()
    RemoveBlip(chopBlip)
end

function chopCarFinished()

    SetEntityAsMissionEntity(vehicle, false, false)
    SetVehicleDoorBroken(vehicle, 0, false)
    Citizen.Wait(2000)
    SetVehicleDoorBroken(vehicle, 1, false)
    Citizen.Wait(2000)
    SetVehicleDoorBroken(vehicle, 2, false)
    Citizen.Wait(2000)
    SetVehicleDoorBroken(vehicle, 3, false)
    Citizen.Wait(2000)
    SetVehicleDoorBroken(vehicle, 4, false)
    Citizen.Wait(2000)
    SetVehicleDoorBroken(vehicle, 5, false)
    Citizen.Wait(2000)
    SetVehicleTyreBurst(vehicle, 0, false, 1000.0)
    Citizen.Wait(500)
    SetVehicleTyreBurst(vehicle, 1, false, 1000.0)
    Citizen.Wait(500)
    SetVehicleTyreBurst(vehicle, 2, false, 1000.0)
    Citizen.Wait(500)
    SetVehicleTyreBurst(vehicle, 3, false, 1000.0)
    Citizen.Wait(500)
    SetVehicleTyreBurst(vehicle, 4, false, 1000.0)
    Citizen.Wait(500)
    SetVehicleTyreBurst(vehicle, 5, false, 1000.0)
    Citizen.Wait(500)
    DeleteVehicle(vehicle)
end
