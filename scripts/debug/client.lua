local debug = false

RegisterNetEvent("XRPLife_DebugClientMode")
AddEventHandler("XRPLife_DebugClientMode", function(status)
    debug = status
end)

Citizen.CreateThread(function()
    while true do
        if debug then
            local pedCoords = GetEntityCoords(XRPLifeClient.Helpers.PlayerPed(), false)
            local pedHeading = GetEntityHeading(XRPLifeClient.Helpers.PlayerPed())
            local stringX = tostring("{ X: " .. pedCoords.x .. " }")
            local stringY = tostring("{ Y: " .. pedCoords.y .. " }")
            local stringZ = tostring("{ Z: " .. pedCoords.z .. " }")
            local stringH = tostring("{ H: " .. pedHeading .. " }")
            XRPLifeClient.Helpers.Draw2DText(0.025, 0.030, 0.025, 0.025, 0.50, stringX, {r = 255, g = 0, b = 0, a = 255})
            XRPLifeClient.Helpers.Draw2DText(0.025, 0.060, 0.025, 0.025, 0.50, stringY, {r = 255, g = 0, b = 0, a = 255})
            XRPLifeClient.Helpers.Draw2DText(0.025, 0.090, 0.025, 0.025, 0.50, stringZ, {r = 255, g = 0, b = 0, a = 255})
            XRPLifeClient.Helpers.Draw2DText(0.025, 0.120, 0.025, 0.025, 0.50, stringH, {r = 255, g = 0, b = 0, a = 255})
        end
        Citizen.Wait(10)
    end
end)