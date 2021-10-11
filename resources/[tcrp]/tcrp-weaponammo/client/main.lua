ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(1)
    end
end)

RegisterNetEvent('tcrp-ammo:use_ammo')
AddEventHandler('tcrp-ammo:use_ammo', function(ammo)
    local playerPed         = GetPlayerPed(-1)
    local hasWeapon, weapon = GetCurrentPedWeapon(playerPed, true)

    if hasWeapon then
        local curAmmo    = GetAmmoInPedWeapon(playerPed, weapon)
        local ammo_type  = GetWeapontypeGroup(weapon)
        print(ammo_type)
        local _, maxAmmo = GetMaxAmmo(playerPed, weapon)
        local ammoInfo   = Config.ammo_type[ammo]
        if weapon == -364377308 then
            ammo_type = 416676503
        end
        if ammoInfo and ammoInfo.weapon_type == ammo_type then
            if ammoInfo.qty + curAmmo <= maxAmmo then
                TriggerServerEvent('tcrp-ammo:remove_ammo', ammo)
                AddAmmoToPed(playerPed, weapon, ammoInfo.qty)
            else
                TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'Max ammo in gun' })
            end
        else
            TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'Wrong ammo for current gun' })
        end
    else
        TriggerEvent('mythic_notify:client:SendErrorAlert', { text = 'Take a weapon out to load ammo' })
    end
end)