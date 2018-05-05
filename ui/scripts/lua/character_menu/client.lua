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

RegisterNUICallback("updatemodels", function(data, cb)
    TriggerServerEvent("XRPLife_CharacterMenu:GetModels", data.gender)
    cb("ok")
end)

RegisterNetEvent("XRPLife_CharacterMenu:LoadPed")
AddEventHandler("XRPLife_CharacterMenu:LoadPed", function(ped, isNew)
    TriggerEvent("XRPLife_CharacterMenu:StopSkyCamera")
end)