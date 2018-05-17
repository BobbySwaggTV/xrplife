---------------------------------------------------------------------------
-- Controls if the server will check whitelist or not
---------------------------------------------------------------------------
XRPLifeConfig["admin"].whitelistActive = false

-- Ranks list from lowest to highest.
XRPLifeConfig["admin"].Ranks = {
    "User",
    "Moderator",
    "Admin",
    "Owner"
}

---------------------------------------------------------------------------
-- Permissions for each rank
---------------------------------------------------------------------------
--[[ List of Permissions --
    Menu              = Ability to access the moderation menu
    ChangeRank        = Ability to change a players rank for users who are lower than they are and also can not set user to the rank they are currently.
    Whitelisting      = Ability to whitelist and unwhitelist players.
    Ban               = Ability to ban players with a lower rank than them.
    Kick              = Ability to kick players that are lower than them.
    Freeze            = Ability to freeze and unfreeze players.
    Chat              = Ability to access the admin chat box in the menu.
    Report            = Ability to report players to administrators.
    BypassRestriction = Ability to use permissions on ranks the same rank as them.
--]]
XRPLifeConfig["admin"].RankPerms = {
    ["User"]      = {},
    ["Moderator"] = {"Menu", "Report", "Chat", "Freeze"},
    ["Admin"]     = {"Menu", "Report", "Chat", "Freeze", "Kick", "Ban", "Whitelisting", "ChangeRank"},
    ["Owner"]     = {"Menu", "Report", "Chat", "Freeze", "Kick", "Ban", "Whitelisting", "ChangeRank", "BypassRestriction"}
}

---------------------------------------------------------------------------
-- Color that shows up in chat for your rank / name
---------------------------------------------------------------------------
XRPLifeConfig["admin"].ChatRankColors = {
    ["User"]      = "^2",
    ["Moderator"] = "^4",
    ["Admin"]     = "^1",
    ["Owner"]     = "^8"
}

XRPLifeServer.Helpers.DebugMessage("Config - admin.lua Loaded")