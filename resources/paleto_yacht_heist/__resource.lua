resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description "av8rgeek's Yacht Heist"

version '1.0.0'

dependency 'bob74_ipl'
dependency 'mhacking'
dependency 'utk_fingerprint'
dependency 'mythic_notify'
dependency 'mythic_progbar'
dependency 'esx_securitycam'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua',
    'client/main.lua'
}
