fx_version 'cerulean'
games { 'gta5' }

author 'Luxcoding'
version '1.0.0'

lua54 'yes'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}