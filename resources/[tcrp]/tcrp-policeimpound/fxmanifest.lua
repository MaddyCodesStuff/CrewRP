fx_version 'cerulean'
games { 'gta5' }
author 'citRa'
description 'TCRP Police Impound - Tisk Tisk'

version '1.0.0'

server_scripts {
    'server/main.lua',
    'server/heist.lua',
    '@mysql-async/lib/MySQL.lua',
}

client_scripts {
    'client/main.lua',
    'client/heist.lua',
}

shared_scripts {
    'config.lua',
}

files {
    'client/nui/app.js',
    'client/nui/index.html',
    'client/nui/style.css',
    'client/nui/screen.png',
}

ui_page 'client/nui/index.html'