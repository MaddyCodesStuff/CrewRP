local Keys   = {
    ["ESC"]       = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"]         = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"]       = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"]      = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"]  = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"]      = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"]    = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX          = nil

elevatormenu = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz       = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.55, 0.55) --0.35
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

-- Create 3D text
Citizen.CreateThread(function()
    elevatormenu = false

    while true do
        Citizen.Wait(0)
        local ped    = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for k, v in pairs(Config.Elevators) do
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance then

                local text = 'Press [~g~E~w~] to access elevator'
                DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, text)

                elevatormenu = k
                break
            else
                elevatormenu = nil
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(0, Keys['E']) and elevatormenu then
            OpenElevatorMenu()
        end
    end
end)

function OpenElevatorMenu()

    local ped      = PlayerPedId()
    local name     = Config.Elevators[elevatormenu].name

    local elements = {
        { label = 'Select a Floor', value = nil }
    }

    for k, v in pairs(Config.Elevators[elevatormenu].options) do
        table.insert(elements, { label = v.label, value = v.name, pos = v.pos })
    end

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'elevator_menu',
        {
            title    = name,
            align    = 'top-right',
            elements = elements,
        },
        function(data, menu)
            if data.current.value and data.current.value ~= nil then
                ESX.Game.Teleport(ped, data.current.pos)
                menu.close()
            end
        end,
        function(data, menu)
            menu.close()
        end)

    elevatormenu = nil
end
