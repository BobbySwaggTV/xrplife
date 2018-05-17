---------------------------------------------------------------------------
-- Version Checker
---------------------------------------------------------------------------
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

Citizen.CreateThread(function()
    print("---------------------------------------------------------------------------\n")
    print(" Welcome to XRPLife made by [Xander1998 (X. Cross)]\n")
    print(" Version Checker is " .. tostring(XRPLifeConfig["server"].checkXRPVersion) .. "\n")
    print(" Debug mode is " .. tostring(XRPLifeConfig["server"].debugMode) .. "\n")
    print("---------------------------------------------------------------------------\n")

    if XRPLifeConfig["server"].checkXRPVersion then

        PerformHttpRequest("https://api.github.com/repos/xander1998/xrplife/contents/version.json", function(code, text, something)
            
            local data = json.decode(text)
            local versionData = json.decode(decode(data.content))

            local jsonVersion = json.decode(LoadResourceFile(GetCurrentResourceName(), "version.json"))
            
            if code == 200 then
                print("---------------------------------------------------------------------------\n")
                if tonumber(versionData.version) == jsonVersion.version then
                    print(" XRPLife Version Updated and ready to go. Version: " .. jsonVersion.version .. "\n")
                    print("---------------------------------------------------------------------------\n")
                else
                    print(" XRPLife version does NOT match. Think about updating?\n Your Version: " .. jsonVersion.version .. "\n Newest Version: " .. versionData.version .. "\n")
                    print("---------------------------------------------------------------------------\n")
                end
            else
                print(" Error checking version API. You don't have to worry about this. It just didn't check for any updates... All good to go!\n")
                print("---------------------------------------------------------------------------\n")
            end

        end, "GET", json.encode({}), {["Content-Type"] = "application/text"})

    end
end)

function decode(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

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