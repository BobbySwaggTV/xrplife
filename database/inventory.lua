---------------------------------------------------------------------------
-- Creates Player Inventory
---------------------------------------------------------------------------
XRPLifeDB["inventory"].CreateInventory = function(charid, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "INSERT INTO inventory SET `weapons` = :weapons, `items` = :items, `char_id` = :charid",
        data = {
            weapons = json.encode(XRPLifeConfig["character"].startInventory.weapons),
            items = json.encode(XRPLifeConfig["character"].startInventory.items),
            charid = charid
        }
    }, function(results)
        callback(results)
    end)
end

---------------------------------------------------------------------------
-- Updates Character Inventory
---------------------------------------------------------------------------
XRPLifeDB["inventory"].UpdateInventory = function(charid, inventory, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "UPDATE inventory SET `weapons` = :weapons, `items` = :items WHERE `char_id` = :charid",
        data = {
            weapons = json.encode(inventory.weapons),
            items = json.encode(inventory.items),
            charid = charid
        }
    }, function(results)
        callback(results)
    end)
end

---------------------------------------------------------------------------
-- Gets Character Inventory
---------------------------------------------------------------------------
XRPLifeDB["inventory"].GetInventory = function(charid, callback)
    exports["externalsql"]:DBAsyncQuery({
        string = "SELECT * FROM inventory WHERE `char_id` = :charid",
        data = {
            charid = charid
        }
    }, function(results)
        callback(results)
    end)
end