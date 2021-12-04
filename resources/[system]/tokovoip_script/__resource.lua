dependency "hypexalteracoes" client_script "@hypexalteracoes/client.lua"  resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script "src/c_utils.lua"
client_script "client_config.lua"
client_script "src/c_main.lua"
client_script "src/c_TokoVoip.lua"
client_script "src/nuiProxy.js"

server_script "server_config.lua"
server_script "src/s_main.lua"
server_script "src/s_utils.lua"

ui_page "nui/index.html"

files({
    "nui/index.html",
    "nui/script.js",
    "nui/microphone.png",
})

export "setPlayerData"
export "getPlayerData"
export "refreshAllPlayerData"
export "addPlayerToRadio"
export "removePlayerFromRadio"
export "clientRequestUpdateChannels"
export "isPlayerInChannel"