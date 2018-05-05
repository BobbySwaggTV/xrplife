local startCameraRotations = false
local spawnedCamera = nil
local cameraRotations = {
    [1] = {
        [1] = {x = 934.42, y = -1859.04, z = 450.0},
        [2] = {x = 31.06, y = -1639.25, z = 450.0},
        [3] = {x = -901.03, y = -1284.55, z = 450.0},
        ["pointTo"] = {x = -296.63, y = -555.25, z = 200.0}
    }
}

--[[
[2] = {
    [1] = {x = 1, y = 1, z = 1},
    [2] = {x = 1, y = 1, z = 1},
    [3] = {x = 1, y = 1, z = 1},
    ["pointTo"] = {x = 1, y = 1, z = 1}
},
[3] = {
    [1] = {x = 1, y = 1, z = 1},
    [2] = {x = 1, y = 1, z = 1},
    [3] = {x = 1, y = 1, z = 1},
    ["pointTo"] = {x = 1, y = 1, z = 1}
}
--]]

RegisterNetEvent("XRPLife_CharacterMenu:StartSkyCamera")
AddEventHandler("XRPLife_CharacterMenu:StartSkyCamera", function()
    spawnedCamera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    startCameraRotations = true
end)

RegisterNetEvent("XRPLife_CharacterMenu:StopSkyCamera")
AddEventHandler("XRPLife_CharacterMenu:StopSkyCamera", function()
    RenderScriptCams(0, 1, 1500, 1, 1)
    DestroyCam(spawnedCamera, false)
    spawnedCamera = nil
    startCameraRotations = false
end)

Citizen.CreateThread(function()
    while true do
        if startCameraRotations then
            if spawnedCamera ~= nil then
                for a = 1, #cameraRotations do
                    for b = 1, #cameraRotations[a] do

                        SetCamCoord(spawnedCamera, cameraRotations[a][b].x, cameraRotations[a][b].y, cameraRotations[a][b].z)
                        PointCamAtCoord(spawnedCamera, cameraRotations[a]["pointTo"].x, cameraRotations[a]["pointTo"].y, cameraRotations[a]["pointTo"].z)
                        RenderScriptCams(1, 1, 1500, 1, 1)

                        Citizen.Wait(5000)
                    end
                end
            end
        end
        Citizen.Wait(500)
    end
end)