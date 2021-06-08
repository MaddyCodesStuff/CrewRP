fx_version 'bodacious'
games { 'gta5' }

description 'TCRP Properties - We do it better'

version '1.0.3'

ui_page {
    'nui/main.html'
}

files {
    'nui/css/main.css',
    'nui/img/bg.jpg',
    'nui/img/logo.svg',
    'nui/img/logo_black.svg',
    'nui/js/main.js',
    'nui/main.html'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua'
}
