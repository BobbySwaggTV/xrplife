RegisterNetEvent("XRPLife_CharacterMenu:EnableMenu")
AddEventHandler("XRPLife_CharacterMenu:EnableMenu", function(characters)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "enable_character_menu",
        chars = characters
    })
    TriggerEvent("XRPLife_CharacterMenu:StartSkyCamera")
end)

RegisterNetEvent("XRPLife_CharacterMenu:UpdateModels")
AddEventHandler("XRPLife_CharacterMenu:UpdateModels", function(models)
    SendNUIMessage({
        type = "update_character_menu_models",
        ped_models = models
    })
end)

RegisterNUICallback("selectcharacter", function(data, cb)
    TriggerServerEvent("XRPLife_CharacterMenu:SelectCharacter", data.char_data)
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("createcharacter", function(data, cb)
    TriggerServerEvent("XRPLife_CharacterMenu:CreateCharacter", data)
    cb("ok")
end)

RegisterNetEvent("XRPLife_CharacterMenu:CreateCharacterCallback")
AddEventHandler("XRPLife_CharacterMenu:CreateCharacterCallback", function(status, error, characters)
    SendNUIMessage({
        type = "create_character_menu_callback",
        status = status,
        error = error,
        chars = characters
    })
end)

RegisterNUICallback("deletecharacter", function(data, cb)
    print(tostring(data.char_data.id))
    TriggerServerEvent("XRPLife_CharacterMenu:DeleteCharacter", data.char_data.id)
    cb("ok")
end)

RegisterNetEvent("XRPLife_CharacterMenu:DeleteCharacterCallback")
AddEventHandler("XRPLife_CharacterMenu:DeleteCharacterCallback", function(characters)
    SendNUIMessage({
        type = "delete_character_menu_callback",
        chars = characters
    })
end)

RegisterNetEvent("XRPLife_CharacterMenu:LoadPed")
AddEventHandler("XRPLife_CharacterMenu:LoadPed", function(ped, clothData, spawn)
    exports["spawnmanager"]:spawnPlayer({x = spawn.x, y = spawn.y, z = spawn.z, heading = spawn.h, model = ped})
    Citizen.Wait(3000)
    local ped = XRPLifeClient.Helpers.PlayerPed()
    local clothing = json.decode(clothData)

    SetPedDefaultComponentVariation(ped)

    -- Set Drawables and Textures
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["FACE"], clothing["FACE"].draw, clothing["FACE"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["HEAD"], clothing["HEAD"].draw, clothing["HEAD"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["HAIR"], clothing["HAIR"].draw, clothing["HAIR"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["ARMS"], clothing["ARMS"].draw, clothing["ARMS"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["LEGS"], clothing["LEGS"].draw, clothing["LEGS"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["BAGS"], clothing["BAGS"].draw, clothing["BAGS"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["SHOES"], clothing["SHOES"].draw, clothing["SHOES"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["NECK"], clothing["NECK"].draw, clothing["NECK"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["ACCESSORIES"], clothing["ACCESSORIES"].draw, clothing["ACCESSORIES"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["VESTS"], clothing["VESTS"].draw, clothing["VESTS"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["OVERLAYS"], clothing["OVERLAYS"].draw, clothing["OVERLAYS"].text, 0)
    SetPedComponentVariation(ped, XRPLifeClient.Tables.PedComponents["JACKETS"], clothing["JACKETS"].draw, clothing["JACKETS"].text, 0)

    -- Set Props

    -- Set Tattoos

    TriggerEvent("XRPLife_CharacterMenu:StopSkyCamera")
    TriggerEvent("XRPLife_CharacterMenu:StopCreatorCamera")
    TriggerEvent("XRPLife_Notification:Success", "XRPLife", "Welcome! Hope you enjoy. STILL WIP", 10000, false, "rightCenter")
end)