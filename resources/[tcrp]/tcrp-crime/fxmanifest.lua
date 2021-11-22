fx_version 'cerulean'
games {'rdr3', 'gta5'}

author 'Kaia'
description 'TCRP crime resource'
version '1.0.0'

client_script {
    '/StoreRobbery/client/*',
    '/Shared/client/*',
    'StoreRobbery/storeconfig.lua'
}

server_scripts {
    '/StoreRobbery/server/*',
    '/Shared/server/*',
    'StoreRobbery/storeconfig.lua'
}