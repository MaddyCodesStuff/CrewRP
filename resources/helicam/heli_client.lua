-- FiveM Heli Cam by mraes, version 1.3 (2017-06-12)
-- Modified by rjross2013 (2017-06-23)
-- Further modified by Loque (2017-08-15) with credits to the following for tips gleaned from their scripts: Guadmaz's Simple Police Searchlight, devilkkw's Speed Camera, nynjardin's Simple Outlaw Alert and IllidanS4's FiveM Entity Iterators.
-- Even further modified by Nelana (2/24/2021) For use on TheCrewRP Server

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

-- Config
local fov_max = 80.0
local fov_min = 5.0 -- max zoom level (smaller fov is more zoom)
local zoomspeed = 2.5 -- camera zoom speed
local speed_lr = 4 -- speed by which the camera pans left-right 
local speed_ud = 4 -- speed by which the camera pans up-down
local toggle_helicam = 47 -- control id of the button by which to toggle the helicam mode. Current Keybind: INPUT_CELLPHONE_CAMERA_GRID (G)
local toggle_vision = 25 -- control id to toggle vision mode. Default: INPUT_AIM (Right mouse btn)
local toggle_rappel = 154 -- control id to rappel out of the heli. Default: INPUT_DUCK (X)
local toggle_lock_on = 22 -- control id to lock onto a vehicle with the camera or unlock from vehicle (with or without camera). Default is INPUT_JUMP (spacebar)
local maxtargetdistance = 500 -- max distance at which target lock is maintained
local speed_measure = "MPH" -- default unit to measure vehicle speed but can be changed to "MPH". Use either exact string, "Km/h" or "MPH", or else functions break.


-- Script starts here
local target_vehicle = nil
local pressed = false
local helicam = false
local vehicle_display = 1 -- 0 is default full vehicle info display with speed/model/plate, 1 is model/plate, 2 turns off display
local pdmav_hash = GetHashKey("pd-mav")
local hwybuz_hash = GetHashKey("hwy-buz")
local fov = (fov_max+fov_min)*0.5
local vision_state = 0 -- 0 is normal, 1 is nightmode, 2 is thermal vision (Disabled)

-- Main Function, Where all the Magic Happens
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
		if IsPlayerInPolmav() then
			local lPed = GetPlayerPed(-1)
			local heli = GetVehiclePedIsIn(lPed)
			if IsHeliHighEnough(heli) then
				if IsControlJustPressed(0, toggle_helicam) and GetPedInVehicleSeat(heli, -1) == lPed or IsControlJustPressed(0, toggle_helicam) and GetPedInVehicleSeat(heli, 0) == lPed  then  -- Toggle Helicam
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					helicam = true
					TriggerServerEvent('heli:togglecam', true)
				end

				if pressed == true and IsVehicleModel(heli, pdmav_hash) then -- Initiate rappel
				--	Citizen.Trace("try to rappel") Debug Line
					if GetPedInVehicleSeat(heli, 1) == lPed or GetPedInVehicleSeat(heli, 2) == lPed then
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					SetPedCanRagdoll(GetPlayerPed(-1), false)
					TaskRappelFromHeli(GetPlayerPed(-1), 1)
					Citizen.CreateThread(function()
						Wait(15000)
						SetPedCanRagdoll(GetPlayerPed(-1), true)
					end)
					else
						ESX.ShowNotification("Can't rappel from this seat")
						PlaySoundFrontend(-1, "5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false)
					end
					pressed = false
				end
			end
			-- Toggle Lock while not in Helicam
			if target_vehicle and GetPedInVehicleSeat(heli, -1) == lPed or target_vehicle and GetPedInVehicleSeat(heli, 0) == lPed then
				local coords1 = GetEntityCoords(heli)
				local coords2 = GetEntityCoords(target_vehicle)
				local target_distance = GetDistanceBetweenCoords(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z, false)
				if IsControlJustPressed(0, toggle_lock_on) or target_distance > maxtargetdistance then
					--Citizen.Trace("Heli: target vehicle released or lost")
					DecorRemove(target_vehicle, "Target")
					target_vehicle = nil					
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
				end
			end
		else
			Citizen.Wait(8000)
		end
		if helicam then

			SetTimecycleModifier("heliGunCam")
			SetTimecycleModifierStrength(0.3)
			local scaleform = RequestScaleformMovie("HELI_CAM")
			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(0)
			end
			local lPed = GetPlayerPed(-1)
			local heli = GetVehiclePedIsIn(lPed)
			local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
			AttachCamToEntity(cam, heli, 0.0,0.0,-1.5, true)
			SetCamRot(cam, 0.0,0.0,GetEntityHeading(heli))
			SetCamFov(cam, fov)
			RenderScriptCams(true, false, 0, 1, 0)
			PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
			PushScaleformMovieFunctionParameterInt(0) -- 0 for nothing, 1 for LSPD logo
			PopScaleformMovieFunctionVoid()
			local locked_on_vehicle = nil

			while helicam and not IsEntityDead(lPed) and (GetVehiclePedIsIn(lPed) == heli) and IsHeliHighEnough(heli) do
				if IsControlJustPressed(0, toggle_helicam) then -- Toggle Helicam
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					helicam = false
					TriggerServerEvent('heli:togglecam', false)
				end

				if IsControlJustPressed(0, toggle_vision) then
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					ChangeVision()
				end

				if locked_on_vehicle then
					if DoesEntityExist(locked_on_vehicle) then
						PointCamAtEntity(cam, locked_on_vehicle, 0.0, 0.0, 0.0, true)
						RenderVehicleInfo(locked_on_vehicle)
						local coords1 = GetEntityCoords(heli)
						local coords2 = GetEntityCoords(locked_on_vehicle)
						local target_distance = GetDistanceBetweenCoords(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z, false)
						if IsControlJustPressed(0, toggle_lock_on) or target_distance > maxtargetdistance then
							--Citizen.Trace("Heli: locked_on_vehicle unlocked or lost")
							PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
							DecorRemove(target_vehicle, "Target")
							target_vehicle = nil
							locked_on_vehicle = nil
							local rot = GetCamRot(cam, 2) -- All this because I can't seem to get the camera unlocked from the entity
							local fov = GetCamFov(cam)
							local old_cam = cam
							DestroyCam(old_cam, false)
							cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
							AttachCamToEntity(cam, heli, 0.0,0.0,-1.5, true)
							SetCamRot(cam, rot, 2)
							SetCamFov(cam, fov)
							RenderScriptCams(true, false, 0, 1, 0)
						end
					else
						locked_on_vehicle = nil -- Cam will auto unlock when entity doesn't exist anyway
						target_vehicle = nil
					end
				else
					local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
					CheckInputRotation(cam, zoomvalue)
					local vehicle_detected = GetVehicleInView(cam)
					if DoesEntityExist(vehicle_detected) then
						RenderVehicleInfo(vehicle_detected)
						if IsControlJustPressed(0, toggle_lock_on) then
							PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
							locked_on_vehicle = vehicle_detected
			
							if target_vehicle then -- If previous target exists, remove old target decorator before updating target vehicle
								DecorRemove(target_vehicle, "Target")
							end
							
							target_vehicle = vehicle_detected
							local target_netID = VehToNet(target_vehicle) 
							SetNetworkIdCanMigrate(target_netID, true)
							NetworkRegisterEntityAsNetworked(VehToNet(target_vehicle))
							SetNetworkIdExistsOnAllMachines(target_vehicle, true) 
							SetEntityAsMissionEntity(target_vehicle, true, true) 
							target_plate = GetVehicleNumberPlateText(target_vehicle)
							DecorSetInt(locked_on_vehicle, "Target", 2)
						end
					end
				end
				
				HandleZoom(cam)
				HideHUDThisFrame()
				SupressClicks()
				PushScaleformMovieFunction(scaleform, "SET_ALT_FOV_HEADING")
				PushScaleformMovieFunctionParameterFloat(GetEntityCoords(heli).z)
				PushScaleformMovieFunctionParameterFloat(zoomvalue)
				PushScaleformMovieFunctionParameterFloat(GetCamRot(cam, 2).z)
				PopScaleformMovieFunctionVoid()
				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
				Citizen.Wait(0)
				
			end
			helicam = false
			ClearTimecycleModifier()
			fov = (fov_max+fov_min)*0.5 -- reset to starting zoom level
			RenderScriptCams(false, false, 0, 1, 0) -- Return to gameplay camera
			SetScaleformMovieAsNoLongerNeeded(scaleform) -- Cleanly release the scaleform
			DestroyCam(cam, false)
			SetNightvision(false)
		end

		if IsPlayerInPolmav() and target_vehicle and not helicam and vehicle_display ~=2 then
			RenderVehicleInfo(target_vehicle)
		end
	end
end)

function IsPlayerInPolmav()
	local lPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(lPed)
	return IsVehicleModel(vehicle, pdmav_hash) or IsVehicleModel(vehicle, hwybuz_hash)
end

function IsHeliHighEnough(heli)
	return GetEntityHeightAboveGround(heli) > 1.5
end

function ChangeVision()
	if vision_state == 0 then
		SetNightvision(true)
		vision_state = 1
	else
		SetNightvision(false)
		vision_state = 0
	end
end

function ChangeDisplay()
	if vehicle_display == 0 then
		vehicle_display = 1
	elseif vehicle_display == 1 then
		vehicle_display = 2
	else
		vehicle_display = 0
	end
end

function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
	HideHudComponentThisFrame(19) -- weapon wheel
	HideHudComponentThisFrame(1) -- Wanted Stars
	HideHudComponentThisFrame(2) -- Weapon icon
	HideHudComponentThisFrame(3) -- Cash
	HideHudComponentThisFrame(4) -- MP CASH
	HideHudComponentThisFrame(13) -- Cash Change
	HideHudComponentThisFrame(11) -- Floating Help Text
	HideHudComponentThisFrame(12) -- more floating help text
	HideHudComponentThisFrame(15) -- Subtitle Text
	HideHudComponentThisFrame(18) -- Game Stream
end

--Prevents changing of weapons while Helicam is active, and supresses the annoying clicking of zooming in
function SupressClicks()
	DisablePlayerFiring(PlayerId(), true)
	DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
	DisableControlAction(0,99,true) -- INPUT_VEH_SELECT_NEXT_WEAPON
	DisableControlAction(0,100,true) -- INPUT_VEH_SELECT_PREV_WEAPON
	SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
end


function CheckInputRotation(cam, zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0, 220)
	local rightAxisY = GetDisabledControlNormal(0, 221)
	local rotation = GetCamRot(cam, 2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
		new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5) -- Clamping at top (cant see top of heli) and at bottom (doesn't glitch out in -90deg)
		SetCamRot(cam, new_x, 0.0, new_z, 2)
	end
end
--Toggle Rappel Timer
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		local heli = GetVehiclePedIsIn(lPed)
		if 	IsHeliHighEnough(heli) and IsVehicleModel(heli, pdmav_hash) then
			local timer = 0
			while IsControlPressed(0, toggle_rappel) do
				Citizen.Wait(0)
				timer = timer + 1
				if timer > 60 then
					pressed = true
					break
				end
			end
		else
			Citizen.Wait(5000)
		end
	end
end)
function HandleZoom(cam)
	if IsControlJustPressed(0,241) then -- Scrollup
		fov = math.max(fov - zoomspeed, fov_min)
	end
	if IsControlJustPressed(0,242) then
		fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown		
	end
	local current_fov = GetCamFov(cam)
	if math.abs(fov-current_fov) < 0.1 then -- the difference is too small, just set the value directly to avoid unneeded updates to FOV of order 10^-5
		fov = current_fov
	end
	SetCamFov(cam, current_fov + (fov - current_fov)*0.05) -- Smoothing of camera zoom
end

function GetVehicleInView(cam)
	local coords = GetCamCoord(cam)
	local forward_vector = RotAnglesToVec(GetCamRot(cam, 2))
	--DrawLine(coords, coords+(forward_vector*100.0), 255,0,0,255) -- debug line to show LOS of cam
	local rayhandle = CastRayPointToPoint(coords, coords+(forward_vector*200.0), 10, GetVehiclePedIsIn(GetPlayerPed(-1)), 0)
	local _, _, _, _, entityHit = GetRaycastResult(rayhandle)
	if entityHit>0 and IsEntityAVehicle(entityHit) then
		return entityHit
	else
		return nil
	end
end

function RenderVehicleInfo(vehicle)
	if DoesEntityExist(vehicle) then
		local model = GetEntityModel(vehicle)
		local vehname = GetLabelText(GetDisplayNameFromVehicleModel(model))
		local licenseplate = GetVehicleNumberPlateText(vehicle)
		if speed_measure == "MPH" then
			vehspeed = GetEntitySpeed(vehicle)*2.236936
		else
			vehspeed = GetEntitySpeed(vehicle)*3.6
		end
		 -- Location of target vehicle 
  local x,y,z = table.unpack(GetEntityCoords(vehicle, false))
    local streetName, crossing = GetStreetNameAtCoord(x, y, z)
    streetName = GetStreetNameFromHashKey(streetName)
    local location = ""
  		if crossing ~= 0 then
  			crossing = GetStreetNameFromHashKey(crossing)
  			location = streetName .. ", " .. crossing 
  		else
  	location = streetName 
  end

  -- Heading of target vehicle
  	local directions = { [0] = 'North', [45] = 'North-West', [90] = 'West', [135] = 'South-West', [180] = 'South', [225] = 'South-East', [270] = 'East', [315] = 'North-East', [360] = 'North', }
  for k,v in pairs(directions)do
  	direction = GetEntityHeading(vehicle, false)
  	if(math.abs(direction - k) < 22.5)then
  		direction = v
  		break;
  	end
  end
		
		if speed_measure == "MPH" then
  	vehspeed = GetEntitySpeed(vehicle)*2.236936
  else
  	vehspeed = GetEntitySpeed(vehicle)*3.6
  end
  SetTextFont(0)
  SetTextProportional(1)
  if vehicle_display == 0 then
  	SetTextScale(0.0, 0.40)
  elseif vehicle_display == 1 then
  	SetTextScale(0.0, 0.40)
  end
  SetTextColour(255, 255, 255, 255)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  SetTextCentre(true) 
  if vehicle_display == 1 then
  	AddTextComponentString("Location: "  .. location .. "\nVelocity: " .. direction .. " | " .. math.ceil(vehspeed) .. " MPH" .. "\nVehicle: " .. vehname .. " | " .. licenseplate)
  end
  DrawText(0.5, 0.91)
	end
end

function RotAnglesToVec(rot) -- input vector3
	local z = math.rad(rot.z)
	local x = math.rad(rot.x)
	local num = math.abs(math.cos(x))
	return vector3(-math.sin(z)*num, math.cos(z)*num, math.sin(x))
end

-- Following two functions from IllidanS4's entity enuerator script:  https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2
local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end
    
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function FindVehicleByPlate(plate) -- Search existing vehicles enumerated above for target plate and return the matching vehicle
	for vehicle in EnumerateVehicles() do
		if GetVehicleNumberPlateText(vehicle) == plate then
			return vehicle
		end
	end
end