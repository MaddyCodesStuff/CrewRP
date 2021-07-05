local toggle = true

CreateThread(function()
    for i = 1, #Config.Blips do
        local blip = Config.Blips[i]

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


    -- Future Function for players to disable Blips -- 
    --for i = 1, #Config.Disabled do
    --    local blip = Config.Blips[i]["blip"]
    --    if blip and blip["sprite"]~= -1 then
    --        if DoesBlipExist(blip["id"]) then
    --            SetBlipDisplay(blip, 0)
    --        end
    --    end
    --end 


end)


AddEventHandler("tcrp-blips:toggleall", function()
    local toggle = not toggle
    for i = 1, #Config.Blips do
            local blip = Config.Blips[i]["blip"]
            if blip and blip["sprite"]~= -1 then
                if DoesBlipExist(blip["id"]) and toggle then
                    SetBlipDisplay(blip, 0)
                elseif DoesBlipExist(blip["id"]) and not toggle then
                    SetBlipDisplay(blip, 0)
            end
        end 
    end
end)