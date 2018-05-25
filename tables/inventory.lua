---------------------------------------------------------------------------
-- Add Character Inventory From Database
---------------------------------------------------------------------------
XRPLifeTables["inventory"].methods.AddCharacterInventory = function(src, inventory, charid, callback)
    table.insert(XRPLifeTables["inventory"].list, {
        src = src,
        weapons = inventory.weapons,
        items = inventory.items,
        charid = charid
    })
    if XRPLifeConfig["server"].debugMode then
        XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Adding Inventory"))
        XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["inventory"].list)))
    end
    callback()
end

---------------------------------------------------------------------------
-- Get Character Inventory From Table
---------------------------------------------------------------------------
XRPLifeTables["inventory"].methods.GetCharacterInventory = function(src, callback)
    for a = 1, #XRPLifeTables["inventory"].list do
        if XRPLifeTables["inventory"].list[a].src == src then
            callback(XRPLifeTables["inventory"].list[a])
            if XRPLifeConfig["server"].debugMode then
                XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Adding Inventory"))
                XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["inventory"].list)))
            end
            break
        end
    end
end

---------------------------------------------------------------------------
-- Remove Character Inventory From Table
---------------------------------------------------------------------------
XRPLifeTables["inventory"].methods.RemoveCharacterInventory = function(src)
    for a = 1, #XRPLifeTables["inventory"].list do
        if XRPLifeTables["inventory"].list[a].src == src then
            table.remove(XRPLifeTables["inventory"].list, a)
            if XRPLifeConfig["server"].debugMode then
                XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Adding Inventory"))
                XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["inventory"].list)))
            end
            break
        end
    end
end

---------------------------------------------------------------------------
-- Add Item To Character Inventory Table
---------------------------------------------------------------------------
XRPLifeTables["inventory"].methods.AddItem = function(src, item, amount)
    XRPLifeTables["inventory"].methods.GetCharacterInventory(src, function(inventory)
        if XRPLifeServer.Helpers.DoesItemExist(inventory, item) then
            for a = 1, #XRPLifeTables["inventory"].list do
                if XRPLifeTables["inventory"].list[a].src == src then
                    for b = 1, #XRPLifeTables["inventory"].list[a].items do
                        if XRPLifeTables["inventory"].list[a].items[b].item == item then
                            XRPLifeTables["inventory"].list[a].items[b].amount = XRPLifeTables["inventory"].list[a].items[b].amount + amount
                            break
                        end
                    end
                end
            end
        else
            for c = 1, #XRPLifeTables["inventory"].list do
                if XRPLifeTables["inventory"].list[c].src == src then
                    table.insert(XRPLifeTables["inventory"].list[c].items, {
                        item = item,
                        amount = amount
                    })
                    break
                end
            end
        end
    end)
    if XRPLifeConfig["server"].debugMode then
        XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Adding Inventory"))
        XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["inventory"].list)))
    end
end

---------------------------------------------------------------------------
-- Remove Item From Character Inventory Table
---------------------------------------------------------------------------
XRPLifeTables["inventory"].methods.RemoveItem = function(src, item, amount, callback)
    XRPLifeTables["inventory"].methods.GetCharacterInventory(src, function(inventory)
        if XRPLifeServer.Helpers.DoesItemExist(inventory, item) then
            for a = 1, #XRPLifeTables["inventory"].list do
                if XRPLifeTables["inventory"].list[a].src == src then
                    for b = 1, #XRPLifeTables["inventory"].list[a].items do
                        if XRPLifeTables["inventory"].list[a].items[b].item == item then
                            if XRPLifeTables["inventory"].list[a].items[b].amount > amount then
                                XRPLifeTables["inventory"].list[a].items[b].amount = XRPLifeTables["inventory"].list[a].items[b].amount - amount
                                callback(true)
                                break
                            elseif XRPLifeTables["inventory"].list[a].items[b].amount == amount then
                                table.remove(XRPLifeTables["inventory"].list[a].items, b)
                                callback(true)
                                break
                            else
                                callback(false)
                                break
                            end
                        end
                    end
                end
            end
        else
            callback(false)
        end
    end)
    if XRPLifeConfig["server"].debugMode then
        XRPLifeServer.Helpers.DebugMessage(tostring("Tables - Adding Inventory"))
        XRPLifeServer.Helpers.DebugMessage(tostring(json.encode(XRPLifeTables["inventory"].list)))
    end
end