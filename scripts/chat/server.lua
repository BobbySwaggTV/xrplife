---------------------------------------------------------------------------
-- Handles regular chat message
---------------------------------------------------------------------------
AddEventHandler("chatMessage", function(source, color, message)
    CancelEvent()
    local src = source
    XRPLifeTables["players"].methods.GetPlayer(src, function(player)
        XRPLifeTables["characters"].methods.GetCharacter(src, function(character)
            local rankColor = XRPLifeConfig["admin"].ChatRankColors[player.rank]
            local message = tostring(rankColor .. "[" .. player.rank .. "] " .. character.name .. ": ^7" .. message)

            if XRPLifeConfig["server"].localChat then
                local players = GetPlayers()
                local distance = XRPLifeConfig["server"].localChatDistance

                for a = 1, #players do
                    if players[a] ~= src then
                        TriggerClientEvent("XRPLife_Chat:LocalChatMessage", players[a], distance, {id = src, msg = message})
                    else
                        TriggerClientEvent("chatMessage", src, message)
                    end
                end
            else
                TriggerClientEvent("chatMessage", -1, message)
            end
        end)
    end)
end)