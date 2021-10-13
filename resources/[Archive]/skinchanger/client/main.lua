local Components  = {
    { label = _U('sex'), name = 'sex', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('face'), name = 'face', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('skin'), name = 'skin', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('wrinkles'), name = 'age_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('wrinkle_thickness'), name = 'age_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('beard_type'), name = 'beard_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('beard_size'), name = 'beard_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('beard_color_1'), name = 'beard_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('beard_color_2'), name = 'beard_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('hair_1'), name = 'hair_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('hair_2'), name = 'hair_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('hair_color_1'), name = 'hair_color_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('hair_color_2'), name = 'hair_color_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('eyebrow_type'), name = 'eyebrows_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('eyebrow_size'), name = 'eyebrows_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('eyebrow_color_1'), name = 'eyebrows_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('eyebrow_color_2'), name = 'eyebrows_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('makeup_type'), name = 'makeup_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('makeup_thickness'), name = 'makeup_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('makeup_color_1'), name = 'makeup_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('makeup_color_2'), name = 'makeup_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('lipstick_type'), name = 'lipstick_1', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('lipstick_thickness'), name = 'lipstick_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('lipstick_color_1'), name = 'lipstick_3', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('lipstick_color_2'), name = 'lipstick_4', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('ear_accessories'), name = 'ears_1', value = -1, min = -1, zoomOffset = 0.4, camOffset = 0.65 }, --
    { label = _U('ear_accessories_color'), name = 'ears_2', value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65, textureof = 'ears_1' }, --
    { label = _U('tshirt_1'), name = 'tshirt_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 }, --
    { label = _U('tshirt_2'), name = 'tshirt_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'tshirt_1' }, --
    { label = _U('torso_1'), name = 'torso_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 }, --
    { label = _U('torso_2'), name = 'torso_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'torso_1' }, --
    { label = _U('decals_1'), name = 'decals_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 }, --
    { label = _U('decals_2'), name = 'decals_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'decals_1' }, --
    { label = _U('arms'), name = 'arms', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 }, --
    { label = _U('pants_1'), name = 'pants_1', value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.5 }, --
    { label = _U('pants_2'), name = 'pants_2', value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.5, textureof = 'pants_1' }, --
    { label = _U('shoes_1'), name = 'shoes_1', value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.8 },
    { label = _U('shoes_2'), name = 'shoes_2', value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.8, textureof = 'shoes_1' },
    { label = _U('mask_1'), name = 'mask_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('mask_2'), name = 'mask_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'mask_1' }, --
    { label = _U('bproof_1'), name = 'bproof_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 }, --
    { label = _U('bproof_2'), name = 'bproof_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'bproof_1' }, --
    { label = _U('chain_1'), name = 'chain_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('chain_2'), name = 'chain_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'chain_1' }, --
    { label = _U('helmet_1'), name = 'helmet_1', value = -1, min = -1, componentId = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('helmet_2'), name = 'helmet_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'helmet_1' }, --
    { label = _U('glasses_1'), name = 'glasses_1', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65 }, --
    { label = _U('glasses_2'), name = 'glasses_2', value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = 'glasses_1' }, --
    { label = _U('bag'), name = 'bags_1', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15 },
    { label = _U('bag_color'), name = 'bags_2', value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = 'bags_1' }
}

local LastSex     = -1
local LoadSkin    = nil
local LoadClothes = nil
local Character   = {}

for i = 1, #Components, 1 do
    Character[Components[i].name] = Components[i].value
end

function LoadDefaultModel(loadMale, cb)
    local playerPed = GetPlayerPed(-1)
    local characterModel

    if loadMale then
        characterModel = GetHashKey('mp_m_freemode_01')
    else
        characterModel = GetHashKey('mp_f_freemode_01');
    end

    RequestModel(characterModel)

    Citizen.CreateThread(function()

        while not HasModelLoaded(characterModel) do
            RequestModel(characterModel)
            Citizen.Wait(0)
        end

        if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
            SetPlayerModel(PlayerId(), characterModel)
            SetPedDefaultComponentVariation(playerPed)
        end

        SetModelAsNoLongerNeeded(characterModel)

        if cb ~= nil then
            cb()
        end

        TriggerEvent('skinchanger:modelLoaded')
    end)
end

function GetMaxVals()

    local playerPed = GetPlayerPed(-1)

    local data      = {
        sex          = getPropCount(playerPed, 'sex'),
        face         = getPropCount(playerPed, 'face'),
        skin         = getPropCount(playerPed, 'skin'),
        age_1        = getPropCount(playerPed, 'age_1'),
        age_2        = getPropCount(playerPed, 'age_2'),
        beard_1      = getPropCount(playerPed, 'beard_1'),
        beard_2      = getPropCount(playerPed, 'beard_2'),
        beard_3      = getPropCount(playerPed, 'beard_3'),
        beard_4      = getPropCount(playerPed, 'beard_4'),
        hair_1       = getPropCount(playerPed, 'hair_1'),
        hair_2       = getPropCount(playerPed, 'hair_2'),
        hair_color_1 = getPropCount(playerPed, 'hair_color_1'),
        hair_color_2 = getPropCount(playerPed, 'hair_color_2'),
        eyebrows_1   = getPropCount(playerPed, 'eyebrows_1'),
        eyebrows_2   = getPropCount(playerPed, 'eyebrows_2'),
        eyebrows_3   = getPropCount(playerPed, 'eyebrows_3'),
        eyebrows_4   = getPropCount(playerPed, 'eyebrows_4'),
        makeup_1     = getPropCount(playerPed, 'makeup_1'),
        makeup_2     = getPropCount(playerPed, 'makeup_2'),
        makeup_3     = getPropCount(playerPed, 'makeup_3'),
        makeup_4     = getPropCount(playerPed, 'makeup_4'),
        lipstick_1   = getPropCount(playerPed, 'lipstick_1'),
        lipstick_2   = getPropCount(playerPed, 'lipstick_2'),
        lipstick_3   = getPropCount(playerPed, 'lipstick_3'),
        lipstick_4   = getPropCount(playerPed, 'lipstick_4'),
        ears_1       = getPropCount(playerPed, 'ears_1'),
        ears_2       = getPropCount(playerPed, 'ears_2'),
        tshirt_1     = getPropCount(playerPed, 'tshirt_1'),
        tshirt_2     = getPropCount(playerPed, 'tshirt_2'),
        torso_1      = getPropCount(playerPed, 'torso_1'),
        torso_2      = getPropCount(playerPed, 'torso_2'),
        decals_1     = getPropCount(playerPed, 'decals_1'),
        decals_2     = getPropCount(playerPed, 'decals_2'),
        arms         = getPropCount(playerPed, 'arms'),
        pants_1      = getPropCount(playerPed, 'pants_1'),
        pants_2      = getPropCount(playerPed, 'pants_2'),
        shoes_1      = getPropCount(playerPed, 'shoes_1'),
        shoes_2      = getPropCount(playerPed, 'shoes_2'),
        mask_1       = getPropCount(playerPed, 'mask_1'),
        mask_2       = getPropCount(playerPed, 'mask_2'),
        bproof_1     = getPropCount(playerPed, 'bproof_1'),
        bproof_2     = getPropCount(playerPed, 'bproof_2'),
        chain_1      = getPropCount(playerPed, 'chain_1'),
        chain_2      = getPropCount(playerPed, 'chain_2'),
        bags_1       = getPropCount(playerPed, 'bags_1'),
        bags_2       = getPropCount(playerPed, 'bags_2'),
        helmet_1     = getPropCount(playerPed, 'helmet_1'),
        helmet_2     = getPropCount(playerPed, 'helmet_2'),
        glasses_1    = getPropCount(playerPed, 'glasses_1'),
        glasses_2    = getPropCount(playerPed, 'glasses_2'),
    }

    return data
end

function ApplySkin(skin, clothes, ped, Gender)
    local playerPed = GetPlayerPed(-1)
    if (ped ~= nil) then
        playerPed = ped
    end

    if (Gender == nil) then
        Gender = 'm';

        if (LastSex == 1) then
            Gender = 'f'
        end
    end

    for k, v in pairs(skin) do
        Character[k] = v
    end

    if clothes ~= nil then

        for k, v in pairs(clothes) do
            if k ~= 'sex' and
                k ~= 'face' and
                k ~= 'skin' and
                k ~= 'age_1' and
                k ~= 'age_2' and
                k ~= 'beard_1' and
                k ~= 'beard_2' and
                k ~= 'beard_3' and
                k ~= 'beard_4' and
                k ~= 'hair_1' and
                k ~= 'hair_2' and
                k ~= 'hair_color_1' and
                k ~= 'hair_color_2' and
                k ~= 'eyebrows_1' and
                k ~= 'eyebrows_2' and
                k ~= 'eyebrows_3' and
                k ~= 'eyebrows_4' and
                k ~= 'makeup_1' and
                k ~= 'makeup_2' and
                k ~= 'makeup_3' and
                k ~= 'makeup_4' and
                k ~= 'lipstick_1' and
                k ~= 'lipstick_2' and
                k ~= 'lipstick_3' and
                k ~= 'lipstick_4' then
                Character[k] = v
            end
        end
    end

    SetPedHeadBlendData(playerPed, GetActualSkinId('face', playerPed, Gender),
                        GetActualSkinId('face', playerPed, Gender), GetActualSkinId('face', playerPed, Gender),
                        GetActualSkinId('skin', playerPed, Gender), GetActualSkinId('skin', playerPed, Gender),
                        GetActualSkinId('skin', playerPed, Gender), 1.0, 1.0, 1.0, true)

    SetPedHeadOverlay(playerPed, 3, GetActualSkinId('age_1', playerPed, Gender),
                      (GetActualSkinId('age_2', playerPed, Gender) / 10) + 0.0) -- Age + opacity
    SetPedHeadOverlay(playerPed, 1, GetActualSkinId('beard_1', playerPed, Gender),
                      (GetActualSkinId('beard_2', playerPed, Gender) / 10) + 0.0) -- Beard + opacity
    SetPedHeadOverlayColor(playerPed, 1, 1, GetActualSkinId('beard_3', playerPed, Gender),
                           GetActualSkinId('beard_4', playerPed, Gender)) -- Beard Color
    SetPedHeadOverlay(playerPed, 2, GetActualSkinId('eyebrows_1', playerPed, Gender),
                      (GetActualSkinId('eyebrows_2', playerPed, Gender) / 10) + 0.0) -- Eyebrows + opacity
    SetPedHeadOverlayColor(playerPed, 2, 1, GetActualSkinId('eyebrows_3', playerPed, Gender),
                           GetActualSkinId('eyebrows_4', playerPed, Gender)) -- Eyebrows Color
    SetPedHeadOverlay(playerPed, 4, GetActualSkinId('makeup_1', playerPed, Gender),
                      (GetActualSkinId('makeup_2', playerPed, Gender) / 10) + 0.0) -- Makeup + opacity
    SetPedHeadOverlayColor(playerPed, 4, 1, GetActualSkinId('makeup_3', playerPed, Gender),
                           GetActualSkinId('makeup_4', playerPed, Gender)) -- Makeup Color
    SetPedHeadOverlay(playerPed, 8, GetActualSkinId('lipstick_1', playerPed, Gender),
                      (GetActualSkinId('lipstick_2', playerPed, Gender) / 10) + 0.0) -- Lipstick + opacity
    SetPedHeadOverlayColor(playerPed, 8, 1, GetActualSkinId('lipstick_3', playerPed, Gender),
                           GetActualSkinId('lipstick_4', playerPed, Gender)) -- Lipstick Color
    SetPedComponentVariation(playerPed, 2, GetActualSkinId('hair_1', playerPed, Gender),
                             GetActualSkinId('hair_2', playerPed, Gender), 2) -- Hair
    SetPedHairColor(playerPed, GetActualSkinId('hair_color_1', playerPed, Gender),
                    GetActualSkinId('hair_color_2', playerPed, Gender)) -- Hair Color

    if GetActualSkinId('ears_1', playerPed, Gender) == -1 then
        ClearPedProp(playerPed, 2)
    else
        SetPedPropIndex(playerPed, 2, GetActualSkinId('ears_1', playerPed, Gender),
                        GetActualSkinId('ears_2', playerPed, Gender), 2) -- Ears Accessories
    end

    SetPedComponentVariation(playerPed, 8, GetActualSkinId('tshirt_1', playerPed, Gender),
                             GetActualSkinId('tshirt_2', playerPed, Gender), 2) -- Tshirt
    SetPedComponentVariation(playerPed, 11, GetActualSkinId('torso_1', playerPed, Gender),
                             GetActualSkinId('torso_2', playerPed, Gender), 2) -- torso parts
    SetPedComponentVariation(playerPed, 3, GetActualSkinId('arms', playerPed, Gender), 0, 2) -- torso
    SetPedComponentVariation(playerPed, 10, GetActualSkinId('decals_1', playerPed, Gender),
                             GetActualSkinId('decals_2', playerPed, Gender), 2) -- decals
    SetPedComponentVariation(playerPed, 4, GetActualSkinId('pants_1', playerPed, Gender),
                             GetActualSkinId('pants_2', playerPed, Gender), 2) -- pants
    SetPedComponentVariation(playerPed, 6, GetActualSkinId('shoes_1', playerPed, Gender),
                             GetActualSkinId('shoes_2', playerPed, Gender), 2) -- shoes
    SetPedComponentVariation(playerPed, 1, GetActualSkinId('mask_1', playerPed, Gender),
                             GetActualSkinId('mask_2', playerPed, Gender), 2) -- mask
    SetPedComponentVariation(playerPed, 9, GetActualSkinId('bproof_1', playerPed, Gender),
                             GetActualSkinId('bproof_2', playerPed, Gender), 2) -- bulletproof
    SetPedComponentVariation(playerPed, 7, GetActualSkinId('chain_1', playerPed, Gender),
                             GetActualSkinId('chain_2', playerPed, Gender), 2) -- chain
    SetPedComponentVariation(playerPed, 5, GetActualSkinId('bags_1', playerPed, Gender),
                             GetActualSkinId('bags_2', playerPed, Gender), 2) -- Bag

    if GetActualSkinId('helmet_1', playerPed, Gender) == -1 then
        ClearPedProp(playerPed, 0)
    else
        SetPedPropIndex(playerPed, 0, GetActualSkinId('helmet_1', playerPed, Gender),
                        GetActualSkinId('helmet_2', playerPed, Gender), 2) -- Helmet
    end

    SetPedPropIndex(playerPed, 1, GetActualSkinId('glasses_1', playerPed, Gender),
                    GetActualSkinId('glasses_2', playerPed, Gender), 2) -- Glasses
end

AddEventHandler('skinchanger:loadDefaultModel', function(loadMale, cb)
    LoadDefaultModel(loadMale, cb)
end)

AddEventHandler('skinchanger:getData', function(cb)

    local components = json.decode(json.encode(Components))

    for k, v in pairs(Character) do
        for i = 1, #components, 1 do
            if k == components[i].name then
                components[i].value = v
                --components[i].zoomOffset = Components[i].zoomOffset
                --components[i].camOffset = Components[i].camOffset
            end
        end
    end

    cb(components, GetMaxVals())
end)

AddEventHandler('skinchanger:change', function(key, val)

    Character[key] = val

    if key == 'sex' then
        TriggerEvent('skinchanger:loadSkin', Character)
    else
        ApplySkin(Character)
    end
end)

AddEventHandler('skinchanger:getSkin', function(cb)
    cb(Character)
end)

AddEventHandler('skinchanger:modelLoaded', function()

    ClearPedProp(GetPlayerPed(-1), 0)

    if LoadSkin ~= nil then

        ApplySkin(LoadSkin)
        LoadSkin = nil
    end

    if LoadClothes ~= nil then

        ApplySkin(LoadClothes.playerSkin, LoadClothes.clothesSkin)
        LoadClothes = nil
    end
end)

RegisterNetEvent('skinchanger:loadSkin')
AddEventHandler('skinchanger:loadSkin', function(skin, cb, checkSex)
    if skin['sex'] ~= LastSex and (checkSex == nil or checkSex) then

        LoadSkin = skin

        if skin['sex'] == 0 then
            TriggerEvent('skinchanger:loadDefaultModel', true, cb)
        else
            TriggerEvent('skinchanger:loadDefaultModel', false, cb)
        end

    else

        ApplySkin(skin)

        if cb ~= nil then
            cb()
        end
    end

    LastSex = skin['sex']
end)

RegisterNetEvent('skinchanger:loadClothes')
AddEventHandler('skinchanger:loadClothes', function(playerSkin, clothesSkin)

    if playerSkin['sex'] ~= LastSex then

        LoadClothes = {
            playerSkin  = playerSkin,
            clothesSkin = clothesSkin
        }

        if playerSkin['sex'] == 0 then
            TriggerEvent('skinchanger:loadDefaultModel', true)
        else
            TriggerEvent('skinchanger:loadDefaultModel', false)
        end

    else
        ApplySkin(playerSkin, clothesSkin)
    end

    LastSex = playerSkin['sex']
end)

function GetActualSkinId(PropName, playerPed, Gender)
    if (Gender == nil) then
        Gender = 'm';

        if (LastSex == 1) then
            Gender = 'f'
        end
    end

    local PropCount    = getPropCount(playerPed, PropName, Gender);

    local VanillaProps = PropCount - Config.CustomLength[Gender][PropName];

    if (Character[PropName] >= Config.CustomStart[Gender][PropName]) then
        if Character[PropName] > PropCount - Config.CustomLength[Gender][PropName] then
            return Character[PropName] - VanillaProps + Config.CustomStart[Gender][PropName] - 1
        else
            return Character[PropName] + Config.CustomLength[Gender][PropName]
        end
    else
        return Character[PropName]
    end
end

function getPropCount(playerPed, PropName, Gender)
    if Gender == nil then
        Gender = 'm';

        if (LastSex == 1) then
            Gender = 'f'
        end
    end

    if PropName == 'sex' then
        return 1
    elseif PropName == 'face' then
        return 45
    elseif PropName == 'skin' then
        return 45
    elseif PropName == 'age_1' then
        return GetNumHeadOverlayValues(3) - 1
    elseif PropName == 'age_2' then
        return 10
    elseif PropName == 'beard_1' then
        return GetNumHeadOverlayValues(1) - 1
    elseif PropName == 'beard_2' then
        return 10
    elseif PropName == 'beard_3' then
        return GetNumHairColors() - 1
    elseif PropName == 'beard_4' then
        return GetNumHairColors() - 1
    elseif PropName == 'hair_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 2) - 1
    elseif PropName == 'hair_2' then
        return GetNumberOfPedTextureVariations(playerPed, 2, GetActualSkinId('hair_1', playerPed, Gender)) - 1
    elseif PropName == 'hair_color_1' then
        return GetNumHairColors() - 1
    elseif PropName == 'hair_color_2' then
        return GetNumHairColors() - 1
    elseif PropName == 'eyebrows_1' then
        return GetNumHeadOverlayValues(2) - 1
    elseif PropName == 'eyebrows_2' then
        return 10
    elseif PropName == 'eyebrows_3' then
        return GetNumHairColors() - 1
    elseif PropName == 'eyebrows_4' then
        return GetNumHairColors() - 1
    elseif PropName == 'makeup_1' then
        return GetNumHeadOverlayValues(4) - 1
    elseif PropName == 'makeup_2' then
        return 10
    elseif PropName == 'makeup_3' then
        return GetNumHairColors() - 1
    elseif PropName == 'makeup_4' then
        return GetNumHairColors() - 1
    elseif PropName == 'lipstick_1' then
        return GetNumHeadOverlayValues(8) - 1
    elseif PropName == 'lipstick_2' then
        return 10
    elseif PropName == 'lipstick_3' then
        return GetNumHairColors() - 1
    elseif PropName == 'lipstick_4' then
        return GetNumHairColors() - 1
    elseif PropName == 'ears_1' then
        return GetNumberOfPedPropDrawableVariations(playerPed, 1) - 1
    elseif PropName == 'ears_2' then
        return GetNumberOfPedPropTextureVariations(playerPed, 1, GetActualSkinId('ears_1', playerPed, Gender) - 1)
    elseif PropName == 'tshirt_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 8) - 1
    elseif PropName == 'tshirt_2' then
        return GetNumberOfPedTextureVariations(playerPed, 8, GetActualSkinId('tshirt_1', playerPed, Gender)) - 1
    elseif PropName == 'torso_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 11) - 1
    elseif PropName == 'torso_2' then
        return GetNumberOfPedTextureVariations(playerPed, 11, GetActualSkinId('torso_1', playerPed, Gender)) - 1
    elseif PropName == 'decals_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 10) - 1
    elseif PropName == 'decals_2' then
        return GetNumberOfPedTextureVariations(playerPed, 10, GetActualSkinId('decals_1', playerPed, Gender)) - 1
    elseif PropName == 'arms' then
        return GetNumberOfPedDrawableVariations(playerPed, 3) - 1
    elseif PropName == 'pants_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 4) - 1
    elseif PropName == 'pants_2' then
        return GetNumberOfPedTextureVariations(playerPed, 4, GetActualSkinId('pants_1', playerPed, Gender)) - 1
    elseif PropName == 'shoes_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 6) - 1
    elseif PropName == 'shoes_2' then
        return GetNumberOfPedTextureVariations(playerPed, 6, GetActualSkinId('shoes_1', playerPed, Gender)) - 1
    elseif PropName == 'mask_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 1) - 1
    elseif PropName == 'mask_2' then
        return GetNumberOfPedTextureVariations(playerPed, 1, GetActualSkinId('mask_1', playerPed, Gender)) - 1
    elseif PropName == 'bproof_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 9) - 1
    elseif PropName == 'bproof_2' then
        return GetNumberOfPedTextureVariations(playerPed, 9, GetActualSkinId('bproof_1', playerPed, Gender)) - 1
    elseif PropName == 'chain_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 7) - 1
    elseif PropName == 'chain_2' then
        return GetNumberOfPedTextureVariations(playerPed, 7, GetActualSkinId('chain_1', playerPed, Gender)) - 1
    elseif PropName == 'bags_1' then
        return GetNumberOfPedDrawableVariations(playerPed, 5) - 1
    elseif PropName == 'bags_2' then
        return GetNumberOfPedTextureVariations(playerPed, 5, GetActualSkinId('bags_1', playerPed, Gender)) - 1
    elseif PropName == 'helmet_1' then
        return GetNumberOfPedPropDrawableVariations(playerPed, 0) - 1
    elseif PropName == 'helmet_2' then
        return GetNumberOfPedPropTextureVariations(playerPed, 0, GetActualSkinId('helmet_1', playerPed, Gender)) - 1
    elseif PropName == 'glasses_1' then
        return GetNumberOfPedPropDrawableVariations(playerPed, 1) - 1
    elseif PropName == 'glasses_2' then
        return GetNumberOfPedPropTextureVariations(playerPed, 1, GetActualSkinId('glasses_1', playerPed, Gender) - 1)
    else
        return 0
    end
end

exports("ApplySkin", ApplySkin);