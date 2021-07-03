Citizen.CreateThread(function()
    for i = 1, #Config.Blips do
        local blip = Config.Blips[i]["blip"]

        if blip and blip["sprite"]~= -1 then
            if not DoesBlipExist(blip["id"]) then
                blip["id"] = AddBlipForCoord(blip["x"], blip["y"], blip["z"])
                SetBlipSprite(blip["id"], blip["sprite"] or Config.DefaultSprite)
                SetBlipDisplay(blip["id"], 4)
                SetBlipHighDetail(blip, blip["detailed"]) or Config.DefaultDetail)
                SetBlipAlpha(blip, blip["transparency"]) or Config.DefaultTransparency)
                SetBlipCategory(blip, blip["type"]) or Config.DefaultType)
                SetBlipPriority(blip, blip["layer"] or Config.DefaultLayer)
                SetBlipScale(blip["id"], blip["scale"] or Config.DefaultScale)
                SetBlipColour(blip["id"], blip["color"] or Config.DefaultSpriteColor)
                SetBlipAsShortRange(blip["id"], true)

                if blip["text"] ~= nil then
                    bliptext = blip["text"]
                else
                    bliptext = Config.DefaultSpriteName 
                end

                AddTextEntry("BLIPS", bliptext)
                BeginTextCommandSetBlipName("BLIPS")
                EndTextCommandSetBlipName(blip["id"])
            end
        end
    end


    --[[
    for i = 1, #Config.Disabled do
        local blip = Config.Blips[i]["blip"]

        if blip and blip["sprite"]~= -1 then
            if DoesBlipExist(blip["id"]) then
                SetBlipDisplay(blip, 0)
            end
        end
    end 
    ]]--

end)
