fx_version { 'cerulean' }
games { 'gta5' }

author 'Kaia'

description 'TCRP legal and maybe illegal gundealers'

client_scripts {
    'legal/client/main.lua',
}

server_scripts {
    'legal/server/main.lua',
    "@mysql-async/lib/MySQL.lua",
}

shared_scripts {
    'legal/config.lua',
}