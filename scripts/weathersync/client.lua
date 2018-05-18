local currentWeather = ""

RegisterNetEvent("XRPLife_Weather:SetWeather")
AddEventHandler("XRPLife_Weather:SetWeather", function(weatherType)
    print("Changed Weather To " .. weatherType)
    if currentWeather ~= weatherType then
        SetWeatherTypeOverTime(weatherType, 1.0)
        Citizen.Wait(1000)
    end
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypeNowPersist(weatherType)
    SetWeatherTypeNow(weatherType)
    currentWeather = weatherType

    if currentWeather == 'XMAS' then
        SetForceVehicleTrails(true)
        SetForcePedFootstepsTracks(true)
    else
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
    end
end)