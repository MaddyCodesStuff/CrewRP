resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'TCRP Harvest'

version '1.0.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua',
}

dependencies {
    'es_extended'
}
