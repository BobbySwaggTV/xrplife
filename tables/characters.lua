---------------------------------------------------------------------------
-- Adds character to server table
---------------------------------------------------------------------------
XRPLifeTables["characters"].methods.AddCharacter = function(src, char_data, callback)
    table.insert(XRPLifeTables["characters"].list, {
        src = src,
        charid = char_data.id,
        name = char_data.name,
        dob = char_data.dob,
        gender = char_data.gender,
        model = char_data.model
    })
    if XRPLifeConfig["server"].debugMode then
        XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Adding Character"))
        XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["characters"].list)))
    end
    callback()
end

---------------------------------------------------------------------------
-- Removes character from server table
---------------------------------------------------------------------------
XRPLifeTables["characters"].methods.RemoveCharacter = function(src, callback)
    for a = 1, #XRPLifeTables["characters"].list do
        if XRPLifeTables["characters"].list[a].src == src then
            table.remove(XRPLifeTables["characters"].list, a)
        end
    end
    if XRPLifeConfig["server"].debugMode then
        XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Removing Character"))
        XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["characters"].list)))
    end
    callback()
end

---------------------------------------------------------------------------
-- Gets character from server table
---------------------------------------------------------------------------
XRPLifeTables["characters"].methods.GetCharacter = function(src, callback)
    for a = 1, #XRPLifeTables["characters"].list do
        if XRPLifeTables["characters"].list[a].src == src then
            if XRPLifeConfig["server"].debugMode then
                XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Getting Character"))
                XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["characters"].list[a])))
            end
            callback(XRPLifeTables["characters"].list[a])
        end
    end
end

XRPLifeServer.Helpers.DebugMessage("Tables - characters.lua Loaded")