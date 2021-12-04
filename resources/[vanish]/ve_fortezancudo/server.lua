-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
pcy = {}
Tunnel.bindInterface("ve_fortezancudo",pcy)
vCLIENT = Tunnel.getInterface("ve_fortezancudo")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local roubos = false
local timedown = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookfortezancudo = "https://discord.com/api/webhooks/867291173176475668/tYHLCGs_lJoPJQOZjI1rmlihH2vZsoVZBwOwpAJB-Lox06fJLlNsKLbf0UIC-SvAOBbY"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUBOS
-----------------------------------------------------------------------------------------------------------------------------------------
local roubositemlist = {
	[1] = { ['place'] = "Forte Zancudo", ['seconds'] = 60, ['rewmin'] = 900000, ['rewmax'] = 1200000 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.checarPolicia()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia < 0 then
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.",8000)
			return false
		elseif (os.time()-timedown) <= 130 then
			TriggerClientEvent("Notify",source,"aviso","Os cofres estão vazios, aguarde <b>"..vRP.format(parseInt((130-(os.time()-timedown)))).." segundos</b> até que os civis efetuem depositos.",8000)
			return false
		end
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMEÇAR ROUBOS
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.comecarRoubos(id,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		roubos = true
		timedown = os.time()
		vCLIENT.comecarRoubos(source,roubositemlist[id].seconds,x,y,z)
		TriggerClientEvent("vrp_sound:source",source,'alarm',0.1)
		vRPclient.setStandBY(source,parseInt(60))

		local policia = vRP.getUsersByPermission("policia.permissao")
		for k,v in pairs(policia) do
			local policial = vRP.getUserSource(v)
			if policial then
				async(function()
					vCLIENT.comecarRoubosPolicia(policial,x,y,z,roubositemlist[id].place)
					vRPclient.playSound(policial,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
					TriggerClientEvent('chatMessage',policial,"911",{64,64,255},"O roubo começou no ^1"..roubositemlist[id].place.."^0, dirija-se até o local e intercepte os assaltantes.")
				end)
			end
		end
		SendWebhookMessage(webhookfortezancudo,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		SetTimeout(roubositemlist[id].seconds*1000,function()
			if roubos then
				roubos = false
				vRP.searchTimer(user_id,60)
				vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(math.random(roubositemlist[id].rewmin,roubositemlist[id].rewmax)))
				for k,v in pairs(policia) do
					local policial = vRP.getUserSource(v)
					if policial then
						async(function()
							vCLIENT.pararRoubosPolicia(policial)
							TriggerClientEvent('chatMessage',policial,"911",{64,64,255},"O roubo terminou, os assaltantes estão correndo antes que vocês cheguem.")
						end)
					end
				end
			end
		end)

	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Parar Roubos
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.pararRoubos()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if roubos then
			roubos = false
			local policia = vRP.getUsersByPermission("policia.permissao")
			for k,v in pairs(policia) do
				local policial = vRP.getUserSource(v)
				if policial then
					async(function()
						vCLIENT.pararRoubosPolicia(policial)
						TriggerClientEvent('chatMessage',policial,"911",{64,64,255},"O assaltante saiu correndo e deixou tudo para trás.")
					end)
				end
			end
		end
	end
end