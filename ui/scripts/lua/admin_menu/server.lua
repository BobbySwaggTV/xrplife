RegisterServerEvent("XRPLife_AdminMenu:PassAdminMessage")
AddEventHandler("XRPLife_AdminMenu:PassAdminMessage", function(data)
    local src = source
    local players = GetPlayers()
    for a = 1, #players do
        if tonumber(players[a]) ~= src then
            XRPLifeTables["players"].methods.GetPlayer(tonumber(players[a]), function(player)
                local perms = XRPLifeConfig["admin"].RankPerms[player.rank]
                TriggerClientEvent("XRPLife_AdminMenu:PassMessageData", players[a], data, perms)
            end)
        end
    end
end)

RegisterServerEvent("XRPLife_AdminMenu:TriggerKickClient")
AddEventHandler("XRPLife_AdminMenu:TriggerKickClient", function(player, reason)
    local src = source
    local player = tonumber(player)
    if src ~= player then
        XRPLifeTables["players"].methods.GetPlayer(src, function(admin)
            XRPLifeTables["players"].methods.GetPlayer(player, function(other)
                if XRPLifeServer.Helpers.CheckPlayerRankPerm(admin.rank, "Kick") then
                    if XRPLifeServer.Helpers.CheckPlayerRankPerm(admin.rank, "BypassRestriction") then
                        DropPlayer(player, reason)
                        CancelEvent()
                    else
                        if XRPLifeServer.Helpers.CheckPlayerRankPosition(admin.rank, other.rank) == "greater" then
                            DropPlayer(player, reason)
                            CancelEvent()
                        else
                            TriggerClientEvent("XRPLife_AdminMenu:ThrowMenuError", src, "You can only target players lower rank than you")
                        end
                    end
                else
                    TriggerClientEvent("XRPLife_AdminMenu:ThrowMenuError", src, "You do not have the kick permission")
                end
            end)
        end)
    else
        TriggerClientEvent("XRPLife_AdminMenu:ThrowMenuError", src, "You can't kick yourself from the server...")
    end
end)

RegisterServerEvent("XRPLife_AdminMenu:TriggerBanClient")
AddEventHandler("XRPLife_AdminMenu:TriggerBanClient", function(player, reason, time)
    local src = source
    local player = tonumber(player)
    local banData = json.encode({time = os.time() + time, banned = true, reason = reason, banner = GetPlayerName(src)})
    if src ~= player then
        XRPLifeTables["players"].methods.GetPlayer(src, function(admin)
            XRPLifeTables["players"].methods.GetPlayer(player, function(other)
                if XRPLifeServer.Helpers.CheckPlayerRankPerm(admin.rank, "Ban") then
                    if XRPLifeServer.Helpers.CheckPlayerRankPerm(admin.rank, "BypassRestriction") then
                        XRPLifeDB["player"].UpdatePlayerBan(player, banData, function(results)
                            DropPlayer(player, reason)
                            CancelEvent()
                        end)
                    else
                        if XRPLifeServer.Helpers.CheckPlayerRankPosition(admin.rank, other.rank) == "greater" then
                            XRPLifeDB["player"].UpdatePlayerBan(player, banData, function(results)
                                DropPlayer(player, reason)
                                CancelEvent()
                            end)
                        else
                            TriggerClientEvent("XRPLife_AdminMenu:ThrowMenuError", src, "You can only target players lower rank than you")
                        end
                    end
                else
                    TriggerClientEvent("XRPLife_AdminMenu:ThrowMenuError", src, "You do not have the ban permission")
                end
            end)
        end)
    else
        TriggerClientEvent("XRPLife_AdminMenu:ThrowMenuError", src, "You can't ban yourself from the server...")
    end
end)