fx_version 'bodacious'
games { 'gta5' }

name 'TheCrewRP Character Creator/Selector'
description 'Character creator/selector for TheCrewRP'

ui_page {
    'html/characterSelection.html'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
}

client_scripts {
    'client/main.lua',
}

files {
    'config.lua',
    'html/characterSelection.html',
    'html/css/characterSelection.css',
    'html/img/logo.png',
    'html/js/script.js',
}
