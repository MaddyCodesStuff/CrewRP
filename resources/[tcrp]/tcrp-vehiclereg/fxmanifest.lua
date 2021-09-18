fx_version 'cerulean'
game 'gta5'

author 'Kaia'
description "Vehicle registration because people can't be trusted"

dependency {
    'mysql-async'
}

client_scripts {
    'client.lua',
    'config.lua'
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    'config.lua'
}
shared_scripts {

}