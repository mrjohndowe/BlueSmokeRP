fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'Fire Tools resource'
version '1.0.0'
lua54 'yes'

client_scripts {
    'cl_utils.lua',
    'cl_firetools.lua',
}

server_scripts {
    -- "@vrp/lib/utils.lua",
    'sv_firetools.lua',
}

escrow_ignore {
    'config.lua',
    'sv_firetools.lua',
    'stream/**',
    'sounds/**',
    'index.html',
    'cl_utils.lua',
}

shared_script 'config.lua'

files {
    'index.html',
    'sounds/spreader.ogg',
    'sounds/fan.ogg', 
    'stream/firetools.ytyp',
}

ui_page 'index.html'

data_file 'DLC_ITYP_REQUEST' 'stream/firetools.ytyp'
dependency '/assetpacks'