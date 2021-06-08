-- currently just the vanilla unicorn - going to extend this for more areas soon

locations = {
    { 114.88079833984, -1289.5260009766, 28.260944366455, 20.0, 1 },
    { 1668.6390380859, 2546.2104492188, 47.580860137939, 40.0, 1 },
    { -243.01, 6324.81, 32.43, 20.0, 1 }, -- Paleto hospital
    { 1815.51, 3679.43, 34.28, 20.0, 1 }, -- Sandy hospital
    { -562.21, 286.95, 82.18, 5.0, 1 }, -- Tequila-la-la lower
    { -565.11, 286.28, 85.38, 3.0, 1 }, -- Tequila-la-la upper
    { -1387.61, -603.87, 30.07, 5.0, 1 }, -- Bahama Mamas
    { 987.93, -94.98, 74.85, 3.0, 1 }, -- Lost MC
    { 1981.38, 3051.17, 47.21, 5.0, 1 }, -- Yellow Jack
    { -676.23, 5837.56, 17.33, 9.0, 1 }, -- Bayview Lodge General Store
    { -447.02, 6008.83, 31.72, 5.0, 1 }, -- Paleto PD
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        for _, v in pairs(locations) do
            x, y, z, r, t = table.unpack(v)
            if GetDistanceBetweenCoords(x, y, z, GetEntityCoords(PlayerPedId())) < 30 then
                ClearAreaOfPeds(x, y, z, r, t)
            end
            Citizen.Wait(50)
        end
    end
end)