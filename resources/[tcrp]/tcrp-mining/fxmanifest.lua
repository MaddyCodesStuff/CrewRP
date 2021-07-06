fx_version 'adamant'
games { 'gta5' }

description 'TCRP Mining Hobby'

shared_scripts {
  'config.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'config.lua',
}