
fx_version 'adamant'
game 'gta5'

author 'C8RE'
description 'Create your own Drugs and asign effects'
version '1.3'

ui_page 'html/form.html'

lua54 'yes'

files {
	'html/form.html',
	'html/css.css',
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
    'UsableItems.lua'
}