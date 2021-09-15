fx_version 'cerulean'
game 'gta5'

author 'Kaia'
description "Vehicle registration because people can't be trusted"

dependency {
    'mysql-async'
}

client_scripts {
    'client.lua'
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}
shared_scripts {

}