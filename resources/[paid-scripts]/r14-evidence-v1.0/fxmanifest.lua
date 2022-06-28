fx_version 'cerulean'
game 'gta5'

description 'r14-evidence'
version '1.0'

escrow_ignore {
  'r14-evidence/*.lua', -- ignore all lua
  'r14-evidence/client/*.lua', -- ignore all lua
  'r14-evidence/client/*.ytd', -- ignore all lua
  'r14-evidence/client/*.js', -- ignore all lua
  'r14-evidence/client/*.html', -- ignore all lua  
  'r14-evidence/server/*.lua', -- ignore all lua
  'r14-evidence/**/**', -- ignore all lua
  'qb-smallresources/**/*.lua', -- ignore all lua
  'script/*.lua', -- ignore all lua
  'script/*.txt', -- ignore all lua
  'inventory/*.png', -- ignore all lua
}

lua54 'yes'
dependency '/assetpacks'