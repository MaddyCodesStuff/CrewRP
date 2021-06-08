resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Prison Uniforms'

version '1.0.0'

server_scripts {
    '@es_extended/locale.lua',
    'en.lua',
    'config.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'en.lua',
    'config.lua',
    'client.lua'
}

dependencies {
    'es_extended'
}