ui_page 'html/index.html'

files {
    'html/index.html',
    'html/static/css/app.css',
    'html/static/js/app.js',
    'html/static/js/manifest.js',
    'html/static/js/vendor.js',

    'html/static/config/config.json',

    -- Coque
    'html/static/img/coque/s8.png',
    'html/static/img/coque/iphonex.png',
    'html/static/img/coque/base.png',
    'html/static/img/coque/transparent.png',
    'html/static/img/coque/iPhoneXI.png',
    'html/static/img/coque/GP4.png',
    'html/static/img/coque/SGS20.png',
    'html/static/img/coque/LGV50.png',
    'html/static/img/coque/LGG8X.png',

    -- Background
    'html/static/img/background/back001.jpg',
    'html/static/img/background/back002.jpg',
    'html/static/img/background/back003.jpg',

    'html/static/img/icons_app/call.png',
    'html/static/img/icons_app/contacts.png',
    'html/static/img/icons_app/sms.png',
    'html/static/img/icons_app/settings.png',
    'html/static/img/icons_app/menu.png',
    'html/static/img/icons_app/stock.png',
    'html/static/img/icons_app/tchat.png',
    'html/static/img/icons_app/photo.png',
    'html/static/img/icons_app/bank.png',
    'html/static/img/icons_app/9gag.png',
    'html/static/img/icons_app/twitter.png',

    'html/static/img/app_bank/logo_mazebank.jpg',

    'html/static/img/app_tchat/splashtchat.png',

    'html/static/img/twitter/bird.png',
    'html/static/img/twitter/default_profile.png',
    'html/static/sound/Twitter_Sound_Effect.ogg',

    'html/static/img/courbure.png',
    'html/static/fonts/fontawesome-webfont.ttf',

    -- Ringtone
    'html/static/sound/ring.ogg',
    'html/static/sound/ring2.ogg',
    'html/static/sound/iPhoneRing.ogg',
    'html/static/sound/Conga-Ringtone.ogg',
    'html/static/sound/Sax.ogg',
    'html/static/sound/Summer-Ringtone-Bensound.ogg',
    'html/static/sound/Zip_Chord_Ringer.ogg',
    'html/static/sound/tchatNotification.ogg',
    'html/static/sound/Phone_Call_Sound_Effect.ogg'
}

client_script {
    "config.lua",
    "client/animation.lua",
    "client/client.lua",

    "client/photo.lua",
    "client/app_tchat.lua",
    "client/bank.lua",
    "client/twitter.lua"
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    "config.lua",
    "server/server.lua",

    "server/app_tchat.lua",
    "server/twitter.lua"
}
