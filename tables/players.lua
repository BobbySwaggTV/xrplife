XRPLifeTables["players"].methods.AddPlayer = function(src, callback)
    XRPLifeDB["player"].GetPlayer(src, function(results)
        table.insert(XRPLifeTables["players"].list, {
            src = src,
            id = results.data[1].id,
            ident = XRPLifeServer.Helpers.PlayerIdentifier(XRPLifeConfig["database"].identifier, src),
            rank = results.data[1].rank
        })
        if XRPLifeConfig["server"].debugMode then
            XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Adding Player"))
            XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["players"].list)))
        end
        callback()
    end)
end

XRPLifeTables["players"].methods.RemovePlayer = function(src)
    for a = 1, #XRPLifeTables["players"].list do
        if XRPLifeTables["players"].list[a].src == src then
            table.remove(XRPLifeTables["players"].list, a)
            if XRPLifeConfig["server"].debugMode then
                XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Removing Player"))
                XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["players"].list)))
            end
            return
        end
    end
end

XRPLifeTables["players"].methods.GetPlayer = function(src, callback)
    local found = {}
    for a = 1, #XRPLifeTables["players"].list do
        if XRPLifeTables["players"].list[a].src == src then
            if XRPLifeConfig["server"].debugMode then
                XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Getting Player"))
                XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["players"].list[a])))
            end
            found = XRPLifeTables["players"].list[a]
        end
    end
    callback(found)
end

XRPLifeTables["players"].methods.UpdatePlayerRank = function(src, newRank, callback)
    for a = 1, #XRPLifeTables["players"].list do
        print(tostring(json.encode(XRPLifeTables["players"].list[a])))
        if XRPLifeTables["players"].list[a].src == src then
            XRPLifeTables["players"].list[a].rank = newRank
            if XRPLifeConfig["server"].debugMode then
                XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Updating Player Rank"))
                XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["players"].list)))
            end
            break
        end
    end
    callback()
end

XRPLifeServer.Helpers.DebugMessage("Tables - players.lua Loaded")