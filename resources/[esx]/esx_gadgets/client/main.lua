local Keys               = {
	["ESC"]       = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"]         = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"]       = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"]      = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"]  = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"]      = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"]      = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"]    = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                      = nil
local PlayerData         = {}

local fov_max            = 70.0
local fov_min            = 5.0 -- max zoom level (smaller fov is more zoom)
local zoomspeed          = 10.0 -- camera zoom speed
local speed_lr           = 8.0 -- speed by which the camera pans left-right
local speed_ud           = 8.0 -- speed by which the camera pans up-down

local usingScuba         = false

local usingNightVision   = false

local usingThermalVision = false

local binoculars         = false

local object, object2
local flag = 0

local scubaTimer         = 900000 -- 15 minutes

local binoculars         = false
local fov                = (fov_max + fov_min) * 0.5

local storeBinoclarKey   = Keys["BACKSPACE"]

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

	TriggerServerEvent('esx_playerCounter:updateCounter')
end)

-- Activate binoculars
RegisterNetEvent('esx_gadgets:useBinoculars')
AddEventHandler('esx_gadgets:useBinoculars', function()
	binoculars = not binoculars
end)

-- Activate scuba gear

Citizen.CreateThread(function()
	local playerPed = GetPlayerPed(-1)
	

	while true do
		Citizen.Wait(0)
		if usingScuba then
			scubaTimer = scubaTimer - 10
			
			if scubaTimer >= 900000 and scubaTimer > 600000 and flag ~= 100 then
				ESX.ShowNotification("Oxygen level: 100%")
				flag = 100
			elseif scubaTimer <= 600000 and scubaTimer >= 300001 and flag ~= 50 then
				ESX.ShowNotification("Oxygen level: 50%")
				flag = 50
			elseif scubaTimer <= 300000 and scubaTimer >= 150001  and flag ~= 25 then
				ESX.ShowNotification("Oxygen level: 25%")
				flag = 25
			elseif scubaTimer <= 150000 and scubaTimer >= 1 and flag ~= 10 then
				ESX.ShowNotification("Oxygen level: 10%~. get to the surface!")
				flag = 10
			elseif scubaTimer == 0 and  flag ~= 0 then
				flag = 0
				ESX.ShowNotification("Oxygen level: 0%")
				usingScuba = false
				SetPedDiesInWater(playerPed, true)
				DeleteObject(object)
				DeleteObject(object2)
				ClearPedSecondaryTask(playerPed)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if usingScuba then
			ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to remove scuba gear")

			if IsControlJustReleased(0, Keys['E']) then
				usingScuba = false
				SetPedDiesInWater(playerPed, true)
				DeleteObject(object)
				DeleteObject(object2)
				ClearPedSecondaryTask(playerPed)

				ESX.ShowNotification("Scuba gear removed.")
			end
		end

		if usingNightVision then
			ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to disable night vision")

			if IsControlJustReleased(0, Keys['E']) then
				usingNightVision = false
				SetNightvision(false)

				ESX.ShowNotification("Night vision disabled.")
			end
		end

		if usingThermalVision then
			ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to disable thermal vision")

			if IsControlJustReleased(0, Keys['E']) then
				usingThermalVision = false
				SetSeethrough(false)

				ESX.ShowNotification("Thermal vision disabled.")
			end
		end
	end
end)

RegisterNetEvent('esx_gadgets:useThermalVision')
AddEventHandler('esx_gadgets:useThermalVision', function()

	if usingNightVision then
		usingNightVision = false

		SetNightvision(false)
		ESX.ShowNotification("Night vision disabled!")
	end
	usingThermalVision = true
	SetSeethrough(true)
	ESX.ShowNotification("Thermal vision enabled!")
end)

RegisterNetEvent('esx_gadgets:useNightVision')
AddEventHandler('esx_gadgets:useNightVision', function()

	if usingThermalVision then
		usingThermalVision = false

		SetSeethrough(false)
		ESX.ShowNotification("Thermal vision disabled!")
	end
	usingNightVision = true
	SetNightvision(true)
	ESX.ShowNotification("Night vision enabled!")

end)

RegisterNetEvent('esx_gadgets:useScuba')
AddEventHandler('esx_gadgets:useScuba', function()

	usingScuba = true

	Citizen.CreateThread(function()
		local playerPed  = GetPlayerPed(-1)
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 12844)
		local boneIndex2 = GetPedBoneIndex(playerPed, 24818)

		if not object then
			RequestModel(GetHashKey('p_s_scuba_mask_s'))

			while not HasModelLoaded(GetHashKey('p_s_scuba_mask_s')) do
				Citizen.Wait(0)
			end
		end

		if not object2 then
			RequestModel(GetHashKey('p_s_scuba_tank_s'))

			while not HasModelLoaded(GetHashKey('p_s_scuba_tank_s')) do
				Citizen.Wait(0)
			end
		end

		-- scubaTimer = 900000
		scubaTimer = 900000

		object     = CreateObject(GetHashKey('p_s_scuba_mask_s'), coords.x, coords.y, coords.z - 3, true, false, true)
		object2    = CreateObject(GetHashKey('p_s_scuba_tank_s'), coords.x, coords.y, coords.z - 3, true, false, true)

		AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false,
							 true, 1, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1,
							 true)
		SetPedDiesInWater(playerPed, false)

		ESX.ShowNotification("Scuba gear equipped!")
		
	end)
end)

-- Give the parachute to the player
RegisterNetEvent('esx_gadgets:useParachute')
AddEventHandler('esx_gadgets:useParachute', function()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), 150, true, true)
end)

-- Thread for binoculars
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local lPed    = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(lPed)

		if binoculars then
			binoculars = true
			if not (IsPedSittingInAnyVehicle(lPed)) then
				Citizen.CreateThread(function()
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS", 0, 1)
					PlayAmbientSpeech1(GetPlayerPed(-1), "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")
				end)
			end

			Wait(2000)

			SetTimecycleModifier("default")

			SetTimecycleModifierStrength(0.3)

			local scaleform = RequestScaleformMovie("BINOCULARS")

			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(10)
			end

			local lPed    = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(lPed)
			local cam     = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)

			AttachCamToEntity(cam, lPed, 0.0, 0.0, 1.0, true)
			SetCamRot(cam, 0.0, 0.0, GetEntityHeading(lPed))
			SetCamFov(cam, fov)
			RenderScriptCams(true, false, 0, 1, 0)
			PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
			PushScaleformMovieFunctionParameterInt(0) -- 0 for nothing, 1 for LSPD logo
			PopScaleformMovieFunctionVoid()

			while binoculars and not IsEntityDead(lPed) and (GetVehiclePedIsIn(lPed) == vehicle) and true do
				if IsControlJustPressed(0, storeBinoclarKey) then
					-- Toggle binoculars
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					ClearPedTasks(GetPlayerPed(-1))
					binoculars = false
				end

				DrawAdvancedText(0.55, 0.93, 0.005, 0.0028, 0.6, "~g~Backspace~w~ to Exit", 255, 255, 255, 255, 6, 1)

				local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
				CheckInputRotation(cam, zoomvalue)

				HandleZoom(cam)
				HideHUDThisFrame()

				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
				Citizen.Wait(1)
			end

			binoculars = false
			ClearTimecycleModifier()
			fov = (fov_max + fov_min) * 0.5
			RenderScriptCams(false, false, 0, 1, 0)
			SetScaleformMovieAsNoLongerNeeded(scaleform)
			DestroyCam(cam, false)
			SetNightvision(false)
			SetSeethrough(false)

		end

		if usingNightVision then
			SetNightvision(true)
		end

		if usingThermalVision then
			SetSeethrough(true)
		end
	end
end)

--FUNCTIONS--
function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
	HideHudComponentThisFrame(1) -- Wanted Stars
	HideHudComponentThisFrame(2) -- Weapon icon
	HideHudComponentThisFrame(3) -- Cash
	HideHudComponentThisFrame(4) -- MP CASH
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(8)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(13) -- Cash Change
	HideHudComponentThisFrame(11) -- Floating Help Text
	HideHudComponentThisFrame(12) -- more floating help text
	HideHudComponentThisFrame(15) -- Subtitle Text
	HideHudComponentThisFrame(18) -- Game Stream
	HideHudComponentThisFrame(19) -- weapon wheel
end

function CheckInputRotation(cam, zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0, 220)
	local rightAxisY = GetDisabledControlNormal(0, 221)
	local rotation   = GetCamRot(cam, 2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX * -1.0 * (speed_ud) * (zoomvalue + 0.1)
		new_x = math.max(math.min(20.0, rotation.x + rightAxisY * -1.0 * (speed_lr) * (zoomvalue + 0.1)), -89.5)
		SetCamRot(cam, new_x, 0.0, new_z, 2)
	end
end

function HandleZoom(cam)
	local lPed = GetPlayerPed(-1)
	if not (IsPedSittingInAnyVehicle(lPed)) then

		if IsControlJustPressed(0, 241) then
			-- Scrollup
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0, 242) then
			fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov - current_fov) < 0.1 then
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov) * 0.05)
	else
		if IsControlJustPressed(0, 17) then
			-- Scrollup
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0, 16) then
			fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov - current_fov) < 0.1 then
			-- the difference is too small, just set the value directly to avoid unneeded updates to FOV of order 10^-5
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov) * 0.05) -- Smoothing of camera zoom
	end
end

function DrawAdvancedText(x, y, w, h, sc, text, r, g, b, a, font, jus)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - 0.1 + w, y - 0.02 + h)
end
