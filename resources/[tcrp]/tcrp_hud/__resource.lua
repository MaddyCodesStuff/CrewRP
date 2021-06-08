resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'TCR Survival Hud'

version '1.0'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/main.lua',
}

ui_page {
    'ui/index.html',
}

files {
    'client/client.lua',
    'ui/index.html',
    'ui/css/style.css',
    'ui/css/all.css',
    'ui/js/app.js',
    'ui/webfonts/fa-brands-400.eot',
    'ui/webfonts/fa-brands-400.svg',
    'ui/webfonts/fa-brands-400.ttf',
    'ui/webfonts/fa-brands-400.woff',
    'ui/webfonts/fa-brands-400.woff2',
    'ui/webfonts/fa-regular-400.eot',
    'ui/webfonts/fa-regular-400.svg',
    'ui/webfonts/fa-regular-400.ttf',
    'ui/webfonts/fa-regular-400.woff',
    'ui/webfonts/fa-regular-400.woff2',
    'ui/webfonts/fa-solid-900.eot',
    'ui/webfonts/fa-solid-900.svg',
    'ui/webfonts/fa-solid-900.woff',
    'ui/webfonts/fa-solid-900.woff2',
}

dependencies {
    'baseevents'
}
