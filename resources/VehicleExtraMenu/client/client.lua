RegisterNetEvent("VEM:Title")
AddEventHandler("VEM:Title", function(title)
    Menu.Title(title)
end)

RegisterNetEvent("VEM:Option")
AddEventHandler("VEM:Option", function(option, cb)
    cb(Menu.Option(option))
end)

RegisterNetEvent("VEM:Bool")
AddEventHandler("VEM:Bool", function(option, bool, cb)
    Menu.Bool(option, bool, function(data)
        cb(data)
    end)
end)

RegisterNetEvent("VEM:Update")
AddEventHandler("VEM:Update", function()
    Menu.updateSelection()
end)

local ExtraCount = 0
local extra      = {}
local menu       = false
local trailer    = false
local bool       = true

Citizen.CreateThread(function()

    while true do

        local playerVeh                 = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
        local text
        local vehicle

        if IsControlJustPressed(1, 212) or IsDisabledControlJustPressed(1, 212) then
            if not menu then
                if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),
                                                                                                     0),
                                                                                   -1) == GetPlayerPed(-1)) then
                    if GetVehicleEngineHealth(playerVeh) >= 900.0 and GetVehicleBodyHealth(playerVeh) >= 900.0 and GetVehiclePetrolTankHealth(playerVeh) >= 900.0 then
                        menu = true
                        for _, i in ipairs({0, 1, 4, 5}) do
                            if IsVehicleTyreBurst(playerVeh, i, false) then
                                menu = false
                                break
                            end
                        end
                    end
                    if not menu then
                        TriggerEvent("mythic_notify:client:SendErrorAlert",
                                     { text = "Vehicle is too damaged. Please repair before applying extras." })
                    end
                else
                    TriggerEvent("mythic_notify:client:SendErrorAlert",
                                 { text = "You have to be the driver of a vehicle to use this Menu." })
                end
            elseif menu then
                menu = false
            end
        end

        if IsDisabledControlJustPressed(1, 177) then
            if menu then
                menu       = false
                bool       = true
                ExtraCount = 0
            elseif trailer then
                trailer    = false
                bool       = true
                ExtraCount = 0
                menu       = true
            end
        elseif not (IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),
                                                                                                      0),
                                                                                    -1) == GetPlayerPed(-1))) then
            menu       = false
            trailer    = false
            bool       = true
            ExtraCount = 0
        end

        if (menu) then
            TriggerEvent("VEM:Title", "~y~~bold~Vehicle Extra Menu")

            if (GotTrailer) then
                TriggerEvent("VEM:Option", "~y~>> ~s~Trailer Extras", function(cb)
                    if (cb) then
                        menu       = false
                        trailer    = true
                        bool       = true
                        ExtraCount = 0
                    end
                end)
            end
        elseif trailer then
            TriggerEvent("VEM:Title", "~y~~bold~Trailer Extra Menu")
        end

        if menu or trailer then
            if menu then
                vehicle = playerVeh
                text    = "Vehicle"
            elseif trailer then
                vehicle = TrailerHandle
                text    = "Trailer"
            end

            if ExtraCount == 0 then
                TriggerEvent("VEM:Option", "Your " .. text .. " has no Extras", function(cb)
                    if (cb) then
                        TriggerEvent("mythic_notify:client:SendErrorAlert",
                                     { text = "Your " .. text .. " has no Extras!" })
                    end
                end)
            else
                TriggerEvent("VEM:Option", "Your " .. text .. " has ~y~" .. ExtraCount .. " ~s~Extras", function(cb)
                    if (cb) then
                        TriggerEvent("mythic_notify:client:SendSuccessAlert",
                                     { text = "Your " .. text .. " has ~y~" .. ExtraCount .. " ~s~Extras!" })
                    end
                end)
            end

            local vehicleFuel = GetVehicleFuelLevel(vehicle) -- get the current fuel level
            SetVehicleAutoRepairDisabled(vehicle,
                                         false) -- This should stop cars from losing their fuel when they are auto-repaired

            for i = 1, 20, 1 do
                if (DoesExtraExist(vehicle, i) == 1) then
                    TriggerEvent("VEM:Bool", "Extra " .. i, extra[i], function(cb)
                        extra[i] = cb
                        if extra[i] then
                            SetVehicleExtra(vehicle, i, 0)
                            TriggerEvent("mythic_notify:client:SendSuccessAlert",
                                         { text = "Extra " .. i .. " Enabled!" })
                        else
                            SetVehicleExtra(vehicle, i, 1)
                            TriggerEvent("mythic_notify:client:SendErrorAlert",
                                         { text = "Extra " .. i .. " Disabled!" })
                        end
                    end)
                end
            end

            TriggerEvent("VEM:Update")
            SetVehicleFuelLevel(vehicle, vehicleFuel) -- restore the original fuel level
        end

        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    --Disables Controls Used In The Menu, When Menu Is Active
    while true do
        Citizen.Wait(1)
        if menu then
            DisableControlAction(1, 20, true)
            DisableControlAction(1, 21, true)
            DisableControlAction(1, 45, true)
            DisableControlAction(1, 73, true)
            DisableControlAction(1, 74, true)
            DisableControlAction(1, 76, true)
            DisableControlAction(1, 80, true)
            DisableControlAction(1, 85, true)
            DisableControlAction(1, 99, true)
            DisableControlAction(1, 114, true)
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 172, true)
            DisableControlAction(1, 173, true)
            DisableControlAction(1, 174, true)
            DisableControlAction(1, 175, true)
            DisableControlAction(1, 176, true)
            DisableControlAction(1, 177, true)
            DisableControlAction(1, 178, true)
            DisableControlAction(1, 179, true)
        end
    end
end)

Citizen.CreateThread(function()
    --Disables Menu When In Pausemenu
    while true do
        Citizen.Wait(0)
        local CF = Citizen.InvokeNative(0x2309595AD6145265)
        if (CF == -1171018317) then
            menu    = false
            trailer = false
        end
    end
end)

Citizen.CreateThread(function()
    --Gets Extra States
    while true do
        Citizen.Wait(0)
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            if bool then
                for i = 1, 14 do
                    if trailer then
                        if DoesExtraExist(TrailerHandle, i) == 1 then
                            ExtraCount = ExtraCount + 1
                            if (IsVehicleExtraTurnedOn(TrailerHandle, i) == 1) then
                                extra[i] = true
                            else
                                extra[i] = false
                            end
                        end
                    else
                        if DoesExtraExist(GetVehiclePedIsIn(GetPlayerPed(-1), false), i) == 1 then
                            ExtraCount = ExtraCount + 1
                            if (IsVehicleExtraTurnedOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), i) == 1) then
                                extra[i] = true
                            else
                                extra[i] = false
                            end
                        end
                    end
                end
                bool = false
            end
        else
            bool       = true
            ExtraCount = 0
        end
    end
end)