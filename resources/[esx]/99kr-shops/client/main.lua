Keys      = { ["E"] = 38, ["L"] = 182, ["G"] = 47 }

payAmount = 0
Basket    = {}

local copblip

--[[ Gets the ESX library ]]--
ESX       = nil
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)

        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
    end
end)

DrawText3D    = function(x, y, z, text)
    local onScreen, x, y = World3dToScreen2d(x, y, z)
    local factor         = #text / 370

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
        DrawRect(x, y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 120)
    end
end

--[[ Requests specified model ]]--
_RequestModel = function(hash)
    if type(hash) == "string" then
        hash = GetHashKey(hash)
    end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
end

--[[ Deletes the cashiers ]]--
DeleteCashier = function()
    for i = 1, #Config.Locations do
        if Config.Locations[i]["cashier"] then
            local cashier = Config.Locations[i]["cashier"]
            if DoesEntityExist(cashier["entity"]) then
                DeletePed(cashier["entity"])
                SetPedAsNoLongerNeeded(cashier["entity"])
            end
        end
    end
end

Citizen.CreateThread(function()
    local defaultHash = 416176080
    local count = 0
    for k,v in pairs(Config.Locations) do
        if Config.Locations[k]["cashier"] then
            local cashier = Config.Locations[k]["cashier"] or nil
            if cashier then
                cashier["hash"] = cashier["hash"] or defaultHash
                if not DoesEntityExist(cashier["entity"]) then
                    if cashier["x"] and cashier["y"] and cashier["z"] then
                        _RequestModel(cashier["hash"]) -- Relocated this to only request the model if a cashier needs to be loaded
                        cashier["entity"] = CreatePed(4, cashier["hash"], cashier["x"], cashier["y"], cashier["z"],
                                                    cashier["h"])
                        count = count + 1
                        local coords = GetEntityCoords(cashier["entity"])
                        --print("X: ".. coords.x .." Y: ".. coords.y .." Z: ".. coords.z)
                        SetEntityAsMissionEntity(cashier["entity"])
                        SetBlockingOfNonTemporaryEvents(cashier["entity"], true)
                        FreezeEntityPosition(cashier["entity"], true)
                        SetEntityInvincible(cashier["entity"], true)
                    end
                end
                SetModelAsNoLongerNeeded(cashier["hash"])
            end
        end
    end

    --print("Total number of spawned peds ".. count)
    --print("Total number of shops " .. #Config.Locations)
end)

--[[ Creates cashiers and blips ]]--
Citizen.CreateThread(function()
    for i = 1, #Config.Locations do
        local blip = Config.Locations[i]["blip"]

        if blip and blip["sprite"]~= -1 then
            if not DoesBlipExist(blip["id"]) then
                blip["id"] = AddBlipForCoord(blip["x"], blip["y"], blip["z"])
                SetBlipSprite(blip["id"], blip["sprite"] or Config.DefaultSprite)
                SetBlipDisplay(blip["id"], 4)
                SetBlipScale(blip["id"], blip["scale"] or Config.DefaultScale)
                SetBlipColour(blip["id"], blip["color"] or Config.DefaultSpriteColor)
                SetBlipAsShortRange(blip["id"], true)
                SetBlipPriority(blip["id"], blip["layer"] or Config.DefaultLayer)

                if blip["text"] ~= nil then
                    bliptext = blip["text"]
                else
                    bliptext = "Shop"
                end

                AddTextEntry("shopblip", bliptext)
                BeginTextCommandSetBlipName("shopblip")
                EndTextCommandSetBlipName(blip["id"])
            end
        end
    end
end)

--[[ Function to trigger pNotify event for easier use :) ]]--
pNotify = function(message, messageType, messageTimeout)
    TriggerEvent("pNotify:SendNotification", {
        text    = message,
        type    = messageType,
        queue   = "shopcl",
        timeout = messageTimeout,
        layout  = "topRight"
    })
end

Marker  = function(pos)
    DrawMarker(25, pos["x"], pos["y"], pos["z"] - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75, 0.75, 0.75, 200, 200, 200,
               60, false, false, 2, false, nil, nil, false)
    DrawMarker(25, pos["x"], pos["y"], pos["z"] - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 200, 200, 200, 60,
               false, false, 2, false, nil, nil, false)
end

--[[ Deletes the peds when the resource stops ]]--
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        TriggerServerEvent('esx:clientLog', "[99kr-shops]: Deleting peds...")
        DeleteCashier()
    end
end)