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
            local shake = recoils[wep]["shake"]
            local recoil = recoils[wep]["kick"]
            if recoil ~= 0 or nil then
                if IsPedDoingDriveby(ped) then
                    recoil = recoil * 14
                elseif GetFollowPedCamViewMode() == 4 then
                    recoil = recoil / 2.1
                elseif IsPlayerFreeAiming(player) then
                    recoil = recoil * 0.5
                end
                p = GetGameplayCamRelativePitch()
                h = GetGameplayCamRelativeHeading()
                local halfrecoil = recoil * 0.5
                local precoil = GetRandomFloatInRange(halfrecoil, recoil) 
                local hrecoil = GetRandomFloatInRange(-halfrecoil, halfrecoil)
                SetGameplayCamRelativePitch(p + precoil, 0.2)
                SetGameplayCamRelativeHeading(h + hrecoil)
            end
            if shake ~= 0 then
                local recoilshake = GetRandomFloatInRange(shake * 0.75 , shake)
                if IsPlayerFreeAiming(player) then
                    recoilshake = recoilshake * 0.5
                end
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', recoilshake)
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
        -- print(weapon) --prints if weapon hash is not in table
        HideHudComponentThisFrame(14)
    end
end
