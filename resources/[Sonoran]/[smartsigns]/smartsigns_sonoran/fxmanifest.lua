fx_version 'bodacious'
game 'gta5'

author 'London Studios'
description 'Setup and control dynamic traffic signs'
version '1.3.3'

client_scripts {
    'cl_config.lua',
    'cl_utils.lua',
    'cl_smartsigns.lua',
}

server_scripts {
    'config.lua',
    'sv_smartsigns.lua',
    'auth.lua',
}

files {
    'stream/data/*.ytyp',
}

lua54 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/data/*.ytyp'

escrow_ignore {
    'config_RENAMEME.lua',
    'version_smartsigns.json'
}

dependency '/assetpacks'