resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Woke City Garage Systeem'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/impound.lua',
	'server/main.lua'
}
client_script {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'vehicle_names.lua',
	'client/impound.lua',
	'client/gui.lua',
	'client/main.lua'
}
