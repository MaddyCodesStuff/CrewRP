resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

name 'Mythic Framework Notification System'
author 'Alzar - https://github.com/Alzar'
version 'v1.0.4'

ui_page {
    'html/ui.html',
}

files {
    'html/ui.html',
    'html/js/app.js',
    'html/css/style.css',
    'html/css/all.css',
    'html/webfonts/fa-brands-400.eot',
    'html/webfonts/fa-brands-400.svg',
    'html/webfonts/fa-brands-400.ttf',
    'html/webfonts/fa-brands-400.woff',
    'html/webfonts/fa-brands-400.woff2',
    'html/webfonts/fa-regular-400.eot',
    'html/webfonts/fa-regular-400.svg',
    'html/webfonts/fa-regular-400.ttf',
    'html/webfonts/fa-regular-400.woff',
    'html/webfonts/fa-regular-400.woff2',
    'html/webfonts/fa-solid-900.eot',
    'html/webfonts/fa-solid-900.svg',
    'html/webfonts/fa-solid-900.woff',
    'html/webfonts/fa-solid-900.woff2',
}

client_scripts {
    'client/main.lua',
    'client/depracated.lua'
}

exports {
    'SendAlert',
    'PersistentAlert',
}

--[[ WARNING: These are depracated and may be removed at a future date, Suggest not using it ]]
exports {
    'DoShortHudText',
    'DoHudText',
    'DoLongHudText',
    'DoCustomHudText',
    'PersistentHudText'
}