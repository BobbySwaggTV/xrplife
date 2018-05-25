XRPLifeClient = {}
XRPLifeClient.Helpers = {}

---------------------------------------------------------------------------
-- Gets Local Players Ped
---------------------------------------------------------------------------
XRPLifeClient.Helpers.PlayerPed = function(serverid)
    local ped = nil
    if serverid ~= nil then
        ped = GetPlayerPed(GetPlayerFromServerId(serverid))
    else
        ped = GetPlayerPed(PlayerId())
    end
    return ped
end

---------------------------------------------------------------------------
-- Draw Top Left Notification
---------------------------------------------------------------------------
XRPLifeClient.Helpers.TopLeftNotification = function(string)
    SetTextComponentFormat("STRING")
    AddTextComponentString(string)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

---------------------------------------------------------------------------
-- Draw 2D Text
---------------------------------------------------------------------------
XRPLifeClient.Helpers.Draw2DText = function(x, y, width, height, scale, text, colors)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(colors.r, colors.g, colors.b, colors.a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.005)
end

---------------------------------------------------------------------------
-- Draw 3D Text
---------------------------------------------------------------------------
XRPLifeClient.Helpers.Draw3DText = function(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

---------------------------------------------------------------------------
-- Read Only Table
---------------------------------------------------------------------------
-- XRPLifeClient.Helpers.ReadOnlyTable{"Sunday", "Monday", "Tuesday", "Wednesday","Thursday", "Friday", "Saturday"}
XRPLifeClient.Helpers.ReadOnlyTable = function(t)
	local proxy = {}
	local mt = {
        __index = t,
        __newindex = function (t,k,v)
        	print("attempt to update a read-only table")
		end
	}
	setmetatable(proxy, mt)
	return proxy
end

---------------------------------------------------------------------------
-- Debug message
---------------------------------------------------------------------------
XRPLifeClient.Helpers.DebugMessage = function(message)
    print(tostring("[XRPLife Debug]: " .. message))
end

XRPLifeClient.Helpers.DebugMessage("Helpers - client.lua Loaded")