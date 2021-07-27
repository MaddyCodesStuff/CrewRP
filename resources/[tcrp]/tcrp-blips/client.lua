toggle = true

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
--Commands--
RegisterCommand("blips", function()
    TriggerEvent("tcrp-blips:disable")
end)

RegisterCommand("blips category", function()
    TriggerEvent("tcrp-blips:disablecategory")
end)

------------

--Events--
AddEventHandler("tcrp-blips:disable", function()
    toggle = not toggle
    for i = 1, #Config.Blips do
        local blip = Config.Blips[i]
        if toggle and DoesBlipExist(blip["id"]) then
            SetBlipAlpha(blip["id"], 0)
        elseif not toggle then
            SetBlipAlpha(blip["id"], blip["opacity"] or Config.DefaultOpacity)
        end
    end
end)
--[[
AddEventHandler("tcrp-blips:disablecategory", function()
    toggle = not toggle
    for i = 1, #Config.Blips do
        local blip = Config.Blips[i]
        if blip["category"] == "Bank" then
            if toggle and DoesBlipExist(blip["id"]) then
                SetBlipAlpha(blip["id"], 0)
            elseif not toggle then
                SetBlipAlpha(blip["id"], blip["opacity"] or Config.DefaultOpacity)
            end
        end
    end
end)
]]--

-----------
