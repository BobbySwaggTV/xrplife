local startCameraRotations = false
local selectedCameraRot = nil
local spawnedCamera = nil
local angle = 0.0
local angleInc = 0.001
local radius = 200.0

local cameraRotations = {
    [1] = {
        ["centerPoint"] = {x = -296.63, y = -555.25, z = 200.0},
        ["centerRadius"] = 300
    }
}

RegisterNetEvent("XRPLife_CharacterMenu:StartSkyCamera")
AddEventHandler("XRPLife_CharacterMenu:StartSkyCamera", function()
    local randomIndex = math.random(1, #cameraRotations)
    selectedCameraRot = randomIndex
    spawnedCamera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(spawnedCamera, posX, posY, posZ)
    RenderScriptCams(1, 1, 1500, 1, 1)
    startCameraRotations = true
end)

RegisterNetEvent("XRPLife_CharacterMenu:StopSkyCamera")
AddEventHandler("XRPLife_CharacterMenu:StopSkyCamera", function()
    startCameraRotations = false
    RenderScriptCams(0, 1, 1500, 1, 1)
    DestroyCam(spawnedCamera, false)
    spawnedCamera = nil
    selectedCameraRot = nil
end)

Citizen.CreateThread(function()
    while true do
        if startCameraRotations then
            angle = angle - angleInc
            print(angle)
            local xOffset = math.cos(angle) * radius
            local yOffset = math.cos(angle) * radius
            local zOffset = math.cos(angle) * radius
            SetCamCoord(spawnedCamera, xOffset, cameraRotations[selectedCameraRot]["centerPoint"].y, cameraRotations[selectedCameraRot]["centerPoint"].z)
            PointCamAtCoord(spawnedCamera, cameraRotations[selectedCameraRot]["centerPoint"].x, cameraRotations[selectedCameraRot]["centerPoint"].y, cameraRotations[selectedCameraRot]["centerPoint"].z)
            HideHudAndRadarThisFrame()
        end
        Citizen.Wait(0)
    end
end)