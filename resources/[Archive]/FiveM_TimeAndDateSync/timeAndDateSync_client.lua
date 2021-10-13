local leapYear = 1

TriggerServerEvent("tads:newplayer")

RegisterNetEvent("tads:timeanddatesync")
AddEventHandler("tads:timeanddatesync", function(time, date)
    Citizen.CreateThread(function()
        while true do
            Wait(2000)
            newTime        = time
            newDate        = date

            newTime.minute = newTime.minute + 1
            if newTime.minute > 59 then
                newTime.minute = 0

                newTime.hour   = time.hour + 1
                if newTime.hour > 23 then
                    newTime.hour = 0

                    newDate.day  = newDate.day + 1
                    if newDate.day > GetDaysInCurrentMonth() then
                        newDate.day   = 1

                        newDate.month = newDate.month + 1
                        if newDate.month > 11 then
                            newDate.month = 0

                            newDate.year  = newDate.year + 1
                            leapYear      = leapYear + 1
                            if leapYear > 3 then
                                leapYear = 0
                            end
                        end
                    end
                    SetClockDate(newDate.day, newDate.month, newDate.year)
                end
            end
            NetworkOverrideClockTime(newTime.hour, newTime.minute, 0)
            TriggerServerEvent("tads:timeanddatesync", newTime, newdate)
        end
    end)
end)

function GetDaysInCurrentMonth()
    local month = GetClockMonth()
    if month == 1 then
        if leapyear == 0 then
            return 29
        else
            return 28
        end
    elseif month == 3 or month == 5 or month == 8 or month == 10 then
        return 30
    elseif month == 0 or month == 2 or month == 4 or month == 6 or month == 7 or month == 9 or month == 11 then
        return 31
    end
end
