--[[
ORIGINAL CODE BY ESX-ORG / ESX_POLICEJOB
EDITS BY CHIP W
]]

Locales['en'] = {
    -- Cloakroom
    ['cloakroom']                  = 'locker room',
    ['citizen_wear']               = 'civilian Outfit',
    ['laborer_wear']               = 'Laborer PPE',
    ['operator_wear']              = 'Operator PPE',
    ['foreman_wear']               = 'Foreman PPE',
    ['boss_wear']                  = 'Contractor PPE',
    ['no_outfit']                  = 'there\'s no outfit in the locker for you!',
    ['open_cloackroom']            = 'press ~INPUT_CONTEXT~ to put on ~y~PPE~s~.',

    -- Service
    ['service_max']                = 'take the day off, we already have enough guys on the job. : %s/%s',
    ['service_not']                = 'you have not ready for work! You\'ll have to put on your PPE first.',
    ['service_anonunce']           = 'service information',
    ['service_in']                 = 'welcome! time to get some work done',
    ['service_in_announce']        = 'worker ~y~%s~s~ has came to work!',
    ['service_out']                = 'you are done for the day. time to hit the Yellow Jack',
    ['service_out_announce']       = 'worker ~y~%s~s~ has left work.',


    -- Vehicles
    ['vehicle_menu']               = 'vehicle',
    ['vehicle_blocked']            = 'all available spawn points are currently blocked!',
    ['garage_prompt']              = 'press ~INPUT_CONTEXT~ to access the ~y~Vehicle Actions~s~.',
    ['garage_title']               = 'git\'r Done Vehicle Menu',
    ['garage_stored']              = 'stored',
    ['garage_notstored']           = 'not in garage',
    ['garage_storing']             = 'we\'re attempting to remove the vehicle, make sure no players are around it.',
    ['garage_has_stored']          = 'the vehicle has been stored in your garage',
    ['garage_has_notstored']       = 'no nearby owned vehicles were found',
    ['garage_notavailable']        = 'your vehicle is not stored in the garage.',
    ['garage_blocked']             = 'there\'s no available spawn points!',
    ['garage_empty']               = 'you dont have any vehicles in your garage.',
    ['garage_released']            = 'your vehicle has been released from the garage.',
    ['garage_store_nearby']        = 'there is no nearby vehicles.',
    ['garage_storeditem']          = 'open garage',
    ['garage_storeitem']           = 'store vehicle in garage',
    ['garage_buyitem']             = 'vehicle shop',
    ['shop_item']                  = '$%s',
    ['vehicleshop_title']          = 'vehicle Shop',
    ['vehicleshop_confirm']        = 'do you want to buy this vehicle?',
    ['vehicleshop_bought']         = 'you have bought ~y~%s~s~ for ~r~$%s~s~',
    ['vehicleshop_money']          = 'you cannot afford that vehicle',
    ['vehicleshop_awaiting_model'] = 'the vehicle is currently ~g~DOWNLOADING & LOADING~s~ please wait',
    ['confirm_no']                 = 'no',
    ['confirm_yes']                = 'yes',

    -- Prop Menu
    ['object_spawner']             = 'Construction Site Items',
    ['traffic_interaction']        = 'Construction Site Items',

    -- Prop List
    ['cone']                       = 'standard warning cone',
    ['cone_2']                     = 'tall warning cone',
    ['block_pallet_1']             = 'partial block pallet',
    ['block_pallet_2']             = 'full block pallet',
    ['block_pallet_3']             = 'large block pallet',
    ['steel_plate_stack']          = 'steel plates',
    ['road_work_ahead_barrier']    = 'road work ahead barrier',
    ['large_barrier']              = 'standard large barrier',
    ['cement_mixer']               = 'portable cement mixter',
    ['pallet_cement_bags']         = 'pallet of ready mix',
    ['steel_beam_stack']           = 'steel beam stack',
    ['load_steel_pipe']            = 'stacked steel pipe 1',
    ['load_steel_pipe_2']          = 'stacked steel pipe 2',
    ['load_concrete_pipe']         = 'stacked concrete pipe',
    ['rebar_pile']                 = 'stack of rebar',
    ['rebar_pipe']                 = 'formed rebar',
    ['wheel_barrow']               = 'wheelbarrow',
    ['wood_pile_1']                = 'wood plank stack',
    ['wood_pile_2']                = 'wood 4x6 stack',
    ['wood_pile_3']                = 'large wood plank stack',
    ['clean_plywood_pile']         = 'clean plywood stack',
    ['dirty_plywood_pile']         = 'dirty plywood stack',
    ['work_light']                 = 'portable work site light',
    ['barrel_barrier']             = 'standard road barrier barrel',
    ['small_barrier_1']            = 'tripod small barrier',
    ['small_barrier_2']            = 'tripod small barrier with light',
    ['uneven_pavement_sign']       = 'uneven pavement sign',
    ['medium_barrier']             = 'medium sawhorse barrier',
    ['medium_barrier_sign']        = 'medium sawhorse barrier with sign',
    ['small_generator']            = 'small generator',
    ['portable_generator']         = 'portable generator',
    ['portable_generator_lights']  = 'portable generator with lights',
    ['blue_plastic_barrel']        = 'blue plastic barrel',
    ['2_green_steel_barrels']      = '2 green steel barrels',
    ['3_blue_steel_barrels']       = '3 blue steel barrels',
    ['industrial_dumpster']        = 'dumpster',
    ['sempty_wooden_cable_spool']  = 'small empty spool',
    ['lempty_wooden_cable_spool']  = 'large empty spool',
    ['black_wooden_cable_spool']   = 'black cable spool',
    ['yellow_cable_spool']         = 'yellow cable spool',
    ['portajohn']                  = 'port-a-john',
    ['1_section_mesh_fence']       = 'single mesh fencing',
    ['2_section_mesh_fence']       = 'double mesh fencing',
    ['3_section_mesh_fence']       = 'tripple mesh fencing',
    ['portable_office']            = 'portable office',
    ['tool_container_1']           = 'red tool container',
    ['tool_container_2']           = 'blue tool container',
    ['tool_container_3']           = 'old tool container',

    -- Boss Menu
    ['open_bossmenu']              = 'press ~INPUT_CONTEXT~ to open the menu',
    ['quantity_invalid']           = 'invalid quantity',
    ['have_withdrawn']             = 'you have withdrawn ~y~%sx~s~ ~b~%s~s~',
    ['have_deposited']             = 'you have deposited ~y~%sx~s~ ~b~%s~s~',
    ['quantity']                   = 'quantity',
    ['inventory']                  = 'inventory',
    ['police_stock']               = 'police Stock',

    --Invoices
    ['gitrdone']                   = 'Git\'r Done Construction',
    ['billing']                    = 'Create Invoice',
    ['invoice_amount']             = 'amount To Charge Customer',

    -- Misc
    ['remove_prop']                = 'press ~INPUT_CONTEXT~ to delete the object',
    ['map_blip']                   = 'Git\'r Done Construction',

    -- Notifications
    ['alert_gitrdone']             = 'message GrD Construction',
    ['phone_gitrdone']             = 'GrD Construction'
}
