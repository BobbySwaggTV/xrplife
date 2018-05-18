local weatherTypes = XRPLifeConfig["weather"].regularWeatherTypes
local weatherWinterTypes = XRPLifeConfig["weather"].winterWeatherTypes

local currentWeather = ""

Citizen.CreateThread(function()
    math.randomseed(os.time())
    if XRPLifeConfig["weather"].isWinter then
        local random = math.random(1, #weatherWinterTypes)
        currentWeather = weatherWinterTypes[random]
    else
        local random = math.random(1, #weatherTypes)
        currentWeather = weatherTypes[random]
    end
    TriggerWeatherChange()
end)

function TriggerWeatherChange()
    math.randomseed(os.time())
    local time = math.random(XRPLifeConfig["weather"].leastTime, XRPLifeConfig["weather"].maxTime)
    SetTimeout(time * 60000, function()
        math.randomseed(os.time())
        if XRPLifeConfig["weather"].isWinter then
            local random = math.random(1, #weatherWinterTypes)
            currentWeather = weatherWinterTypes[random]
        else
            local random = math.random(1, #weatherTypes)
            currentWeather = weatherTypes[random]
        end

        TriggerClientEvent("XRPLife_Weather:SetWeather", -1, currentWeather)

        TriggerWeatherChange()
    end)
end

RegisterServerEvent("XRPLife_Weather:ConnectionSetWeather")
AddEventHandler("XRPLife_Weather:ConnectionSetWeather", function()
    local src = source
    TriggerClientEvent("XRPLife_Weather:SetWeather", src, currentWeather)
end)