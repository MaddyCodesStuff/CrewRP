fx_version 'cerulean'
games { 'gta5' }

author 'Kaia'
description 'TCRP QTE Resource'
version '0.0.1'
client_scripts {
    './client/*'
}
server_scripts{
    './server/*'
}
shared_scripts{
    'config.lua'
}
ui_page 'ui/index.html'

files{
    '/ui/qte.js',
    '/ui/index.html',
    '/ui/styles.css'
}