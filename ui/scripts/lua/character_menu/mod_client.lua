---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_CharacterMenu:OpenCreator")
AddEventHandler("XRPLife_CharacterMenu:OpenCreator", function(models)
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "enable_character_creator_menu",
            models = models
        })
        TriggerEvent("XRPLife_CharacterMenu:StopSkyCamera")
        TriggerEvent("XRPLife_CharacterMenu:StartCreatorCamera")
end)

---------------------------------------------------------------------------
-- Callbacks
---------------------------------------------------------------------------
RegisterNUICallback("creatorchangemodel", function(data, cb)
    SetModel(data.model)
    cb("ok")
end)

RegisterNUICallback("creatorchangedrawable", function(data, cb)
    SetComponentDraw(data.component, data.drawable)
    cb("ok")
end)

RegisterNUICallback("creatorchangetexture", function(data, cb)
    SetCompText(data.component, data.texture)
    cb("ok")
end)

RegisterNUICallback("finishcharactercreator", function(data, cb)
    SaveCharacterData(data.model)
    cb("ok")
end)

---------------------------------------------------------------------------
-- Functions
---------------------------------------------------------------------------
function SetModel(model)
    local model = GetHashKey(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end
    SetPlayerModel(PlayerId(), model)
    SetPedDefaultComponentVariation(GetPlayerPed(PlayerId()))
    UpdateCreatorMenu()
end

function SetComponentDraw(comp, draw)
    local ped = XRPLifeClient.Helpers.PlayerPed()
    local component = XRPLifeClient.Tables.PedComponents[comp]
    SetPedComponentVariation(ped, component, draw, 0, 0)

    if comp == "FACE" then
        SetPedHeadBlendData(ped, draw, draw, draw, draw, draw, draw, 0.0, 0.0, 0.0, 0)
    end

    UpdateDrawableMenuTextures(comp)
end

function GetComponentDraw(comp)
    local ped = XRPLifeClient.Helpers.PlayerPed()
    local component = XRPLifeClient.Tables.PedComponents[comp]
    return GetPedDrawableVariation(ped, component)
end

function SetCompText(comp, text)
    local ped = XRPLifeClient.Helpers.PlayerPed()
    local component = XRPLifeClient.Tables.PedComponents[comp]
    local current_component = GetPedDrawableVariation(ped, component)
    SetPedComponentVariation(ped, component, current_component, text, 0)
end

function GetCompText(comp)
    local ped = XRPLifeClient.Helpers.PlayerPed()
    local component = XRPLifeClient.Tables.PedComponents[comp]
    return GetPedTextureVariation(ped, component)
end

function UpdateCreatorMenu()
    local ped = XRPLifeClient.Helpers.PlayerPed()
    SendNUIMessage({
        type = "update_character_model_components",
        components = {
            ["FACE"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["FACE"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["FACE"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["FACE"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["FACE"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["FACE"]))}
            },
            ["HEAD"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["HEAD"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["HEAD"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["HEAD"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["HEAD"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["HEAD"]))}
            },
            ["HAIR"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["HAIR"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["HAIR"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["HAIR"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["HAIR"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["HAIR"]))}
            },
            ["ARMS"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["ARMS"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["ARMS"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["ARMS"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["ARMS"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["ARMS"]))}
            },
            ["LEGS"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["LEGS"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["LEGS"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["LEGS"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["LEGS"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["LEGS"]))}
            },
            ["BAGS"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["BAGS"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["BAGS"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["BAGS"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["BAGS"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["BAGS"]))}
            },
            ["SHOES"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["SHOES"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["SHOES"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["SHOES"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["SHOES"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["SHOES"]))}
            },
            ["NECK"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["NECK"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["NECK"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["NECK"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["NECK"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["NECK"]))}
            },
            ["ACCESSORIES"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["ACCESSORIES"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["ACCESSORIES"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["ACCESSORIES"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["ACCESSORIES"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["ACCESSORIES"]))}
            },
            ["VESTS"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["VESTS"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["VESTS"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["VESTS"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["VESTS"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["VESTS"]))}
            },
            ["OVERLAYS"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["OVERLAYS"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["OVERLAYS"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["OVERLAYS"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["OVERLAYS"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["OVERLAYS"]))}
            },
            ["JACKETS"] = {
                draw = {min = 0, current = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["JACKETS"]), max = GetNumberOfPedDrawableVariations(ped, XRPLifeClient.Tables.PedComponents["JACKETS"])},
                text = {min = 0, current = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["JACKETS"]), max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents["JACKETS"], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["JACKETS"]))}
            }
        }
    })
end

function UpdateDrawableMenuTextures(component)
    local ped = XRPLifeClient.Helpers.PlayerPed()
    SendNUIMessage({
        type = "update_character_model_draw_textures",
        component = component,
        textures = {min = 0, current = 0, max = GetNumberOfPedTextureVariations(ped, XRPLifeClient.Tables.PedComponents[component], GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents[component]))}
    })
end

function SaveCharacterData(model)
    local ped = XRPLifeClient.Helpers.PlayerPed()
    SetNuiFocus(false, false)
    TriggerServerEvent("XRPLife_CharacterMenu:SaveCharacter", {
        model = model,
        clothing = {
            ["FACE"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["FACE"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["FACE"])
            },
            ["HEAD"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["HEAD"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["HEAD"])
            },
            ["HAIR"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["HAIR"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["HAIR"])
            },
            ["ARMS"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["ARMS"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["ARMS"])
            },
            ["LEGS"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["LEGS"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["LEGS"])
            },
            ["BAGS"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["BAGS"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["BAGS"])
            },
            ["SHOES"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["SHOES"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["SHOES"])
            },
            ["NECK"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["NECK"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["NECK"])
            },
            ["ACCESSORIES"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["ACCESSORIES"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["ACCESSORIES"])
            },
            ["VESTS"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["VESTS"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["VESTS"])
            },
            ["OVERLAYS"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["OVERLAYS"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["OVERLAYS"])
            },
            ["JACKETS"] = {
                draw = GetPedDrawableVariation(ped, XRPLifeClient.Tables.PedComponents["JACKETS"]),
                text = GetPedTextureVariation(ped, XRPLifeClient.Tables.PedComponents["JACKETS"])
            }
        }
    })
end

---------------------------------------------------------------------------
-- CAMERA STUFF
---------------------------------------------------------------------------
local camera = nil

RegisterNetEvent("XRPLife_CharacterMenu:StartCreatorCamera")
AddEventHandler("XRPLife_CharacterMenu:StartCreatorCamera", function()
    local ped = XRPLifeClient.Helpers.PlayerPed()
    SetEntityCoords(ped, 409.010, -999.893, -100.004, 0.0, 0.0, 0.0, 0)
    SetEntityHeading(ped, 274.177)
    local pedOffset = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.5, 0.2)
    local pedRot = GetEntityRotation(ped, 1)
    camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(camera, pedOffset.x, pedOffset.y, pedOffset.z)
    SetCamRot(camera, pedRot.x - 10.0, pedRot.y, pedRot.z - 180.0, 1)
    RenderScriptCams(1, 0, 0, 1, 1)
    NetworkSetEntityVisibleToNetwork(ped, false)
end)

RegisterNetEvent("XRPLife_CharacterMenu:StopCreatorCamera")
AddEventHandler("XRPLife_CharacterMenu:StopCreatorCamera", function()
    if camera ~= nil then
        RenderScriptCams(0, 0, 0, 1, 1)
        DestroyCam(camera, 0)
        camera = nil
    end
end)