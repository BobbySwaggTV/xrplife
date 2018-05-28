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

---------------------------------------------------------------------------
-- Withdrawing Money
---------------------------------------------------------------------------
RegisterServerEvent("XRPLife_ATMMenu:WithdrawMoney")
AddEventHandler("XRPLife_ATMMenu:WithdrawMoney", function(amount)
    local src = source
    XRPLifeTables["characters"].methods.GetCharacter(src, function(selectedCharacter)
        XRPLifeDB["character"].GetCharacter(selectedCharacter.charid, function(dbCharacter)
            local bankBalance = dbCharacter.data[1].bank
            local newBankBalance = dbCharacter.data[1].bank - tonumber(amount)
            if bankBalance >= tonumber(amount) then
                XRPLifeDB["character"].UpdateBankAccount(selectedCharacter.charid, newBankBalance, function()
                    XRPLifeTables["inventory"].methods.AddItem(src, "Cash", tonumber(amount), function()
                        TriggerClientEvent("XRPLife_ATMMenu:ActionCallback", src, true, "Success", newBankBalance)
                    end)
                end)
            else
                TriggerClientEvent("XRPLife_ATMMenu:ActionCallback", src, false, "Insufficiant Funds", false)
            end
        end)
    end)
end)

---------------------------------------------------------------------------
-- Depositing Money
---------------------------------------------------------------------------
RegisterServerEvent("XRPLife_ATMMenu:DepositMoney")
AddEventHandler("XRPLife_ATMMenu:DepositMoney", function(amount)
    local src = source
    XRPLifeTables["characters"].methods.GetCharacter(src, function(selectedCharacter)
        XRPLifeTables["inventory"].methods.GetCharacterInventory(src, function(storedInventory)
            if XRPLifeServer.Helpers.DoesItemExist(storedInventory.items, "Cash") then
                local currentCash = 0
                for a = 1, #storedInventory.items do
                    if storedInventory.items[a].item == "Cash" then
                        currentCash = storedInventory.items[a].amount
                        break
                    end
                end
                if currentCash >= tonumber(amount) then
                    XRPLifeDB["character"].GetCharacter(selectedCharacter.charid, function(dbCharacter)
                        local currentBank = dbCharacter.data[1].bank
                        local newBankBalance = currentBank + tonumber(amount)
                        XRPLifeDB["character"].UpdateBankAccount(selectedCharacter.charid, newBankBalance, function()

                            XRPLifeTables["inventory"].methods.RemoveItem(src, "Cash", amount, function(hasRemoved)
                                TriggerClientEvent("XRPLife_ATMMenu:ActionCallback", src, true, "Success", newBankBalance)
                            end)
                        end)
                    end)
                else
                    TriggerClientEvent("XRPLife_ATMMenu:ActionCallback", src, false, "Insufficiant Funds", false)
                end
            else
                TriggerClientEvent("XRPLife_ATMMenu:ActionCallback", src, false, "Insufficiant Funds", false)
            end
        end)
    end)
end)