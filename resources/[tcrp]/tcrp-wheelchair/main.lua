local RCCar = {}
local player = nil

Attached = false

RegisterNetEvent('wheelchair:clear')
AddEventHandler('wheelchair:clear', function()
	RCCar.Clear()
end)

RegisterNetEvent('wheelchair:start')
AddEventHandler('wheelchair:start', function()
    RCCar.Start()
end)

AddEventHandler('wheelchair:onPlayerDied', function()
	RCCar.AttachPlayer(false)
end)

RCCar.Start = function()
	if DoesEntityExist(RCCar.Entity) then return end

	RCCar.Spawn()

	while DoesEntityExist(RCCar.Entity) and DoesEntityExist(RCCar.Driver) do
		Citizen.Wait(5)

		local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),  GetEntityCoords(RCCar.Entity), true)

		RCCar.HandleKeys(distanceCheck)

		if distanceCheck <= Config.LoseConnectionDistance then
			if not NetworkHasControlOfEntity(RCCar.Driver) then
				NetworkRequestControlOfEntity(RCCar.Driver)
			elseif not NetworkHasControlOfEntity(RCCar.Entity) then
				NetworkRequestControlOfEntity(RCCar.Entity)
			end
		else
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 6, 2500)
		end
	end
end

RCCar.MustRagdoll = function()
	local x = GetEntityRotation(RCCar.Entity).x
	local y = GetEntityRotation(RCCar.Entity).y
	if IsEntityInAir(RCCar.Entity) then
		Citizen.Wait(50)
		if IsEntityInAir(RCCar.Entity) then
			return true
		end
	end
	if HasEntityCollidedWithAnything(player) and RCCar.Speed > 7.0 then 
		return true 
	end
	if HasPedBeenDamagedByWeapon(player, 0, 2) then
		return true
	end
	if IsPedDeadOrDying(player, false) then 
		return true
	end
	return false
end

RCCar.HandleKeys = function(distanceCheck)
	if distanceCheck <= 1.5 then
		if IsControlJustPressed(0, 38) then
			RCCar.Attach("pick")
		end
		if IsControlJustPressed(0, 73) or IsDisabledControlJustPressed(0, 36) then
			if Attached then
				RCCar.AttachPlayer(false)
			end
		end
		if IsControlJustReleased(0, 113) then
			if Attached then
				RCCar.AttachPlayer(false)
			elseif not IsPedRagdoll(player) then
				Citizen.Wait(200)
				RCCar.AttachPlayer(true)
			end
		end
	end

	if distanceCheck < Config.LoseConnectionDistance then
		local overSpeed = (GetEntitySpeed(RCCar.Entity)*3.6) > Config.MaxSpeedKmh
		
		-- prevents ped from driving away
		TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 1, 1)
		Citizen.CreateThread(function()
			player = GetPlayerPed(-1)
			Citizen.Wait(1)
			SetEntityInvincible(RCCar.Entity, true)
			StopCurrentPlayingAmbientSpeech(RCCar.Driver)	
			if Attached then
				-- Ragdoll system
				RCCar.Speed = GetEntitySpeed(RCCar.Entity) * 3.6
				if RCCar.MustRagdoll() then
					SetEntityCollision(RCCar.Skate, true, true)
					RCCar.AttachPlayer(false)
					SetPedToRagdoll(player, 5000, 4000, 0, true, true, false)
					Attached = false
				end
			end
			
		end)
		if Attached then
			if IsControlPressed(0, 172) and not IsControlPressed(0, 173) and not overSpeed then
				TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 9, 1)
			end

			if IsControlJustReleased(0, 172) or IsControlJustReleased(0, 173) and not overSpeed then
				TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 6, 2500)
			end

			if IsControlPressed(0, 173) and not IsControlPressed(0, 172) and not overSpeed then
				TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 22, 1)
			end

			if IsControlPressed(0, 174) and IsControlPressed(0, 173) and not overSpeed then
				TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 13, 1)
			end

			if IsControlPressed(0, 175) and IsControlPressed(0, 173) and not overSpeed then
				TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 14, 1)
			end

			if IsControlPressed(0, 172) and IsControlPressed(0, 173) and not overSpeed then
				TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 30, 100)
			end

			if IsControlPressed(0, 174) and IsControlPressed(0, 172) and not overSpeed then
				TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 7, 1)
			end

			if IsControlPressed(0, 175) and IsControlPressed(0, 172) and not overSpeed then
				TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 8, 1)
			end

			if IsControlPressed(0, 174) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) and RCCar.Speed < 0.5 and RCCar.Speed > -0.5 then
				SetEntityHeading(RCCar.Entity, GetEntityHeading(RCCar.Entity) + 0.4)
			end
			if IsControlPressed(0, 175) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) and RCCar.Speed < 0.5 and RCCar.Speed > -0.5 then 
				SetEntityHeading(RCCar.Entity, GetEntityHeading(RCCar.Entity) - 0.4)
			end	
		end			
	end
end


RCCar.Spawn = function()
	-- models to load
	RCCar.LoadModels({ GetHashKey("rcbandito"), 68070371, GetHashKey("prop_wheelchair_01_s"), "pickup_object", "missfinale_c2leadinoutfin_c_int", "move_crouch_proto"})

	local spawnCoords, spawnHeading = GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0, GetEntityHeading(PlayerPedId())

	RCCar.Entity = CreateVehicle(GetHashKey("rcbandito"), spawnCoords, spawnHeading, true)
	RCCar.Skate = CreateObject(GetHashKey("prop_wheelchair_01_s"), 0.0, 0.0, 0.0, true, true, true)
	
	-- load models
	while not DoesEntityExist(RCCar.Entity) do
		Citizen.Wait(5)
	end
	while not DoesEntityExist(RCCar.Skate) do
		Citizen.Wait(5)
	end

	SetEntityNoCollisionEntity(RCCar.Entity, player, false) -- disable collision between the player and the rc
	SetEntityVisible(RCCar.Entity, false)
	AttachEntityToEntity(RCCar.Skate, RCCar.Entity, GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, -0.16, 0.0, 0.0, 180.0, false, true, true, true, 1, true)

	RCCar.Driver = CreatePed(12	, 68070371, spawnCoords, spawnHeading, true, true)

	-- Driver properties
	SetEnableHandcuffs(RCCar.Driver, true)
	SetEntityInvincible(RCCar.Driver, true)
	SetEntityVisible(RCCar.Driver, false)
	FreezeEntityPosition(RCCar.Driver, true)
	TaskWarpPedIntoVehicle(RCCar.Driver, RCCar.Entity, -1)

	while not IsPedInVehicle(RCCar.Driver, RCCar.Entity) do
		Citizen.Wait(0)
	end

	RCCar.Attach("place")
end


RCCar.Attach = function(param)
	if not DoesEntityExist(RCCar.Entity) then
		return
	end
	
	if param == "place" then
		-- Place longboard
		SetEntityCollision(RCCar.Skate, false, true)
		AttachEntityToEntity(RCCar.Entity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.1, 0.2, 0.29, 0.0, 90.0, 180.0, 1, 1, 0, 0, 2, 1)

		TaskPlayAnim(PlayerPedId(), "pickup_object", "pickup_low", 8.0, -8.0, -1, 0, 0, true, true, true)

		Citizen.Wait(800)

		DetachEntity(RCCar.Entity, false, true)
		SetEntityCollision(RCCar.Skate, true, true)
		PlaceObjectOnGroundProperly(RCCar.Entity)
	elseif param == "pick" then
		if not Attached then
			-- Pick longboard
			if TriggerServerEvent('wheelchair:limit') then
				Citizen.Wait(100)
				TaskPlayAnim(PlayerPedId(), "pickup_object", "pickup_low", 8.0, -8.0, -1, 0, 0, true, true, true)

				Citizen.Wait(850)
				SetEntityCollision(RCCar.Skate, false, true)
				AttachEntityToEntity(RCCar.Entity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.1, 0.2, 0.29, 0.0, 90.0, 180.0, 1, 1, 0, 0, 2, 1)
				Citizen.Wait(900)
				
				-- Clear 
				RCCar.Clear()
				TriggerServerEvent('wheelchair:item')
			end
		end
	end
end

RCCar.Clear = function(models)
	DetachEntity(RCCar.Entity)
	DeleteEntity(RCCar.Skate)
	DeleteVehicle(RCCar.Entity)
	DeleteEntity(RCCar.Driver)

	RCCar.UnloadModels()
	Attach = false
	Attached  = false
	SetPedRagdollOnCollision(player, false)
end


RCCar.LoadModels = function(models)
	for modelIndex = 1, #models do
		local model = models[modelIndex]

		if not RCCar.CachedModels then
			RCCar.CachedModels = {}
		end

		table.insert(RCCar.CachedModels, model)

		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)	
				Citizen.Wait(10)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)
				Citizen.Wait(10)
			end    
		end
	end
end

RCCar.UnloadModels = function()
	for modelIndex = 1, #RCCar.CachedModels do
		local model = RCCar.CachedModels[modelIndex]

		if IsModelValid(model) then
			SetModelAsNoLongerNeeded(model)
		else
			RemoveAnimDict(model)   
		end
	end
end

RCCar.AttachPlayer = function(toggle)
	
	if toggle then
		TaskPlayAnim(player, "missfinale_c2leadinoutfin_c_int", "_leadin_loop2_lester", 8.0, 8.0, -1, 33, 1.0, false, false, false)
		AttachEntityToEntity(player, RCCar.Skate, 20, -0.02, -0.03, 0.85, -5.0, 0, 189.0, true, false, false, true, 1, true)
		SetEntityNoCollisionEntity(player, RCCar.Entity, false)
		SetEntityCollision(RCCar.Entity, true, true)
		SetEntityCollision(RCCar.Skate, true, true)
		SetPedRagdollOnCollision(player, false)
		SetCurrentPedWeapon(player, 0xA2719263, true)
		SetPedConfigFlag(player, 48, true)
		SetPedConfigFlag(player, 122, true)
		SetPedConfigFlag(player, 64, true)
		Citizen.CreateThread(function()
			while Attached do
				if not IsEntityPlayingAnim(player, "missfinale_c2leadinoutfin_c_int", "_leadin_loop2_lester", 3) then
					TaskPlayAnim(player, "missfinale_c2leadinoutfin_c_int", "_leadin_loop2_lester", 8.0, 8.0, -1, 33, 1.0, false, false, false)
				end
				Citizen.Wait(1000)
			end
		end)
		Citizen.CreateThread(function()
			while Attached do
				DisableControlAction(0, 29, true)
				Citizen.Wait(0)
			end
		end)
	elseif not toggle then
		SetPedRagdollOnCollision(player, false)
		StopAnimTask(player, "missfinale_c2leadinoutfin_c_int", "_leadin_loop2_lester", 1.0)
		DetachEntity(player, false, false)
		SetPedConfigFlag(player, 48, false)
		SetPedConfigFlag(player, 122, false)
		SetPedConfigFlag(player, 64, false)
		SetEntityNoCollisionEntity(player,RCCar.Entity, false)
		TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 3, 1)	
		Citizen.Wait(100)
		
	end	
	Attached = toggle
end

Citizen.CreateThread(function()
while true do
	Citizen.Wait(100)
	if IsControlJustPressed(0, 113) then
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local closestObject = GetClosestObjectOfType(pedCoords, 3.0, GetHashKey("prop_wheelchair_01_s"), false)
		if DoesEntityExist(closestObject) then
			PickUp(closestObject)
		end
	end
end
end)

PickUp = function(strObject)
    local closestPlayer, closestPlayerDist = GetClosestPlayer()

    if closestPlayer ~= nil and closestPlayerDist <= 1.5 then
        if IsEntityPlayingAnim(GetPlayerPed(closestPlayer), 'anim@heists@box_carry@', 'idle', 3) then
            ShowNotification("Somebody is already driving the wheelchair!")
            return
        end
    end

    NetworkRequestControlOfEntity(strObject)
    RCCar.LoadModels("anim@heists@box_carry@")
    AttachEntityToEntity(strObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.6, -1.43, 180.0, 170.0, 90.0, 0.0, false, false, true, false, 2, true)

    while IsEntityAttachedToEntity(strObject, PlayerPedId()) do
        Citizen.Wait(5)
        if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 3) then
            TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
        end
        if IsPedDeadOrDying(PlayerPedId()) then
            DetachEntity(strObject, true, true)
        end
        if IsControlJustPressed(0, 73) then
            DetachEntity(strObject, true, true)
        end
    end
end

GetClosestPlayer = function()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    
    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    
    return closestPlayer, closestDistance
end

GetPlayers = function()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end