ESX                 = nil

local Keys          = {
    ["ESC"]       = 322,
    ["F1"]        = 288,
    ["F2"]        = 289,
    ["F3"]        = 170,
    ["F5"]        = 166,
    ["F6"]        = 167,
    ["F7"]        = 168,
    ["F8"]        = 169,
    ["F9"]        = 56,
    ["F10"]       = 57,
    ["~"]         = 243,
    ["1"]         = 157,
    ["2"]         = 158,
    ["3"]         = 160,
    ["4"]         = 164,
    ["5"]         = 165,
    ["6"]         = 159,
    ["7"]         = 161,
    ["8"]         = 162,
    ["9"]         = 163,
    ["-"]         = 84,
    ["="]         = 83,
    ["BACKSPACE"] = 177,
    ["TAB"]       = 37,
    ["Q"]         = 44,
    ["W"]         = 32,
    ["E"]         = 38,
    ["R"]         = 45,
    ["T"]         = 245,
    ["Y"]         = 246,
    ["U"]         = 303,
    ["P"]         = 199,
    ["["]         = 39,
    ["]"]         = 40,
    ["ENTER"]     = 18,
    ["CAPS"]      = 137,
    ["A"]         = 34,
    ["S"]         = 8,
    ["D"]         = 9,
    ["F"]         = 23,
    ["G"]         = 47,
    ["H"]         = 74,
    ["K"]         = 311,
    ["L"]         = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"]         = 20,
    ["X"]         = 73,
    ["C"]         = 26,
    ["V"]         = 0,
    ["B"]         = 29,
    ["N"]         = 249,
    ["M"]         = 244,
    [","]         = 82,
    ["."]         = 81,
    ["LEFTCTRL"]  = 36,
    ["LEFTALT"]   = 19,
    ["SPACE"]     = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213,
    ["PAGEUP"]    = 10,
    ["PAGEDOWN"]  = 11,
    ["DELETE"]    = 178,
    ["LEFT"]      = 174,
    ["RIGHT"]     = 175,
    ["TOP"]       = 27,
    ["DOWN"]      = 173,
    ["NENTER"]    = 201,
    ["N4"]        = 108,
    ["N5"]        = 60,
    ["N6"]        = 107,
    ["N+"]        = 96,
    ["N-"]        = 97,
    ["N7"]        = 117,
    ["N8"]        = 61,
    ["N9"]        = 118
}

local dumpsterBlips = {}

local dumpsters     = {}
local atDumpster    = 0

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent('tcrp_dirtydumps:getDumpsters')
end)

RegisterNetEvent('tcrp_dirtydumpsters:updateDumpsters')
AddEventHandler('tcrp_dirtydumpsters:updateDumpsters', function(dumps)

    for k, v in pairs(dumpsterBlips) do
        RemoveBlip(dumpsterBlips[k])
    end

    for k, v in pairs(dumps) do
        if v.public == 1 then
            coords           = json.decode(v.coords)
            dumpsterBlips[k] = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(dumpsterBlips[k], 467)
            SetBlipDisplay(dumpsterBlips[k], 0)
            SetBlipScale(dumpsterBlips[k], 0.7)
            SetBlipAsShortRange(dumpsterBlips[k], true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Public Trash")
            EndTextCommandSetBlipName(dumpsterBlips[k])
        end

        dumpsters[k] = v
    end
end)

RegisterCommand('syncdumpsters', function()
    TriggerServerEvent('tcrp_dirtydumps:getDumpsters')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(144)

        local playerCoords = GetEntityCoords(PlayerPedId())
        atDumpster = 0

        for k, v in pairs(dumpsters) do
            local coords = json.decode(v.coords)

            if coords.x and #(playerCoords - vector3(coords.x, coords.y, coords.z)) < 2 then
                atDumpster = k
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if atDumpster > 0 then
            SetTextComponentFormat('STRING')
            AddTextComponentString("Press ~INPUT_CONTEXT~ to search the trash")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0, Keys['E']) then
                -- Trigger the client event to update the inventory and check the trash
                ESX.TriggerServerCallback("tcrp_dirtydumpsters:getDumpsterInventory",
                                          function(inventory)
                                              -- TriggerEvent('esx_inventoryhud:updateDumpster', name)
                                              TriggerEvent("esx_inventoryhud:openDumpsterInventory", inventory, atDumpster,
                                                           -1)
                                          end,
                                          { id = atDumpster }
                )
            end
        end
    end
end)

function dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end