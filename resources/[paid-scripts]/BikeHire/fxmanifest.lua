fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'A resource to add bike hire docks around the map'
version '2.0.0'
lua54 'yes'

files {
     'stream/hiredock.ytyp',
}

shared_script 'config.lua'

client_scripts {
    'cl_utils.lua',
    'cl_bikehire.lua',
}

server_scripts {
    'sv_bikehire.lua',
    'sv_utils.lua'
}

escrow_ignore {
    'stream/**',
    'cl_utils.lua',
    'config.lua',
    'sv_bikehire.lua',
    'photoshopFiles/**',
    'sv_utils.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/hiredock.ytyp'
dependency '/assetpacks'