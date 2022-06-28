fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'A realistic vehicle rescue experience'
version '1.0.0'
lua54 'yes'

files {
    'stream/prop_inflatablejack.ytyp',
}

client_scripts {
    'config.lua',
    'cl_utils.lua',
    'cl_vehiclerescue.lua',
}

server_scripts {
    'config.lua',
    'sv_vehiclerescue.lua',
}

escrow_ignore {
    'stream/*',
    'sv_vehiclerescue.lua',
    'config.lua',
    'cl_utils.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/prop_inflatable_jack.ytyp'

-- Join the London Studios Discord server here:
-- https://discord.gg/ND3JkdD5TN
dependency '/assetpacks'