fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'A resource providing a jump rescue cushion'
version '1.0.0'
lua54 'yes'

files {
    'stream/rescuecushion.ytyp',
}

client_scripts {
    'cl_utils.lua',
    'cl_rescuecushion.lua',
}

server_scripts {
    'sv_rescuecushion.lua',
}

escrow_ignore {
    'config.lua',
    'stream/**',
    'sv_rescuecushion.lua',
    'cl_utils.lua',
}

shared_script 'config.lua'

data_file 'DLC_ITYP_REQUEST' 'stream/rescuecushion.ytyp'
dependency '/assetpacks'