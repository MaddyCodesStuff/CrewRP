Crouched = false
CrouchedForce = false
Aimed = false
LastCam = 0
Cooldown = false
ped = nil
CoolDownTime = 500 -- in ms

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		ped = PlayerPedId()
		if IsPedUsingActionMode(ped) then
			SetPedUsingActionMode(ped, false, -1, 'DEFAULT_ACTION')
		end
	end
end)

NormalWalk = function() 
	SetPedMaxMoveBlendRatio(ped, 1.0)
	ResetPedMovementClipset(ped, 0.55)
	ResetPedStrafeClipset(ped)
	SetPedCanPlayAmbientAnims(ped, true)
	SetPedCanPlayAmbientBaseAnims(ped, true)
	Crouched = false
end

SetupCrouch = function()
	while not HasAnimSetLoaded('move_ped_crouched') do
		Citizen.Wait(5)
		RequestAnimSet('move_ped_crouched')
	end
end

CanCrouch = function()
	if IsPedOnFoot(ped) and not IsPedInCover(ped, False) and not IsPedJumping(ped) and not IsPedFalling(ped) and not IsPedDeadOrDying(ped) then
		return true
	else
		return false
	end
end

CrouchPlayer = function()
	SetPedCanPlayAmbientAnims(ped, false)
	SetPedCanPlayAmbientBaseAnims(ped, false)
	SetPedMovementClipset(ped, 'move_ped_crouched', 0.55)
	SetPedStrafeClipset(ped, 'move_ped_crouched_strafing') -- it force be on third person if not player will freeze but this func make player can shoot with good anim on crouch if someone know how to fix this make request :D
	Crouched = true
	Aimed = false
end

SetPlayerAimSpeed = function()
	SetPedMaxMoveBlendRatio(ped, 0.2)
	Aimed = true
end

IsPlayerFreeAimed = function()
	local PlayerID = GetPlayerIndex()
	if IsPlayerFreeAiming(ped) or IsAimCamActive() or IsAimCamThirdPersonActive() then
		return true
	else
		return false
	end
end

Citizen.CreateThread( function()
	SetupCrouch()
    while true do 
        DisableControlAction(0, 26, true) 
		if CrouchedForce then
			local CanDo = CanCrouch()
			if CanDo and Crouched and IsPlayerFreeAimed() then
				SetPlayerAimSpeed()
			elseif CanDo and (not Crouched or Aimed) then
				CrouchPlayer()
			elseif not CanDo and Crouched then
				CrouchedForce = false
				NormalWalk()
			end
			local NowCam = GetFollowPedCamViewMode()
		elseif Crouched then
			NormalWalk()
		end
		
        Citizen.Wait(5)
    end
end)

RegisterCommand('crouch', function()
	if not Cooldown then
		CrouchedForce = not CrouchedForce
		Cooldown = true
		SetTimeout(CoolDownTime, function()
			Cooldown = false
		end)
	end
end, false)

RegisterKeyMapping('crouch', 'Crouch', 'keyboard', 'C') -- now its better player can change to any bottom they want

IsCrouched = function()
    return Crouched
end

exports("IsCrouched", IsCrouched)