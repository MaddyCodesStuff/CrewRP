description "Extended Banking"

version '1.0.0'

ui_page "html/ui.html"

client_scripts {
    "@es_extended/locale.lua",
    "locales/de.lua",
    "locales/br.lua",
    "locales/en.lua",
    "locales/fr.lua",
    "locales/es.lua",
    "esx_banking_cl.lua",
    "cfg/banking.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "locales/de.lua",
    "locales/br.lua",
    "locales/en.lua",
    "locales/fr.lua",
    "locales/es.lua",
    "esx_banking_sv.lua",
    "cfg/banking.lua",
}

files {
    "html/ui.html",
    "html/scripts.js",
    "html/bootstrap.min.js",
    "html/style.css",
    "html/bootstrap.min.css",
    "html/glyphicons-halflings-regular.eot",
    "html/glyphicons-halflings-regular.ttf",
    "html/glyphicons-halfings-regular.woff",
    "html/glyphicons-halflings-regular.woff2",
    "cfg/banking.lua",
    "html/debounce.min.js"
}