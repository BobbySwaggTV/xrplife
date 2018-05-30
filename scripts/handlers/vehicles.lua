Citizen.CreateThread(function()
    while true do
        if XRPLifeClient.Variables.inVehicle.inVehicle == false then
            local ped = XRPLifeClient.Helpers.PlayerPed()
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local pedSeat = XRPLifeClient.Helpers.GetPedVehicleSeat(ped, vehicle)
                XRPLifeClient.Variables.inVehicle = {inVehicle = true, vehicle = vehicle, seat = pedSeat}
                print(tostring(json.encode(XRPLifeClient.Variables.inVehicle)))
            end
        end

        if XRPLifeClient.Variables.inVehicle.inVehicle == true then
            local ped = XRPLifeClient.Helpers.PlayerPed()
            if not IsPedInAnyVehicle(ped, false) then
                XRPLifeClient.Variables.inVehicle = {inVehicle = false, vehicle = nil, seat = nil}
                print(tostring(json.encode(XRPLifeClient.Variables.inVehicle)))
            end
        end
        Citizen.Wait(150)
    end
end)