-- Settings
local color         = { r = 225, g = 225, b = 225, alpha = 225 } -- Color of the text
local font          = 4 -- Font of the text
local time          = 7000 -- Duration of the display of the text : 1000ms = 1sec
local background    = {
    enable = true,
    color  = { r = 0, g = 0, b = 0, alpha = 255 },
}
local dropShadow    = false

-- Don't touch
local nbrDisplaying = 1

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    --local offset = 1 + (nbrDisplaying*0.14)
    local offset = (nbrDisplaying * 0.14)
    Display(source, text, offset)
end)

function Display(mePlayer, text, offset)
    local displaying = true
    local mePlayerPed = GetPlayerPed(GetPlayerFromServerId(mePlayer))

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)

    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(mePlayerPed, false)
            local coords   = GetEntityCoords(PlayerPedId(), false)
            local dist     = #(coordsMe - coords)
            if dist < 2500 then
                if HasEntityClearLosToEntity(PlayerPedId(), mePlayerPed, 17) then
                    DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z'] + offset, text)
                end
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz       = table.unpack(GetGameplayCamCoord())
    local dist             = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale            = ((1 / dist) * 2.0) * (1 / GetGameplayCamFov()) * 100

    if onScreen then

        -- Formalize the text
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextCentre(true)
        if dropShadow then
            SetTextDropshadow(10, 100, 100, 100, 255)
        end

        -- Calculate width and height
        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55 * scale, font)
        local width  = EndTextCommandGetWidth(font)

        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)

        if background.enable then
            DrawRect(_x + 0.003, _y + scale / 45 - 0.003, width, height, background.color.r, background.color.g,
                     background.color.b, background.color.alpha)
        end
    end
end
