RegisterNetEvent("XRPLife_Chat:LocalChatMessage")
AddEventHandler("XRPLife_Chat:LocalChatMessage", function(pDistance, senderdata)
    local senderPlayer = GetPlayerFromServerId(senderdata.id)
    local senderPos = GetEntityCoords(GetPlayerPed(senderPlayer), false)
    local lPlayerPos = GetEntityCoords(GetPlayerPed(PlayerId()), false)
    local distance = Vdist(senderPos.x, senderPos.y, senderPos.z, lPlayerPos.x, lPlayerPos.y, lPlayerPos.z)

    if distance <= pDistance then
        TriggerEvent("chatMessage", senderdata.msg)
    end
end)

-- Placeholder
RegisterNetEvent("XRPLife_Chat:RespawnPlayer")
AddEventHandler("XRPLife_Chat:RespawnPlayer", function()
    exports["spawnmanager"]:forceRespawn()
end)