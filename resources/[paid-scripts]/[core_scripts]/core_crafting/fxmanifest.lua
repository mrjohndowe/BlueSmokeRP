
fx_version 'adamant'
game 'gta5'
description 'core_crafting'
version '2.1.0'

ui_page 'html/form.html'

lua54 'yes'

files {
	'html/form.html',
	'html/css.css',
	'html/water.png',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
}

client_scripts{
    'config.lua',
    'client/main.lua',
}

server_scripts{
    'config.lua',
    'server/main.lua',
}


shared_scripts {
    'config.lua',
	'@qb-core/import.lua'
}