XRPLifeClient = {}
XRPLifeClient.Helpers = {}

XRPLifeClient.Helpers.PlayerPed = function()
    return GetPlayerPed(PlayerId())
end

XRPLifeClient.Helpers.TopLeftNotification = function(string)
    SetTextComponentFormat("STRING")
    AddTextComponentString(string)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

XRPLifeClient.Helpers.DebugMessage = function(message)
    print(tostring("[XRPLife Debug]: " .. message))
end

XRPLifeClient.Helpers.DebugMessage("Helpers - client.lua = Loaded")