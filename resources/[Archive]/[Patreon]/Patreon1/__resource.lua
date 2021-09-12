resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
 
files {
    'data/vehicles.meta',
    'data/carvariations.meta',
    'data/carcols.meta',
    'data/handling.meta',
    'data/vehiclelayoutsr35.meta',
	'data/vehiclelayoutscp9a.meta',
    'data/dlctext.meta',
    'data/contentunlocks.meta',
    'data/shopvehicle.meta',
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayoutsr35.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayoutscp9a.meta'

client_script 'data/vehicle_names.lua'
