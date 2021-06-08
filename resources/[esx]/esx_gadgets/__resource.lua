resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Gadgets'

server_scripts {
	'server/main.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
}

client_scripts {
	'client/main.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
}
