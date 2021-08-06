toggle = true
--MAKE SURE YOU TURN THIS OFF BEFORE MERGING KAIA
local Debug.SeeOwnBlip = true
Citizen.CreateThread(function()
    for i = 1, #Blips.Main do
        local blip = Blips.Main[i]
        RequestStreamedTextureDict(blip["Info.dictionary"], 1)
        while not HasStreamedTextureDictLoaded(blip["Info.dictionary"])  do
            Citizen.Wait(1)
        end
    end
end)

for i = 1, #Blips.Main do
    local blip = Blips.Main[i]
    if blip and blip["sprite"]~= -1 then
        if not DoesBlipExist(blip["id"]) then
            blip["id"] = AddBlipForCoord(blip["x"], blip["y"], blip["z"] or Config.DefaultZ)
            SetBlipSprite(blip["id"], blip["sprite"] or Config.DefaultSprite)
            SetBlipDisplay(blip["id"], blip["display"] or Config.DefaultDisplay)
            SetBlipAlpha(blip["id"], blip["opacity"] or Config.DefaultOpacity)
            SetBlipCategory(blip["id"], blip["type"] or Config.DefaultType)
            SetBlipPriority(blip["id"], blip["layer"] or Config.DefaultLayer)
            SetBlipScale(blip["id"], blip["scale"] or Config.DefaultScale)
            SetBlipColour(blip["id"], blip["color"] or Config.DefaultColor)
            SetBlipHiddenOnLegend(blip["id"], blip["hidden"] or Config.DefaultHidden)
            if blip["checkmark"] ~= nil then
                ShowTickOnBlip(blip, blip["checkmark"])
            end
            if blip["blueoutline"] ~= nil then
                ShowOutlineIndicatorOnBlip(blip, blip["blueoutline"])
            end
            if blip["shrink"] ~= nil then
                SetBlipShrink(blip, blip["shrink"])
            end
            if blip["number"] ~= nil then
                ShowNumberOnBlip(blip, blip["number"])
            end
            if blip["outlineonly"] ~= nil then
                SetRadiusBlipEdge(blip, blip["outlineonly"])
            end
            if blip["fadeopacity"] and blip["fadetime"] ~= nil  then
                SetBlipFade(blip, blip["fadeopacity"], blip["fadetime"])
            end
            if blip["color2red"] and blip["color2green"] and blip["color2blue"] ~= nil then
                SetBlipSecondaryColour(blip, blip["color2red"], blip["color2green"], blip["color2blue"])
            end
            if blip["cone"] ~= nil then
                SetBlipShowCone(blip, blip["cone"])
            end
            if blip["rotation"] ~= nil then
                SetBlipRotation(blip["id"], blip["rotation"])
            end
            if blip["scaleX"] or blip["scaleY"] then
                SetBlipScaleTransformation(blip["id"], blip["scaleX"] or 1.0,blip["scaleY"] or 1.0)
            end
            if blip["Info.toggle"] == true then
                exports['blip_info']:SetBlipInfoTitle(blip["id"], blip["Info.title"] or blip["name"], false)
                exports['blip_info']:SetBlipInfoImage(blip["id"], blip["Info.dictionary"] or Config.DefaultDictionary, blip["Info.image"] or Config.DefaultImage)
            end
            if blip["Info.textLeft"] and blip["Info.textRight"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.textLeft"], blip["Info.textRight"])
            end
            if blip["Info.nameLeft"] and blip["Info.nameRight"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.nameLeft"], blip["Info.nameRight"])
            end
            if blip["Info.text2Left"] and blip["Info.text2Right"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.text2Left"], blip["Info.text2Right"])
            end
            if blip["Info.name2Left"] and blip["Info.name2Right"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.name2Left"], blip["Info.name2Right"])
            end
            if blip["Info.text3Left"] and blip["Info.text3Right"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.text3Left"], blip["Info.text3Right"])
            end
            if blip["Info.name3Left"] and blip["Info.name3Right"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.name3Left"], blip["Info.name3Right"])
            end
            if blip["Info.text4Left"] and blip["Info.text4Right"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.text4Left"], blip["Info.text4Right"])
            end
            if blip["Info.name4Left"] and blip["Info.name4Right"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.name4Left"], blip["Info.name4Right"])
            end
            if blip["Info.text5Left"] and blip["Info.text3Right"] ~= nil then
                exports['blip_info']:AddBlipInfoText(blip["id"], blip["Info.text5Left"], blip["Info.text5Right"])
            end
            if blip["Info.name5Left"] and blip["Info.name5Right"] ~= nil then
                exports['blip_info']:AddBlipInfoName(blip["id"], blip["Info.name5Left"], blip["Info.name5Right"])
            end
            if blip["Info.headerLeft"] and blip["Info.headerRight"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.headerLeft"], blip["Info.headerRight"])
            end
            if blip["Info.header2Left"] and blip["Info.header2Right"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.header2Left"], blip["Info.header2Right"])
            end
            if blip["Info.header3Left"] and blip["Info.header3Right"] ~= nil then
                exports['blip_info']:AddBlipInfoHeader(blip["id"], blip["Info.header2Left"], blip["Info.header2Right"])
            end
            if blip["Info.iconLeft"] and blip["Info.iconRight"] and blip["Info.iconID"] and blip["Info.iconColor"] and blip ["Info.iconCheckmark"] ~= nil then
                exports['blip_info']:AddBlipInfoIcon(blip["id"], blip["Info.iconLeft"], blip["Info.iconRight"], blip["Info.iconID"], blip["Info.iconColor"], blip["Info.iconCheckmark"])
            end
            if blip["Info.icon2Left"] and blip["Info.icon2Right"] and blip["Info.icon2ID"] and blip["Info.icon2Color"] and blip ["Info.icon2Checkmark"] ~= nil then
                exports['blip_info']:AddBlipInfoIcon(blip["id"], blip["Info.icon2Left"], blip["Info.icon2Right"], blip["Info.icon2ID"], blip["Info.icon2Color"], blip["Info.icon2Checkmark"])
            end
            if blip["Info.icon3Left"] and blip["Info.icon3Right"] and blip["Info.icon3ID"] and blip["Info.icon3Color"] and blip ["Info.icon3Checkmark"] ~= nil then
                exports['blip_info']:AddBlipInfoIcon(blip["id"], blip["Info.icon3Left"], blip["Info.icon3Right"], blip["Info.icon3ID"], blip["Info.icon3Color"], blip["Info.icon3Checkmark"])
            end
            SetBlipAsShortRange(blip["id"], true)
            if blip["text"] ~= nil then 
                bliptext = blip["text"]
            else 
                bliptext = "New Blip"
            end
            AddTextEntry("blips", bliptext)
            BeginTextCommandSetBlipName("blips")
            EndTextCommandSetBlipName(blip["id"])
        end
    end
end
for i = 1, #ATM.Blips, 1 do
    local blip = AddBlipForCoord(ATM.Blips[i].x, ATM.Blips[i].y, ATM.Blips[i].z or Config.DefaultZ)
    SetBlipSprite(blip, ATM.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, ATM.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, ATM.Config["opacity"] or Config.DefaultOpacity) 
    SetBlipCategory(blip, ATM.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, ATM.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, ATM.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, ATM.Config["color"] or Config.DefaultColor)
    SetBlipHiddenOnLegend(blip, ATM.Config["hidden"] or Config.DefaultHidden)
    SetBlipAsShortRange(blip, true)
    local bliptext = ATM.Config["text"]
    AddTextEntry("ATM", bliptext)
    BeginTextCommandSetBlipName("ATM")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #GAS.Blips, 1 do
    local blip = AddBlipForCoord(GAS.Blips[i].x, GAS.Blips[i].y, GAS.Blips[i].z)
    SetBlipSprite(blip, GAS.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, GAS.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, GAS.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, GAS.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, GAS.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, GAS.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, GAS.Config["color"] or Config.DefaultColor)
    SetBlipHiddenOnLegend(blip, GAS.Config["hidden"] or Config.DefaultHidden)
    SetBlipAsShortRange(blip, true)
    local bliptext = GAS.Config["text"]
    AddTextEntry("GAS", bliptext)
    BeginTextCommandSetBlipName("GAS")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #STORE.Blips, 1 do
    local blip = AddBlipForCoord(STORE.Blips[i].x, STORE.Blips[i].y, STORE.Blips[i].z)
    SetBlipSprite(blip, STORE.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, STORE.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, STORE.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, STORE.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, STORE.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, STORE.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, STORE.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = STORE.Config["text"]
    AddTextEntry("STORE", bliptext)
    BeginTextCommandSetBlipName("STORE")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #PARKING.Blips, 1 do
    local blip = AddBlipForCoord(PARKING.Blips[i].x, PARKING.Blips[i].y, PARKING.Blips[i].z)
    SetBlipSprite(blip, PARKING.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, PARKING.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, PARKING.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, PARKING.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, PARKING.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, PARKING.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, PARKING.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = PARKING.Config["text"]
    AddTextEntry("PARKING", bliptext)
    BeginTextCommandSetBlipName("PARKING")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #PHARMACY.Blips, 1 do
    local blip = AddBlipForCoord(PHARMACY.Blips[i].x, PHARMACY.Blips[i].y, PHARMACY.Blips[i].z)
    SetBlipSprite(blip, PHARMACY.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, PHARMACY.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, PHARMACY.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, PHARMACY.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, PHARMACY.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, PHARMACY.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, PHARMACY.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = PHARMACY.Config["text"]
    AddTextEntry("PHARMACY", bliptext)
    BeginTextCommandSetBlipName("PHARMACY")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #CARWASH.Blips, 1 do
    local blip = AddBlipForCoord(CARWASH.Blips[i].x, CARWASH.Blips[i].y, CARWASH.Blips[i].z)
    SetBlipSprite(blip, CARWASH.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, CARWASH.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, CARWASH.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, CARWASH.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, CARWASH.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, CARWASH.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, CARWASH.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = CARWASH.Config["text"]
    AddTextEntry("CARWASH", bliptext)
    BeginTextCommandSetBlipName("CARWASH")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #TATTOO.Blips, 1 do
    local blip = AddBlipForCoord(TATTOO.Blips[i].x, TATTOO.Blips[i].y, TATTOO.Blips[i].z)
    SetBlipSprite(blip, TATTOO.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, TATTOO.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, TATTOO.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, TATTOO.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, TATTOO.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, TATTOO.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, TATTOO.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = TATTOO.Config["text"]
    AddTextEntry("TATTOO", bliptext)
    BeginTextCommandSetBlipName("TATTOO")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #CLOTHING.Blips, 1 do
    local blip = AddBlipForCoord(CLOTHING.Blips[i].x, CLOTHING.Blips[i].y, CLOTHING.Blips[i].z)
    SetBlipSprite(blip, CLOTHING.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, CLOTHING.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, CLOTHING.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, CLOTHING.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, CLOTHING.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, CLOTHING.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, CLOTHING.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = CLOTHING.Config["text"]
    AddTextEntry("CLOTHING", bliptext)
    BeginTextCommandSetBlipName("CLOTHING")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #HAIR.Blips, 1 do
    local blip = AddBlipForCoord(HAIR.Blips[i].x, HAIR.Blips[i].y, HAIR.Blips[i].z)
    SetBlipSprite(blip, HAIR.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, HAIR.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, HAIR.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, HAIR.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, HAIR.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, HAIR.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, HAIR.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = HAIR.Config["text"]
    AddTextEntry("HAIR", bliptext)
    BeginTextCommandSetBlipName("HAIR")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #IMPOUND.Blips, 1 do
    local blip = AddBlipForCoord(IMPOUND.Blips[i].x, IMPOUND.Blips[i].y, IMPOUND.Blips[i].z)
    SetBlipSprite(blip, IMPOUND.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, IMPOUND.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, IMPOUND.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, IMPOUND.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, IMPOUND.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, IMPOUND.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, IMPOUND.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = IMPOUND.Config["text"]
    AddTextEntry("IMPOUND", bliptext)
    BeginTextCommandSetBlipName("IMPOUND")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #MASKS.Blips, 1 do
    local blip = AddBlipForCoord(MASKS.Blips[i].x, MASKS.Blips[i].y, MASKS.Blips[i].z)
    SetBlipSprite(blip, MASKS.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, MASKS.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, MASKS.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, MASKS.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, MASKS.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, MASKS.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, MASKS.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = MASKS.Config["text"]
    AddTextEntry("MASKS", bliptext)
    BeginTextCommandSetBlipName("MASKS")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #TRASH.Blips, 1 do
    local blip = AddBlipForCoord(TRASH.Blips[i].x, TRASH.Blips[i].y, TRASH.Blips[i].z)
    SetBlipSprite(blip, TRASH.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, TRASH.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, TRASH.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, TRASH.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, TRASH.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, TRASH.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, TRASH.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = TRASH.Config["text"]
    AddTextEntry("TRASH", bliptext)
    BeginTextCommandSetBlipName("TRASH")
    EndTextCommandSetBlipName(blip)
end
for i = 1, #HANGAR.Blips, 1 do
    local blip = AddBlipForCoord(HANGAR.Blips[i].x, HANGAR.Blips[i].y, HANGAR.Blips[i].z)
    SetBlipSprite(blip, HANGAR.Config["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, HANGAR.Config["display"] or Config.DefaultDisplay)
    SetBlipAlpha(blip, HANGAR.Config["opacity"] or Config.DefaultOpacity)
    SetBlipCategory(blip, HANGAR.Config["type"] or Config.DefaultType)
    SetBlipPriority(blip, HANGAR.Config["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, HANGAR.Config["scale"] or Config.DefaultScale)
    SetBlipColour(blip, HANGAR.Config["color"] or Config.DefaultColor)
    SetBlipAsShortRange(blip, true)
    local bliptext = HANGAR.Config["text"]
    AddTextEntry("HANGAR", bliptext)
    BeginTextCommandSetBlipName("HANGAR")
    EndTextCommandSetBlipName(blip)
end

RegisterNetEvent("tcrp-blips:emergency")
AddEventHandler("tcrp-blips:emergency", function(table)
    local onRadio = table
    local playerid = GetPlayerServerId(PlayerId())
    if onRadio[playerid]["active"] == true then
        for k, v in pairs(onRadio) do 
            local player = GetPlayerFromServerId(onRadio[k]["source"])
            local ped    = GetPlayerPed(player)
            local name   = onRadio[k]["name"]
            local job    = onRadio[k]["job"]
            if onRadio[k]["active"] == true then
                if ped ~= GetPlayerPed(-1) and not DoesBlipExist(GetBlipFromEntity(ped)) then
                    if job == "police" then 
                        local blip = AddBlipForEntity(ped)
                        SetBlipSprite(blip, POLICE.Config["sprite"] or Config.DefaultSprite)
                        SetBlipDisplay(blip, POLICE.Config["display"] or Config.DefaultDisplay)
                        SetBlipAlpha(blip, POLICE.Config["opacity"] or Config.DefaultOpacity)
                        SetBlipCategory(blip, POLICE.Config["type"] or Config.DefaultType)
                        SetBlipPriority(blip, POLICE.Config["layer"] or Config.DefaultLayer)
                        SetBlipScale(blip, POLICE.Config["scale"] or Config.DefaultScale)
                        SetBlipColour(blip, POLICE.Config["color"] or Config.DefaultColor)
                        SetBlipShowCone(blip, true)
                        SetBlipAsShortRange(blip, true)
                        exports['blip_info']:SetBlipInfoTitle(blip, name)
                        exports['blip_info']:AddBlipInfoText(blip, "Job", POLICE.Config["text"])
                        local bliptext = POLICE.Config["text"]
                        AddTextEntry("POLICE", bliptext)
                        BeginTextCommandSetBlipName("POLICE")
                        EndTextCommandSetBlipName(blip)
                    elseif job == "ambulance" then 
                        local blip = AddBlipForEntity(ped)
                        SetBlipSprite(blip, MEDICAL.Config["sprite"] or Config.DefaultSprite)
                        SetBlipDisplay(blip, MEDICAL.Config["display"] or Config.DefaultDisplay)
                        SetBlipAlpha(blip, MEDICAL.Config["opacity"] or Config.DefaultOpacity)
                        SetBlipCategory(blip, MEDICAL.Config["type"] or Config.DefaultType)
                        SetBlipPriority(blip, MEDICAL.Config["layer"] or Config.DefaultLayer)
                        SetBlipScale(blip, MEDICAL.Config["scale"] or Config.DefaultScale)
                        SetBlipColour(blip, MEDICAL.Config["color"] or Config.DefaultColor)
                        SetBlipShowCone(blip, true)
                        SetBlipAsShortRange(blip, true)
                        exports['blip_info']:SetBlipInfoTitle(blip, name)
                        exports['blip_info']:AddBlipInfoText(blip, "Job", MEDICAL.Config["text"])
                        local bliptext = MEDICAL.Config["text"]
                        AddTextEntry("MEDICAL", bliptext)
                        BeginTextCommandSetBlipName("MEDICAL")
                        EndTextCommandSetBlipName(blip)
                    elseif job == "fireman" then 
                        local blip = AddBlipForEntity(ped)
                        SetBlipSprite(blip, FIRE.Config["sprite"] or Config.DefaultSprite)
                        SetBlipDisplay(blip, FIRE.Config["display"] or Config.DefaultDisplay)
                        SetBlipAlpha(blip, FIRE.Config["opacity"] or Config.DefaultOpacity)
                        SetBlipCategory(blip, FIRE.Config["type"] or Config.DefaultType)
                        SetBlipPriority(blip, FIRE.Config["layer"] or Config.DefaultLayer)
                        SetBlipScale(blip, FIRE.Config["scale"] or Config.DefaultScale)
                        SetBlipColour(blip, FIRE.Config["color"] or Config.DefaultColor)
                        SetBlipShowCone(blip, true)
                        SetBlipAsShortRange(blip, true)
                        exports['blip_info']:SetBlipInfoTitle(blip, name)
                        exports['blip_info']:AddBlipInfoText(blip, "Job", FIRE.Config["text"])
                        local bliptext = FIRE.Config["text"]
                        AddTextEntry("FIRE", bliptext)
                        BeginTextCommandSetBlipName("FIRE")
                        EndTextCommandSetBlipName(blip)
                    elseif job == "parkranger" then 
                        local blip = AddBlipForEntity(ped)
                        SetBlipSprite(blip, PARKS.Config["sprite"] or Config.DefaultSprite)
                        SetBlipDisplay(blip, PARKS.Config["display"] or Config.DefaultDisplay)
                        SetBlipAlpha(blip, PARKS.Config["opacity"] or Config.DefaultOpacity)
                        SetBlipCategory(blip, PARKS.Config["type"] or Config.DefaultType)
                        SetBlipPriority(blip, PARKS.Config["layer"] or Config.DefaultLayer)
                        SetBlipScale(blip, PARKS.Config["scale"] or Config.DefaultScale)
                        SetBlipColour(blip, PARKS.Config["color"] or Config.DefaultColor)
                        SetBlipShowCone(blip, true)
                        SetBlipAsShortRange(blip, true)
                        exports['blip_info']:SetBlipInfoTitle(blip, name)
                        exports['blip_info']:AddBlipInfoText(blip, "Job", PARKS.Config["text"])
                        local bliptext = PARKS.Config["text"]
                        AddTextEntry("PARKS", bliptext)
                        BeginTextCommandSetBlipName("PARKS")
                        EndTextCommandSetBlipName(blip)
                    elseif job == "corrections" then 
                        local blip = AddBlipForEntity(ped)
                        SetBlipSprite(blip, CORRECTIONS.Config["sprite"] or Config.DefaultSprite)
                        SetBlipDisplay(blip, CORRECTIONS.Config["display"] or Config.DefaultDisplay)
                        SetBlipAlpha(blip, CORRECTIONS.Config["opacity"] or Config.DefaultOpacity)
                        SetBlipCategory(blip, CORRECTIONS.Config["type"] or Config.DefaultType)
                        SetBlipPriority(blip, CORRECTIONS.Config["layer"] or Config.DefaultLayer)
                        SetBlipScale(blip, CORRECTIONS.Config["scale"] or Config.DefaultScale)
                        SetBlipColour(blip, CORRECTIONS.Config["color"] or Config.DefaultColor)
                        SetBlipShowCone(blip, true)
                        SetBlipAsShortRange(blip, true)
                        exports['blip_info']:SetBlipInfoTitle(blip, name)
                        exports['blip_info']:AddBlipInfoText(blip, "Job", CORRECTIONS.Config["text"])
                        local bliptext = CORRECTIONS.Config["text"]
                        AddTextEntry("CORRECTIONS", bliptext)
                        BeginTextCommandSetBlipName("CORRECTIONS")
                        EndTextCommandSetBlipName(blip)

                    end

                end
            elseif onRadio[k]["active"] == false then
                local blip = GetBlipFromEntity(ped)
                RemoveBlip(blip)
            end
        end
    else   
        for k, v in pairs(onRadio) do
            local player = GetPlayerFromServerId(onRadio[k]["source"])
            local ped    = GetPlayerPed(player)
            local blip = GetBlipFromEntity(ped)
            RemoveBlip(blip)
        end
    end
end)


RegisterNetEvent("tcrp-blips:addblip")
AddEventHandler("tcrp-blips:addblip", function(blipconfig, entity)
    if entity ~= nil then
        local blip = AddBlipForEntity(entity)
    else
        local blip = AddBlipForCoord(blip["x"], blip["y"], blip["z"] or Config.DefaultZ)
    end
    SetBlipSprite(blip, blipconfig["sprite"] or Config.DefaultSprite)
    SetBlipDisplay(blip, blipconfig["display"] or Config.DefaultDisplay)
    SetBlipCategory(blip, blipconfig["type"] or Config.DefaultType)
    SetBlipPriority(blip, blipconfig["layer"] or Config.DefaultLayer)
    SetBlipScale(blip, blipconfig["scale"] or Config.DefaultScale)
    SetBlipColour(blip, blipconfig["color"] or Config.DefaultColor)
    SetBlipRotation(blip, blipconfig["rotation"] or Config.DefaultRotation)
    SetBlipHiddenOnLegend(blip, blipconfig["hidden"] or Config.DefaultHidden)
    if blipconfig["checkmark"] ~= nil then
        ShowTickOnBlip(blip, blipconfig["checkmark"])
    end
    if blipconfig["blueoutline"] ~= nil then
        ShowOutlineIndicatorOnBlip(blip, blipconfig["blueoutline"])
    end
    if blipconfig["shrink"] ~= nil then
        SetBlipShrink(blip, blipconfig["shrink"])
    end
    if blipconfig["number"] ~= nil then
        ShowNumberOnBlip(blip, blipconfig["number"])
    end
    if blipconfig["outlineonly"] ~= nil then
        SetRadiusBlipEdge(blip, blipconfig["outlineonly"])
    end
    if blipconfig["fadeopacity"] and blipconfig["fadetime"] ~= nil  then
        SetBlipFade(blip, blipconfig["fadeopacity"], blipconfig["fadetime"])
    end
    if blipconfig["color2red"] and blipconfig["color2green"] and blipconfig["color2blue"] ~= nil then
        SetBlipSecondaryColour(blip, blipconfig["color2red"], blipconfig["color2green"], blipconfig["color2blue"])
    end
    if blipconfig["cone"] ~= nil then
        SetBlipShowCone(blip, blipconfig["cone"])
    end
    if blipconfig["scaleX"] or blipconfig["scaleY"] ~= nil then
        SetBlipScaleTransformation(blip, blipconfig["scaleX"] or 1.0, blipconfig["scaleY"] or 1.0)
    end
    if blipconfig["Info.toggle"] == true then
        exports['blip_info']:SetBlipInfoTitle(blip, blipconfig["Info.title"] or blipconfig["name"], false)
        exports['blip_info']:SetBlipInfoImage(blip, blipconfig["Info.dictionary"] or Config.DefaultDictionary, blipconfig["Info.image"] or Config.DefaultImage)
    end
    if blipconfig["Info.textLeft"] and blipconfig["Info.textRight"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.textLeft"], blipconfig["Info .textRight"])
    end
    if blipconfig["Info.nameLeft"] and blipconfig["Info.nameRight"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.nameLeft"], blipconfig["Info.nameRight"])
    end
    if blipconfig["Info.text2Left"] and blipconfig["Info.text2Right"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text2Left"], blipconfig["Info.text2Right"])
    end
    if blipconfig["Info.name2Left"] and blipconfig["Info.name2Right"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name2Left"], blipconfig["Info.name2Right"])
    end
    if blipconfig["Info.text3Left"] and blipconfig["Info.text3Right"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text3Left"], blipconfig["Info.text3Right"])
    end
    if blipconfig["Info.name3Left"] and blipconfig["Info.name3Right"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name3Left"], blipconfig["Info.name3Right"])
    end
    if blipconfig["Info.text4Left"] and blipconfig["Info.text4Right"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text4Left"], blipconfig["Info.text4Right"])
    end
    if blipconfig["Info.name4Left"] and blipconfig["Info.name4Right"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name4Left"], blipconfig["Info.name4Right"])
    end
    if blipconfig["Info.text5Left"] and blipconfig["Info.text3Right"] ~= nil then
        exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text5Left"], blipconfig["Info.text5Right"])
    end
    if blipconfig["Info.name5Left"] and blipconfig["Info.name5Right"] ~= nil then
        exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name5Left"], blipconfig["Info.name5Right"])
    end
    if blipconfig["Info.headerLeft"] and blipconfig["Info.headerRight"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.headerLeft"], blipconfig["Info.headerRight"])
    end
    if blipconfig["Info.header2Left"] and blipconfig["Info.header2Right"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header2Left"], blipconfig["Info.header2Right"])
    end
    if blipconfig["Info.header3Left"] and blipconfig["Info.header3Right"] ~= nil then
        exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header2Left"], blipconfig["Info.header2Right"])
    end
    if blipconfig["Info.iconLeft"] and blipconfig["Info.iconRight"] and blipconfig["Info.iconID"] and blipconfig["Info.iconColor"] and blip ["Info.iconCheckmark"] ~= nil then
        exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.iconLeft"], blipconfig["Info.iconRight"], blipconfig["Info.iconID"], blipconfig["Info.iconColor"], blipconfig["Info.iconCheckmark"])
    end
    if blipconfig["Info.icon2Left"] and blipconfig["Info.icon2Right"] and blipconfig["Info.icon2ID"] and blipconfig["Info.icon2Color"] and blip ["Info.icon2Checkmark"] ~= nil then
        exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.icon2Left"], blipconfig["Info.icon2Right"], blipconfig["Info.icon2ID"], blipconfig["Info.icon2Color"], blipconfig["Info.icon2Checkmark"])
    end
    if blipconfig["Info.icon3Left"] and blipconfig["Info.icon3Right"] and blipconfig["Info.icon3ID"] and blipconfig["Info.icon3Color"] and blip ["Info.icon3Checkmark"] ~= nil then
        exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.icon3Left"], blipconfig["Info.icon3Right"], blipconfig["Info.icon3ID"], blipconfig["Info.icon3Color"], blipconfig["Info.icon3Checkmark"])
    end
    SetBlipAsShortRange(blip, true)
    if blip["text"] ~= nil then 
        bliptext = blip["text"]
    else 
        bliptext = "New Blip"
    end
    AddTextEntry("blips", bliptext)
    BeginTextCommandSetBlipName("blips")
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("tcrp-blips:joinRadio")
AddEventHandler("tcrp-blips:joinRadio", function(jobname)

    TriggerServerEvent("tcrp-blips:emergencylist", jobname)
    TriggerEvent('tcrp-blips:toggle', true)

end)
RegisterNetEvent("tcrp-blips:leaveRadio")
AddEventHandler("tcrp-blips:leaveRadio", function()
    TriggerEvent('tcrp-blips:toggle', false)
    TriggerServerEvent("tcrp-blips:removeEmergency")
    
    
end)

RegisterNetEvent("tcrp-blips:removeblip")
AddEventHandler("tcrp-blips:removeblip", function(blip)
    RemoveBlip(blip)
end)


RegisterNetEvent("tcrp-blips:updateblip")
AddEventHandler("tcrp-blips:updateblip", function(blipsource, table)
    local entityblip = GetBlipFromEntity(blipsource)
    local blipconfig = table
    if entityblip ~= nil or 0 then 
        local blip = entityblip
    elseif blipsource ~= nil or 0 then 
        local blip = blipsource
    else
        local blip = nil
    end
    if blip ~= nil then
        if blipconfig["sprite"] ~= nil then
            SetBlipSprite(blip, blipconfig["sprite"])
        end
        if blipconfig["display"] ~= nil then
            SetBlipDisplay(blip, blipconfig["display"])
        end
        if blipconfig["opacity"] ~= nil then
            SetBlipAlpha(blip, blipconfig["opacity"])
        end
        if blipconfig["type"] ~= nil then
        SetBlipCategory(blip, blipconfig["type"])
        end
        if blipconfig["layer"] ~= nil then
        SetBlipPriority(blip, blipconfig["layer"])
        end
        if blipconfig["scale"] ~= nil then
        SetBlipScale(blip, blipconfig["scale"])
        end
        if blipconfig["color"] ~= nil then
        SetBlipColour(blip, blipconfig["color"])
        end
        if blipconfig["hidden"] ~= nil then
        SetBlipHiddenOnLegend(blip, blipconfig["hidden"])
        end
        if blipconfig["rotation"] ~= nil then
            SetBlipRotation(blip, blipconfig["rotation"])
        end
        if blipconfig["scaleX"] or blipconfig["scaleY"] ~= nil then
            SetBlipScaleTransformation(blip, blipconfig["scaleX"] or 1.0,blipconfig["scaleY"] or 1.0)
        end
        if blipconfig["checkmark"] ~= nil then
            ShowTickOnBlip(blip, blipconfig["checkmark"])
        end
        if blipconfig["blueoutline"] ~= nil then
            ShowOutlineIndicatorOnBlip(blip, blipconfig["blueoutline"])
        end
        if blipconfig["shrink"] ~= nil then
            SetBlipShrink(blip, blipconfig["shrink"])
        end
        if blipconfig["number"] ~= nil then
            ShowNumberOnBlip(blip, blipconfig["number"])
        end
        if blipconfig["outlineonly"] ~= nil then
            SetRadiusBlipEdge(blip, blipconfig["outlineonly"])
        end
        if blipconfig["fadeopacity"] and blipconfig["fadetime"] ~= nil  then
            SetBlipFade(blip, blipconfig["fadeopacity"], blipconfig["fadetime"])
        end
        if blipconfig["color2red"] and blipconfig["color2green"] and blipconfig["color2blue"] ~= nil then
            SetBlipSecondaryColour(blip, blipconfig["color2red"], blipconfig["color2green"], blipconfig["color2blue"])
        end
        if blipconfig["cone"] ~= nil then
            SetBlipShowCone(blip, blipconfig["cone"])
        end
        if blipconfig["Info.toggle"] == true then
            exports['blip_info']:SetBlipInfoTitle(blip, blipconfig["Info.title"] or blipconfig["name"], false)
            exports['blip_info']:SetBlipInfoImage(blip, blipconfig["Info.dictionary"] or Config.DefaultDictionary, blipconfig["Info.image"] or Config.DefaultImage)
        end
        if blipconfig["Info.textLeft"] and blipconfig["Info.textRight"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.textLeft"], blipconfig["Info.textRight"])
        end
        if blipconfig["Info.nameLeft"] and blipconfig["Info.nameRight"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.nameLeft"], blipconfig["Info.nameRight"])
        end
        if blipconfig["Info.text2Left"] and blipconfig["Info.text2Right"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text2Left"], blipconfig["Info.text2Right"])
        end
        if blipconfig["Info.name2Left"] and blipconfig["Info.name2Right"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name2Left"], blipconfig["Info.name2Right"])
        end
        if blipconfig["Info.text3Left"] and blipconfig["Info.text3Right"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text3Left"], blipconfig["Info.text3Right"])
        end
        if blipconfig["Info.name3Left"] and blipconfig["Info.name3Right"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name3Left"], blipconfig["Info.name3Right"])
        end
        if blipconfig["Info.text4Left"] and blipconfig["Info.text4Right"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text4Left"], blipconfig["Info.text4Right"])
        end
        if blipconfig["Info.name4Left"] and blipconfig["Info.name4Right"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name4Left"], blipconfig["Info.name4Right"])
        end
        if blipconfig["Info.text5Left"] and blipconfig["Info.text3Right"] ~= nil then
            exports['blip_info']:AddBlipInfoText(blip, blipconfig["Info.text5Left"], blipconfig["Info.text5Right"])
        end
        if blipconfig["Info.name5Left"] and blipconfig["Info.name5Right"] ~= nil then
            exports['blip_info']:AddBlipInfoName(blip, blipconfig["Info.name5Left"], blipconfig["Info.name5Right"])
        end
        if blipconfig["Info.headerLeft"] and blipconfig["Info.headerRight"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.headerLeft"], blipconfig["Info.headerRight"])
        end
        if blipconfig["Info.header2Left"] and blipconfig["Info.header2Right"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header2Left"], blipconfig["Info.header2Right"])
        end
        if blipconfig["Info.header3Left"] and blipconfig["Info.header3Right"] ~= nil then
            exports['blip_info']:AddBlipInfoHeader(blip, blipconfig["Info.header2Left"], blipconfig["Info.header2Right"])
        end
        if blipconfig["Info.iconLeft"] and blipconfig["Info.iconRight"] and blipconfig["Info.iconID"] and blipconfig["Info.iconColor"] and blip ["Info.iconCheckmark"] ~= nil then
            exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.iconLeft"], blipconfig["Info.iconRight"], blipconfig["Info.iconID"], blipconfig["Info.iconColor"], blipconfig["Info.iconCheckmark"])
        end
        if blipconfig["Info.icon2Left"] and blipconfig["Info.icon2Right"] and blipconfig["Info.icon2ID"] and blipconfig["Info.icon2Color"] and blip ["Info.icon2Checkmark"] ~= nil then
            exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.icon2Left"], blipconfig["Info.icon2Right"], blipconfig["Info.icon2ID"], blipconfig["Info.icon2Color"], blipconfig["Info.icon2Checkmark"])
        end
        if blipconfig["Info.icon3Left"] and blipconfig["Info.icon3Right"] and blipconfig["Info.icon3ID"] and blipconfig["Info.icon3Color"] and blip ["Info.icon3Checkmark"] ~= nil then
            exports['blip_info']:AddBlipInfoIcon(blip, blipconfig["Info.icon3Left"], blipconfig["Info.icon3Right"], blipconfig["Info.icon3ID"], blipconfig["Info.icon3Color"], blipconfig["Info.icon3Checkmark"])
        end
        SetBlipAsShortRange(blip, true)
    end
end)

