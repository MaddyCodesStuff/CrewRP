local dockcache = {}
local pdcache = {}

RegisterNetEvent("tcrp-blips:radioon")
AddEventHandler("tcrp-blips:radioon", function(job)
    for i = 1, #EMERGENCYDOCKS.Blips, 1 do
        local blip = AddBlipForCoord(EMERGENCYDOCKS.Blips[i].x, EMERGENCYDOCKS.Blips[i].y, EMERGENCYDOCKS.Blips[i].z or Config.DefaultZ)
        dockcache[i] = blip
        SetBlipSprite(blip, EMERGENCYDOCKS.Config["sprite"] or Config.DefaultSprite)
        SetBlipDisplay(blip, EMERGENCYDOCKS.Config["display"] or Config.DefaultDisplay)
        SetBlipAlpha(blip, EMERGENCYDOCKS.Config["opacity"] or Config.DefaultOpacity) 
        SetBlipCategory(blip, EMERGENCYDOCKS.Config["type"] or Config.DefaultType)
        SetBlipPriority(blip, EMERGENCYDOCKS.Config["layer"] or Config.DefaultLayer)
        SetBlipScale(blip, EMERGENCYDOCKS.Config["scale"] or Config.DefaultScale)
        SetBlipColour(blip, EMERGENCYDOCKS.Config["color"] or Config.DefaultColor)
        SetBlipHiddenOnLegend(blip, EMERGENCYDOCKS.Config["hidden"] or Config.DefaultHidden)
        SetBlipAsShortRange(blip, true)
        local bliptext = EMERGENCYDOCKS.Config["text"]
        AddTextEntry("EMERGENCYDOCKS", bliptext)
        BeginTextCommandSetBlipName("EMERGENCYDOCKS")
        EndTextCommandSetBlipName(blip)
    end
    if job == 'police' then
        for i = 1, #LOCALPD.Blips, 1 do
            local blip = AddBlipForCoord(LOCALPD.Blips[i].x, LOCALPD.Blips[i].y, LOCALPD.Blips[i].z or Config.DefaultZ)
            pdcache[i] = blip
            SetBlipSprite(blip, LOCALPD.Config["sprite"] or Config.DefaultSprite)
            SetBlipDisplay(blip, LOCALPD.Config["display"] or Config.DefaultDisplay)
            SetBlipAlpha(blip, LOCALPD.Config["opacity"] or Config.DefaultOpacity) 
            SetBlipCategory(blip, LOCALPD.Config["type"] or Config.DefaultType)
            SetBlipPriority(blip, LOCALPD.Config["layer"] or Config.DefaultLayer)
            SetBlipScale(blip, LOCALPD.Config["scale"] or Config.DefaultScale)
            SetBlipColour(blip, LOCALPD.Config["color"] or Config.DefaultColor)
            SetBlipHiddenOnLegend(blip, LOCALPD.Config["hidden"] or Config.DefaultHidden)
            SetBlipAsShortRange(blip, true)
            local bliptext = LOCALPD.Config["text"]
            AddTextEntry("LOCALPD", bliptext)
            BeginTextCommandSetBlipName("LOCALPD")
            EndTextCommandSetBlipName(blip)
        end
    end
end)

RegisterNetEvent("tcrp-blips:radiooff")
AddEventHandler("tcrp-blips:radiooff", function()
    for i = 1, #EMERGENCYDOCKS.Blips, 1 do
        RemoveBlip(dockcache[i])
    end
    for i = 1, #LOCALPD.Blips, 1 do
        RemoveBlip(pdcache[i])
    end
end)