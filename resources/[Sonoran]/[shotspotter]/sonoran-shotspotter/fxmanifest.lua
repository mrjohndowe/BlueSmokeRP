fx_version "cerulean"
games {"gta5"}
author "Sonoran Software"
version "1.2.1"
config_version "1.2"
real_name "Shot Spotter"

lua54 "yes"

client_scripts {"client/*.lua"}

server_scripts {"server/*.lua", "server/util/unzip.js"}

shared_script {"config/*.lua", "config/*.json"}

files {"stream/*.ytyp"}

data_file "DLC_ITYP_REQUEST" "stream/*.ytyp"

escrow_ignore {"config/config.CHANGEME.lua", "config/spotters.CHANGEME.json"}

dependency '/assetpacks'