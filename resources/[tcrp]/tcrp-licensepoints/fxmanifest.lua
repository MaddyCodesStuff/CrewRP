fx_version 'bodacious'
games { 'gta5' }
author 'citRa'
description 'TCRP License Points - DRIVE GEWD'

version '1.0.0'

server_scripts {
    'server/main.lua',
    '@mysql-async/lib/MySQL.lua',
}

client_scripts {
    'client/main.lua',
}

shared_scripts {
    'config.lua',
}