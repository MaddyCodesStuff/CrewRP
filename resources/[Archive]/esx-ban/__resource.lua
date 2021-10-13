resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Ban Tool'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua',

}

dependency 'essentialmode'