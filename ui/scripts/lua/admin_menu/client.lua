---------------------------------------------------------------------------
-- Open Admin Menu
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_AdminMenu:OpenMenu")
AddEventHandler("XRPLife_AdminMenu:OpenMenu", function(name, rank, perms, players) -- add players list aswell
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open_admin_menu",
        name = name,
        rank = rank,
        perms = perms,
        players = players
    })
end)

---------------------------------------------------------------------------
-- Close Admin Menu
---------------------------------------------------------------------------
RegisterNUICallback("closeadmin", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

---------------------------------------------------------------------------
-- Send Admin Message
---------------------------------------------------------------------------
RegisterNUICallback("sendadminmessage", function(data, cb)
    TriggerServerEvent("XRPLife_AdminMenu:PassAdminMessage", data.message)
    cb("ok")
end)

---------------------------------------------------------------------------
-- Pass Admin Message To Menu
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_AdminMenu:PassMessageData")
AddEventHandler("XRPLife_AdminMenu:PassMessageData", function(data, perms)
    print(tostring(json.encode(perms)))
    SendNUIMessage({
        type = "pass_recieved_admin_message",
        message_data = data,
        perms = perms
    })
end)

---------------------------------------------------------------------------
-- Pass Admin Kick Request
---------------------------------------------------------------------------
RegisterNUICallback("recievekickrequest", function(data, cb)
    TriggerServerEvent("XRPLife_AdminMenu:TriggerKickClient", data.player, data.reason)
    cb("ok")
end)

---------------------------------------------------------------------------
-- Throw Error To Admin Menu
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_AdminMenu:ThrowMenuError")
AddEventHandler("XRPLife_AdminMenu:ThrowMenuError", function(error)
    SendNUIMessage({
        type = "pass_admin_error",
        error = error
    })
end)