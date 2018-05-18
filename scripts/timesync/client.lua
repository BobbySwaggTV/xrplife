RegisterNetEvent("XRPLife_Time:SetTime")
AddEventHandler("XRPLife_Time:SetTime", function(hours, minutes)
    NetworkOverrideClockTime(hours, minutes, 0)
end)