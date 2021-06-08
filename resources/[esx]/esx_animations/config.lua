Config            = {}

Config.Animations = {

    {
        name  = 'festives',
        label = 'Festive',
        items = {
            { label = "Play Music", type = "scenario", data = { anim = "WORLD_HUMAN_MUSICIAN" } },
            { label = "DJ", type = "anim", data = { lib = "anim@mp_player_intcelebrationmale@dj", anim = "dj" } },
            { label = "Drink a Beer", type = "scenario", data = { anim = "WORLD_HUMAN_DRINKING" } },
            { label = "Party", type = "scenario", data = { anim = "WORLD_HUMAN_PARTYING" } },
            { label = "Air Guitar", type = "anim", data = { lib = "anim@mp_player_intcelebrationmale@air_guitar", anim = "air_guitar" } },
            { label = "Air Shagging", type = "anim", data = { lib = "anim@mp_player_intcelebrationfemale@air_shagging", anim = "air_shagging" } },
            { label = "Rock'n'roll", type = "anim", data = { lib = "mp_player_int_upperrock", anim = "mp_player_int_rock" } },
            -- {label = "Smoke a joint", type = "scenario", data = {anim = "WORLD_HUMAN_SMOKING_POT"}},
            { label = "Bum Drunk", type = "anim", data = { lib = "amb@world_human_bum_standing@drunk@idle_a", anim = "idle_a" } },
            { label = "Vomit", type = "anim", data = { lib = "oddjobs@taxi@tie", anim = "vomit_outside" } },
        }
    },

    {
        name  = 'greetings',
        label = 'Salutations',
        items = {
            { label = "Greet", type = "anim", data = { lib = "gestures@m@standing@casual", anim = "gesture_hello" } },
            { label = "Shake Hands", type = "anim", data = { lib = "mp_common", anim = "givetake1_a" } },
            { label = "Tchek", type = "anim", data = { lib = "mp_ped_interaction", anim = "handshake_guy_a" } },
            { label = "Salute Bandit", type = "anim", data = { lib = "mp_ped_interaction", anim = "hugs_guy_a" } },
            { label = "Salute Military", type = "anim", data = { lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute" } },
        }
    },

    {
        name  = 'work',
        label = 'Job',
        items = {
            { label = "Surrender/Hostage", type = "anim", data = { lib = "random@arrests@busted", anim = "idle_c" } },
            { label = "Sinner", type = "scenario", data = { anim = "world_human_stand_fishing" } },
            { label = "Police : Investigate", type = "anim", data = { lib = "amb@code_human_police_investigate@idle_b", anim = "idle_f" } },
            { label = "Police : Talk on the radio", type = "anim", data = { lib = "random@arrests", anim = "generic_radio_chatter" } },
            { label = "Police : Control traffic", type = "scenario", data = { anim = "WORLD_HUMAN_CAR_PARK_ATTENDANT" } },
            { label = "Police : Binoculars", type = "scenario", data = { anim = "WORLD_HUMAN_BINOCULARS" } },
            { label = "Agriculture : Garden", type = "scenario", data = { anim = "world_human_gardener_plant" } },
            { label = "Mechanic : Repair under vehicle", type = "scenario", data = { anim = "world_human_vehicle_mechanic" } },
            { label = "Mechanic : Repair motor", type = "anim", data = { lib = "mini@repair", anim = "fixing_a_ped" } },
            { label = "Doctor : Observe", type = "scenario", data = { anim = "CODE_HUMAN_MEDIC_KNEEL" } },
            { label = "Taxi : Talk to customer", type = "anim", data = { lib = "oddjobs@taxi@driver", anim = "leanover_idle" } },
            { label = "Taxi : Give the bill", type = "anim", data = { lib = "oddjobs@taxi@cyi", anim = "std_hand_off_ps_passenger" } },
            { label = "Grocer : donner les courses", type = "anim", data = { lib = "mp_am_hold_up", anim = "purchase_beerbox_shopkeeper" } },
            { label = "Bartender : Serve a shot", type = "anim", data = { lib = "mini@drinking", anim = "shots_barman_b" } },
            { label = "Photograph", type = "scenario", data = { anim = "WORLD_HUMAN_PAPARAZZI" } },
            { label = "Take Notes", type = "scenario", data = { anim = "WORLD_HUMAN_CLIPBOARD" } },
            { label = "Hammer", type = "scenario", data = { anim = "WORLD_HUMAN_HAMMERING" } },
            { label = "Bum Sign", type = "scenario", data = { anim = "WORLD_HUMAN_BUM_FREEWAY" } },
            { label = "Statue", type = "scenario", data = { anim = "WORLD_HUMAN_HUMAN_STATUE" } },
        }
    },

    {
        name  = 'humors',
        label = 'Moods',
        items = {
            { label = "Congratulate", type = "scenario", data = { anim = "WORLD_HUMAN_CHEERING" } },
            { label = "Great", type = "anim", data = { lib = "mp_action", anim = "thanks_male_06" } },
            { label = "You", type = "anim", data = { lib = "gestures@m@standing@casual", anim = "gesture_point" } },
            { label = "Come To", type = "anim", data = { lib = "gestures@m@standing@casual", anim = "gesture_come_here_soft" } },
            { label = "Keskya ?", type = "anim", data = { lib = "gestures@m@standing@casual", anim = "gesture_bring_it_on" } },
            { label = "To Me", type = "anim", data = { lib = "gestures@m@standing@casual", anim = "gesture_me" } },
            { label = "I Knew It", type = "anim", data = { lib = "anim@am_hold_up@male", anim = "shoplift_high" } },
            { label = "Exhausted", type = "scenario", data = { lib = "amb@world_human_jog_standing@male@idle_b", anim = "idle_d" } },
            { label = "I'm in this shit", type = "scenario", data = { lib = "amb@world_human_bum_standing@depressed@idle_a", anim = "idle_a" } },
            { label = "Facepalm", type = "anim", data = { lib = "anim@mp_player_intcelebrationmale@face_palm", anim = "face_palm" } },
            { label = "Calm Down", type = "anim", data = { lib = "gestures@m@standing@casual", anim = "gesture_easy_now" } },
            { label = "What did I do ?", type = "anim", data = { lib = "oddjobs@assassinate@multi@", anim = "react_big_variations_a" } },
            { label = "Cower", type = "anim", data = { lib = "amb@code_human_cower_stand@male@react_cowering", anim = "base_right" } },
            { label = "Fight ?", type = "anim", data = { lib = "anim@deathmatch_intros@unarmed", anim = "intro_male_unarmed_e" } },
            { label = "That's impossible!", type = "anim", data = { lib = "gestures@m@standing@casual", anim = "gesture_damn" } },
            { label = "Hug", type = "anim", data = { lib = "mp_ped_interaction", anim = "kisses_guy_a" } },
            { label = "Middle finger", type = "anim", data = { lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter" } },
            { label = "Wanker", type = "anim", data = { lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01" } },
            { label = "Bullet to the head", type = "anim", data = { lib = "mp_suicide", anim = "pistol" } },
        }
    },

    {
        name  = 'sports',
        label = 'Sports',
        items = {
            { label = "Flex", type = "anim", data = { lib = "amb@world_human_muscle_flex@arms_at_side@base", anim = "base" } },
            { label = "Weight bar", type = "anim", data = { lib = "amb@world_human_muscle_free_weights@male@barbell@base", anim = "base" } },
            { label = "Push-ups", type = "anim", data = { lib = "amb@world_human_push_ups@male@base", anim = "base" } },
            { label = "Sit-ups", type = "anim", data = { lib = "amb@world_human_sit_ups@male@base", anim = "base" } },
            { label = "Yoga", type = "anim", data = { lib = "amb@world_human_yoga@male@base", anim = "base_a" } },
        }
    },

    {
        name  = 'misc',
        label = 'Various',
        items = {
            { label = "Drink Coffee", type = "anim", data = { lib = "amb@world_human_aa_coffee@idle_a", anim = "idle_a" } },
            { label = "Sit", type = "anim", data = { lib = "anim@heists@prison_heistunfinished_biztarget_idle", anim = "target_idle" } },
            { label = "Sit on Floor", type = "scenario", data = { anim = "WORLD_HUMAN_PICNIC" } },
            { label = "Lean", type = "scenario", data = { anim = "world_human_leaning" } },
            { label = "Sunbathe (back)", type = "scenario", data = { anim = "WORLD_HUMAN_SUNBATHE_BACK" } },
            { label = "Sunbathe (chest)", type = "scenario", data = { anim = "WORLD_HUMAN_SUNBATHE" } },
            { label = "Clean", type = "scenario", data = { anim = "world_human_maid_clean" } },
            { label = "Barbecue", type = "scenario", data = { anim = "PROP_HUMAN_BBQ" } },
            { label = "Search", type = "anim", data = { lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female" } },
            { label = "Take a Selfie", type = "scenario", data = { anim = "world_human_tourist_mobile" } },
            { label = "Listen", type = "anim", data = { lib = "mini@safe_cracking", anim = "idle_base" } },
        }
    },

    -- {
    -- 	name  = 'porn',
    -- 	label = 'Mature',
    -- 	items = {
    --     {label = "Homme se faire su*** en voiture", type = "anim", data = {lib = "oddjobs@towing", anim = "m_blow_job_loop"}},
    --     {label = "Femme faire une gaterie en voiture", type = "anim", data = {lib = "oddjobs@towing", anim = "f_blow_job_loop"}},
    --     {label = "Homme bais** en voiture", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_sex_loop_player"}},
    --     {label = "Femme bais** en voiture", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_sex_loop_female"}},
    --     {label = "Se gratter les couilles", type = "anim", data = {lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch"}},
    --     {label = "Faire du charme", type = "anim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_02"}},
    --     {label = "Pose michto", type = "scenario", data = {anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}},
    --     {label = "Montrer sa poitrine", type = "anim", data = {lib = "mini@strip_club@backroom@", anim = "stripper_b_backroom_idle_b"}},
    --     {label = "Strip Tease 1", type = "anim", data = {lib = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", anim = "ld_girl_a_song_a_p1_f"}},
    --     {label = "Strip Tease 2", type = "anim", data = {lib = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2"}},
    --     {label = "Stip Tease au sol", type = "anim", data = {lib = "mini@strip_club@private_dance@part3", anim = "priv_dance_p3"}},
    -- 		}
    -- },

}