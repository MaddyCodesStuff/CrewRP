resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

Discription "Tablet"

Version "0.2"

ui_page "nui/ui.html"

files {
    "nui/ui.html",
    "nui/style.css",
    "nui/app.js",
    "nui/bg.jpg",
    "nui/fancy-crap.css",
    "nui/fancy-crap.js",
    "nui/jquery.min/js",
    "nui/bootstrap.min.css",
    "nui/radio.js",
    "nui/radio.css",
    "nui/howler.core.js",
    "nui/html/_snake.html",
    "nui/html/snake.html",
    "nui/html/jobboard.html", -- hotkeys
    "nui/html/mdt.html", -- police mdt
    "nui/html/phonebook.html",
    "nui/html/yellowpages.html",
    "nui/html/classifieds.html",
    "nui/html/unpaidfines.html",
    --"nui/html/gtfkt.html",              -- get fekt  -- future puzzle
}

client_script "client.lua"
