local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local webhookadmin = "https://discord.com/api/webhooks/778092045859291176/mADXNylfthCpgOgbRMS4kB-nrKa6a_lsEzXLsz3VbsQU2qNIsEIvyfKOqHlg2m9_AFls"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- Start/Stop Resources
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('startR',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"kyller.permissao") then
			StartResource(tostring(args[1]))
			TriggerClientEvent('chatMessage',source,"SR: ",{255,0,0},"Started "..args[1])
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ATIVOU A RESOURCE]: "..args[1].."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
		end
	end
end)
RegisterCommand('stopR',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"kyller.permissao") then
			StopResource(tostring(args[1]))
			TriggerClientEvent('chatMessage',source,"SR: ",{255,0,0},"Stoped "..args[1])
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESATIVOU A RESOURCE]: "..args[1].."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
		end
	end
end)
RegisterCommand('restartR',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"kyller.permissao") then
			StopResource(tostring(args[1]))
			StartResource(tostring(args[1]))
			TriggerClientEvent('chatMessage',source,"SR: ",{255,0,0},"Started "..args[1])
			TriggerClientEvent('chatMessage',source,"SR: ",{255,0,0},"Stoped "..args[1])
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RESTARTOU A RESOURCE]: "..args[1].."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
		end
	end
end)