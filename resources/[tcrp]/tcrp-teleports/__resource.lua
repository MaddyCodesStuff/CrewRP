resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Elevator Script'

version '1.3.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'sv_main.lua'
}

client_scripts {
    'config.lua',
    'cl_main.lua'
}

dependencies {
    'es_extended'
}