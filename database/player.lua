---------------------------------------------------------------------------
-- Gets the player information
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Creates a player
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Updates the players name
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Updates player rank [Created for the console commands]
---------------------------------------------------------------------------
XRPLifeDB["player"].ConsoleUpdatePlayerRank = function(identifier, rank, callback)
    local rankAvailable = false
    for a = 1, #XRPLifeConfig["admin"].Ranks do
        if XRPLifeConfig["admin"].Ranks[a] == rank then
            rankAvailable = true
            break
        end
    end
    if rankAvailable then
        exports["externalsql"]:DBAsyncQuery({
            string = "UPDATE players SET `rank` = :rank WHERE `identifier` = :identifier",
            data = {
                identifier = identifier,
                rank = rank
            }
        }, function(results)
            if results.data.changedRows >= 1 then
                callback(true, tostring("\nChanged rank for (" .. identifier .. ") to [" .. rank .. "]"))
            else
                callback(false, tostring("\n" .. identifier .. " is not a registered identifier on your server!"))
            end
        end)
    else
        callback(false, tostring("\n" .. rank .. " is not a valid rank for your server!"))
    end
end

---------------------------------------------------------------------------
-- Updates players whitelist status [Created for the console commands]
---------------------------------------------------------------------------
XRPLifeDB["player"].ConsoleUpdatePlayerWhitelisted = function(identifier, whitelisted, callback)
    print(whitelisted)
    local status = tonumber(whitelisted)
    if status == 1 or status == 0 then
        exports["externalsql"]:DBAsyncQuery({
            string = "UPDATE players SET `whitelisted` = :whitelisted WHERE `identifier` = :identifier",
            data = {
                identifier = identifier,
                whitelisted = status
            }
        }, function(results)
            if results.data.changedRows >= 1 then
                callback(true, tostring("\nChanged whitelisted status for (" .. identifier .. ") to [" .. tostring(whitelisted) .. "]"))
            else
                callback(false, tostring("Didn't find a player to change whitelist status with that identifier"))
            end
        end)
    else
        callback(false, tostring("\n You passed a status other than '1' or '0'"))
    end
end

XRPLifeServer.Helpers.DebugMessage("Database - player.lua Loaded")