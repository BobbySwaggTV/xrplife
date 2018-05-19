---------------------------------------------------------------------------
-- Version Checker
---------------------------------------------------------------------------
Citizen.CreateThread(function()
    print("\n")
    print("---------------------------------------------------------------------------\n")
    print(" Welcome to XRPLife made by [Xander1998 (X. Cross)]\n")
    print(" Version Checker is " .. tostring(XRPLifeConfig["server"].checkXRPVersion) .. "\n")
    print(" Debug mode is " .. tostring(XRPLifeConfig["server"].debugMode) .. "\n")
    print("---------------------------------------------------------------------------\n")
    if XRPLifeConfig["server"].checkXRPVersion then
        PerformHttpRequest("http://raw.githubusercontent.com/xander1998/xrplife/master/version.json", function(code, text, something)
            local data = json.decode(text)
            local jsonVersion = json.decode(LoadResourceFile(GetCurrentResourceName(), "version.json"))

            if code == 200 then
                print("\n")
                print("---------------------------------------------------------------------------\n")
                if tonumber(data.version) == jsonVersion.version then
                    print(" XRPLife Version Updated and ready to go. Version: " .. jsonVersion.version .. "\n")
                    print("---------------------------------------------------------------------------\n")
                else
                    print(" XRPLife version does NOT match. Think about updating?\n Your Version: " .. jsonVersion.version .. "\n Newest Version: " .. data.version .. "\n")
                    print("---------------------------------------------------------------------------\n")
                end
            else
                print(" Error checking version API. You don't have to worry about this. It just didn't check for any updates... All good to go!\n")
                print("---------------------------------------------------------------------------\n")
            end
        end, "GET", json.encode({}), {["Content-Type"] = "application/text"})
    end
end)

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
-- Pass Settings From Server To Client
---------------------------------------------------------------------------
RegisterServerEvent("XRPLife_Settings:RequestConfigSettings")
AddEventHandler("XRPLife_Settings:RequestConfigSettings", function()
    local src = source
    TriggerClientEvent("XRPLife_DebugClientMode", src, XRPLifeConfig["server"].debugMode)
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