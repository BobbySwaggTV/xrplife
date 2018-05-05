XRPLifeDB["player"].GetPlayer = function(id, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "SELECT * FROM players WHERE `identifier` = :identifier", 
        data = {
            identifier = XRPLifeServer.Helpers.PlayerIdentifier(XRPLifeConfig["database"].identifier, id)
        }
    }, function(results)
        callback(results)
    end)
end

XRPLifeDB["player"].CreatePlayer = function(id, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "INSERT INTO players SET `identifier` = :identifier, `name` = :name, `rank` = :rank, `banned_data` = :banned_data, `whitelisted` = :whitelisted",
        data = {
            identifier = XRPLifeServer.Helpers.PlayerIdentifier(XRPLifeConfig["database"].identifier, id),
            name = GetPlayerName(id),
            rank = XRPLifeConfig["admin"].Ranks[1],
            banned_data = json.encode({banned = false, banner = "", reason = ""}),
            whitelisted = false
        }
    }, function(results)
        callback(results)
    end)
end

XRPLifeDB["player"].UpdatePlayerName = function(id, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "UPDATE players SET `name` = :name WHERE `identifier` = :identifier",
        data = {
            identifier = XRPLifeServer.Helpers.PlayerIdentifier(XRPLifeConfig["database"].identifier, id),
            name = GetPlayerName(id)
        }
    }, function(results)
        callback(results)
    end)
end

if XRPLifeConfig["server"].debugMode then
    XRPLifeServer.Helpers.DebugMessage("Database - player.lua Loaded")
end