---------------------------------------------------------------------------
-- Regular Commands
---------------------------------------------------------------------------
RegisterCommand("respawn", function(source, args, raw)
    local src = source
    TriggerClientEvent("XRPLife_Chat:RespawnPlayer", src)
end, false)

RegisterCommand("admin", function(source, args, raw)
    local src = source
    local player_list = GetPlayers()
    local new_players = {}

    for a = 1, #player_list do
        table.insert(new_players, {serverid = player_list[a], name = GetPlayerName(player_list[a])})
    end

    XRPLifeTables["players"].methods.GetPlayer(src, function(player)
        local rank = player.rank
        local perms = XRPLifeConfig["admin"].RankPerms[rank]
        for a = 1, #perms do
            if perms[a] == "Menu" then
                TriggerClientEvent("XRPLife_AdminMenu:OpenMenu", src, GetPlayerName(src), rank, perms, new_players)
                return
            end
        end
    end)
end, false)

---------------------------------------------------------------------------
-- Console Commands
---------------------------------------------------------------------------
RegisterCommand("console_ChangeRank", function(source, args, raw)
    if source == 0 then
        local identifier = args[1]
        local newRank = args[2]
        XRPLifeDB["player"].ConsoleUpdatePlayerRank(identifier, newRank, function(status, resultMessage)
            print(resultMessage)
            if status ~= false then
                local players = GetPlayers()
                local foundPlayer = nil

                for a = 1, #players do
                    if XRPLifeServer.Helpers.PlayerIdentifier(XRPLifeConfig["database"].identifier, players[a]) == identifier then
                        foundPlayer = tonumber(players[a])
                        break
                    end
                end

                if foundPlayer ~= nil then
                    XRPLifeTables["players"].methods.UpdatePlayerRank(foundPlayer, newRank, function()
                        print("Updated player in-game table")
                    end)
                end
            end
        end)
    end
end, false)

RegisterCommand("console_ChangeWhitelist", function(source, args, raw)
    if source == 0 then
        local identifier = args[1]
        local whitelistStatus = args[2]
        XRPLifeDB["player"].ConsoleUpdatePlayerWhitelisted(identifier, whitelistStatus, function(status, resultMessage)
            print(resultMessage)
        end)
    end
end)