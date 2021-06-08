local inTrunk = false
local LockControls = false
ESX = nil

function leaveTrunk()
    DetachEntity(PlayerPedId(), true, true)
    ClearPedTasks(PlayerPedId())
    TriggerEvent('emote:cancel')
    -- This is a hack to fix collision issues. If we move player far enough away, collision detection
    -- with vehicle returns.
    local endCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.25, -1.0, -0.75)

    -- Fix case where player falls through world
    local checkGround, groundZ = GetGroundZFor_3dCoord(endCoords.x + 0.0, endCoords.y + 0.0, endCoords.z + 0.0)
    if not checkGround then
        local addZ = 1.5
        while not checkGround do
            checkGround, groundZ = GetGroundZFor_3dCoord(endCoords.x + 0.0, endCoords.y + 0.0, endCoords.z + addZ)
            addZ = addZ + 1.5
        end
        endCoords.z = groundZ
    end

    SetEntityVisible(PlayerPedId(), false, false)
    Wait(100)
    SetEntityCollision(PlayerPedId(), true, true)
    SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.25, -3.0, -0.75))
    Wait(100)
    SetEntityCoordsNoOffset(PlayerPedId(), endCoords)
    Wait(100)
    SetEntityVisible(PlayerPedId(), true, false)
    inTrunk = false
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if inTrunk then
            -- Disable opening of trunk inventory when inside. Creates jank
            DisableControlAction(0, 47, false)
            local vehicle = GetEntityAttachedTo(PlayerPedId())
            if DoesEntityExist(vehicle) and not IsPedDeadOrDying(PlayerPedId()) and not IsPedFatallyInjured(PlayerPedId()) then
                local coords = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, 'boot'))
                SetEntityCollision(PlayerPedId(), false, false)
                DrawText3D(coords, '[H] leave Trunk')

                if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                    SetEntityVisible(PlayerPedId(), false, false)
                else
                    SetEntityVisible(PlayerPedId(), true, false)
                end
                if IsControlJustReleased(0, 74) and inTrunk then
                    while GetVehicleDoorAngleRatio(vehicle, 5) <= 0 do
                        TriggerEvent('tcrp-vehiclecontrol:startAction', 'trunk')
                        Wait(1000)
                    end
                    leaveTrunk()
                    if GetVehicleDoorAngleRatio(vehicle, 5) > 0 then
                        Wait(1000)
                        TriggerEvent('tcrp-vehiclecontrol:startAction', 'trunk')
                    end
                end
            else
                leaveTrunk()
            end
        end
    end
end)

Citizen.CreateThread(function()

    while true do
        Wait(0)
        if(LockControls) then
            DisableControlAction(0, 32, false) -- W
            DisableControlAction(0, 34, false) -- A
            DisableControlAction(0, 31, false) -- S
            DisableControlAction(0, 30, false) -- D
            DisableControlAction(0, 74, false) -- H
            DisableControlAction(0, 47, false) -- G
        end
    end
end)

Citizen.CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
    while not NetworkIsSessionStarted() or ESX.GetPlayerData().job == nil do Wait(0) end
    while true do
        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0, 0, 70)
		--Lockstatus
		local lockStatus = GetVehicleDoorLockStatus(vehicle)
		--Lockstatus End
        if DoesEntityExist(vehicle) then
            local trunk = GetEntityBoneIndexByName(vehicle, 'boot')
            if trunk ~= -1 then
                local coords = GetWorldPositionOfEntityBone(vehicle, trunk)
                if #(GetEntityCoords(PlayerPedId()) - coords) <= 1.5 then
                    if not inTrunk then
                        DrawText3D(coords, '[H] Hide\n[G] Look')
                    end
                    if IsControlJustPressed(0, 74) and not inTrunk then
                        LockControls = true
                        local player = ESX.Game.GetClosestPlayer()
                        local playerPed = GetPlayerPed(player)
						if lockStatus == 1 then --unlocked
							if DoesEntityExist(playerPed) then
								if not IsEntityAttached(playerPed) or GetDistanceBetweenCoords(GetEntityCoords(playerPed), GetEntityCoords(PlayerPedId()), true) >= 5.0 then
									if GetVehicleDoorAngleRatio(vehicle, 5) <= 0 then
                                        TriggerEvent('tcrp-vehiclecontrol:startAction', 'trunk')
						        	end
                                    Wait(1000)
									AttachEntityToEntity(PlayerPedId(), vehicle, -1, -0.25, -1.8, 1.2, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                    TriggerEvent('emote:do', 'sleep')
                                    Wait(0)
                                    if GetVehicleDoorAngleRatio(vehicle, 5) > 0 then
                                        Wait(1000)
                                        TriggerEvent('tcrp-vehiclecontrol:startAction', 'trunk')
						        	end
                                    Wait(1000)
                                    inTrunk = true
								else
									ESX.ShowNotification('There is already someone in the trunk!')
								end
							end
						elseif lockStatus == 2 then -- locked
							ESX.ShowNotification('Car is locked')
						end
                        LockControls = false
                    end
                end
            end
        end
        Wait(0)
    end
end)

function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()

    AddTextComponentString(text)
    DrawText(_x, _y)
end