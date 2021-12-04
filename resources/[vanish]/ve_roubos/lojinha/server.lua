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
src = {}
Tunnel.bindInterface("ve_lojinha",src)
vCLIENT = Tunnel.getInterface("ve_lojinha")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbery = false
local timedown = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookdepartamento = "https://discord.com/api/webhooks/778094302697095188/HxVoWrC84mJJ_F0-q6aal6ITHnSK1lFtExjNOrXSjv3bhP2wDTL3QA7E5NCo9hB_g4Na"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbers = {
	[1] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 80000, ['rewmax'] = 130000 ,["timedown"] = 70 },
	[2] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 80000, ['rewmax'] = 130000 ,["timedown"] = 70 },
	[3] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 80000, ['rewmax'] = 130000 ,["timedown"] = 70 },
	[4] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 80000, ['rewmax'] = 130000 ,["timedown"] = 70 },
	[5] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 80000, ['rewmax'] = 130000 ,["timedown"] = 70 },
	[6] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 80000, ['rewmax'] = 130000 ,["timedown"] = 70 },
	[7] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 80000, ['rewmax'] = 130000 ,["timedown"] = 70 },
	[8] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 80000, ['rewmax'] = 130000 ,["timedown"] = 70 },
	[9] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 120000, ['rewmax'] = 160000 ,["timedown"] = 70 },
	[10] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 120000, ['rewmax'] = 160000 ,["timedown"] = 70 },
	[11] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 120000, ['rewmax'] = 160000 ,["timedown"] = 70},
	[12] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 120000, ['rewmax'] = 160000  ,["timedown"] = 70 } 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPolice(id)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia < 0 then
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.",8000)
			return false
		elseif	(os.time()-timedown) <= robbers[id]["timedown"] then
			TriggerClientEvent("Notify",source,"aviso","Os cofres estão vazios, aguarde <b>"..vRP.format(parseInt(robbers[id]["timedown"]-(os.time()-timedown))).." segundos</b> até que os civis efetuem depositos.",8000)
			return false
		end
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobbery(id,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		robbery = true
		timedown = os.time()
		vCLIENT.startRobbery(source,robbers[id].seconds,x,y,z)
		TriggerClientEvent("vrp_sound:source",source,'alarm',0.1)
		vRPclient.setStandBY(source,parseInt(10))

		local policia = vRP.getUsersByPermission("policia.permissao")
		for k,v in pairs(policia) do
			local policial = vRP.getUserSource(v)
			if policial then
				async(function()
					vCLIENT.startRobberyPolice(policial,x,y,z,robbers[id].place)
					vRPclient.playSound(policial,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
					TriggerClientEvent('chatMessage',policial,"911",{64,64,255},"O roubo começou no ^1"..robbers[id].place.."^0, dirija-se até o local e intercepte os assaltantes.")
				end)
			end
		end
		SendWebhookMessage(webhookdepartamento,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		SetTimeout(robbers[id].seconds*1000,function()
			if robbery then
				robbery = false
				vRP.searchTimer(user_id,900)
				vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(math.random(robbers[id].rewmin,robbers[id].rewmax)))
				for k,v in pairs(policia) do
					local policial = vRP.getUserSource(v)
					if policial then
						async(function()
							vCLIENT.stopRobberyPolice(policial)
							TriggerClientEvent('chatMessage',policial,"911",{64,64,255},"O roubo terminou, os assaltantes estão correndo antes que vocês cheguem.")
						end)
					end
				end
			end
		end)

	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.stopRobbery()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if robbery then
			robbery = false
			local policia = vRP.getUsersByPermission("policia.permissao")
			for k,v in pairs(policia) do
				local policial = vRP.getUserSource(v)
				if policial then
					async(function()
						vCLIENT.stopRobberyPolice(policial)
						TriggerClientEvent('chatMessage',policial,"911",{64,64,255},"O assaltante saiu correndo e deixou tudo para trás.")
					end)
				end
			end
		end
	end
end