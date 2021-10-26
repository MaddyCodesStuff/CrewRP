--[[
Orbital Cannon 
Credits - MythicalBro
/////License/////
Do not reupload/re release any part of this script without my permission
]]
function f(n)
	n = n + 0.00000
	return n
end
local oc,oc_manual,oc_automatic,oc_surveillance = false,false,false,false
local oc_speed = f(8)
local oc_pos = vector3(0,0,0)
local cam = nil
local oc_height = f(1000)
local oc_target = nil
local oc_countdown = false
local oc_countdown_text = 3
local toggle = false

OCmenu = Menu.new("Orbital Cannon","",0.15,0.1,0.28,0.4,0)
OCmenu.config.pcontrol = false
OCmenu:addButton("Surveillance","Observe San Andreas using the optics of the Orbital Cannon. No firing capabilities.")
OCmenu:addButton("Cannon","Fire the Orbital Cannon on a manually tracked target.")

RegisterNetEvent("orbital_cannon:toggle")
AddEventHandler("orbital_cannon:toggle", function()
	toggle = not toggle
	if toggle then
		TriggerEvent('mythic_notify:client:SendAlert', { type = "inform", text = "ORBITAL CANNON ACTIVE [[]", duration = 5000} )
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = "inform", text = "Orbital Cannon Deactivated", duration = 5000 } )
	end
end)

function DrawTextXY(text, settings)
	if settings == nil then
		settings = {}
	end
	if settings.rgba == nil then
		settings.rgba = {255,255,255,255}
	end
	SetTextFont(settings.font or 4)
	SetTextProportional(0)
	SetTextScale(settings.scale or 0.4, settings.scale or 0.4)
	if settings.right then
		SetTextRightJustify(1)
		SetTextWrap(0.0,settings.x or 0.5)
	end
	SetTextColour(settings.rgba[1] or 255, settings.rgba[2] or 255, settings.rgba[3] or 255, settings.rgba[4] or 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(settings.centre or 0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(settings.x or 0.5 , settings.y or 0.5)	
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

AddEventHandler('playerSpawned', function(spawn)
	SetCanAttackFriendly(GetPlayerPed(-1), true, false)
	NetworkSetFriendlyFireOption(true)
end)

function OCmenu:OnMenuOpen()
	oc_manual = false
	oc_automatic = false
	oc_surveillance = false
	oc_target = nil
end

function OCmenu:OnMenuClose()
	
end

function OCmenu:OnMenuChange(last,current)
	if current.name == "automatictargetting" then
		Setibuttons({	
		}, 0)
		OCmenu.automatictargetting.buttons = {}
		for i = 0,32 do 
			if NetworkIsPlayerActive(i) and i ~= PlayerId() then
				local ped = GetPlayerPed(i)
				if IsEntityDead(ped) == false and GetPlayerInvincible(i) == false then
					OCmenu.automatictargetting:addButton(GetPlayerName(i),nil)
				end
			end
		end
	end
end

function OCmenu:onButtonSelected(name,btn)
	if name == "Cannon" then
		Setibuttons({	
			{GetControlInstructionalButton(2,194,0), "Back"},
			{GetControlInstructionalButton(1,15,0),"Zoom In"},
			{GetControlInstructionalButton(1,16,0),"Zoom Out"},
			{GetControlInstructionalButton(2,201,0),"Fire"},
		}, 0)
		oc_manual = true
		OCmenu:Close()
	elseif name == "Surveillance" then
		Setibuttons({	
			{GetControlInstructionalButton(2,194,0), "Back"},
			{GetControlInstructionalButton(1,15,0),"Zoom In"},
			{GetControlInstructionalButton(1,16,0),"Zoom Out"},
		}, 0)
		oc_surveillance = true
		OCmenu:Close()
	end
	if self.currentmenu ~= "main" then
		if self.currentmenu.name == "automatictargetting" then
			local target = nil
			for i = 0,32 do
				if NetworkIsPlayerActive(i) and GetPlayerName(i) == name then
					target = i
					break
				end
			end
			if target ~= nil then
				oc_target = target
				oc_automatic = true
				OCmenu:Close()
				FireOrbitalCannon(true,GetPlayerPed(target))
			else
				OCmenu:showNotification("Couldnt target player")
			end
		end
	end
end

function FireOrbitalCannon(lock,var)
	if lock then
		Citizen.CreateThread(function()
			oc_countdown = false
			local ped = var
			local pos = GetEntityCoords(ped)
			local heading = GetEntityHeading(ped)
			if not HasWeaponAssetLoaded(GetHashKey("WEAPON_VEHICLE_ROCKET")) then
				RequestWeaponAsset(GetHashKey("WEAPON_VEHICLE_ROCKET"), 31, 0)
				while not HasWeaponAssetLoaded(GetHashKey("WEAPON_VEHICLE_ROCKET")) do
					Citizen.Wait(0)
				end
			end
			local offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,0,0,0)
			RequestCollisionAtCoord(offset)
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,0,0,0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,f(-3),0,0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,f(3),0,0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,0,f(-3),0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,0,f(3),0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			Citizen.Wait(1000)
			OCmenu:Open()
			if IsEntityDead(ped) then
				OCmenu:showNotification("Target successfully obliterated.")
			else
				OCmenu:showNotification("~r~Obliteration failed. Target survived.")
			end
			streetName, _      = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
			streetName         = GetStreetNameFromHashKey(streetName)
			TriggerServerEvent('esx_outlawalert:explosionInProgress', pos, streetName, true, nil)
		end)
	else
		Citizen.CreateThread(function()
			oc_countdown = false
			local pos = oc_pos
			local heading = 0
			SetFocusArea(pos, 0, 0, 0)
			if not HasWeaponAssetLoaded(GetHashKey("WEAPON_VEHICLE_ROCKET")) then
				RequestWeaponAsset(GetHashKey("WEAPON_VEHICLE_ROCKET"), 31, 0)
				while not HasWeaponAssetLoaded(GetHashKey("WEAPON_VEHICLE_ROCKET")) do
					Citizen.Wait(0)
				end
			end
			local offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,0,0,0)
			RequestCollisionAtCoord(offset)
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,0,0,0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,f(-3),0,0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,f(3),0,0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,0,f(-3),0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			offset = GetObjectOffsetFromCoords(pos.x,pos.y,pos.z,heading,0,f(3),0)
			ShootSingleBulletBetweenCoords(offset+vector3(0,0,5), offset, 5000, 0, GetHashKey("WEAPON_VEHICLE_ROCKET"), GetPlayerPed(-1), 1, 0, f(9000))
			streetName, _      = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
			streetName         = GetStreetNameFromHashKey(streetName)
			TriggerServerEvent('esx_outlawalert:explosionInProgress', pos, streetName, true, nil)
		end)
	end
end

Citizen.CreateThread(function()
local rx,ry,rz = 0,0,0
	while true do
		Citizen.Wait(0)
		if toggle then 
			if IsControlJustPressed(2,100) then
				oc = not oc
				if oc then
					TriggerEvent("emote:do", "tablet2")
					OCmenu:Open()
					local ped = GetPlayerPed(-1)
					local pos = GetEntityCoords(ped)
					FreezeEntityPosition(ped, true)
					SetEntityVisible(ped, false, 0)
					SetEntityCollision(ped, false, 0)
					SetEntityInvincible(ped, true)
					SetPedDiesInWater(ped, 0)
					if not DoesCamExist(cam) then
						cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",false)
						SetCamCoord(cam,vector3(pos.x,pos.y,oc_height))
						SetCamRot(cam,-f(90),f(0),f(0),2)
						SetCamActive(cam,true)
						StopCamPointing(cam)
						RenderScriptCams(true,true,0,0,0,0)
					else
						SetCamCoord(cam,vector3(pos.x,pos.y,oc_height))
						SetCamRot(cam,-f(90),f(0),f(0),2)
						SetCamActive(cam,true)
						StopCamPointing(cam)
						RenderScriptCams(true,true,0,0,0,0)
					end
					oc_manual = false
					oc_automatic = false
					DisplayRadar(false)
					StartScreenEffect("DeathFailNeutralIn",0,true)
				else
					StopScreenEffect("DeathFailNeutralIn")
					OCmenu:Close()
					local ped = GetPlayerPed(-1)
					FreezeEntityPosition(ped, false)
					SetEntityVisible(ped, true)
					SetEntityCollision(ped, true, 1)
					SetEntityInvincible(ped, false)
					SetPedDiesInWater(ped, 1)
					SetCamActive(cam,false)
					StopCamPointing(cam)
					RenderScriptCams(0,0,0,0,0,0)
					DisplayRadar(true)
					SetFocusEntity(ped)
				end
			end
			if oc then
				if IsEntityDead(GetPlayerPed(-1)) then
					StopScreenEffect("DeathFailNeutralIn")
					OCmenu:Close()
					local ped = GetPlayerPed(-1)
					FreezeEntityPosition(ped, false)
					SetEntityVisible(ped, true)
					SetEntityCollision(ped, true, 1)
					SetEntityInvincible(ped, false)
					SetPedDiesInWater(ped, 1)
					SetCamActive(cam,false)
					StopCamPointing(cam)
					RenderScriptCams(0,0,0,0,0,0)
					DisplayRadar(true)
					SetFocusEntity(ped)
				end
				DisableControlAction(2, 26, true)
				DisableControlAction(2, 24, true)
				DisableControlAction(2, 16, true)
				DisableControlAction(2, 17, true)
				if not HasStreamedTextureDictLoaded("helicopterhud") then
					RequestStreamedTextureDict("helicopterhud")
					while not HasStreamedTextureDictLoaded("helicopterhud") do
						Citizen.Wait(0)
					end
				end
				if not HasStreamedTextureDictLoaded("securitycam") then
					RequestStreamedTextureDict("securitycam")
					while not HasStreamedTextureDictLoaded("securitycam") do
						Citizen.Wait(0)
					end
				end
				if not HasStreamedTextureDictLoaded("crosstheline") then
					RequestStreamedTextureDict("crosstheline")
					while not HasStreamedTextureDictLoaded("crosstheline") do
						Citizen.Wait(0)
					end
				end
				if not OCmenu:isVisible() then
					Drawibuttons()
					if oc_countdown then
						DrawTextXY('~r~FIRING IN',{ centre= 1,x = 0.5, y = 0.3, scale = 0.85})
						DrawTextXY('~r~'..oc_countdown_text,{ centre= 1,x = 0.5, y = 0.36, scale = 0.85})
					end
					if oc_automatic or oc_manual or oc_surveillance then
						DrawSprite("helicopterhud", "hud_corner", f(0.1), f(0.1), f(0.015), f(0.02), f(0.0), 255, 255, 255, 255)
						DrawSprite("helicopterhud", "hud_corner", f(0.9), f(0.1), f(0.015), f(0.02), f(90), 255, 255, 255, 255)
						DrawSprite("helicopterhud", "hud_corner", f(0.1), f(0.9), f(0.015), f(0.02), f(270), 255, 255, 255, 255)
						DrawSprite("helicopterhud", "hud_corner", f(0.9), f(0.9), f(0.015), f(0.02), f(180), 255, 255, 255, 255)
						DrawSprite("crosstheline", "timer_largecross_32", f(0.5), f(0.5), f(0.025), f(0.04), f(0.0), 255, 255, 255, 255)
						if not oc_surveillance then
							if oc_target ~= nil then
								DrawSprite("helicopterhud", "hud_lock", f(0.5), f(0.5), f(0.06), f(0.09), f(0.0), 255, 0, 0, 255)
							else
								DrawSprite("helicopterhud", "hud_lock", f(0.5), f(0.5), f(0.06), f(0.09), f(0.0), 255, 255, 255, 255)
							end
						end
						for i = 0,32 do
							if NetworkIsPlayerActive(i) and IsEntityDead(GetPlayerPed(i)) == false then
								local pos = GetEntityCoords(GetPlayerPed(i))
								local b,x,y = N_0xf9904d11f1acbec3(pos.x,pos.y,pos.z)
								if i == PlayerId() then
									if not b then
										DrawTextXY('~b~YOU',{x = x, y = y-0.04, centre = 1})
										DrawSprite("helicopterhud", "hud_lock", f(x), f(y), f(0.025), f(0.035), f(0.0), 50, 155, 255, 255)
									else
										DrawSprite("helicopterhud", "hudarrow", f(x), f(y), f(0.015), f(0.025), f(0.0), 50, 155, 255, 255)
									end
								else
									if oc_target == i then
										DrawSprite("helicopterhud", "hud_lock", f(x), f(y), f(0.025), f(0.035), f(0.0), 255, 100, 100, 255)
									else
										if not b then
											DrawSprite("helicopterhud", "hud_lock", f(x), f(y), f(0.025), f(0.035), f(0.0), 100, 255, 100, 255)
										else
											DrawSprite("helicopterhud", "hudarrow", f(x), f(y), f(0.015), f(0.025), f(0.0), 100, 255, 100, 255)
										end
									end
								end
							end
						end
					end
					if IsControlJustReleased(2,202) then
						if oc_automatic or oc_manual or oc_surveillance then
							OCmenu:Open()
						else
							oc = not oc
							StopScreenEffect("DeathFailNeutralIn")
							OCmenu:Close()
							local ped = GetPlayerPed(-1)
							FreezeEntityPosition(ped, false)
							SetEntityVisible(ped, true)
							SetEntityCollision(ped, true, 1)
							SetEntityInvincible(ped, false)
							SetPedDiesInWater(ped, 1)
							SetCamActive(cam,false)
							StopCamPointing(cam)
							RenderScriptCams(0,0,0,0,0,0)
							DisplayRadar(true)
							SetFocusEntity(ped)
						end
					end
					if oc_manual or oc_surveillance then
						if IsPauseMenuActive() == false then
							local rotation = GetCamRot(cam,2)
							local position = GetCamCoord(cam)
							local heading = rotation.z
							local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,position,Citizen.PointerValueFloat(),0)
							SetFocusArea(position.x,position.y,g, 0, 0, 0)
							if IsDisabledControlPressed(2,15) or IsControlPressed(2,15) then
								if oc_height > 250 then
									oc_height = oc_height - oc_speed*2
									SetCamCoord(cam,vector3(position.x,position.y,oc_height))
									RenderScriptCams(1, 1, 0, 0, 0)
								end
							end
							if IsDisabledControlPressed(2,16) or IsControlPressed(2,16) then
								if oc_height < 1000 then
									oc_height = oc_height + oc_speed*2
									SetCamCoord(cam,vector3(position.x,position.y,oc_height))
									RenderScriptCams(1, 1, 0, 0, 0)
								end
							end
							if IsDisabledControlPressed(2,33) then
								SetCamCoord(cam,GetObjectOffsetFromCoords(position.x,position.y,position.z,heading, 0,-oc_speed,0))
							end
							--s
							if IsDisabledControlPressed(2,32) then
								SetCamCoord(cam,GetObjectOffsetFromCoords(position.x,position.y,position.z,heading, 0,oc_speed,0))
							end
							--a
							if IsDisabledControlPressed(2,34) then
								SetCamCoord(cam,GetObjectOffsetFromCoords(position.x,position.y,position.z,heading, -oc_speed,0,0))
							end
							--d
							if IsDisabledControlPressed(2,35) then
								SetCamCoord(cam,GetObjectOffsetFromCoords(position.x,position.y,position.z,heading, oc_speed,0,0))
							end
							rightAxisX = GetDisabledControlNormal(0, 270)
							rightAxisY = GetDisabledControlNormal(0, 272)
							if (rightAxisX ~= 0 and rightAxisY ~= 0) then
								newY = position.y - rightAxisY * f(10)*oc_speed
								newX = position.x + rightAxisX * f(10)*oc_speed
								SetCamCoord(cam,newX, newY, position.z,2)
							end
							if oc_manual then
								oc_pos = vector3(position.x,position.y,g)
								if IsDisabledControlJustPressed(2,201) then
									if oc_countdown == false then
										FireOrbitalCannon(false)
									end
								end
							end
						end
					elseif oc_automatic then
						local ped = GetPlayerPed(oc_target)
						local position = GetEntityCoords(ped)
						local heading = GetEntityHeading(ped)
						SetCamCoord(cam,vector3(position.x,position.y,position.z+ 250))
						oc_height = position.z+ 250
						SetFocusArea(position, 0, 0, 0)
					end
				else

				end
			end
		end
	end
end)

local sf = nil
function Setibuttons(buttons, layout) --Layout: 0 - Horizontal, 1 - vertical
	Citizen.CreateThread(function()
		if not HasScaleformMovieLoaded(sf) then
			sf = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
			while not HasScaleformMovieLoaded(sf) do
				Citizen.Wait(0)
			end
		end
		local sf = sf
		local w,h = GetScreenResolution()
		local aw,ah = GetActiveScreenResolution()
		local wide = (aw>ah)
		local ssize = round(GetSafeZoneSize(),2)
		PushScaleformMovieFunction(sf,"CLEAR_ALL")
		PopScaleformMovieFunction()
		PushScaleformMovieFunction(sf,"INSTRUCTIONAL_BUTTONS")
		PopScaleformMovieFunction()
		PushScaleformMovieFunction(sf,"SET_MAX_WIDTH")
		PushScaleformMovieFunctionParameterInt(1)
		PopScaleformMovieFunction()
		PushScaleformMovieFunction(sf,"OVERRIDE_POSITION")
		PushScaleformMovieFunctionParameterFloat(ssize) --x
		PushScaleformMovieFunctionParameterFloat(ssize) --y
		PushScaleformMovieFunctionParameterBool(true)--align right
		PopScaleformMovieFunction()
		
		for i,btn in pairs(buttons) do
			PushScaleformMovieFunction(sf,"SET_DATA_SLOT")
			PushScaleformMovieFunctionParameterInt(i-1)
			PushScaleformMovieFunctionParameterString(btn[1])
			PushScaleformMovieFunctionParameterString(btn[2])
			PopScaleformMovieFunction()
			
		end
		if layout ~= 1 then
			PushScaleformMovieFunction(sf,"SET_PADDING")
			PushScaleformMovieFunctionParameterInt(10)
			PopScaleformMovieFunction()
		end
		PushScaleformMovieFunction(sf,"DRAW_INSTRUCTIONAL_BUTTONS")
		PushScaleformMovieFunctionParameterInt(layout)
		PopScaleformMovieFunction()
	end)
end
function Drawibuttons() -- Layout: 1 - vertical,0 - horizontal 
	if HasScaleformMovieLoaded(sf) then
		DrawScaleformMovie(sf, 0.5, 0.5, 1.0, 1.0, 255, 255, 255, 255)
	end
end