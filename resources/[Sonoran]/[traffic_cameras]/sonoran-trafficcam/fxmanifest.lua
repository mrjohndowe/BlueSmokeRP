fx_version 'cerulean'
games {'gta5'}

author 'Sonoran Software Systems'
real_name 'Traffic Cameras'
description 'Standalone Traffic Camera/ALPR System'
version '2.1.0'
config_version '2.4'

lua54 'yes'

shared_scripts {'config.lua', 'shared/shared.lua'}

server_scripts {'server/server.lua', 'server/permissions.lua', 'server/update.lua', 'server/util/unzip.js',
                'discord.CHANGEME.lua'}

client_scripts {'client/client.lua', 'client/placement_gun.lua'}

files {'stream/**/*.ytyp'}

data_file 'DLC_ITYP_REQUEST' 'stream/**/*.ytyp'

escrow_ignore {'config.CHANGEME.lua', 'cameras.CHANGEME.json', 'package.json', 'discord.CHANGEME.lua'}

dependency '/assetpacks'