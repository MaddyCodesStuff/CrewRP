-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Madison Tinsley/ Kaia'
description 'quick eye color setter'
version '1.0.0'

-- What to run
client_scripts {
    '@mysql-async/lib/MySQL.lua',
    'client.lua'

}
server_script 'server.lua'
