-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP UTILS
-----------------------------------------------------------------------------------------------------------------------------------------	
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP")
--vCLIENT = Tunnel.getInterface("vrp_names")
vRPNames = {}
Tunnel.bindInterface("vrp_names",vRPNames)
Proxy.addInterface("vrp_names",vRPNames)
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookids = "https://discord.com/api/webhooks/778092045859291176/mADXNylfthCpgOgbRMS4kB-nrKa6a_lsEzXLsz3VbsQU2qNIsEIvyfKOqHlg2m9_AFls"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- USER ADMIN PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------	
function vRPNames.isAdmin()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return (vRP.hasPermission(user_id,"ceo.permissao"))
	end
	return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- GET USER ID AND STEAMHEX
-----------------------------------------------------------------------------------------------------------------------------------------	
function vRPNames.getId(sourceplayer)
	if sourceplayer ~= nil and sourceplayer ~= 0 then
		local user_id = vRP.getUserId(sourceplayer)
		if user_id then
			return user_id
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- REPORT LOG WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPNames.reportLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookids,"```prolog\n[ID]: "..user_id.." Usou o comando wall \n[STATUS]: ".. toggle ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end