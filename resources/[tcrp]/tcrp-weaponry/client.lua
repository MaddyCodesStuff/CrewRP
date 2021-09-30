Citizen.CreateThread(function()
    while true do
        ped = PlayerPedId()
        player = PlayerId()
        _, wep = GetCurrentPedWeapon(ped)
        ManageReticle(wep)
        Recoil()
        DisplayAmmoThisFrame(false)
        HideHudComponentThisFrame(20)
        HideHudComponentThisFrame(2)
        Citizen.Wait(0)
    end
end)

function Recoil()
    if IsPedShooting(ped) then
        if recoils[wep] ~= nil then
            if IsPedInCover(ped, false) and not IsPedAimingFromCover(ped) then
            else
                local shake = recoils[wep]["shake"]
                local recoil = recoils[wep]["kick"]
                local scale = 1.0
                local random = math.random(50, 100) / 100
                local random2 = math.random(-50, 50) / 100
                if recoil ~= 0 or nil then
                    local h = (GetGameplayCamRelativeHeading())                               
                    if GetFollowPedCamViewMode() == 4 then
                        scale = 0.5
                    elseif IsPlayerFreeAiming(player) and not IsPedDoingDriveby(ped) then
                        scale = 0.5
                    end
                    local hrecoil = random2 * scale 
                    recoil = recoil * random * scale
                    local p = GetGameplayCamRelativePitch()
                    if IsPedDoingDriveby(ped) then
                        p = p + 2.08
                        SetGameplayCamRelativePitch(p + recoil, 1.0)
                        SetGameplayCamRelativeHeading(h + hrecoil)
                    elseif GetFollowPedCamViewMode() == 4 then
                        SetGameplayCamRelativePitch(p + recoil, 1.0)
                        SetGameplayCamRelativeHeading(hrecoil)
                    else
                        SetGameplayCamRelativePitch(p + recoil, 1.0)
                        SetGameplayCamRelativeHeading(hrecoil)
                    end  
                end
                if shake ~= 0 then
                    if IsPlayerFreeAiming(player) or GetFollowPedCamViewMode() == 4 then
                        shake = shake * 0.5
                    end
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', shake)
                end
            end
        end
    end
end

function ManageReticle(weapon)
    if recoils[weapon] ~= nil then
        if recoils[weapon]["scope"] == true then 
            if IsControlPressed(0, 25) then
            else
                HideHudComponentThisFrame(14)
            end
        else
            HideHudComponentThisFrame(14)
        end
    else
        print(weapon) --prints if weapon hash is not in table
        HideHudComponentThisFrame(14)
    end
end
