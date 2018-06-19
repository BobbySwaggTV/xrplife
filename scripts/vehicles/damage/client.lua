-- XRPLifeClient.Variables.Vehicle = {inVehicle = false, vehicle = nil, seat = nil}
local trackedVehicle = nil
local pastHealth = 0.0

RegisterCommand("toolkit", function()
    SetVehicleEngineHealth(trackedVehicle, 300.0)
end, false)

Citizen.CreateThread(function()
    while true do

        if XRPLifeClient.Variables.Vehicle.inVehicle == true then
            if XRPLifeClient.Variables.Vehicle.seat == -1 then
                local vehicle = XRPLifeClient.Variables.Vehicle.vehicle
                if trackedVehicle ~= XRPLifeClient.Variables.Vehicle.vehicle then 
                    trackedVehicle = XRPLifeClient.Variables.Vehicle.vehicle 
                    pastHealth = GetVehicleEngineHealth(vehicle)
                else
                    if pastHealth < GetVehicleEngineHealth(vehicle) then
                        pastHealth = GetVehicleEngineHealth(vehicle)
                    end
                end

                local newHealth = 0.0
                local currentHealth = GetVehicleEngineHealth(vehicle)
                local calculatedDamage = (currentHealth - pastHealth) * -1

                if currentHealth >= 0.0 then
                    if calculatedDamage > 0.0 and calculatedDamage <= 25.0 then
                        newHealth = currentHealth - 100.0
                        SetVehicleEngineHealth(vehicle, newHealth)
                        TriggerEvent("XRPLife_Notification:Error", "Vehicle Damage", "Smaller Damage", 4000, false, "rightCenter")
                    elseif calculatedDamage > 25.0 and calculatedDamage <= 50.0 then
                        newHealth = currentHealth - 200.0
                        SetVehicleEngineHealth(vehicle, newHealth)
                        TriggerEvent("XRPLife_Notification:Error", "Vehicle Damage", "Small Damage", 4000, false, "rightCenter")
                    elseif calculatedDamage > 50.0 and calculatedDamage <= 75.0 then
                        newHealth = currentHealth - 300.0
                        SetVehicleEngineHealth(vehicle, newHealth)
                        TriggerEvent("XRPLife_Notification:Error", "Vehicle Damage", "Medium Damage", 4000, false, "rightCenter")
                    elseif calculatedDamage > 75.0 and calculatedDamage <= 100.0 then
                        newHealth = currentHealth - 400.0
                        SetVehicleEngineHealth(vehicle, newHealth)
                        TriggerEvent("XRPLife_Notification:Error", "Vehicle Damage", "Large Damage", 4000, false, "rightCenter")
                    elseif calculatedDamage > 100.0 then
                        newHealth = 0.0
                        SetVehicleEngineHealth(vehicle, newHealth)
                        TriggerEvent("XRPLife_Notification:Error", "Vehicle Damage", "Critical Damage", 4000, false, "rightCenter")
                    end
                    pastHealth = GetVehicleEngineHealth(vehicle)
                end
            else
                pastHealth = currentHealth
            end
        end

        Citizen.Wait(1000)
    end
end)