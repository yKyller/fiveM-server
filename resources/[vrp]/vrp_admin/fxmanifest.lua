
fx_version 'bodacious'
game 'gta5'

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua",
	"vs_client.lua",
}

server_scripts {
	"@vrp/lib/utils.lua",
	'@mysql-async/lib/MySQL.lua',
	"server.lua",
	"vs_server.lua",
}

dependencies {
    'mysql-async'
}