local atm_models = {"prop_fleeca_atm", "prop_atm_01", "prop_atm_02", "prop_atm_03"}
local atmOpen = false

RegisterNetEvent("XRPLife_ATMMenu:OpenMenu")
AddEventHandler("XRPLife_ATMMenu:OpenMenu", function(name, balance)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open_atm_menu",
        name = name,
        balance = balance
    })
end)

RegisterNUICallback("closeatm", function(cb)
    SetNuiFocus(false, false)
    local pedPos = GetEntityCoords(GetPlayerPed(PlayerId()), false)
    local pedHead = GetEntityHeading(GetPlayerPed(PlayerId()))
    TaskStartScenarioAtPosition(GetPlayerPed(PlayerId()), "PROP_HUMAN_ATM", pedPos.x, pedPos.y, pedPos.z + 1.0, pedHead, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasksImmediately(GetPlayerPed(PlayerId()))
    atmOpen = false
    cb("ok")
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(PlayerId())
        local pedPos = GetEntityCoords(ped, false)
        for a = 1, #atm_models do
            local atm = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 5.0, GetHashKey(atm_models[a]), false, 1, 1)
            if atm ~= 0 and not atmOpen then

                local atmOffset = GetOffsetFromEntityInWorldCoords(atm, 0.0, -0.7, 0.0)
                local atmHeading = GetEntityHeading(atm)
                local distance = Vdist(pedPos.x, pedPos.y, pedPos.z, atmOffset.x, atmOffset.y, atmOffset.z)
                DrawMarker(1, atmOffset.x, atmOffset.y, atmOffset.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 0.8, 0, 0, 0, 0, 0, 0, 0)
                
                if distance <= 1.2 then
                    XRPLifeClient.Helpers.TopLeftNotification("Press ~INPUT_PICKUP~ to use the ATM")
                    if IsControlJustPressed(1, 38) then
                        TaskStartScenarioAtPosition(ped, "PROP_HUMAN_ATM", atmOffset.x, atmOffset.y, atmOffset.z + 1.0, atmHeading, -1, 0, 0)
                        Citizen.Wait(5000)
                        TriggerServerEvent("XRPLife_ATMMenu:RequestATMInfo")
                        atmOpen = true
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

RegisterNUICallback("depositatm", function(data, cb)
    print(tostring(data.amount))
    cb("ok")
end)

RegisterNetEvent("XRPLife_ATMMenu:DepositCallback")
AddEventHandler("XRPLife_ATMMenu:DepositCallback", function(status, message, balance)

end)

RegisterNUICallback("withdrawatm", function(data, cb)
    print(tostring(data.amount))
    cb("ok")
end)

RegisterNetEvent("XRPLife_ATMMenu:WithdrawCallback")
AddEventHandler("XRPLife_ATMMenu:WithdrawCallback", function(status, message, balance)
    
end)