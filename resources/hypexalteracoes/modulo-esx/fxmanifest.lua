fx_version "adamant"
game "gta5"

name "Flux Anticheat"
author "suporte@fluxanticheat.com"
description "www.fluxanticheat.com"

dependency "es_extended"

client_script {
	"client.lua"
}

server_script {
	"@mysql-async/lib/MySQL.lua",
	"esx.lua",
	"server.lua"
}
