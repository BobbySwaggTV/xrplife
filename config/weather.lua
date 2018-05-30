---------------------------------------------------------------------------
-- Least time for the weather to change [Minutes]
---------------------------------------------------------------------------
XRPLifeConfig["weather"].leastTime = 30

---------------------------------------------------------------------------
-- Max time for the weather to change [Minutes]
---------------------------------------------------------------------------
XRPLifeConfig["weather"].maxTime = 45

---------------------------------------------------------------------------
-- Would you like the weather to be snowing ???
---------------------------------------------------------------------------
XRPLifeConfig["weather"].isWinter = false

---------------------------------------------------------------------------
-- Regular Weather Types
---------------------------------------------------------------------------
XRPLifeConfig["weather"].regularWeatherTypes = {
    "CLEAR",
    "EXTRASUNNY",
    "CLOUDS",
    "OVERCAST",
    "RAIN",
    "CLEARING",
    "THUNDER",
    "SMOG",
    "FOGGY"
}

---------------------------------------------------------------------------
-- Winter Weather Types
---------------------------------------------------------------------------
XRPLifeConfig["weather"].winterWeatherTypes = {"XMAS"}

XRPLifeServer.Helpers.DebugMessage("Config - weather.lua Loaded")