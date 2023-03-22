fx_version 'cerulean'
game 'gta5'
name 'hyon_fallentrees'
version      '1.1.0'
description 'Fallen Trees'

lua54 'yes'

shared_script 'config.lua'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependency 'qb-core'