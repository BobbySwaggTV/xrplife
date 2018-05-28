---------------------------------------------------------------------------
-- Gets all of the players characters
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Gets the amount of characters the player has created
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Gets a players certain character
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Creates a players character
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Deletes a players character
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Checks if a character already exists with the same name and dob
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Updates Character Bank Account
---------------------------------------------------------------------------
XRPLifeDB["character"].UpdateBankAccount = function(charid, newBalance, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "UPDATE `characters` SET `bank` = :bank WHERE `id` = :charid",
        data = {
            bank = newBalance,
            charid = charid
        }
    }, function(results)
        callback()
    end)
end

XRPLifeServer.Helpers.DebugMessage("Database - character.lua Loaded")