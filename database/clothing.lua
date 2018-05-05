XRPLifeDB["clothing"].CreateClothing = function(charid, cloth_data, callback)
    
end

XRPLifeDB["clothing"].UpdateClothing = function(charid, cloth_data, callback)
    
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