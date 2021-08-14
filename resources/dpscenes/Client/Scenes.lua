Scenes = {}
Scene = {}
Presets = {}
Cache = {}
LOS = {}
Cooldown = false
Hidden = false
MovingScene = false
IsAdmin = false
savedcoords = nil
ClientTextScale = 1
distancetimer = 0

function IncurCooldown(time)
	Cooldown = true
	CreateThread(function() Wait(time) Cooldown = false end)
end

-- This is the default scene options.
function ResetScene()
	Scene = {
		State = false,
		Info = false,
		Hours = 4,
		ShowAge = 1,
		Text = {Text = "", Font = 1, Size = .50, Outline = 1},
		Background = {
			Sprite = 1,
			Colour = {0,0,0},
			ColourName = "Black",
			Settings = {x = 0.00, y = 0.016, w = 0.01, h = 0.01, r = 0.00, o = 120}
		},
		Distance = 10,
		AnyDelete = 1,
		Function = false
	}
end

function SceneAge(sec)
	local Seconds = tonumber(sec)
	if Seconds <= 0 then
		return {Hours = 0, Minutes = 0}
	else
		Hours = string.format("%02.f", math.floor(Seconds/3600))
		Minutes = string.format("%02.f", math.floor(Seconds/60-(Hours*60)))
		return {Hours = Hours, Minutes = Minutes}
	end
end

function SceneText(i)
	local x,y,z = table.unpack(i.Location)
	local Active,_x,_y = World3dToScreen2d(x,y,z)
	if Active then
		local Font = Fonts[i.Text.Font].Font or 4
		local Dis = Distance(GetGameplayCamCoords(), vec(x,y,z))
		local Scale = ((1/Dis)*2)*(1/GetGameplayCamFov())*80*ClientTextScale
		local RangeAlpha = 10*math.floor(Scale*40)
		if RangeAlpha > 225 then RangeAlpha = 225 elseif RangeAlpha < 40 then RangeAlpha = 40 end
		local SceneAlpha = RangeAlpha
		local Text = i.Text.Text
		if i.ShowAge == 1 then
			local Age = Lang("Recent")
			if i.Age then local Hours = string.format("%01.f", math.floor(tonumber(i.Age.Hours))) if tonumber(Hours) > 1 then Age = Hours.." "..Lang("Hours") end end
			Text = "~m~["..Age.."]~w~ "..i.Text.Text
		end
		SetTextColour(255, 255, 255, RangeAlpha)
		SetTextScale(0.0*Scale, i.Text.Size*Scale)
		SetTextFont(Font)
		SetTextProportional(1)
		SetTextCentre(true)
		SetTextWrap(0.0, 1.0)
		if i.Text.Outline then if i.Text.Outline == 1 then SetTextOutline() elseif i.Text.Outline == 2 then SetTextDropshadow(1, 255, 255, 255, 0) end end
		BeginTextCommandWidth("THREESTRINGS")
		AddTextComponentString(Text)
		if string.len(Text) > 99 then SplitString(Text) end
		local H = GetTextScaleHeight(i.Text.Size*Scale, Font)+0.0030
		local W = EndTextCommandGetWidth(Font)+0.005

		SetTextEntry("THREESTRINGS")
		AddTextComponentString(Text)
		if string.len(Text) > 99 then
			SplitString(Text)
		end
		EndTextCommandDisplayText(_x, _y)

		if i.Background then
			if SceneAlpha > i.Background.Settings.o then SceneAlpha = i.Background.Settings.o end
			local Col = i.Background.Colour
			local Sprite = Config.BackgroundSprites[i.Background.Sprite].Sprite
			local Settings = i.Background.Settings
			DrawSprite("dpscenes", Sprite, _x+Settings.x*Scale, _y+Settings.y*Scale, W+Settings.w*Scale, H+Settings.h*Scale, Settings.r, Col[1], Col[2], Col[3], SceneAlpha)
		end
	end
end

function HandleSceneInteract(i)
	if Cooldown then return false end
	local Interact = i.Function
	if Interact.Prefix then
		ExecuteCommand(Interact.Prefix.." "..Interact.Variable)
		IncurCooldown(1000) return true
	else
		local t = false
		local f = ""
		for k,v in pairs(Config.SceneFunctions) do
			if v.Name == Interact.Current then
				t = v.Function
				f = v.Name
			end
		end
		if t and f == 'GPS' then
			Chat(Lang("WaypointSet"))
			t(Interact.Variable)
			IncurCooldown(1000) return true
		else
			t(Interact.Variable)
			IncurCooldown(1000) return true
		end
	end
end

function DrawScene(i,p)
	local Distance = Distance(i.Location, p)
	local s = ((1/Distance)*2)*(1/GetGameplayCamFov())*80
	local a = 10 * math.floor(s*20)
	if a > 225 then a = 225 elseif a < 40 then a = 40 end
	local Age = false
	if Cache.Time and i.Created then
		Age = SceneAge(Cache.Time - i.Created)
	end
	local ExtraInformation = i
	ExtraInformation["Age"] = Age
	ExtraInformation["Alpha"] = a
	SceneText(ExtraInformation)
	if Distance < 1.5 and not Scene.State then
		if i.Function then
			if i.Function.Current == "GPS" or i.Function.Current == "Teleporter" then
				SetTextComponentFormat("TWOSTRINGS")
				AddTextComponentString(Lang("Interact"))
				AddTextComponentString("\n~b~"..string.format(i.Function.Description or "N/A %s", i.Function.String or "N/A"))
				EndTextCommandDisplayHelp(0,0,0,-1)
				if IsControlJustReleased(0, GetKey("E")) then
					if not HandleSceneInteract(i) then
						Chat(Lang("CantRightNow"))
					end
				end
			elseif i.Function.Current ~= "None"  then
				SetTextComponentFormat("TWOSTRINGS")
				AddTextComponentString(Lang("Interact"))
				AddTextComponentString("\n~b~/"..i.Function.Prefix.." "..i.Function.Variable)
				EndTextCommandDisplayHelp(0,0,0,-1)
				if IsControlJustReleased(0, GetKey("E")) then
					if not HandleSceneInteract(i) then
						Chat(Lang("CantRightNow"))
					end
				end
			end
		end
	end
end

RegisterCommand("sceneremove", function()
	local Hit = nil
	local Coords = nil 
	local Entity = nil
	local Delete = {Id = 0, Distance = 1}
	for i = 1, 110 do
		Wait(0)
		Hit, Coords, Entity = RayCastGamePlayCamera(20)
		DrawMarker(2, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.06, 0.06, 0.06, 0, 200, 255, 255, false, true, false, nil, nil, false)
	end
	for k,v in pairs(Scenes) do
		local Dis = Distance(Coords, v.Location)
		if Dis < Delete.Distance then
			Delete = {Id = k,Distance = Dis}
		end
	end
	if Delete.Id ~= 0 then
		TriggerServerEvent("Scene:AttemptDelete", Delete.Id)
	end
end)

RegisterCommand("sceneowner", function()
	local Hit = nil
	local Coords = nil 
	local Entity = nil
	local Owner = {Id = 0, Distance = 1, SteamID = nil}
	for i = 1, 100 do
		Wait(0)
		Hit, Coords, Entity = RayCastGamePlayCamera(20)
		DrawMarker(2, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.06, 0.06, 0.06, 0, 200, 255, 255, false, true, false, nil, nil, false)
	end
	for k,v in pairs(Scenes) do
		local Dis = Distance(Coords, v.Location)
		if Dis < Owner.Distance then
			Owner = {Id = k, Distance = Dis, SteamID = v.Owner}
			break
		end
	end
	if Owner.Id ~= 0 then
		TriggerServerEvent("Scene:OwnerCheck", Owner.Id)
	end
end)

RegisterCommand("scenecopylast", function()
	if LastCopiedScene then
		Scene = LastCopiedScene
		if not Scene.State then
			Scene.State = "Placing"
		end
	else
		Chat(Lang("NoLastCopied"))
	end
end)

RegisterCommand("scenecopy", function()
	local Hit = nil
	local Coords = nil 
	local Entity = nil
	local Copy = {Id = 0, Distance = 1}
	for i = 1, 110 do
		Wait(0)
		Hit, Coords, Entity = RayCastGamePlayCamera(20)
		DrawMarker(2, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.06, 0.06, 0.06, 0, 200, 255, 255, false, true, false, nil, nil, false)
	end
	for k,v in pairs(Scenes) do
		local Dis = Distance(Coords, v.Location)
		if Dis < Copy.Distance then
			Copy = {Id = k,Distance = Dis}
		end
	end
	if Copy.Id ~= 0 then
		TriggerServerEvent("Scene:AttemptCopy", Copy.Id)
	else
		Chat(Lang("CouldntFindCopy"))
	end
end)

RegisterCommand("scenemove", function()
	if Scene.Placing then
		Chat("Cant do this right now.")
		return
	end
	local Hit = nil
	local Coords = nil 
	local Entity = nil
	local Move = {Id = 0, Distance = 1}
	for i = 1, 110 do
		Wait(0)
		Hit, Coords, Entity = RayCastGamePlayCamera(20)
		DrawMarker(2, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.06, 0.06, 0.06, 0, 200, 255, 255, false, true, false, nil, nil, false)
	end
	for k,v in pairs(Scenes) do
		local Dis = Distance(Coords, v.Location)
		if Dis < Move.Distance then
			Move = {Id = k,Distance = Dis}
		end
	end
	if Move.Id ~= 0 then
		StartMoveScene(Scenes[Move.Id], Move.Id)
	else
		Chat(Lang("CouldntFindMove"))
	end
end)

RegisterCommand("sceneedit", function()
	local Hit = nil
	local Coords = nil 
	local Entity = nil
	local Edit = {Id = 0, Distance = 1}
	for i = 1, 110 do
		Wait(0)
		Hit, Coords, Entity = RayCastGamePlayCamera(20)
		DrawMarker(2, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.06, 0.06, 0.06, 0, 200, 255, 255, false, true, false, nil, nil, false)
	end
	for k,v in pairs(Scenes) do
		local Dis = Distance(Coords, v.Location)
		if Dis < Edit.Distance then
			Edit = {Id = k,Distance = Dis}
		end
	end
	if Edit.Id ~= 0 then
		TriggerServerEvent("Scene:AttemptCopy", Edit.Id)
		TriggerServerEvent("Scene:AttemptDelete", Edit.Id)
	end
end)

RegisterCommand("scenescale", function(Arg1,Arg2)
	local a = tonumber(Arg2[1])
	if type(a) == 'number' then
		ClientTextScale = a
		if ClientTextScale < 1 then
			ClientTextScale = 1
		elseif ClientTextScale > 5 then
			ClientTextScale = 5
		end
	else Chat(Lang("ScaleError"))
	end
end)

RegisterCommand("scenecoords", function()
	if savedcoords == nil then
		local lped = PlayerPedId()
		coords = GetEntityCoords(lped)
		local coordsx = coords.x
		local coordsy = coords.y
		local coordsz = coords.z - 1
		local coordsh = GetEntityHeading(lped)
		savedcoords = vector4(coordsx,coordsy,coordsz,coordsh)
		Chat(Lang("CoordsSaved"))
	else
		savedcoords = nil
		Chat(Lang("CoordsCleared"))
	end
end)

function StartMoveScene(scene, id)
	MovingScene = {
		Scene = scene,
		Id = id,
		OldLoc = scene.Location
	}
	TriggerServerEvent("Scene:AttemptDelete", id, true)
	Chat(Lang("ConfirmCancel"))
end

RegisterCommand("scenehide", function()
	Hidden = not Hidden
end)

local CachedPosition = vec(0,0,0)
CreateThread(function()
	while true do
		CachedPosition = GetEntityCoords(PlayerPedId())
		Wait(1000)
	end
end)

function CreateSuggestions()
	TriggerEvent("chat:addSuggestion", "/scene", Lang("SceneDesc"), {
		{ name="text", help = Lang("SceneDesc2")},
	})
	TriggerEvent("chat:addSuggestion", "/sceneremove", Lang("SceneRemove"))
	TriggerEvent("chat:addSuggestion", "/scenehide", Lang("HideScenes"))
	TriggerEvent("chat:addSuggestion", "/scenecopy", Lang("CopySuggestion"))
	TriggerEvent("chat:addSuggestion", "/scenemove", Lang("MoveSuggestion"))
	TriggerEvent("chat:addSuggestion", "/sceneedit", Lang("EditSuggestion"))
	TriggerEvent("chat:addSuggestion", "/scenecopylast", Lang("CopyLastSuggestion"))
	TriggerEvent("chat:addSuggestion", "/sceneresetpresets", Lang("ResetSuggestion"))
	TriggerEvent("chat:addSuggestion", "/scenescale", Lang("SceneScaleSuggestion"))
	TriggerEvent("chat:addSuggestion", "/scenecoords", Lang("SceneCoordsSuggestion"))
end

local TextureDicts = {"dpscenes", "commonmenu"}
CreateThread(function()
	CreateSuggestions()
	CreateFonts()
	ResetScene()
	for k,v in pairs(TextureDicts) do while not HasStreamedTextureDictLoaded(v) do Wait(100) RequestStreamedTextureDict(v, true) end end
	TriggerServerEvent("Scene:Request")
	local timer = 0
	local timestamp = GetGameTimer()
	while true do Wait(0)
		local mindistance = math.huge
		local currenttimestamp = GetGameTimer()
		local elapsedtime = currenttimestamp - timestamp
		timestamp = currenttimestamp
		distancetimer = distancetimer - elapsedtime
		if distancetimer <= 0 then
			if not Hidden then
				if not ReadyToCheckLos then
					timer = timer + 1
					if timer > 100 then
						timer = 0
						LOS = {}
						ReadyToCheckLos = true
					end
				end
				for id,i in pairs(Scenes) do
					local Distance = Distance(i.Location, CachedPosition)
					mindistance = math.min(mindistance , Distance)
					if Distance < i.Distance then
						if ReadyToCheckLos or LOS[id] == nil then
							local hit = 1
							local LosCoords = 5
							local number = 0
							hit, LosCoords = CheckLos(i)
							LOS[id]=(hit == 0 or LosCoords < .20)
						end
						if LOS[id] then
							DrawScene(i,CachedPosition)
						end
					end
				end
				distancetimer = 1000*math.max(0, math.min(10, mindistance/200 - .5))
				ReadyToCheckLos = false
			else
				Wait(1000)
			end
		end
	end
end)

CreateThread(function()
	while true do Wait(0)
		if Scene.State then
			local Player = GetEntityCoords(PlayerPedId())
			local Hit, Coords, Entity = RayCastGamePlayCamera(Scene.Distance)
			local Dis = Distance(Player, Coords)
			local c = false
			if Scene.State == "Placing" then c = true end
			DrawMenu(c)
			if IsControlJustPressed(0, GetKey("X")) then
				ResetScene()
				IsAdmin = false
				Scene.State = false
			end
			if Dis < Scene.Distance and Hit then
				local Info = {Entity = Entity, Coords = Coords, Player = Player}
				local Blocked = false
				for k,v in pairs(Config.Blacklist) do
					if v.Function(Info) then Blocked = v.Error end
				end
				if not Blocked then
					DrawMarker(2, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.06, 0.06, 0.06, 0, 200, 255, 255, false, true, false, nil, nil, false)
					Scene["Location"] = Coords
					DrawScene(Scene, Player)
					if IsControlJustPressed(0, GetKey("E")) then
						TriggerServerEvent("Scene:New", Scene)
						Wait(250)
					end
				else
					DrawMarker(28, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.02, 0.02, 0.02, 255, 0, 0, 255, false, true, 2, nil, nil, false)
					SceneText({
						Text = {Text = Blocked, Font = 1, Size = 0.3, Outline = 1},
						Location = Coords,
						Alpha = 255,
					})
				end
			end
			if Scene.State == "Colour" then
				DrawColourSelect()
			elseif Scene.State == "Fonts" then
				DrawFonts()
			elseif Scene.State == "Functions" then
				DrawFunctions()
			elseif Scene.State == "Presets" then
				DrawPresets()
			end
			if Scene.Info then
				DrawInfo()
			end
		elseif MovingScene then
			local Player = GetEntityCoords(PlayerPedId())
			local Hit, Coords, Entity = RayCastGamePlayCamera(10.0)
			local Dis = Distance(Player, Coords)

			if Dis < 15 and Hit then
				local Info = {Entity = Entity, Coords = Coords, Player = Player}
				local Blocked = false
				for k,v in pairs(Config.Blacklist) do
					if v.Function(Info) then Blocked = v.Error end
				end
				if not Blocked then
					DrawMarker(2, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.06, 0.06, 0.06, 0, 200, 255, 255, false, true, false, nil, nil, false)
					MovingScene.Scene["Location"] = Coords
					DrawScene(MovingScene.Scene, Player)
					if IsControlJustPressed(0, GetKey("E")) then
						TriggerServerEvent("Scene:New", MovingScene.Scene)
						MovingScene = false
						Wait(250)
					end
				else
					DrawMarker(28, Coords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.02, 0.02, 0.02, 255, 0, 0, 255, false, true, 2, nil, nil, false)
					SceneText({
						Text = {Text = Blocked, Font = 1, Size = 0.3, Outline = 1},
						Location = Coords,
						Alpha = 255,
					})
				end
			end

			if IsControlJustPressed(0, GetKey("X")) then
				MovingScene.Scene["Location"] = MovingScene.OldLoc
				TriggerServerEvent("Scene:New", MovingScene.Scene)
				MovingScene = false
				Wait(250)
			end
		else
			--IsAdmin = false
			Wait(250)
		end
	end
end)

