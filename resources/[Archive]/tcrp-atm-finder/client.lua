local hashes  = {
    -870868698, -- prop_atm_01
    -1126237515, -- prop_atm_02
    -1364697528, -- prop_atm_03
    506770882 -- prop_fleeca_atm
}

local atmBlip = nil

function findNearestAtm(coords, callback, range)
    local closestATM = nil
    if range == nil then
        range = 100.0
    end

    for i = 1, #hashes do
        local atm = GetClosestObjectOfType(
            coords,
            range,
            hashes[i],
            false,
            false
        )
        if atm ~= 0 then
            local atmCoords = GetEntityCoords(atm)
            if closestATM == nil then
                closestATM = atm
            elseif #(coords - GetEntityCoords(atm)) < #(coords - GetEntityCoords(closestATM)) then
                closestATM = atm
            end
        end
    end

    if closestATM == nil then
        findNearestAtm(coords, callback, range + 100.0)
    else
        callback(closestATM)
    end
end

function findATM()
    local coords = GetEntityCoords(GetPlayerPed(-1));

    findNearestAtm(coords, function(closestATM)
        local atmCoords = GetEntityCoords(closestATM);

        SetNewWaypoint(atmCoords.xy)

        if atmBlip ~= nil then
            RemoveBlip(atmBlip)
        end

        atmBlip = AddBlipForCoord(atmCoords)
        SetBlipSprite(atmBlip, 108)
        SetBlipColour(atmBlip, 52)
        Citizen.CreateThread(function()
            Citizen.Wait(30000)
            for i = 256, 0, -1 do
                SetBlipAlpha(atmBlip, i)
                Citizen.Wait(100)
            end
            RemoveBlip(atmBlip)
        end)
    end)
end

RegisterNetEvent('tcrp-atm-finder:findATM')
AddEventHandler('tcrp-atm-finder:findATM', findATM)
RegisterCommand('findATM', findATM)
