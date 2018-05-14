XRPLifeTables["vehicles"].methods.AddVehicle = function(net, src, callback)
    table.insert(XRPLifeTables["vehicles"].list, {src = src, net = net})
    callback()
end

XRPLifeTables["vehicles"].methods.RemoveVehicle = function(src, callback)
    for a = 1, #XRPLifeTables["vehicles"].list do
        if XRPLifeTables["vehicles"].list[a].src == src then
            table.remove(XRPLifeTables["vehicles"].list, a)
        end
    end
    callback()
end

XRPLifeTables["vehicles"].methods.GetVehicleOwner = function(net, src, callback)
    local owner = 0
    for a = 1, #XRPLifeTables["vehicles"].list do
        if XRPLifeTables["vehicles"].list[a].net == net then
            owner = XRPLifeTables["vehicles"].list[a].src
        end
    end
    callback(owner)
end