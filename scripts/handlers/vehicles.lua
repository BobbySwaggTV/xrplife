RegisterCommand("shuffle", function()
    XRPLifeClient.Variables.canShuffle = true
    if XRPLifeClient.Variables.Vehicle.inVehicle then
        local vehicle = XRPLifeClient.Variables.Vehicle.vehicle
        if CanShuffleSeat(vehicle, 1) then
            TaskShuffleToNextVehicleSeat(XRPLifeClient.Helpers.PlayerPed(), vehicle)
        end
    end
    Citizen.Wait(2500)
    XRPLifeClient.Variables.canShuffle = false
end, false)

Citizen.CreateThread(function()
    while true do
        if XRPLifeClient.Variables.Vehicle.inVehicle == false then
            local ped = XRPLifeClient.Helpers.PlayerPed()
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local pedSeat = XRPLifeClient.Helpers.GetPedVehicleSeat(ped, vehicle)
                XRPLifeClient.Variables.Vehicle = {inVehicle = true, vehicle = vehicle, seat = pedSeat}
                print(tostring(json.encode(XRPLifeClient.Variables.Vehicle)))
            end
        end

        if XRPLifeClient.Variables.Vehicle.inVehicle == true then
            local ped = XRPLifeClient.Helpers.PlayerPed()
            if not IsPedInAnyVehicle(ped, false) then
                XRPLifeClient.Variables.Vehicle = {inVehicle = false, vehicle = nil, seat = nil}
                print(tostring(json.encode(XRPLifeClient.Variables.Vehicle)))
            end
        end
        Citizen.Wait(150)
    end
end)