fx_version 'adamant'

game 'gta5'

description 'Disc JobCars'

version '1.0.0'

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    'config.lua',
    'server/main.lua'
}
