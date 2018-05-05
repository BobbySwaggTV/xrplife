XRPLifeClient = {}
XRPLifeClient.Helpers = {}
XRPLifeClient.Tables = {}

XRPLifeClient.Helpers.PlayerPed = function()
    return GetPlayerPed(PlayerId())
end

XRPLifeClient.Tables.PedComponents = {
    ["Face"] = 0,
    ["Head"] = 1,
    ["Hair"] = 2,
    ["Torso"] = 3,
    ["Legs"] = 4,
    ["Hands"] = 5,
    ["Feet"] = 6,
    ["Eyes"] = 7,
    ["Accessories"] = 8,
    ["Tasks"] = 9,
    ["Textures"] = 10,
    ["Torso2"] = 11
}

XRPLifeClient.Tables.PedProps = {
    ["Hats"] = 0,
    ["Glasses"] = 1,
    ["Watches"] = 2
}

XRPLifeClient.Helpers.DebugMessage = function(message)
    print(tostring("[XRPLife Debug]: " .. message))
end

XRPLifeClient.Helpers.DebugMessage("Helpers - client.lua = Loaded")