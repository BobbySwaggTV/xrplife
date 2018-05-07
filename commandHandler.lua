--[[ Regular Commands ]]--


--[[ Console Commands ]]--

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
                        foundPlayer = players[a]
                        break
                    end
                end

                if foundPlayer ~= nil then

                    -- IF PLAYER IS INGAME MAKE SURE TO UPDATE THE SERVERSIDED TABLE [ YOU NEED TO RECREATE THE FUNCTION TO DO THAT ]
                    print("Player is in-game")

                else
                    print("Player is NOT in-game")
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