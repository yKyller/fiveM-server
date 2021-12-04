local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local cfg = module("vrp","cfg/armas")
local sanitizes = module("cfg/sanitizes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookadmin = "https://discord.com/api/webhooks/778092045859291176/mADXNylfthCpgOgbRMS4kB-nrKa6a_lsEzXLsz3VbsQU2qNIsEIvyfKOqHlg2m9_AFls"
local webhookfac = "https://discord.com/api/webhooks/778092045859291176/mADXNylfthCpgOgbRMS4kB-nrKa6a_lsEzXLsz3VbsQU2qNIsEIvyfKOqHlg2m9_AFls"
local webhookkeys = "https://discord.com/api/webhooks/778092045859291176/mADXNylfthCpgOgbRMS4kB-nrKa6a_lsEzXLsz3VbsQU2qNIsEIvyfKOqHlg2m9_AFls"
local webhookcds = "https://discord.com/api/webhooks/778092045859291176/mADXNylfthCpgOgbRMS4kB-nrKa6a_lsEzXLsz3VbsQU2qNIsEIvyfKOqHlg2m9_AFls"
local webhookblacklist = "https://discord.com/api/webhooks/778092045859291176/mADXNylfthCpgOgbRMS4kB-nrKa6a_lsEzXLsz3VbsQU2qNIsEIvyfKOqHlg2m9_AFls"
local webhookgod = "https://discord.com/api/webhooks/778092045859291176/mADXNylfthCpgOgbRMS4kB-nrKa6a_lsEzXLsz3VbsQU2qNIsEIvyfKOqHlg2m9_AFls"
local webhookspawn = "https://discord.com/api/webhooks/867270855490666496/Gl5amvj0HFMY7dC09wKsEx4AGMXZH6a4yF5b8F6tQdeCyhmFKEs2HPkb8dRmh3fiE7ap"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent("adminLogs:Armamentos")
AddEventHandler("adminLogs:Armamentos",function(weapon)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
    	SendWebhookMessage(webhookblacklist,"```prolog\n[BLACKLIST ARMAS]: "..user_id.." " .. "\n[ARMA]: " .. weapon ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")  
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local player_customs = {}
RegisterCommand('vroupas',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local custom = vRPclient.getCustomization(source)
    if not vRP.hasPermission(user_id,"admin.permissao") then
        if player_customs[source] then
            player_customs[source] = nil
        else 
            local content = ""
            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."\n"
            end

            player_customs[source] = true
            vRP.prompt(source,"Roupas:", content)
        end
    end
end)

RegisterCommand('playerids',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local admin = vRP.getUsersByPermission("admin.permissao")
    local suporte = vRP.getUsersByPermission("suporte.permissao")
    local mec = vRP.getUsersByPermission("mecanico.permissao")
    local policia = vRP.getUsersByPermission("grove.permissao")
    local paramedico= vRP.getUsersByPermission("ballas.permissao")
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
        if user_id then
            TriggerClientEvent('chatMessage',source,"ADMIN ONLINE:",{0,0,0},admin)
            TriggerClientEvent('chatMessage',source,"SUPORTE ONLINE:",{255,255,255},suporte)
            TriggerClientEvent('chatMessage',source,"MECANICO ONLINE:",{255,115,0},mec)
            TriggerClientEvent('chatMessage',source,"POLICIA ONLINE:",{0,0,255},policia)
            TriggerClientEvent('chatMessage',source,"PARAMEDICO ONLINE:",{255,0,255},paramedico)
        end
    end
end)

RegisterCommand('playerids2',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local crips = vRP.getUsersByPermission("crips.permissao")
    local bloods = vRP.getUsersByPermission("bloods.permissao")
    local vagos = vRP.getUsersByPermission("vagos.permissao")
    local grove = vRP.getUsersByPermission("grove.permissao")
    local ballas = vRP.getUsersByPermission("ballas.permissao")
    local triade = vRP.getUsersByPermission("triade.permissao")
    local siciliana = vRP.getUsersByPermission("siciliana.permissao")
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
        if user_id then
            TriggerClientEvent('chatMessage',source,"CRIPS ONLINE:",{0,0,255},crips)
            TriggerClientEvent('chatMessage',source,"BLOODS ONLINE:",{255,0,0},bloods)
            TriggerClientEvent('chatMessage',source,"VAGOS ONLINE:",{255,255,0},vagos)
            TriggerClientEvent('chatMessage',source,"GROVE ONLINE:",{0,255,0},grove)
            TriggerClientEvent('chatMessage',source,"BALLAS ONLINE:",{255,0,255},ballas)
            TriggerClientEvent('chatMessage',source,"TRIADE ONLINE:",{0,0,0},triade)
            TriggerClientEvent('chatMessage',source,"SICILIANA ONLINE:",{255,255,255},siciliana)
        end
    end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- Ativar/Desativar NPC
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('aNPC',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"ceo.permissao") then
			StopResource('npc_control')
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESATIVOU A RESOURCE]: npc_control "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
		end
	end
end)
RegisterCommand('dNPC',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"ceo.permissao") then
			StartResource('npc_control')
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ATIVOU A RESOURCE]: npc_control "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
		end
	end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- Start/Stop Resources
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand('startR',function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	local identity = vRP.getUserIdentity(user_id)
-- 	if user_id then
-- 		if vRP.hasPermission(user_id,"kyller.permissao") then
-- 			StartResource(tostring(args[1]))
-- 			TriggerClientEvent('chatMessage',"SR:",{255,255,255},"Started "..args[1])
-- 			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ATIVOU A RESOURCE]: "..args[1].."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
-- 		end
-- 	end
-- end)
-- RegisterCommand('stopR',function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	local identity = vRP.getUserIdentity(user_id)
-- 	if user_id then
-- 		if vRP.hasPermission(user_id,"kyller.permissao") then
-- 			StopResource(tostring(args[1]))
-- 			TriggerClientEvent('chatMessage',"SR:",{255,255,255},"Stoped "..args[1])
-- 			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESATIVOU A RESOURCE]: "..args[1].."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
-- 		end
-- 	end
-- end)
-- RegisterCommand('restartR',function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	local identity = vRP.getUserIdentity(user_id)
-- 	if user_id then
-- 		if vRP.hasPermission(user_id,"kyller.permissao") then
-- 			StopResource(tostring(args[1]))
-- 			StartResource(tostring(args[1]))
-- 			TriggerClientEvent('chatMessage',"SR:",{255,255,255},"Started "..args[1])
-- 			TriggerClientEvent('chatMessage',"SR:",{255,255,255},"Stoped "..args[1])
-- 			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RESTARTOU A RESOURCE]: "..args[1].."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEGAR FICHAS DO CASINO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fichas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local amount =  args[1]
	if user_id then
		if vRP.hasPermission(user_id,"pvp.permissao") then
			vRP.giveInventoryItem(user_id,"casinotoken",amount)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"pvp.permissao") then
			local mensagem = vRP.prompt(source,"Mensagem:","")
			local nome = vRP.prompt(source,"Nome:","")
			if mensagem == "" or nome == "" then
				return
			end
			TriggerClientEvent("Notify",-1,"negado",mensagem.."<br><b>Mensagem enviada por:</b> "..nome,60000)
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU MENSAGEM DE ADM]: "..mensagem.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Blips
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if first_spawn then
        blips[source] = { source }
       TriggerClientEvent("blips:updateBlips",-1,blips)
        if vRP.hasPermission(user_id,"blips.permissao") then
            TriggerClientEvent("blips:adminStart",source)
        end
     end
 end)

AddEventHandler("playerDropped",function()
	if blips[source] then
		blips[source] = nil
		TriggerClientEvent("blips:updateBlips",-1,blips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOQUE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('estoque',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"administrador.permissao") then
        if args[1] and args[2] then
            vRP.execute("creative/set_estoque",{ vehicle = args[1], quantidade = args[2] })
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o carro <b>"..args[1].."</b>.") 
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ADICIONOU AO ESTOQUE]: "..args[2].."x "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"administrador.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/add_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) }) 
            --vRP.execute("creative/set_ipva",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) })
            TriggerClientEvent("Notify",source,"sucesso","Voce adicionou o veículo <b>"..args[1].."</b> para o Passaporte: <b>"..parseInt(args[2]).."</b>.") 
            SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ADICIONOU]: "..args[1].." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('remcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"administrador.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/rem_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time())  }) 
            TriggerClientEvent("Notify",source,"sucesso","Voce removeu o veículo <b>"..args[1].."</b> do Passaporte: <b>"..parseInt(args[2]).."</b>.") 
            SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UNCUFF
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uncuff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"moderador.permissao") then
			TriggerClientEvent("admcuff",source)
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUEL
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fuel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"pvp.permissao") then
			TriggerClientEvent("admfuel",source)
		end	
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SYNCAREA
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limpararea',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
    if vRP.hasPermission(user_id,"pvp.permissao") or vRP.hasPermission(user_id,"polpar.permissao") then
        TriggerClientEvent("syncarea",-1,x,y,z)
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APAGAO
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('apagao',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"moderador.permissao") and args[1] ~= nil then
            local cond = tonumber(args[1])
            --TriggerEvent("cloud:setApagao",cond)
            TriggerClientEvent("cloud:setApagao",-1,cond)    
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COMANDO]: APAGAO "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")                
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ RAIOS ]-------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('raios', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"moderador.permissao") and args[1] ~= nil then
            local vezes = tonumber(args[1])
			TriggerClientEvent("cloud:raios",-1,vezes)
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COMANDO]: RAIOS POR "..args[1].." VEZES "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TROCAR SEXO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('skin',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"administrador.permissao") then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("skinmenu",nplayer,args[2])
                TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.")
				SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SKIN]: ALTEROU A SKIN DO ID "..args[1].." PARA "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            end
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('debug',function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"administrador.permissao") then
			TriggerClientEvent("ToggleDebug",player)
		end
	end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- DV
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			TriggerClientEvent('deletarveiculo',source,vehicle)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteveh")
AddEventHandler("trydeleteveh",function(index)
	TriggerClientEvent("syncdeleteveh",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEOBJ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
    TriggerClientEvent("syncdeleteobj",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local vehicle = vRPclient.getNearestVehicle(source,11)
	if vehicle then
		if vRP.hasPermission(user_id,"pvp.permissao") then 
			TriggerClientEvent('reparar',source)
			PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({username = botusername, content = "```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU FIX] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"}), { ['Content-Type'] = 'application/json' })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('god',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"pvp.permissao") then 
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                vRPclient.killGod(nplayer)
                vRPclient.setHealth(nplayer,400)
                TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
				PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({username = botusername, content = "```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU /GOD NO ID]: "..vRP.getUserId(nplayer).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"}), { ['Content-Type'] = 'application/json' })
            end
        else
            vRPclient.killGod(source)
            vRPclient.setHealth(source,400)
            TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
            PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({username = botusername, content = "```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU /GOD] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"}), { ['Content-Type'] = 'application/json' })
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('god2',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"pvp.permissao") then 
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                -- vRPclient.killGod(nplayer)
                vRPclient.setHealth(nplayer,400)
                TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
				PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({username = botusername, content = "```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU /GOD NO ID]: "..vRP.getUserId(nplayer).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"}), { ['Content-Type'] = 'application/json' })
            end
        else
            -- vRPclient.killGod(source)
            vRPclient.setHealth(source,400)
            TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
            PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({username = botusername, content = "```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU /GOD] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"}), { ['Content-Type'] = 'application/json' })
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GODSTREAMER
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('god2',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"streamer.permissao") then
        if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer,120)
				
                TriggerClientEvent("resetBleeding",nplayer)
				TriggerClientEvent("resetDiagnostic",nplayer)

            end
		else
            vRPclient.killGod(source)
			vRPclient.setHealth(source,120)

            TriggerClientEvent("resetBleeding",source)
			TriggerClientEvent("resetDiagnostic",source)
		end
    end
end)]]--
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('godall',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"moderador.permissao") then
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
            	vRPclient.killGod(id)
				vRPclient.setHealth(id,400)
				print(id)
            end
        end
		PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({username = botusername, content = "```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU /GODALL] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"}), { ['Content-Type'] = 'application/json' })
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('hash',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		TriggerClientEvent('vehash',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tunar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		TriggerClientEvent('vehtuning',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING APARENCIA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tunar2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		TriggerClientEvent('vehtuning2',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"pvp.permissao") then
			if args[1] then
				TriggerClientEvent('spawnarveiculo',source,args[1])
				TriggerEvent("setPlateEveryone",identity.registration)
				SendWebhookMessage(webhookspawn,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SPAWNOU]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN RG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('admrg',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"administrador.permissao") then
        local nuser_id = parseInt(args[1])
        local identity = vRP.getUserIdentity(nuser_id)
        local bankMoney = vRP.getBankMoney(nuser_id)
        local walletMoney = vRP.getMoney(nuser_id)
        local sets = json.decode(vRP.getUData(nuser_id,"vRP:datatable"))
        
        
        if args[1] then
           TriggerClientEvent("Notify",source,"importante","ID: <b>"..parseInt(nuser_id).."</b><br>Nome: <b>"..identity.name.." "..identity.firstname.."</b><br>Idade: <b>"..identity.age.."</b><br>Telefone: <b>"..identity.phone.."</b><br>Carteira: <b>"..vRP.format(parseInt(walletMoney)).."</b><br>Banco: <b>"..vRP.format(parseInt(bankMoney)).."</b><br>Sets: <b>"..json.encode(sets.groups).."</b>",5000)    
        else
            TriggerClientEvent("Notify",source,"negado","Digite o ID desejado!")

        end
    end
end)
----------------------------------------------------------------------------------------------------------------
-- RENAME
----------------------------------------------------------------------------------------------------------------
RegisterCommand('rename',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "pvp.permissao") then
		local idjogador = user_id
		if vRP.hasPermission(user_id, "ceo.permissao") then
        	idjogador = vRP.prompt(source, "Passaporte: ", "")
		end
        local nome = vRP.prompt(source, "Nome: ", "")
        local firstname = vRP.prompt(source, "Sobrenome: ", "")
        local idade = vRP.prompt(source, "Idade: ", "")
        local nplayer = vRP.getUserSource(parseInt(idjogador))

        if nplayer then

            local identity = vRP.getUserIdentity(parseInt(idjogador))
            if idjogador == "" or nome == "" or idade == "" then
                return
            else
                vRP.execute("vRP/update_user_identity",{ user_id = idjogador, firstname = firstname, name = nome, age = idade, registration = identity.registration, phone = identity.phone })
                TriggerClientEvent("Notify",nplayer,"sucesso","Identidade atualizada!")
                TriggerClientEvent("Notify",source,"sucesso","Identidade do ID: <b>"..parseInt(idjogador).."</b> alterada com sucesso!")
				SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RENAME]: ALTEROU O NOME DO ID "..idjogador.." PARA "..nome.." "..firstname..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")		
			end

        else
            TriggerClientEvent("Notify",source,"negado","O ID: <b>"..parseInt(idjogador).."</b> não está na cidade!")
        end        
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('ChatMe')
AddEventHandler('ChatMe',function(text)
    local user_id = vRP.getUserId(source)
    if user_id then
        TriggerClientEvent('DisplayMe',-1,text,source)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('wl',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"pvp.permissao") then
        if args[1] then
            vRP.setWhitelisted(parseInt(args[1]),true)
            TriggerClientEvent("Notify",source,"sucesso","Voce aprovou o passaporte <b>"..args[1].."</b> na whitelist.")
            SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[APROVOU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unwl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] then
			vRP.setWhitelisted(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce retirou o passaporte <b>"..args[1].."</b> da whitelist.")
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kick',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] then
			local id = vRP.getUserSource(parseInt(args[1]))
			if id then
				vRP.kick(id,"Você foi expulso da cidade.")
				TriggerClientEvent("Notify",source,"sucesso","Voce kickou o passaporte <b>"..args[1].."</b> da cidade.")
				SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[KICKOU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kickall',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"ceo.permissao") then
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
                vRP.kick(id,"Você foi vitima do terremoto.")
            end
        end
		SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[KICKALL]: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),true)
			TriggerClientEvent("Notify",source,"sucesso","Voce baniu o passaporte <b>"..args[1].."</b> da cidade.")
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[BANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce desbaniu o passaporte <b>"..args[1].."</b> da cidade.")
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESBANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('money',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		if args[1] then
			vRP.giveMoney(user_id,parseInt(args[1]))
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FEZ]: $"..vRP.format(parseInt(args[1])).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		vRPclient.toggleNoclip(source)
		PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({username = botusername, content = "```prolog\n[ID]: "..user_id.." \n[USOU NOCLIP] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"}), { ['Content-Type'] = 'application/json' })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		heading = GetEntityHeading(GetPlayerPed(-1))
		vRP.prompt(source,"Cordenadas:","['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z))
	end
end)

RegisterCommand('cds2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:",tD(x).." "..tD(y).." "..tD(z))
	end
end)

RegisterCommand('cds3',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:","{name='ATM', id=277, x="..tD(x)..", y="..tD(y)..", z="..tD(z).."},")
	end
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT ADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('aa',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "sc.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,"[CHAT ADMIN] ["..user_id.."] "..identity.name.." "..identity.firstname,{80,80,190},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('group',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] and args[2] then
			vRP.addUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ungroup',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] and args[2] then
			vRP.removeUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.")
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao")  then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then
				vRPclient.teleport(tplayer,x,y,z)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				vRPclient.teleport(source,vRPclient.getPosition(tplayer))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		TriggerClientEvent('tptoway',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER PROCURADO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rprocurado',function(source)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"pvp.permissao")  then
		if vRP.getSearchTimer(user_id) and vRP.getSearchTimer(user_id) > 0 then
			vRP.searchTimer(user_id,-vRP.getSearchTimer(user_id))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"moderador.permissao") then
		TriggerClientEvent('delnpcs',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pon',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"suporte.permissao") then
        local users = vRP.getUsers()
        local players = ""
        local quantidade = 0
        for k,v in pairs(users) do
            if k ~= #users then
                players = players..", "
            end
            players = players..k
            quantidade = quantidade + 1
        end
        TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{255,0,0},quantidade)
        TriggerClientEvent('chatMessage',source,"ID's ONLINE",{255,0,0},players)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ARMA ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('arma',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id then
        if args[1] then
            if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"pvp.permissao") then
            	vRPclient.giveWeapons(source,{[args[1]] = { ammo = 5000 }})
				TriggerClientEvent("Notify",source,"importante","Você pergou a arma "..args[1])
			end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LIMPARMOCHILA ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limpainv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		if args[1] ~= null and vRP.hasPermission(user_id,"ceo.permissao") then
            local tuser_id = tonumber(args[1])
            local tplayer = vRP.getUserSource(tonumber(tuser_id))
            local tplayerID = vRP.getUserId (tonumber(tplayer))
            if tplayerID ~= nil then
                vRP.clearInventory(parseInt(args[1]))
                TriggerClientEvent("Notify",source,"Sucesso","Limpou inventario do ID <b>"..args[1].."</b>.")
                SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[LIMPOU O INVENTARIO]: DO ID "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            else
                TriggerClientEvent("Notify",source,"Negado","O usuário não foi encontrado ou está offline.")
            end
        else
			vRP.clearInventory(user_id)
            TriggerClientEvent("Notify",source,"Sucesso","Limpou seu inventario <b></b>.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LIMPARARMAS - APENAS SADM ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limpararmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		if args[1] and vRP.hasPermission(user_id,"ceo.permissao") then 
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then 
				vRPclient.giveWeapons(nplayer,{},true)
				SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[LIMPOU AS ARMAS]: DO ID "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		else
			vRPclient.giveWeapons(source,{},true)
		end
	end
end)
----------------------------------------------------------------------------------------------------------------------------------------
------ MUDAR COR DO CARRO
----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('carcolor',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"pvp.permissao") then
		local vehicle,vehNet = vRPclient.vehList(source,5)
		if vehicle then
            local rgb = vRP.prompt(source,"RGB Color(255 255 255):"," ")
            rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
            local r,g,b = table.unpack(splitString(rgb," "))
			--TriggerClientEvent('vcolorv',source,vehicle,vehNet,tonumber(r),tonumber(g),tonumber(b))
			TriggerClientEvent('vcolorv',source,vehicle,tonumber(r),tonumber(g),tonumber(b))
			TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Cor ^1alterada")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
---[ ALTERAR PLACA DO PLAYER ]------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mudarplaca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local id = user_id
	if vRP.hasPermission(user_id,"pvp.permissao") then
		TriggerClientEvent('newplate',source, args[1])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ KILL ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kill',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"pvp.permissao") then
        if args[1] and vRP.hasPermission(user_id,"ceo.permissao") then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                vRPclient.setHealth(nplayer,0)
				TriggerClientEvent("Notify",source,"importante","Você matou o passaporte "..args[1])
			end
		else
			args[1] = user_id
            vRPclient.setHealth(source,0)
		end	
		SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[KILL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ KILLALL ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('killall',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"ceo.permissao") then
    	local nusers = vRP.getUsers()
        for k,v in pairs(nusers) do
			local nplayer = vRP.getUserSource(parseInt(k))
            if nplayer then
				vRPclient.setHealth(nplayer,0)
				vRP.updateThirst(parseInt(args[1]),0)
				vRP.updateHunger(parseInt(args[1]),0)
				TriggerClientEvent("resetBleeding",nplayer)
				TriggerClientEvent("resetDiagnostic",nplayer)
            end
		end
		SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[KILL]: TODOS "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end)

RegisterCommand('setarpolicia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"policiaftu.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Policia \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"paisanapolicia")
		end
	end
end)

RegisterCommand('removerpolicia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"policiaftu.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Policia \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"policia")
			vRP.removeUserGroup(parseInt(args[1]),"paisanapolicia")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ EXCLUIR PERSONAGEM ]-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reset',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"pvp.permissao") then
		if args[1] and vRP.hasPermission(user_id,"moderador.permissao") then
			vRP.execute("vRP/delete_character_for_reset",{ user_id = args[1]})
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[EXCLUIU PERSONAGEM]: do ID "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			local id = vRP.getUserSource(parseInt(args[1]))
			vRP.kick(id,"Você foi Kickado para resetar o personagem.")
		else 
			vRP.execute("vRP/delete_character_for_reset",{ user_id = user_id})
			SendWebhookMessage(webhookadmin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[EXCLUIU PERSONAGEM]: do ID "..user_id.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.kick(source,"Você foi Kickado para resetar o personagem.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CORRIDAS SUL ]-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('corrida',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"sadm.permissao") or vRP.hasPermission(user_id,"pvp.permissao") then
		TriggerClientEvent('tpcorrida',source,384.96,-1657.87,26.65)
		-- vRPclient.teleport(source,384.96,-1657.87,26.65)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ OBJETOS ]
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('objetos',function(source,rawCommand)
    local user_id = vRP.getUserId(source)
        vRPclient._setCustomization(source,vRPclient.getCustomization(source))
        vRP.removeCloak(source)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CORRIDAS NORTE ]---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('corrida2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"sadm.permissao") or vRP.hasPermission(user_id,"pvp.permissao") then
		TriggerClientEvent('tpcorrida',source,1646.38,3236.36,40.45)
		-- vRPclient.teleport(source,1646.38,3236.36,40.45)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CORRIDAS VENISH ]--------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('corrida3',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"sadm.permissao") or vRP.hasPermission(user_id,"pvp.permissao") then
		TriggerClientEvent('tpcorrida',source,1371.05,-739.9,66.81)
		-- vRPclient.teleport(source,1646.38,3236.36,40.45)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ /PREDIO ]--------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('predio',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"sadm.permissao") or vRP.hasPermission(user_id,"pvp.permissao") then
		TriggerClientEvent('tpcorrida',source,103.52,-873.14,137.96)
		-- vRPclient.teleport(source,1646.38,3236.36,40.45)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ /FAZENDA ]--------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fazenda',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"sadm.permissao") or vRP.hasPermission(user_id,"pvp.permissao") then
		TriggerClientEvent('tpcorrida',source,1456.42,1182.87,114.07)
		-- vRPclient.teleport(source,1646.38,3236.36,40.45)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('roupa',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		-- local homeName = vCLIENT.getHomeStatistics(source)
		local homeName = tostring(user_id)
		-- local myResult = vRP.query("homes/get_homeuser",{ user_id = parseInt(user_id), home = tostring(homeName) })
		-- if myResult[1] then
			local data = vRP.getSData("outfit:"..tostring(homeName))
			local result = json.decode(data) or {}
			if result then
				if (args[1] == "add" or args[1] == "save" or args[1] == "adicionar") and args[2] then
					local custom = vRPclient.getCustomPlayer(source)
					if custom then
						local outname = sanitizeString(table.slice(args, 2),sanitizes.homename[1],sanitizes.homename[2])
						if result[outname] == nil and string.len(outname) > 0 then
							result[outname] = custom
							vRP.setSData("outfit:"..tostring(homeName),json.encode(result))
							TriggerClientEvent("Notify",source,"sucesso","Outfit <b>"..outname.."</b> adicionado com sucesso.",10000)
						else
							TriggerClientEvent("Notify",source,"aviso","Nome escolhido já existe na lista de <b>Outfits</b>.",10000)
						end
					end
				elseif (args[1] == "rem" or args[1] == "remover") and args[2] then
					local outname = sanitizeString(table.slice(args, 2),sanitizes.homename[1],sanitizes.homename[2])
					if result[outname] ~= nil and string.len(outname) > 0 then
						result[outname] = nil
						vRP.setSData("outfit:"..tostring(homeName),json.encode(result))
						TriggerClientEvent("Notify",source,"sucesso","Outfit <b>"..outname.."</b> removido com sucesso.",10000)
					else
						TriggerClientEvent("Notify",source,"negado","Nome escolhido não encontrado na lista de <b>Outfits</b>.",10000)
					end
				elseif (args[1] == "apply" or args[1] == "aplicar" or args[1] == "usar") and args[2] then
					local outname = sanitizeString(table.slice(args, 2),sanitizes.homename[1],sanitizes.homename[2])
					if result[outname] ~= nil and string.len(outname) > 0 then
						TriggerClientEvent("updateRoupas",source,result[outname])
						TriggerClientEvent("Notify",source,"sucesso","Outfit <b>"..outname.."</b> aplicado com sucesso.",10000)
					else
						TriggerClientEvent("Notify",source,"negado","Nome escolhido não encontrado na lista de <b>Outfits</b>.",10000)
					end
				else
					for k,v in pairs(result) do
						TriggerClientEvent("Notify",source,"importante","<b>Outfit:</b> "..k,20000)
						Citizen.Wait(10)
					end
				end
			end
		-- end
	end
end)

function table.slice(tbl, first, last, step)
	local sliced = ""
  
	for i = first or 1, last or #tbl, step or 1 do
	  sliced = sliced.." "..tbl[i]
	end
  
	return sliced
  end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ARMAS ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('a',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and (vRP.hasPermission(user_id,"sadm.permissao") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"pvp.permissao")) then
		if string.lower(args[1]) == "all" then
			for k,v in pairs(cfg.armas["all"]) do
				vRPclient.giveWeapons(source,{[cfg.armas[v].nome] = { ammo = cfg.armas[v].ammo }})
			end
			TriggerClientEvent("Notify",source,"sucesso","Armamentos adicionados com sucesso.")
		elseif string.lower(args[1]) == "limpar" then
			vRPclient.giveWeapons(source,{},true)
			TriggerClientEvent("Notify",source,"sucesso","Armamento limpo com sucesso.")
		elseif args[1] then
			local achou = false
			for k,v in pairs(cfg.armas) do
				if (cfg.armas[k].index == string.lower(args[1]) and string.lower(args[1]) ~= "all") then
					vRPclient.giveWeapons(source,{[cfg.armas[k].nome] = { ammo = cfg.armas[k].ammo }})
					TriggerClientEvent("Notify",source,"sucesso","Armamento adicionado com sucesso.")
					achou = true
				end
			end
			if not achou then
				TriggerClientEvent("Notify",source,"negado","Armamento não encontrado.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Armamento não encontrado.")
		end
	end
end)