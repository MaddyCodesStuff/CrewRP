fx_version 'adamant'

game 'gta5'

description 'Mx Tattoos'

version '1.0'

ui_page 'html/index.html'

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    'server/*'
}

client_scripts {
    'client/*'
}

files {
	'html/index.html',
	'html/css/*.css',
	'html/js/*.js',
	'html/img/*.png',
}
