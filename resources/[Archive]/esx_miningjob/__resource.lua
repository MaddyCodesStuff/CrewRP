resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Mining Hobby'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'config.lua',
}
