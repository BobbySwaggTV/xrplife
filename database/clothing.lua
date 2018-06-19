XRPLifeDB["clothing"].CreateClothing = function(charid, characterData, callback)
   exports["externalsql"]:DBAsyncQuery({
       string = "INSERT INTO clothing SET `model` = :model, `clothing` = :clothing, `props` = :props, `tattoos` = :tattoos, `char_id` = :charid",
       data = {
            model = characterData.model,
            clothing = json.encode(characterData.clothing),
            props = json.encode({}),
            tattoos = json.encode({}),
            charid = charid
       }
   }, function(results)
        callback(results)
   end) 
end

XRPLifeDB["clothing"].UpdateClothing = function(charid, clothingData, callback)

end

XRPLifeDB["clothing"].UpdateProps = function(charid, propData, callback)

end

XRPLifeDB["clothing"].UpdateTattoos = function(charid, tatData, callback)

end

XRPLifeDB["clothing"].GetCharacterClothing = function(charid, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "SELECT * FROM clothing WHERE `char_id` = :charid",
        data = {
            charid = charid
        }
    }, function(results)
        callback(results)
    end)
end

XRPLifeServer.Helpers.DebugMessage("Database - clothing.lua Loaded")