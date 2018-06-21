local setHours = 0
local setMinutes = 0

RegisterNetEvent("XRPLife_Time:SetTime")
AddEventHandler("XRPLife_Time:SetTime", function(hours, minutes)
    setHours = hours
    setMinutes = minutes
    NetworkOverrideClockTime(hours, minutes, 0)
end)

Citizen.CreateThread(function()
    while true do
        NetworkOverrideClockTime(setHours, setMinutes, 0)
        Citizen.Wait(100)
    end
end)