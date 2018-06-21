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
            XRPLifeDB["inventory"].GetInventory(getcharacter.charid, function(getinventory)
                local inventory = {weapons = json.decode(getinventory.data[1].weapons), items = json.decode(getinventory.data[1].items)}
                XRPLifeTables["inventory"].methods.AddCharacterInventory(src, inventory, getcharacter.charid, function()
                    XRPLifeDB["clothing"].GetCharacterClothing(getcharacter.charid, function(clothing)
                        if #clothing.data > 0 then
                            math.randomseed(os.time())
                            local spawn = XRPLifeConfig["server"].SpawnLocations[math.random(1, #XRPLifeConfig["server"].SpawnLocations)]
                            TriggerClientEvent("XRPLife_CharacterMenu:LoadPed", src, clothing.data[1].model, clothing.data[1].clothing, spawn)
                        else
                            local models = XRPLifeConfig["character"].models[getcharacter.gender]
                            TriggerClientEvent("XRPLife_CharacterMenu:OpenCreator", src, models)
                        end
                    end)
                end)
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
                        XRPLifeDB["character"].CreateCharacter(character.name, character.dob, character.gender, player.id, function(createCharResults)
                            XRPLifeDB["character"].GetCharacters(player.id, function(characters)
                                XRPLifeDB["inventory"].CreateInventory(createCharResults.data.insertId, function(createInvResults)
                                    TriggerClientEvent("XRPLife_CharacterMenu:CreateCharacterCallback", src, true, "", characters.data)
                                end)
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

---------------------------------------------------------------------------
-- CHARACTER MODIFIER
---------------------------------------------------------------------------
RegisterServerEvent("XRPLife_CharacterMenu:SaveCharacter")
AddEventHandler("XRPLife_CharacterMenu:SaveCharacter", function(characterData)
    local src = source
    XRPLifeTables["characters"].methods.GetCharacter(src, function(charData)
        XRPLifeDB["clothing"].CreateClothing(charData.charid, characterData, function(createResults)
            local spawn = XRPLifeConfig["server"].SpawnLocations[math.random(1, #XRPLifeConfig["server"].SpawnLocations)]
            TriggerClientEvent("XRPLife_CharacterMenu:LoadPed", src, characterData.model, json.encode(characterData.clothing), spawn)
        end)
    end)
end)