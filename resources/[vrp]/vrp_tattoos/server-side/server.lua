local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPts = {}
Tunnel.bindInterface("vrp_tattoos",vRPts)
Proxy.addInterface("vrp_tattoos",vRPts)
TSclient = Tunnel.getInterface("vrp_tattoos")

local cfg = module("vrp_tattoos","config-side/tattoos")

function vRPts.updateTattoo(atualTattoo)
	local source = source
	local user_id = vRP.getUserId(source)
	local custom = atualTattoo
	vRP.setUData(user_id,"vRP:tattoos",json.encode(custom))
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
		-- build_client_tattooshops(source)
		local custom = {}
		local data = vRP.getUData(user_id,"vRP:tattoos")
		if data then
			custom = json.decode(data)
			-- print(custom)
			-- print(json.decode(data))
			-- TriggerClientEvent("vrp_tattoos:setTattoos",source,custom)
			TSclient.setTattoos(source,custom)
		end
	end
end)