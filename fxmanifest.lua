fx_version 'cerulean'
game 'gta5'

description 'ESX Tsunami - QB > ESX Conversion'
name 'esx-tsunami'
developer 'PrivateGiles - QB owner: Strez'
version 'v1.1'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'cd_easytime', -- Used for time management & Tsunami weather changes
}


lua54 'yes'
