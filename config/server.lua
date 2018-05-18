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

XRPLifeServer.Helpers.DebugMessage("Config - server.lua Loaded")