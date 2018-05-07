XRPLifeConfig["admin"].whitelistActive = false

XRPLifeConfig["admin"].Ranks = {
    "User",
    "Moderator",
    "Admin",
    "Owner"
}

XRPLifeConfig["admin"].RankPerms = {
    ["User"] = {},
    ["Moderator"] = {},
    ["Admin"] = {},
    ["Owner"] = {}
}

XRPLifeConfig["admin"].ChatRankColors = {
    ["User"] = "^2",
    ["Moderator"] = "^4",
    ["Admin"] = "^1",
    ["Owner"] = "^8"
}

XRPLifeServer.Helpers.DebugMessage("Config - admin.lua Loaded")