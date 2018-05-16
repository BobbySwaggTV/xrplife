---------------------------------------------------------------------------
-- Handles players connecting to the server
---------------------------------------------------------------------------
AddEventHandler("playerConnecting", function(name, reason, deferrals)
    local src = source
    deferrals.defer()

    for a = 1, 5 do
        deferrals.update("Please Wait " .. 5 - a .. " seconds!")
        Wait(1000)
    end

    XRPLifeDB["player"].GetPlayer(src, function(getresults)
        if #getresults.data >= 1 then
            local ban_data = json.decode(getresults.data[1].banned_data)
            if ban_data.banned then
                local string = tostring("[XRPLife]: You have been banned for ( " .. ban_data.reason .. " ) by ( " .. ban_data.banner .. " )")
                deferrals.done(string)
            else
                if XRPLifeConfig["admin"].whitelistActive then
                    if getresults.data[1].whitelisted == 1 then
                        XRPLifeDB["player"].UpdatePlayerName(src, function(results)
                        end)
                        deferrals.done()
                    else
                        deferrals.done("[XRPLife]: You are not whitelisted.")
                    end
                else
                    deferrals.done()
                end
            end
        else
            print("Creating Player")
            XRPLifeDB["player"].CreatePlayer(src, function(createresults)
                if XRPLifeConfig["admin"].whitelistActive then
                    deferrals.done("[XRPLife]: Whitelist active please rejoin the server.")
                else
                    deferrals.done()
                end
            end)
        end
    end)
end)

---------------------------------------------------------------------------
-- Handles getting the playes started
---------------------------------------------------------------------------
RegisterServerEvent("XRPLife_Start")
AddEventHandler("XRPLife_Start", function()
    local src = source
    XRPLifeTables["players"].methods.AddPlayer(src, function()
        TriggerEvent("XRPLife_CharacterMenu:RequestMenu", src)
    end)
end)

---------------------------------------------------------------------------
-- Cleans out the players data from the server tables
---------------------------------------------------------------------------
AddEventHandler("playerDropped", function()
    local src = source
    XRPLifeTables["players"].methods.RemovePlayer(src)
    XRPLifeTables["characters"].methods.RemoveCharacter(src, function()
    end)
end)