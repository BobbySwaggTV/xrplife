local objects = false

RegisterNetEvent("XRPLife_Inventory:SetObjects")
AddEventHandler("XRPLife_Inventory:SetObjects", function(objectList)
    objects = XRPLifeClient.Helpers.ReadOnlyTable(objectList)
end)

--[[
Citizen.CreateThread(function()
    while true do
        if objects ~= false then

            

        end
        Citizen.Wait(0)
    end
end)
--]]