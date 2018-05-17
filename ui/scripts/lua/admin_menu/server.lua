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