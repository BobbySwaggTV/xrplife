---------------------------------------------------------------------------
-- Weapon Placements On Ped
---------------------------------------------------------------------------
local WeaponConfigs = XRPLifeClient.Helpers.ReadOnlyTable{
    ["1"] = {posX = 0.0, posY = -0.150, posZ = -0.15, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    ["2"] = {posX = 0.0, posY = -0.150, posZ = 0.15, xRot = 0.0, yRot = 0.0, zRot = 0.5},
}

---------------------------------------------------------------------------
-- Players Weapons / Ammo
---------------------------------------------------------------------------
local weapons = {
    ["1"] = {label = "AR-15", object = "w_ar_carbinerifle", model = "weapon_carbinerifle"},
    ["2"] = {label = "Mossberg 590", object = "w_sg_pumpshotgun", model = "weapon_pumpshotgun"}
}
local ammo = {}

---------------------------------------------------------------------------
-- Created Objects For Weapons
---------------------------------------------------------------------------
local createdObjects = {
    ["1"] = nil,
    ["2"] = nil
}

---------------------------------------------------------------------------
-- Selected Weapon Index
---------------------------------------------------------------------------
local selectedIndex = "1"

---------------------------------------------------------------------------
-- Is weapon holstered?
---------------------------------------------------------------------------
local holstered = true
local used = false

---------------------------------------------------------------------------
-- Holster / Unholster selected weapon
---------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(1, 311) then -- K
            if used then
                RemoveWeapons({1, 2})
            else
                DisplayWeapons()
            end
        end
        Citizen.Wait(0)
    end
end)

---------------------------------------------------------------------------
-- Function do display weapons on back
---------------------------------------------------------------------------
function DisplayWeapons()
    local ped = XRPLifeClient.Helpers.PlayerPed()
    local pedPos = GetEntityCoords(ped, false)

    if weapons["1"] ~= false then
        local weaponInfo = weapons["1"]
        local firstWeapon = CreateObject(GetHashKey(weaponInfo.object), pedPos.x, pedPos.y, pedPos.z, 0, 1, 1)
        AttachEntityToEntity(firstWeapon, ped, GetPedBoneIndex(ped, 24818),  WeaponConfigs["1"].posX,  WeaponConfigs["1"].posY,  WeaponConfigs["1"].posZ, WeaponConfigs["1"].xRot, WeaponConfigs["1"].yRot, WeaponConfigs["1"].zRot, 0, 0, 0, 0, 0, 1)
        createdObjects["1"] = firstWeapon
    end

    if weapons["2"] ~= false then
        local weaponInfo = weapons["2"]
        local secondWeapon = CreateObject(GetHashKey(weaponInfo.object), pedPos.x, pedPos.y, pedPos.z, 0, 1, 1)
        AttachEntityToEntity(secondWeapon, ped, GetPedBoneIndex(ped, 24818),  WeaponConfigs["2"].posX,  WeaponConfigs["2"].posY,  WeaponConfigs["2"].posZ, WeaponConfigs["2"].xRot, WeaponConfigs["2"].yRot, WeaponConfigs["2"].zRot, 0, 0, 0, 0, 0, 1)
        createdObjects["2"] = secondWeapon
    end

    used = true
end

function RemoveWeapons(indexes)
    for a = 1, #indexes do
        if createdObjects[tostring(indexes[a])] ~= nil then
            DeleteObject(createdObjects[tostring(indexes[a])])
        end
    end
    used = false
end