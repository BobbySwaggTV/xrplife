local hours = 0
local minutes = 0

Citizen.CreateThread(function()
    math.randomseed(os.time())
    local randomHour = math.random(1, 24)
    local randomMinute = math.random(1, 59)
    hours = randomHour
    minutes = randomMinute
    StartTimeChanging()
end)

function StartTimeChanging()
    SetTimeout(XRPLifeConfig["time"].SecPerMin * 1000, function()
        minutes = minutes + 1
        if minutes >= 60 then
            hours = hours + 1
            minutes = 0
            if hours > 24 then
                hours = 0
            end
        end
        StartTimeChanging()
        TriggerClientEvent("XRPLife_Time:SetTime", -1, hours, minutes)
    end)
end

RegisterServerEvent("XRPLife_Time:ConnectionSetTime")
AddEventHandler("XRPLife_Time:ConnectionSetTime", function()
    local src = source
    TriggerClientEvent("XRPLife_Time:SetTime", src, hours, minutes)
end)