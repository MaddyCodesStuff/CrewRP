Locale = {}
ReadyToCheckLos = true

function Lang(what)
	local Dict = Locale[Config.Language]
	if not Dict[what] then return Locale["en"][what] end -- If we cant find a translation, use the english one.
	return Dict[what]
end

function TextInput(TextEntry, ExampleText, MaxStringLength, TP, Fire)
	if not TP and not Fire then
		AddTextEntry('FMMC_KEY_TIP1', TextEntry)
		DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength or 20)
		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
		if UpdateOnscreenKeyboard() ~= 2 then
			local Result = GetOnscreenKeyboardResult()
			Wait(200) return Result
		else
			Wait(200) return ExampleText
		end
	end
	if TP then
		local x = 0
		local y = 0
		local z = 0
		local h = 0
		AddTextEntry('X', 'Where do you want to teleport the user? X Coordinate.')
		DisplayOnscreenKeyboard(1, "X", "", ExampleText, "", "", "", MaxStringLength or 20)
		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
		if UpdateOnscreenKeyboard() ~= 2 then
			local XResult = GetOnscreenKeyboardResult()
			x = XResult
			Wait(200)
		end
		AddTextEntry('Y', 'Where do you want to teleport the user? Y Coordinate.')
		DisplayOnscreenKeyboard(1, "Y", "", ExampleText, "", "", "", MaxStringLength or 20)
		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
		if UpdateOnscreenKeyboard() ~= 2 then
			local YResult = GetOnscreenKeyboardResult()
			y = YResult
			Wait(200)
		end
		AddTextEntry('Z', 'Where do you want to teleport the user? Z Coordinate.')
		DisplayOnscreenKeyboard(1, "Z", "", ExampleText, "", "", "", MaxStringLength or 20)
		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
		if UpdateOnscreenKeyboard() ~= 2 then
			local ZResult = GetOnscreenKeyboardResult()
			ZZResult = tonumber(ZResult)
			if ZZResult ~= nil then
				z = ZZResult - 1
			end
			Wait(200)
		end
		AddTextEntry('H', 'Where do you want to teleport the user? Heading.')
			DisplayOnscreenKeyboard(1, "H", "", ExampleText, "", "", "", MaxStringLength or 20)
			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
			if UpdateOnscreenKeyboard() ~= 2 then
				local HResult = GetOnscreenKeyboardResult()
				h = HResult
				Wait(200)
			return x, y, z, h
		else
			Wait(200) return ExampleText
		end
	end
	if Fire then
		local numfires = 0
		local radius = 0
		local explosion = false
		AddTextEntry('NumFires', 'How Many Fires? Only use 0 or numbers between 10-30')
		DisplayOnscreenKeyboard(1, "NumFires", "", ExampleText, "", "", "", MaxStringLength or 20)
		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
		if UpdateOnscreenKeyboard() ~= 2 then
			local numFiresResult = GetOnscreenKeyboardResult()
			numfires = numFiresResult
			Wait(200)
		end
		AddTextEntry('Radius', 'Radius of Fires? Only use 0 or numbers between 10-30')
		DisplayOnscreenKeyboard(1, "Radius", "", ExampleText, "", "", "", MaxStringLength or 20)
		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
		if UpdateOnscreenKeyboard() ~= 2 then
			local RadiusResult = GetOnscreenKeyboardResult()
			radius = RadiusResult
			Wait(200)
		end
		AddTextEntry('Explosion', 'Explosion?(true or false)')
		DisplayOnscreenKeyboard(1, "Explosion", "", ExampleText, "", "", "", MaxStringLength or 5)
		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
		if UpdateOnscreenKeyboard() ~= 2 then
			local ExplosionResult = GetOnscreenKeyboardResult()
			explosion = ExplosionResult
			Wait(200)
		end
		return numfires,radius,explosion
	else
		Wait(200) return ExampleText
	end
end

function Text(t)
	local Align = t.Align or 0
	local Colour = t.Colour or {255,255,255}
	local Font = t.Font or 4
	local Scale = t.Scale or 0.25
	local Alpha = t.Alpha or 255
	SetTextFont(Font)
	SetTextJustification(Align)
	SetTextScale(Scale, Scale)
	if t.Center then SetTextCentre() end
	SetTextColour(Colour[1], Colour[2], Colour[3], Alpha)
	if t.Outline then SetTextOutline() end
	if t.Wrap then SetTextWrap(t.Wrap.x, t.Wrap.y) end
	SetTextEntry("STRING")
	AddTextComponentString(t.Text)
	DrawText(t.x,t.y)
end

function Distance(first, second)
	local distance = #(first - second)
	return distance
end

function Chat(Msg)
	TriggerEvent("chatMessage", "^4Scenes^7", {255,255,255}, Msg)
end

function log(what)
	if type(what) == "table" then
		print(json.encode(what))
	else
		print(tostring(what).." | "..type(what))
	end
end

function AlterOverflow(var, value, min, max, around)
    local v = var+value
    if v > max then
        if around then
            return min
        end
        return var
    end
    if v < min then
        if around then
            return max
        end
        return var
    end
    return v
end

function GetCursor()
	local sx, sy = GetActiveScreenResolution()
	local cx, cy = GetNuiCursorPosition()
	local cx, cy = (cx / sx) + 0.008, (cy / sy) + 0.027
	return cx, cy
end

function SplitString(s)
    local Rows = 0
    for i = 100, string.len(s), 99 do
        local String = string.sub(s, i, i+99)
        AddTextComponentString(String)
        Rows = Rows+1
    end
    return Rows
end

local function RotationToDirection(rotation)
	local New = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local Dir = 
	{
		x = -math.sin(New.z) * math.abs(math.cos(New.x)), 
		y = math.cos(New.z) * math.abs(math.cos(New.x)), 
		z = math.sin(New.x)
	}
	return Dir
end

function RayCastGamePlayCamera(distance)
	local Rotation = GetGameplayCamRot()
	local Cam = GetGameplayCamCoord()
	local Dir = RotationToDirection(Rotation)
	local Des = 
	{ 
		x = Cam.x + Dir.x * distance, 
		y = Cam.y + Dir.y * distance, 
		z = Cam.z + Dir.z * distance 
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(Cam.x, Cam.y, Cam.z, Des.x, Des.y, Des.z, -1, -1, 4))
	return b, c, e, Des
end

function CheckLos(scenecoords)
	local lped = PlayerPedId()
	local LosCoords = 0
	local SCX,SCY,SCZ = table.unpack(scenecoords.Location)
	local player = GetEntityCoords(lped)
	local handle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(StartExpensiveSynchronousShapeTestLosProbe(player.x, player.y, player.z+.7, SCX, SCY, SCZ, -1, lped, 4))
	LosCoords = GetDistanceBetweenCoords(endCoords, scenecoords.Location, false)
	return hit, LosCoords
end