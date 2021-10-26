fx_version 'cerulean'
game 'gta5'

dependency {
    'blip_info',
    'mysql-async'
}

client_script "cl_emergencyblips.lua"
server_script "sv_emergencyblips.lua"
