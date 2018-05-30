-- XRPLifeClient.Variables.inVehicle = {inVehicle = false, vehicle = nil, seat = nil}
local trackedVehicle = nil
local pastHealth = 0.0

Citizen.CreateThread(function()
    while true do

        if XRPLifeClient.Variables.inVehicle.inVehicle == true then
            
            if XRPLifeClient.Variables.inVehicle.seat == -1 then
                local vehicle = XRPLifeClient.Variables.inVehicle.vehicle
                if trackedVehicle ~= XRPLifeClient.Variables.inVehicle.vehicle then 
                    trackedVehicle = XRPLifeClient.Variables.inVehicle.vehicle 
                    pastHealth = GetVehicleEngineHealth(vehicle)
                end

                local currentHealth = GetVehicleEngineHealth(vehicle)
                local newHealth = 0.0

                if currentHealth < pastHealth - 15.0 then
                    newHealth = currentHealth - 100.0
                    SetVehicleEngineHealth(vehicle, newHealth)
                    pastHealth = newHealth
                elseif currentHealth < pastHealth - 35.0 then
                    newHealth = currentHealth - 200.0
                    SetVehicleEngineHealth(vehicle, newHealth)
                    pastHealth = newHealth
                elseif currentHealth < pastHealth - 50.0 then
                    newHealth = currentHealth - 300.0
                    SetVehicleEngineHealth(vehicle, newHealth)
                    pastHealth = newHealth
                elseif currentHealth < pastHealth - 75.0 then
                    newHealth = currentHealth - 450.0
                    SetVehicleEngineHealth(vehicle, newHealth)
                    pastHealth = newHealth
                elseif currentHealth < pastHealth - 90.0 and (currentHealth < pastHealth - 90) > 300.0  then
                    newHealth = 300.0
                    SetVehicleEngineHealth(vehicle, newHealth)
                    pastHealth = newHealth
                end
                print("Current Health: " .. currentHealth)
                print("New Health: " .. newHealth)
            end
        end

        Citizen.Wait(250)
    end
end)