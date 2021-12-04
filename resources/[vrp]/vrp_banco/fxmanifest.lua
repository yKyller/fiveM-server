
fx_version 'bodacious'
game 'gta5'

dependencies {
	'vrp',
	'vrp_ghmattimysql'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/ui.css',
	'html/ui.js',
}

client_script {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts{ 
	"@vrp/lib/utils.lua",
	"server.lua"
}
