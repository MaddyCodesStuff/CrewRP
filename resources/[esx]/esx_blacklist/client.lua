ped_models     = {
    "s_f_y_cop_01",
    -- "s_m_y_cop_01",
    "s_m_y_swat_01",
    "s_m_y_hwaycop_01",
    "csb_cop",
    "2073775040",
    "-1313105063",
    "1596003233",
    "-1920001264",
    "-1275859404",
    "2047212121",
    "1349953339",
    "1925237458",
    "1490458366",
    "-265970301",
    "1702441027",
    "-220552467",
    "1631478380",
    "-163714847",
    "-1422914553",
    "-685776591",
    "-1444213182",
    "2111372120",
    "a_m_y_golfer_01",
    "a_m_m_golfer_01",
    "a_f_y_golfer_01",
    "a_f_m_fatcult_01",
    "a_m_m_acult_01",
    "a_m_o_acult_01",
    "a_m_o_acult_02",
    "a_m_y_acult_01",
    "a_m_y_acult_02",
    "a_f_y_topless_01",
}

veh_models     = {
    "police",
    "police2",
    "police3",
    "police4",
    "policeold1",
    "policeold2",
    "policet",
    "policeb",
    "polmav",
    "pranger",
    "sheriff",
    "sheriff2",
    "Ambulance",
    "FireTruck",

    -- helicopters with weapons
    "buzzard",
    "buzzard2",
    "annihilator",
    "akula",

    -- tanks/military
    "apc",
    "rhino",
    "barrage",
    "insurgent",
    "insurgent2",
    "insurgent3",
    "lazer",
    "hydra",

    -- Final end to blimpcon
    "blimp",
    "blimp2",
}

local interval = 1000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)

        for _, model in pairs(ped_models) do
            local hash
            if type(model) == "string" then
                hash = GetHashKey(model)
            else
                hash = model
            end

            ped_models[hash] = true
        end

        local peds    = {}

        local it, ped = FindFirstPed()
        if ped then
            table.insert(peds, ped)
        end

        while true do
            local ok, ped = FindNextPed(it)
            if ok and ped then
                table.insert(peds, ped)
            else
                EndFindPed(it)
                break
            end
        end

        for _, ped in ipairs(peds) do
            if not IsPedAPlayer(ped) and ped_models[GetEntityModel(ped)] then
                DeletePed(Citizen.PointerValueIntInitialized(ped))
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)

        for _, model in pairs(veh_models) do
            local hash
            if type(model) == "string" then
                hash = GetHashKey(model)
            else
                hash = model
            end

            veh_models[hash] = true
        end

        local vehicles = {}

        local it, veh  = FindFirstVehicle()
        if veh then
            table.insert(vehicles, veh)
        end

        while true do
            local ok, veh = FindNextVehicle(it)
            if ok and veh then
                table.insert(vehicles, veh)
            else
                EndFindVehicle(it)
                break
            end
        end

        for _, veh in ipairs(vehicles) do
            if veh_models[GetEntityModel(veh)] then
                SetEntityAsMissionEntity(veh, true, true)
                DeleteVehicle(veh)
            end
        end
    end
end)