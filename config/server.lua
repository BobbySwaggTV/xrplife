---------------------------------------------------------------------------
-- Decides if you want version checker to notify you of XRPLife updates
---------------------------------------------------------------------------
XRPLifeConfig["server"].checkXRPVersion = false

---------------------------------------------------------------------------
-- Allows you to see some debug comments when functions are triggered etc..
---------------------------------------------------------------------------
XRPLifeConfig["server"].debugMode = true

---------------------------------------------------------------------------
-- Lets to toggle on XRPLife's local chat feature for chat.
---------------------------------------------------------------------------
XRPLifeConfig["server"].localChat = true

---------------------------------------------------------------------------
-- Lets you change the distance for the local chat.
---------------------------------------------------------------------------
XRPLifeConfig["server"].localChatDistance = 20.0

---------------------------------------------------------------------------
-- Spawn points where players spawn
---------------------------------------------------------------------------
XRPLifeConfig["server"].SpawnLocations = {
    {x = 127.815, y = -1733.634, z = 30.110, h = 319.082},
    {x = 126.225, y = -1732.339, z = 30.506, h = 320.506},
    {x = 124.844, y = -1731.098, z = 30.111, h = 333.474}
}

XRPLifeServer.Helpers.DebugMessage("Config - server.lua Loaded")