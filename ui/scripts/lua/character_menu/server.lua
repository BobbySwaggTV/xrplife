RegisterCommand("drop", function(source, args, raw)
    DropPlayer(source, "Quit Command Entered")
end)

RegisterServerEvent("XRPLife_CharacterMenu:RequestMenu")
AddEventHandler("XRPLife_CharacterMenu:RequestMenu", function(source)
    local src = source
    XRPLifeTables["players"].methods.GetPlayer(src, function(player)
        XRPLifeDB["character"].GetCharacters(player.id, function(results)
            TriggerClientEvent("XRPLife_CharacterMenu:EnableMenu", src, results.data)
        end)
    end)
end)

RegisterServerEvent("XRPLife_CharacterMenu:SelectCharacter")
AddEventHandler("XRPLife_CharacterMenu:SelectCharacter", function(character)
    local src = source
    XRPLifeTables["characters"].methods.AddCharacter(src, character, function()
        XRPLifeTables["characters"].methods.GetCharacter(src, function(getcharacter)
            XRPLifeDB["clothing"].GetCharacterClothing(getcharacter.charid, function(clothing)
                
                TriggerClientEvent("XRPLife_CharacterMenu:LoadPed", src, getcharacter.model, false) -- Determin if new character or not on server..... So prob change false later...

            end)
        end)
    end)
end)

RegisterServerEvent("XRPLife_CharacterMenu:CreateCharacter")
AddEventHandler("XRPLife_CharacterMenu:CreateCharacter", function(character)
    local src = source
    XRPLifeDB["character"].DoesCharacterExist(character.name, character.dob, function(result)
        if result then
            TriggerClientEvent("XRPLife_CharacterMenu:CreateCharacterCallback", src, false, "Character Already Exists", {})
        else
            XRPLifeTables["players"].methods.GetPlayer(src, function(player)
                XRPLifeDB["character"].GetCharacterCount(player.id, function(character_count)
                    if character_count < XRPLifeConfig["character"].maxCharacters then
                        XRPLifeDB["character"].CreateCharacter(character.name, character.dob, character.gender, character.model, player.id, function()
                            XRPLifeDB["character"].GetCharacters(player.id, function(characters)
                                TriggerClientEvent("XRPLife_CharacterMenu:CreateCharacterCallback", src, true, "", characters.data)
                            end)
                        end)
                    else
                        TriggerClientEvent("XRPLife_CharacterMenu:CreateCharacterCallback", src, false, "You have reached the max characters allowed on this server.", {})
                    end
                end)
            end)
        end
    end)
end)

RegisterServerEvent("XRPLife_CharacterMenu:DeleteCharacter")
AddEventHandler("XRPLife_CharacterMenu:DeleteCharacter", function(charid)
    local src = source
    XRPLifeDB["character"].DeleteCharacter(charid, function()
        XRPLifeTables["players"].methods.GetPlayer(src, function(player)
            XRPLifeDB["character"].GetCharacters(player.id, function(characters)
                TriggerClientEvent("XRPLife_CharacterMenu:DeleteCharacterCallback", src, characters.data)
            end)
        end)
    end)
end)

RegisterServerEvent("XRPLife_CharacterMenu:GetModels")
AddEventHandler("XRPLife_CharacterMenu:GetModels", function(gender)
    local src = source
    TriggerClientEvent("XRPLife_CharacterMenu:UpdateModels", src, XRPLifeConfig["character"].models[gender])
end)