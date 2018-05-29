local objects = false

RegisterNetEvent("XRPLife_Inventory:SetObjects")
AddEventHandler("XRPLife_Inventory:SetObjects", function(objectList)
    objects = XRPLifeClient.Helpers.ReadOnlyTable(objectList)
end)