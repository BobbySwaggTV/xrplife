---------------------------------------------------------------------------
-- Gets character information to send to ATM menu
---------------------------------------------------------------------------
RegisterServerEvent("XRPLife_ATMMenu:RequestATMInfo")
AddEventHandler("XRPLife_ATMMenu:RequestATMInfo", function()
    local src = source
    XRPLifeTables["characters"].methods.GetCharacter(src, function(results)
        XRPLifeDB["character"].GetCharacter(results.charid, function(character)
            TriggerClientEvent("XRPLife_ATMMenu:OpenMenu", src, results.name, character.data[1].bank)
        end)
    end)
end)