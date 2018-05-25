---------------------------------------------------------------------------
-- Notification compatible with icons shown from URL
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_Notification:CustomURLIcon")
AddEventHandler("XRPLife_Notification:CustomURLIcon", function(title, body, time, url, showBar, pos)
    SendNUIMessage({
        type = "notification_customurlicon",
        title = title,
        body = body,
        time = time,
        url = url,
        showBar = showBar,
        pos = pos
    })
end)

---------------------------------------------------------------------------
-- Notification compatible with icons shown from local images
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_Notification:CustomIcon")
AddEventHandler("XRPLife_Notification:CustomIcon", function(title, body, time, iconFile, showBar, pos)
    SendNUIMessage({
        type = "notification_customicon",
        title = title,
        body = body,
        time = time,
        iconFile = iconFile,
        showBar = showBar,
        pos = pos
    })
end)

---------------------------------------------------------------------------
-- Success Notification
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_Notification:Success")
AddEventHandler("XRPLife_Notification:Success", function(title, body, time, showBar, pos)
    SendNUIMessage({
        type = "notification_success",
        title = title,
        body = body,
        time = time,
        showBar = showBar,
        pos = pos
    })
end)

---------------------------------------------------------------------------
-- Error Notification
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_Notification:Error")
AddEventHandler("XRPLife_Notification:Error", function(title, body, time, showBar, pos)
    SendNUIMessage({
        type = "notification_error",
        title = title,
        body = body,
        time = time,
        showBar = showBar,
        pos = pos
    })
end)

---------------------------------------------------------------------------
-- Warning Notification
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_Notification:Warning")
AddEventHandler("XRPLife_Notification:Warning", function(title, body, time, showBar, pos)
    SendNUIMessage({
        type = "notification_warning",
        title = title,
        body = body,
        time = time,
        showBar = showBar,
        pos = pos
    })
end)

---------------------------------------------------------------------------
-- Info Notification
---------------------------------------------------------------------------
RegisterNetEvent("XRPLife_Notification:Info")
AddEventHandler("XRPLife_Notification:Info", function(title, body, time, showBar, pos)
    SendNUIMessage({
        type = "notification_info",
        title = title,
        body = body,
        time = time,
        showBar = showBar,
        pos = pos
    })
end)