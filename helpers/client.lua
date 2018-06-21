XRPLifeClient = {}
XRPLifeClient.Helpers = {}
XRPLifeClient.Variables = {}
XRPLifeClient.Tables = {}

---------------------------------------------------------------------------
-- Helper Variables
---------------------------------------------------------------------------
XRPLifeClient.Variables.canShuffle = false
XRPLifeClient.Variables.Vehicle = {inVehicle = false, vehicle = nil, seat = nil}

---------------------------------------------------------------------------
-- Helper Tables
---------------------------------------------------------------------------
XRPLifeClient.Tables.PedComponents = {
    ["FACE"] = 0,
    ["HEAD"] = 1,
    ["HAIR"] = 2,
    ["ARMS"] = 3,
    ["LEGS"] = 4,
    ["BAGS"] = 5,
    ["SHOES"] = 6,
    ["NECK"] = 7,
    ["ACCESSORIES"] = 8,
    ["VESTS"] = 9,
    ["OVERLAYS"] = 10,
    ["JACKETS"] = 11
}

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
-- Checks if ped is in seat
---------------------------------------------------------------------------
XRPLifeClient.Helpers.GetPedVehicleSeat = function(ped, vehicle)
    local seatCount = GetVehicleModelNumberOfSeats(GetHashKey(GetEntityModel(vehicle)))
    for a = -1, seatCount do
        local pedInSeat = GetPedInVehicleSeat(vehicle, a)
        if pedInSeat == ped then
            return a
        end
    end
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
XRPLifeClient.Helpers.ReadOnlyTable = function(t)
	local proxy = {}
	local mt = {
        __index = t,
        __newindex = function (t,k,v)
            print("attempt to update a read-only table")
            TriggerEvent("XRPLife_Notification:Error", "Cheater??", "You just tried to change my client code? Fuck You..", 8000, false, "rightCenter")
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

---------------------------------------------------------------------------
-- Helper Tables
---------------------------------------------------------------------------
--XRPLifeClient.Tables.WeaponList = XRPLifeClient.Helpers.ReadOnlyTable(json.decode(LoadResourceFile(GetCurrentResourceName(), "./helpers/lists/weaponlist.json")))

XRPLifeClient.Helpers.DebugMessage("Helpers - client.lua Loaded")