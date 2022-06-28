fx_version 'cerulean'
game 'gta5'
author 'QP scripts - Territories'

lua54 'yes'

escrow_ignore {
    'config.lua',
    'colors-rgb.lua',
}

shared_script {
    'utils.lua',
    'config.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    'colors-rgb.lua',
    'client/main.lua',
}


server_scripts {
    '@mysql-async/lib/MySQL.lua', --comment if you dont want use esx
    --'@oxmysql/lib/MySQL.lua', --use it if you have the oxmysql latest version for qb-core
    'server/main.lua',
}

dependencies{
    'PolyZone'
}
dependency '/assetpacks'