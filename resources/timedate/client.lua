local displayTime       = true
local useMilitaryTime   = true
local displayDayOfWeek  = true
local displayDate       = true
local timeAndDateString = nil
local hour
local minute
local dayOfWeek
local month
local dayOfMonth
local year

function DrawAdvancedText(x, y, w, h, sc, text, r, g, b, a, font, jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1 + w, y - 0.02 + h)
end

function GetSeatPedIsIn(ped)
    local vehicle = GetVehiclePedIsIn(ped, false)

    for i = -2, GetVehicleMaxNumberOfPassengers(vehicle) do
        if GetPedInVehicleSeat(vehicle, i) == ped then
            return i
        end
    end

    return -2
end

-- Display Time and Date at top right of screen -- format: | 12:13 | Wednesday | January 17, 2017 |
Citizen.CreateThread(function()
    while true do
        Wait(1)
        timeAndDateString = ""

        if displayTime == true then
            CalculateTimeToDisplay()
            timeAndDateString = timeAndDateString .. hour .. ":" .. minute .. " |"
        end
        if displayDayOfWeek == true then
            CalculateDayOfWeekToDisplay()
            timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " |"
        end
        if displayDate == true then
            CalculateDateToDisplay()
            timeAndDateString = timeAndDateString .. " " .. month .. " " .. dayOfMonth .. ", " .. year
        end

        if GetSeatPedIsIn(GetPlayerPed(-1)) == -1 then
            DrawAdvancedText(0.267, 0.855, 0.005, 0.0028, 0.4, timeAndDateString, 255, 255, 255, 175, 6, 1)
        else
            DrawAdvancedText(0.267, 0.91, 0.005, 0.0028, 0.4, timeAndDateString, 255, 255, 255, 175, 6, 1)
        end

    end
end)

function CalculateTimeToDisplay()
    hour   = GetClockHours()
    minute = GetClockMinutes()

    if useMilitaryTime == false then
        if hour == 0 or hour == 24 then
            hour = 12
        elseif hour >= 13 then
            hour = hour - 12
        end
    end

    if hour <= 9 then
        hour = "0" .. hour
    end
    if minute <= 9 then
        minute = "0" .. minute
    end
end

function CalculateDayOfWeekToDisplay()
    dayOfWeek = GetClockDayOfWeek()

    if dayOfWeek == 0 then
        dayOfWeek = "Sunday"
    elseif dayOfWeek == 1 then
        dayOfWeek = "Monday"
    elseif dayOfWeek == 2 then
        dayOfWeek = "Tuesday"
    elseif dayOfWeek == 3 then
        dayOfWeek = "Wednesday"
    elseif dayOfWeek == 4 then
        dayOfWeek = "Thursday"
    elseif dayOfWeek == 5 then
        dayOfWeek = "Friday"
    elseif dayOfWeek == 6 then
        dayOfWeek = "Saturday"
    end
end

function CalculateDateToDisplay()
    month      = GetClockMonth()
    dayOfMonth = GetClockDayOfMonth()
    year       = GetClockYear()

    if month == 0 then
        month = "January"
    elseif month == 1 then
        month = "February"
    elseif month == 2 then
        month = "March"
    elseif month == 3 then
        month = "April"
    elseif month == 4 then
        month = "May"
    elseif month == 5 then
        month = "June"
    elseif month == 6 then
        month = "July"
    elseif month == 7 then
        month = "August"
    elseif month == 8 then
        month = "September"
    elseif month == 9 then
        month = "October"
    elseif month == 10 then
        month = "November"
    elseif month == 11 then
        month = "December"
    end
end
