local firstSpawn = true

-- Client loads into the server
AddEventHandler("onClientMapStart", function()
    TriggerServerEvent("XRPLife_Start")
end)

-- One Time Call
Citizen.CreateThread(function()
    while true do
        if firstSpawn then
            Wait(3000)
            DisableAutoRespawn()
            DisableDispatch()
            firstSpawn = false
        end
        Citizen.Wait(0)
    end
end)

function DisableAutoRespawn()
    exports.spawnmanager:spawnPlayer()
    exports.spawnmanager:setAutoSpawn(false)
end

function DisableDispatch()
    for a = 1, 15 do
        EnableDispatchService(a, false)
    end
end


-- Every Tick Call
Citizen.CreateThread(function()
    while true do
        if not firstSpawn then
            RemoveWantedLevel()
            DisableHealthRegen()
        end
        Citizen.Wait(0)
    end
end)

function RemoveWantedLevel()
    if GetPlayerWantedLevel(PlayerId()) >= 1 then
        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
    end
end

function DisableHealthRegen()
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
end