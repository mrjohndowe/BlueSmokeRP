fx_version 'cerulean'
games {'gta5'}

author 'Sonoran Software Systems'
real_name 'Power Grid'
description 'Standalone Power System'
version '1.0.0'
config_version '1.0'

lua54 'yes'

shared_scripts {'config.lua', 'shared/shared.lua'}

server_scripts {'server/server.lua', 'server/permissions.lua', 'server/update.lua', 'server/util/unzip.js'}

client_scripts {'client/client.lua', 'client/placement_gun.lua', 'client/link_gun.lua'}

files {'stream/**/*.ytyp', 'nui/app.js', 'nui/index.html', 'nui/style.css', 'nui/sonoran.png'}

data_file 'DLC_ITYP_REQUEST' 'stream/**/*.ytyp'

escrow_ignore {'config.CHANGEME.lua', 'cameras.CHANGEME.json', 'package.json'}

ui_page 'nui/index.html'

dependency '/assetpacks'