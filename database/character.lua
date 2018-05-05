XRPLifeDB["character"].GetCharacters = function(plyid, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "SELECT * FROM characters WHERE `playerid` = :plyid",
        data = {
            plyid = plyid
        }
    }, function(results)
        callback(results)
    end)
end

XRPLifeDB["character"].GetCharacterCount = function(plyid, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "SELECT * FROM characters WHERE `playerid` = :plyid",
        data = {
            plyid = plyid
        }
    }, function(results)
        callback(#results.data)
    end)
end

XRPLifeDB["character"].GetCharacter = function(charid, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "SELECT * FROM characters WHERE `id` = :charid",
        data = {
            charid = charid
        }
    }, function(results)
        callback(results)
    end)
end

XRPLifeDB["character"].CreateCharacter = function(name, dob, gender, model, playerid, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "INSERT INTO characters SET `name` = :name, `dob` = :dob, `gender` = :gender, `model` = :model, `bank` = :bank, `playerid` = :playerid",
        data = {
            name = name,
            dob = dob,
            gender = gender,
            model = model,
            bank = XRPLifeConfig["character"].starterMoney,
            playerid = playerid
        }
    }, function(results)
        callback(results)
    end)
end

XRPLifeDB["character"].DeleteCharacter = function(charid, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "DELETE FROM characters WHERE `id` = :id",
        data = {
            id = charid
        }
    }, function(results)
        callback()
    end)
end

XRPLifeDB["character"].DoesCharacterExist = function(name, dob, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "SELECT * FROM characters WHERE `name` = :name AND `dob` = :dob",
        data = {
            name = name,
            dob = dob
        }
    }, function(results)
        if #results.data >= 1 then
            callback(true)
        else
            callback(false)
        end
    end)
end