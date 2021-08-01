fx_version 'cerulean'
game 'gta5'

author 'Kunai'
description 'Handles Map Blips'
version '1.0.0'

dependency {
    'blip_info',
    'mysql-async'
}

client_script 'client.lua'

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}
shared_scripts {
    'config.lua',
    'emergencyconfig.lua'
}