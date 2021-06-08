exports('GetFloydObject', function()
    return Floyd2
end)

Floyd2 = {
    interiorId  = GetInteriorAtCoords(751.12340000, 5588.45600000, 10.67931000),
    Style       = {
        normal   = { "swap_clean_apt", "layer_debra_pic", "layer_whiskey", "swap_sofa_A" },
        messedUp = { "layer_mess_A", "layer_mess_B", "layer_mess_C", "layer_sextoys_a", "swap_sofa_B", "swap_wade_sofa_A", "layer_wade_shit", "layer_torture" },
        Set      = function(style, refresh)
            Floyd2.Style.Clear(false)
            SetIplPropState(Floyd2.interiorId, style, true, refresh)
        end,
        Clear    = function(refresh)
            SetIplPropState(Floyd2.interiorId, { Floyd2.Style.normal, Floyd2.Style.messedUp }, false, refresh)
        end
    },
    MrJam       = {
        normal = "swap_mrJam_A", jammed = "swap_mrJam_B", jammedOnTable = "swap_mrJam_C",
        Set    = function(mrJam, refresh)
            Floyd2.MrJam.Clear(false)
            SetIplPropState(Floyd2.interiorId, mrJam, true, refresh)
        end,
        Clear  = function(refresh)
            SetIplPropState(Floyd2.interiorId, { Floyd2.MrJam.normal, Floyd2.MrJam.jammed, Floyd2.MrJam.jammedOnTable },
                            false, refresh)
        end
    },

    LoadDefault = function()
        Floyd2.Style.Set(Floyd2.Style.normal)
        Floyd2.MrJam.Set(Floyd2.MrJam.normal)
        RefreshInterior(Floyd2.interiorId)
    end
}
