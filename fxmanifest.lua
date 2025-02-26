fx_version 'cerulean'
game 'gta5'

description 'sk-overheid'

shared_script {
    '@ox_lib/init.lua',
    'config.lua',
    '@es_extended/imports.lua'
}

server_scripts {
    'server/*.lua'
}

client_script {
    'client/*.lua'
}

lua54 'yes'
use_fxv2_oal 'yes'
