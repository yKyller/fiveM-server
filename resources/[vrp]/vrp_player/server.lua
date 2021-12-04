 local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
src = {}
Tunnel.bindInterface("vrp_player",src)
vDIAGNOSTIC = Tunnel.getInterface("vrp_diagnostic")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookgarmas = "https://discord.com/api/webhooks/778095092359626784/JuTEoyd-ykW_Qooz2mXx8xQE_XQOuYe6BMOi8SCUBhWsmZERs1QAH5sMVRoV0dE6tUi-"
local webhookgarmas250 = "https://discord.com/api/webhooks/778095092359626784/JuTEoyd-ykW_Qooz2mXx8xQE_XQOuYe6BMOi8SCUBhWsmZERs1QAH5sMVRoV0dE6tUi-"
local webhookequipar = "https://discord.com/api/webhooks/778094053627396106/x7EDWP6t5KHmIfqFwIkzUCSOBwGabUV9FjSzEJYejxsDc8HNpgwuvdKxMXVcb6hG3Owy" 
local webhookenviaritem = "https://discord.com/api/webhooks/778093767680196640/yIRpCAzTIwTCMTTEs_L2yB5ljMp6gxaq9rWqxXDpULTEUQk_aOclI47Ae01RauSBUplT"
local webhookenviardinheiro = "https://discord.com/api/webhooks/778094936578719794/hbAYCUC6Ichs62MmSIFdGjCCTPw5KkYHQZuiSGXQ2OU-OdIAaReoASpI0iq0xlc4UBO0"
local webhookdropar = "https://discord.com/api/webhooks/778093628723560468/HbbhV5L3XL5VQaiKmTTeVbnIaLN0hqNlfl27h1eTRp1GxGCtQnAWfh8Fy2GLJiHwtHqb"
local webhookgive = "https://discord.com/api/webhooks/778094618583498762/kd7chNkUtI9NPwD4U1jgzqleAxDekqXglyts9zwz4rAInRH6dZPe0g4i4LOCTo6JwdhA"
local webhooksaquear = "https://discord.com/api/webhooks/778095220977172500/agNvNZaMautiVGyuq1HqOy8M3dkOkGpHb2ZapCuWPZF2-cCm08ZoUT_dVjYfr8YJW7GT"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkRoupas()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"pvp.permissao") then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
			return false
		end
	end
end

function src.checkPermVip()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"vanish.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui <b>VIP VANISH</b>.") 
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSAO COR
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checarPermissao()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"cor.permissao") then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui <b>VIP</b> ou <b>Booster</b>.") 
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK MODIFICADOR DE ARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.PossuiCompArma()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"compattach") >= 1 or vRP.hasPermission(user_id,"vanish.permissao") then
			return true 
		end
	end
end

function src.CheckVip()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"vanish.permissao") then
			return true 
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	---------------------------------------------------------------------------------------------------
	--[ Ultilitários legais ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["mochila"] = { index = "mochila", nome = "Mochila" },
	["pendrive"] = { index = "pendrive", nome = "Pendrive" },
	["celular"] = { index = "celular", nome = "Celular" },
	["casinotoken"] = { index = "casinotoken", nome = "Ficha" },
	["radio"] = { index = "radio", nome = "Radio" },
	["distintivopolicial"] = { index = "distintivopolicial", nome = "Distintivo Policial" },
	["militec"] = { index = "militec", nome = "Militec" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos" },
	["roupas"] = { index = "roupas", nome = "Roupas", },
	["bandagem"] = { index = "bandagem", nome = "Bandagem", },
	["materialmunicaopesada"] = { index = "materialmunicaopesada", nome = "Material de Munição Pesada", },
	["materialmunicao"] = { index = "materialmunicao", nome = "Material de Munição", },
	---------------------------------------------------------------------------------------------------
	--[ Ultilitários Ilegais]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo" },
	["dinheiroempacotado"] = { index = "dinheiroempacotado", nome = "Dinheiro Empacotado" },
	["algemas"] = { index = "algemas", nome = "Algema" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick" },
	["masterpick"] = { index = "masterpick", nome = "Masterpick" },
	["cartao-desmanche"] = { index = "cartao-desmanche", nome = "Cartao do desmanche" },
	["compattach"] = { index = "compattach", nome = "Modificador de Armas" },
	["capuz"] = { index = "capuz", nome = "Capuz" },
	["placa"] = { index = "placa", nome = "Placa" },
	["c4"] = { index = "c4", nome = "C4" },
	["serra"] = { index = "serra", nome = "Serra" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira" },
	---------------------------------------------------------------------------------------------------
	--[ Empregos ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de lixo" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda" },
	["uva"] = { index = "uva", nome = "Uva", },
	["lanche"] = { index = "lanche", nome = "Tacos", },
	["graos"] = { index = "graos", nome = "Graos" },
	["bateria"] = { index = "bateria", nome = "Bateria" },
	["gps"] = { index = "gps", nome = "GPS" },
	["cobre"] = { index = "cobre", nome = "Cobre" },
	["plastico"] = { index = "plastico", nome = "Plastico" },
	["borracha"] = { index = "borracha", nome = "Borracha" },
	["linha"] = { index = "linha", nome = "Linha" },
	["pano"] = { index = "pano", nome = "Pano" },
	["vidro"] = { index = "vidro", nome = "Vidro" },
	["pilha"] = { index = "pilha", nome = "Pilha" },
	["fioeletronico"] = { index = "fioeletronico", nome = "Fio Eletronico" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Graos Impuros" },
	---------------------------------------------------------------------------------------------------
	--[ Bebidas ]-----------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["energetico"] = { index = "energetico", nome = "Energético" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja" },
	["fardo"] = { index = "fardo", nome = "Fardo de Cerveja" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia" },
	--------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 01 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["metanfetamina"] = { index = "metanfetamina", nome = "Metanfetamina" },
	["anfetamina"] = { index = "anfetamina", nome = "Anfetamina" },
	["acidobateria"] = { index = "acidobateria", nome = "Acido Bateria" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 02 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["cocamisturada"] = { index = "cocamisturada", nome = "Cocaina" },
	["cocaina"] = { index = "cocaina", nome = "Cocaina Pasta" },
	["folhadecoca"] = { index = "folhadecoca", nome = "Folha de Coca" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Maconha ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["maconha"] = { index = "maconha", nome = "Maconha" },
	["alvejante"] = { index = "alvejante", nome = "Alvejante" },
	["alvejantemodificado"] = { index = "alvejantemodificado", nome = "Alvejante Modificado" },
	["maconhamacerada"] = { index = "maconhamacerada", nome = "Maconha Macerada" },
	["folhademaconha"] = { index = "folhademaconha", nome = "Folha de Maconha" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Ecstasy ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["ecstasy"] = { index = "ecstasy", nome = "Ecstasy" },
	["essenciadeecstasy"] = { index = "essenciadeecstasy", nome = "Essencia de Ecstasy" },
	["pastadeecstasy"] = { index = "pastadeecstasy", nome = "Pasta de Ecstasy" },
	---------------------------------------------------------------------------------------------------
	--[ Dominação itens ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["armacaodeg3"] = { index = "armacaodeg3", nome = "Armação de G36" },
	["armacaodetec"] = { index = "armacaodetec", nome = "Armação de TEC-9" },
	["armacaodeak"] = { index = "armacaodeak", nome = "Armação de AK" },
	["armacaodemp5"] = { index = "armacaodemp5", nome = "Armação de MP5" },
	["materialg3"] = { index = "materialg3", nome = "Material de G36" },
	["materialtec"] = { index = "materialtec", nome = "Material de TEC-9" },
	["materialak"] = { index = "materialak", nome = "Material de AK" },
	["materialmp5"] = { index = "materialmp5", nome = "Material de MP5" },
	["lsd"] = { index = "lsd", nome = "LSD" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 02 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["molas"] = { index = "molas", nome = "Molas" },
	["metal"] = { index = "metal", nome = "Metal" },
	["gatilho"] = { index = "gatilho", nome = "Gatilho", },
	["capsulas"] = { index = "capsulas", nome = "Capsulas" },
	["polvora"] = { index = "polvora", nome = "Polvora" },
	["pecadearma"] = { index = "pecadearma", nome = "Peça de Arma" },
	---------------------------------------------------------------------------------------------------
	--[ ARMAS / OUTROS ]-------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------	
	["wbody_GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas" },
	["wbody_WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador" },
	["wbody_WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor" },
	---------------------------------------------------------------------------------------------------
	--[ CORPO A CORPO ]--------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------	
	["wbody_WEAPON_KNIFE"] = { index = "faca", nome = "Faca" },
	["wbody_WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga" },
	["wbody_WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês" },
	["wbody_WEAPON_MACHETE"] = { index = "machete", nome = "Machete" },
	["wbody_WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete" },
	["wbody_WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo" },
	["wbody_WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo" },
	["wbody_WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf" },
	["wbody_WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra" },
	["wbody_WEAPON_HATCHET"] = { index = "machado", nome = "Machado" },
	["wbody_WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna" },
	["wbody_WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol" },
	["wbody_WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa" },
	["wbody_WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha" },
	["wbody_WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca" },
	["wbody_WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra" },
	["wbody_WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete" },
    ---------------------------------------------------------------------------------------------------
    --[ PISTOLA ]-------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ["wbody_WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19" },--
    ["wbody_WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven" },
    ["wbody_WEAPON_SNSPISTOL"] = { index = "pistolhk", nome = "Pistol HK" },
    ["wbody_WEAPON_STUNGUN"] = { index = "taser", nome = "Taser" },
    ---------------------------------------------------------------------------------------------------
    --[ FUZIL ]----------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ["wbody_WEAPON_ASSAULTRIFLE_MK2"] = { index = "ak74", nome = "AK-47 MK2" },
    ["wbody_WEAPON_CARBINERIFLE"] = { index = "m4a4", nome = "M4A4", },
	["wbody_WEAPON_CARBINERIFLE_MK2"] = { index = "mpx", nome = "MPX", },
	["wbody_WEAPON_SPECIALCARBINE_MK2"] = { index = "g36mk2", nome = "G36 MK2", },
    ---------------------------------------------------------------------------------------------------
    --[ SMG ]------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
	["wbody_WEAPON_SMG"] = { index = "mp5", nome = "MP5" },
	["wbody_WEAPON_SMG_MK2"] = { index = "mp5mk2", nome = "MP5 MK2" },
    ["wbody_WEAPON_MACHINEPISTOL"] = { index = "tec9", nome = "Tec-9", },
	---------------------------------------------------------------------------------------------------
	--[ SHOTGUN ]--------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody_WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870" },
	---------------------------------------------------------------------------------------------------
	--[ RIFLES ]---------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody_WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22" },
    ---------------------------------------------------------------------------------------------------
    --[ MUNIÇÕES ]-------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
    ["wammo_GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "M.Paraquedas" },
    ["wammo_WEAPON_FLARE"] = { index = "m-sinalizador", nome = "M.Sinalizador" },
    ["wammo_WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "M.Extintor" },
    ["wammo_WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "M.Glock 19" },
    ["wammo_WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "M.FN Five Seven" },
    ["wammo_WEAPON_SNSPISTOL"] = { index = "m-pistolhk", nome = "M.Pistol HK" },
    ["wammo_WEAPON_STUNGUN"] = { index = "m-taser", nome = "M.Taser" },
    ["wammo_WEAPON_ASSAULTRIFLE_MK2"] = { index = "m-ak74", nome = "M.AK47 MK2", },
    ["wammo_WEAPON_CARBINERIFLE"] = { index = "m-m4a4", nome = "M.M4A4", },
	["wammo_WEAPON_CARBINERIFLE_MK2"] = { index = "m-mpx", nome = "M.MPX", },
	["wammo_WEAPON_SPECIALCARBINE_MK2"] = { index = "m-g36mk2", nome = "M.G36 MK2", },
	["wammo_WEAPON_SMG"] = { index = "m-mp5", nome = "M.MP5" },
	["wammo_WEAPON_SMG_MK2"] = { index = "m-mp5mk2", nome = "M.MP5 MK2" },
    ["wammo_WEAPON_MACHINEPISTOL"] = { index = "m-tec9", nome = "M.TEC-9", },
    ["wammo_WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "M.Remington 870" },
    ["wammo_WEAPON_MUSKET"] = { index = "m-winchester22", nome = "M.Winchester 22" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"pvp.permissao") or vRP.hasPermission(user_id,"ceo.permissao") then
		if args[1] and args[2] and itemlist[args[1]] ~= nil then
			vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))
			SendWebhookMessage(webhookgive,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PEGOU]: "..args[1].." \n[QUANTIDADE]: "..vRP.format(parseInt(args[2])).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USER VEHS [ADMIN]
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uservehs',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"administrador.permissao") then
        	local nuser_id = parseInt(args[1])
            if nuser_id > 0 then 
                local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(nuser_id) })
                local car_names = {}
                for k,v in pairs(vehicle) do
                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b>")
                    --TriggerClientEvent("Notify",source,"importante","<b>Modelo:</b> "..v.vehicle,10000)
                end
                car_names = table.concat(car_names, ", ")
                local identity = vRP.getUserIdentity(nuser_id)
                TriggerClientEvent("Notify",source,"importante","Veículos de <b>"..identity.name.." " .. identity.firstname.. " ("..#vehicle..")</b>: "..car_names,10000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- reskin
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reskin',function(source,rawCommand)
	local user_id = vRP.getUserId(source)		
	vRPclient._setCustomization(vRPclient.getCustomization(source))		
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ID
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id',function(source,rawCommand)	
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(nuser_id)
		vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Passaporte:</b> ( "..vRP.format(identity.user_id).." )</div>")
		vRP.request(source,"Você deseja fechar o registro geral?",1000)
		vRPclient.removeDiv(source,"completerg")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ID 2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer == nil then
				TriggerClientEvent("Notify",source,'aviso',"Aviso","Passaporte <b>"..vRP.format(args[1]).."</b> indisponível no momento.")
				return
			end
			nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local groupv = vRP.getUserGroupByType(nuser_id,"job")
				local groupv2 = vRP.getUserGroupByType(nuser_id,"job2")
				local vip = vRP.getUserGroupByType(nuser_id,"vip")
				local banco = vRP.getBankMoney(nuser_id)
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 18%; right: 2.5%; position: absolute; border: 1px solid rgba(255,0,0,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #FF0000; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..vRP.format(identity.user_id).." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div><div class=\"local2\"><b>Emprego:</b> "..groupv.."</div><div class=\"local2\"><b>Emprego2:</b> "..groupv2.."</div></div></div><div class=\"local2\"><b>Vip:</b> "..vip.."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		else
			local nplayer = vRPclient.getNearestPlayer(source,2)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local groupv = vRP.getUserGroupByType(nuser_id,"job")
				local groupv2 = vRP.getUserGroupByType(nuser_id,"job2")
				local vip = vRP.getUserGroupByType(nuser_id,"vip")
				local banco = vRP.getBankMoney(nuser_id)
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 18%; right: 2.5%; position: absolute; border: 1px solid rgba(255,0,0,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #FF0000; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..vRP.format(identity.user_id).." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div><div class=\"local2\"><b>Emprego:</b> "..groupv.."</div></div><div class=\"local2\"><b>Emprego2:</b> "..groupv2.."</div></div><div class=\"local2\"><b>Vip:</b> "..vip.."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		end
	end
end)
------------------------------------------------------------------------------------------------------
-- /REVISTAR
------------------------------------------------------------------------------------------------------
RegisterCommand('revistar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(user_id)
		local weapons = vRPclient.getWeapons(nplayer)
		local money = vRP.getMoney(nuser_id)
		local data = vRP.getUserDataTable(nuser_id)

		TriggerClientEvent('cancelando',source,true)
		TriggerClientEvent('cancelando',nplayer,true)
        vRPclient._playAnim(nplayer,false,{{"random@mugging3","handsup_standing_base"}},true)
		TriggerClientEvent("progress",source,5000,"revistando")
		SetTimeout(5000,function()

			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(nuser_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(nuser_id)).."kg^4  ]  - -")
			if data and data.inventory then
				for k,v in pairs(data.inventory) do
					TriggerClientEvent('chatMessage',source,"",{},"    "..vRP.format(parseInt(v.amount)).."x"..vRP.itemNameList(k))
				end
			end
			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5E Q U I P A D O^4  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
			for k,v in pairs(weapons) do
				if v.ammo < 1 then
					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody_"..k))
				else
					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wammo_"..k).." | "..vRP.format(parseInt(v.ammo)).."x Munições")
				end
			end

			vRPclient._stopAnim(nplayer,false)
			TriggerClientEvent('cancelando',source,false)
			TriggerClientEvent('cancelando',nplayer,false)
			TriggerClientEvent('chatMessage',source,"",{},"     $"..vRP.format(parseInt(money)).." Dólares")
		end)
		TriggerClientEvent("Notify",nplayer,"aviso","Você está sendo <b>Revistado</b>.")
		--TriggerClientEvent("Notify",nplayer,"aviso","Revistado por <b>"..identity.name.." "..identity.firstname.."</b>.",8000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALÁRIO
-----------------------------------------------------------------------------------------------------------------------------------------
local salarios = {
	{ ['permissao'] = "vanish.permissao", ['nome'] = "Vanish", ['payment'] = 2000 },
	{ ['permissao'] = "advanced.permissao", ['nome'] = "Advanced", ['payment'] = 1000 },
	{ ['permissao'] = "news.permissao", ['nome'] = "News", ['payment'] = 4000 },
	{ ['permissao'] = "juiz.permissao", ['nome'] = "Juiz(a)", ['payment'] = 8500 },
	{ ['permissao'] = "advogado.permissao", ['nome'] = "Advogado(a)", ['payment'] = 6500 },
	{ ['permissao'] = "conce.permissao", ['nome'] = "Dealership", ['payment'] = 1000 },
	{ ['permissao'] = "policia.permissao", ['nome'] = "Policia", ['payment'] = 7500 },
	{ ['permissao'] = "medico.permissao", ['nome'] = "Hospital", ['payment'] = 10000 },
	{ ['permissao'] = "mecanico.permissao", ['nome'] = "Mêcanico", ['payment'] = 1000 },
	{ ['permissao'] = "chefemec.permissao", ['nome'] = "Mêcanico Chefe", ['payment'] = 1500 },
	{ ['permissao'] = "policiaacao.permissao", ['nome'] = "Policia Ação", ['payment'] = 7500 }
}

RegisterServerEvent('salario:pagamento')
AddEventHandler('salario:pagamento',function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(salarios) do
			if vRP.hasPermission(user_id,v.permissao) then
				TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
				TriggerClientEvent("Notify",source,"importante","Obrigado por colaborar com a cidade, seu salario de <b>$"..vRP.format(parseInt(v.payment)).." dólares</b> foi depositado.")
				vRP.giveBankMoney(user_id,parseInt(v.payment))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOCARJACK
-----------------------------------------------------------------------------------------------------------------------------------------
local veiculos = {}
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AFKSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("kickAFK")
AddEventHandler("kickAFK",function()
    local source = source
    local user_id = vRP.getUserId(source)
    if not vRP.hasPermission(user_id,"administrador.permissao") then
        DropPlayer(source,"Voce foi desconectado por ficar ausente.")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /SEQUESTRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
						TriggerClientEvent("clearpedtasks",source)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /camburao
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('camburao',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,5)
    if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"policiaacao.permissao") or vRP.hasPermission(user_id,"medico.permissao") then
    if nplayer then
            if not vRPclient.getNoCarro(source) and not vRPclient.isHandcuffed(source) or vRPclient.isHandcuffed(source) then
                local vehicle = vRPclient.getNearestVehicle(source,7)
                if vehicle then
                    if vRPclient.getCarroClass(source,1) then
                        vRPclient.setMalas(nplayer)
                        TriggerClientEvent("clearpedtasks",source)
                    end
                end
            elseif vRPclient.isMalas(nplayer) then
                vRPclient.setMalas(nplayer)
            end
        end
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- CASAS
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('casas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if args[1] and vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRP.getUserSource(parseInt(args[1]))
		if nplayer == nil then
			return
		end
		user_id = vRP.getUserId(nplayer)
	end
	if user_id then
		local address = vRP.getUserAddress(user_id)
		local casas = ""
		if args[1] then
			if #address > 0 then
				for k,v in pairs(address) do
					casas = casas..v.home.." - Nº"..v.number
					if k ~= #address then
						casas = casas..", "
					end
				end
				TriggerClientEvent("Notify",source,"importante","Residências possuidas pelo passaporte <b>"..vRP.format(parseInt(args[1])).."</b>: "..casas)
			else
				TriggerClientEvent("Notify",source,"negado","Passaporte <b>"..vRP.format(parseInt(args[1])).."</b> não possui residências.")
			end
		else
			if #address > 0 then
				for k,v in pairs(address) do
					casas = casas..v.home.." - Nº"..v.number
					if k ~= #address then
						casas = casas..", "
					end
				end
				TriggerClientEvent("Notify",source,"importante","Residências possuidas: "..casas)
			else
				TriggerClientEvent("Notify",source,"negado","Não possui residências em seu nome.")
			end
		end
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOTOR
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('motor',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local mPlaca = vRPclient.ModelName(source,3)
	local mPlacaUser = vRP.getUserByRegistration(mPlaca)
	if mPlaca then
		if not vRPclient.isInVehicle(source) then
			if vRP.hasPermission(user_id,"mecanico.permissao") then
				if user_id ~= mPlacaUser then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,30000,"reparando")
					SetTimeout(30000,function()
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('repararmotor',source)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"aviso","Não pode efetuar reparos em seu próprio veículo.")
				end
			else
				if vRP.tryGetInventoryItem(user_id,"militec",1) then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,30000,"reparando")
					SetTimeout(30000,function()
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('repararmotor',source)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"negado","Precisa de um <b>Militec-1</b> para reparar o motor.")
				end
			end
		else
			TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
		end
	end
end)

RegisterServerEvent("trymotor")
AddEventHandler("trymotor",function(nveh)
	TriggerClientEvent("syncmotor",-1,nveh)
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('reparar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local mPlaca = vRPclient.ModelName(source,3)
	local mPlacaUser = vRP.getUserByRegistration(mPlaca)
	if mPlaca then
		if not vRPclient.isInVehicle(source) then
			if vRP.hasPermission(user_id,"mecanico.permissao") then
				if user_id ~= mPlacaUser then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,30000,"reparando")
					SetTimeout(30000,function()
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('reparar',source)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"aviso","Não pode efetuar reparos em seu próprio veículo.")
				end
			else
				if vRP.tryGetInventoryItem(user_id,"repairkit",1) then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,30000,"reparando")
					SetTimeout(30000,function()
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('reparar',source)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"negado","Precisa de um <b>Kit de Reparos</b> para reparar o motor.")
				end
			end
		else
			TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
		end
	end
end)

RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENVIAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('enviar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	local identity = vRP.getUserIdentity(user_id)
	  local identitynu = vRP.getUserIdentity(nuser_id)
	  
	if nuser_id and parseInt(args[1]) > 0 then
		if vRP.tryPayment(user_id,parseInt(args[1])) then
			vRP.giveMoney(nuser_id,parseInt(args[1]))
			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.",8000)
			vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.",8000)
			SendWebhookMessage(webhookenviardinheiro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(args[1])).." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		else
			TriggerClientEvent("Notify",source,"negado","Não tem a quantia que deseja enviar.",8000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ GARMAS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('garmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local weapons = vRPclient.replaceWeapons(source,{})
		for k,v in pairs(weapons) do
			vRP.giveInventoryItem(user_id,"wbody_"..k,1)
			if v.ammo > 0 then
				vRP.giveInventoryItem(user_id,"wammo_"..k,v.ammo)
			end
			PerformHttpRequest(webhookgarmas, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE GARMAS",
						thumbnail = {
						url = ""
						}, 
						fields = {
							{ 
								name = "**GUARDOU:**", 
								value = "` ["..vRP.itemNameList("wbody_"..k).."] `"
							},
							{ 
								name = "**QUANTIDADE:**", 
								value = "` ["..v.ammo.."] `"
							},
							{ 
								name = "**QUEM GUARDOU:**", 
								value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "" 
						},
						color = 15914080 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
			if v.ammo == 250 then 
				PerformHttpRequest(webhookgarmas250, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 
							title = "REGISTRO DE GARMAS",
							thumbnail = {
							url = ""
							}, 
							fields = {
								{ 
									name = "**TENTOU USAR MONSTERMENU E FOI PEGO NO PULO**", 
								},
								{ 
									name = "**GUARDOU:**", 
									value = "` ["..vRP.itemNameList("wbody_"..k).."] `"
								},
								{ 
									name = "**QUANTIDADE:**", 
									value = "` ["..v.ammo.."] `"
								},
								{ 
									name = "**QUEM GUARDOU:**", 
									value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
								}
							}, 
							footer = { 
								text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
								icon_url = "" 
							},
							color = 15914080 
						}
					}
				}), { ['Content-Type'] = 'application/json' })
			end
		end
		TriggerClientEvent("Notify",source,"Sucesso","Você guardou seu armamento na mochila.")
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CINTO 
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cinto',function(source, args, rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"policiaacao.permissao") then	
		if nplayer then
			TriggerClientEvent('pcy:PoliciaToggleCinto',nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Saquear
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('saquear',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if vRPclient.isInComa(nplayer) then
			local identity_user = vRP.getUserIdentity(user_id)
			local nuser_id = vRP.getUserId(nplayer)
			local nidentity = vRP.getUserIdentity(nuser_id)
			local policia = vRP.getUsersByPermission("policiasaque.permissao")
			local itens_saque = {}
			if #policia >= 0 then
				local vida = vRPclient.getHealth(nplayer)
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@idle_a","idle_a"}},true)
				TriggerClientEvent("progress",source,8000,"saqueando")
				SetTimeout(8000,function()
					if not vRP.hasPermission(nuser_id, "policiasaque.permissao") then
						local ndata = vRP.getUserDataTable(nuser_id)
						if ndata ~= nil then
							if ndata.inventory ~= nil then
								for k,v in pairs(ndata.inventory) do
									if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
										if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
											vRP.giveInventoryItem(user_id,k,v.amount)
											table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList(k).." [QUANTIDADE]: "..v.amount)
										end
									else
										TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
									end
								end
							end
						end
						local weapons = vRPclient.replaceWeapons(nplayer,{})
						for k,v in pairs(weapons) do
							vRP.giveInventoryItem(nuser_id,"wbody_"..k,1)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody_"..k) <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wbody_"..k,1) then
									vRP.giveInventoryItem(user_id,"wbody_"..k,1)
									table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList("wbody_"..k).." [QUANTIDADE]: "..1)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..vRP.itemNameList("wbody_"..k).."</b> por causa do peso.")
							end
							if v.ammo > 0 then
								vRP.giveInventoryItem(nuser_id,"wammo_"..k,v.ammo)
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo_"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,"wammo_"..k,v.ammo) then
										vRP.giveInventoryItem(user_id,"wammo_"..k,v.ammo)
										table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList("wammo_"..k).." [QTD]: "..v.ammo)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo_"..k).."</b> por causa do peso.")
								end
							end
						end
						local nmoney = vRP.getMoney(nuser_id)
						if vRP.tryPayment(nuser_id,nmoney) then
							vRP.giveMoney(user_id,nmoney)
						end
					elseif vRP.tryGetInventoryItem(nuser_id,"distintivopolicial",1) then
						vRP.giveInventoryItem(user_id,"distintivopolicial",1)
					end
					vRPclient.setStandBY(source,parseInt(8000))
					vRPclient._stopAnim(source,false)
					TriggerClientEvent('cancelando',source,false)
					local apreendidos = table.concat(itens_saque, "\n")
					TriggerClientEvent("Notify",source,"importante","Saque concluido com sucesso.")
					SendWebhookMessage(webhooksaquear,"```prolog\n[ID]: "..user_id.." "..identity_user.name.." "..identity_user.firstname.."\n[SAQUEOU]: "..nuser_id.." "..nidentity.name.." " ..nidentity.firstname .. "\n" .. apreendidos ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					Citizen.Wait(8000)
				end)
			else
				TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Você só pode saquear quem está em coma.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WINS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALL
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
RegisterCommand('call',function(source,args,rawCommand)
	local source = source
	local answered = false
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	vida = vRPclient.getHealth(source)
	if user_id then
		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			vRPclient._stopAnim(source,false)
			vRPclient._DeletarObjeto(source)
			return
		end

		local x,y,z = vRPclient.getPosition(source)
		local players = {}
		vRPclient._stopAnim(source,false)
		vRPclient._DeletarObjeto(source)
		local especialidade = false
		if args[1] == "adm" then
			players = vRP.getUsersByPermission("suporte.permissao")	
			especialidade = "Administradores"
		end
		local adm = ""
		if especialidade == "Administradores" then
			adm = "[ADM] "
		end
		
		vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		if #players == 0  and especialidade ~= "policiais" then
			TriggerClientEvent("Notify",source,"importante","Não há "..especialidade.." em serviço.")
		else
			local identitys = vRP.getUserIdentity(user_id)
			TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.")
			for l,w in pairs(players) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player and player ~= uplayer then
					async(function()
						vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
						TriggerClientEvent('chatMessage',player,"CHAMADO",{255,0,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
						local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
						if ok then
							if not answered then
								answered = true
								local identity = vRP.getUserIdentity(nuser_id)
								TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								vRPclient._setGPS(player,x,y)
							else
								TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
								vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
							end
						end
						local id = idgens:gen()
						blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
						SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVISTAR ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('arevistar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
    if nuser_id then
        local identity = vRP.getUserIdentity(user_id)
        local weapons = vRPclient.getWeapons(nplayer)
        local money = vRP.getMoney(nuser_id)
		local data = vRP.getUserDataTable(nuser_id)
        TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(nuser_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(nuser_id)).."kg^4  ]  - -")
        if data and data.inventory then
            for k,v in pairs(data.inventory) do
                TriggerClientEvent('chatMessage',source,"",{},"     "..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome)
            end
        end
        TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5E Q U I P A D O^4  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
        for k,v in pairs(weapons) do
            if v.ammo < 1 then
                TriggerClientEvent('chatMessage',source,"",{},"     1x "..itemlist["wbody_"..k].nome)
            else
                TriggerClientEvent('chatMessage',source,"",{},"     1x "..itemlist["wbody_"..k].nome.." _ "..vRP.format(parseInt(v.ammo)).."x Munições")
            end
        end
        TriggerClientEvent('chatMessage',source,"",{},"     $"..vRP.format(parseInt(money)).." Dólares")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MEC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mec',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"mecanico.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,"Central Mecânica",{255,128,0},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "mecanico.permissao"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,191,128},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------
-- [ /USE ] ------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('use', function(source, args, rawCommand)
	if args[1] == nil then
		return
	end
	local user_id = vRP.getUserId(source)
	if args[1] == "energetico" then
		if true then
			TriggerClientEvent('energeticos',source,true)
			TriggerClientEvent("Notify",source,"sucesso","Energético utilizado com sucesso.")
			SetTimeout(60000,function()
				TriggerClientEvent('energeticos',source,false)
				TriggerClientEvent("Notify",source,"aviso","O efeito do energético passou e o coração voltou a bater normalmente.")
			end)
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
-- ROLL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('ChatRoll')
AddEventHandler('ChatRoll',function(text)
	local user_id = vRP.getUserId(source)
	if user_id then
		TriggerClientEvent('DisplayRoll',-1,text,source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /mochila
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mochila',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmochila",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /mascara
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmascara",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /blusa
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setblusa",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /colete
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('colete',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setcolete",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /jaqueta
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setjaqueta",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmaos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /calca
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setcalca",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /acessorios
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setacessorios",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sapatos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setsapatos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /chapeu
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setchapeu",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /oculos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setoculos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /orelha
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("orelha",function(source,args)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setorelha",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /relogio
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("relogio",function(source,args)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setrelogio",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /bracelete
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("bracelete",function(source,args)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setbracelete",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local roupas = {
    ["mecanico"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 12,0 },
			[4] = { 39,0 },
			[5] = { -1,0 },
			[6] = { 24,0 },
			[7] = { 109,0 },
			[8] = { 89,0 },
			[9] = { 14,0 },
			[10] = { -1,0 },
			[11] = { 66,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 38,0 },
			[5] = { -1,0 },
			[6] = { 24,0 },
			[7] = { 2,0 },
			[8] = { 56,0 },
			[9] = { 35,0 },
			[10] = { -1,0 },
			[11] = { 59,0 }
		}
	},
	["minerador"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 99,1 },
			[4] = { 89,20 },
			[5] = { -1,0 },
			[6] = { 82,2 },
			[7] = { -1,0 },
			[8] = { 90,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 273,0 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 114,1 },
			[4] = { 92,20 },
			[5] = { -1,0 },
			[6] = { 86,2 },
			[7] = { -1,0 },
			[8] = { 54,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 286,0 },
			["p1"] = { 25,0 }
		}
	},
    ["gari"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 17,0 },
			[4] = { 36,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { -1,0 },
			[8] = { 59,0 },
			[10] = { -1,0 },
			[11] = { 57,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 18,0 },
			[4] = { 35,0 },
			[5] = { -1,0 },
			[6] = { 26,0 },
			[7] = { -1,0 },
			[8] = { 36,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 50,0 }
		}
	},
	["carteiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 17,10 },
			[5] = { 40,0 },
			[6] = { 7,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 242,3 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 14,1 },
			[5] = { 40,0 },
			[6] = { 10,1 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 250,3 }
		}
	},
	["fazendeiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 37,0 },
			[4] = { 7,0 },
			[5] = { -1,0 },
			[6] = { 15,6 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 95,2 },
			["p0"] = { 105,23 },
			["p1"] = { 5,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 45,0 },
			[4] = { 25,10 },
			[5] = { -1,0 },
			[6] = { 21,1 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 171,4 },
			["p0"] = { 104,23 },
			["p1"] = { 11,2 }
		}
	},
	["lenhador"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 62,0 },
			[4] = { 89,23 },
			[5] = { -1,0 },
			[6] = { 12,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 15,0 },
			["p0"] = { 77,13 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 71,0 },
			[4] = { 92,23 },
			[5] = { -1,0 },
			[6] = { 69,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 15,0 },
			["p1"] = { 25,0 }
		}
	},
	["taxista"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 11,0 },
			[4] = { 35,0 },
			[5] = { -1,0 },
			[6] = { 10,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 13,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 112,0 },
			[5] = { -1,0 },
			[6] = { 6,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 27,0 }
		}
	},
	["caminhoneiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 63,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { -1,0 },
			[8] = { 81,0 },
			[10] = { -1,0 },
			[11] = { 173,3 },
			["p1"] = { 8,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 74,5 },
			[5] = { -1,0 },
			[6] = { 9,0 },
			[7] = { -1,0 },
			[8] = { 92,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 175,3 },
			["p1"] = { 11,0 }
		}
	},
	["motocross"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 111,0 },
			[4] = { 67,3 },
			[5] = { -1,0 },
			[6] = { 47,3 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 152,0 },
			["p1"] = { 25,5 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 128,0 },
			[4] = { 69,3 },
			[5] = { -1,0 },
			[6] = { 48,3 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 149,0 },
			["p1"] = { 27,5 }
		}
	},
	["mergulho"] = {
		[1885233650] = {
			[1] = { 122,0 },
			[3] = { 31,0 },
			[4] = { 94,0 },
			[5] = { -1,0 },
			[6] = { 67,0 },
			[7] = { -1,0 },
			[8] = { 123,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 243,0 },			
			["p0"] = { -1,0 },
			["p1"] = { 26,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 122,0 },
			[3] = { 18,0 },
			[4] = { 97,0 },
			[5] = { -1,0 },
			[6] = { 70,0 },
			[7] = { -1,0 },
			[8] = { 153,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 251,0 },
			["p0"] = { -1,0 },
			["p1"] = { 28,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pelado"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 21,0 },
			[5] = { -1,0 },
			[6] = { 34,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 15,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 21,0 },
			[5] = { -1,0 },
			[6] = { 35,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 82,0 }
		}
	},
	["paciente"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 61,0 },
			[5] = { -1,0 },
			[6] = { 16,0 },
			[7] = { -1,0 },			
			[8] = { 15,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 104,0 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 57,0 },
			[5] = { -1,0 },
			[6] = { 16,0 },
			[7] = { -1,0 },		
			[8] = { 7,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 105,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["gesso"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 1,0 },
			[4] = { 84,9 },
			[5] = { -1,0 },
			[6] = { 13,0 },
			[7] = { -1,0 },			
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 186,9 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 3,0 },
			[4] = { 86,9 },
			[5] = { -1,0 },
			[6] = { 12,0 },
			[7] = { -1,0 },		
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 188,9 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["leiteiro"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 74,0 }, -- maos
			[4] = { 89,22 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 51,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 271,0 }, -- jaqueta		
			["p0"] = { 105,22 }, -- chapeu
			["p1"] = { 23,0 }, -- oculos
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 85,0 }, -- maos
			[4] = { 92,22 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 52,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 141,0 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 3,9 }, -- oculos
		}
	},
	["motorista"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 10,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 21,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 242,1 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 7,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 14,0 }, -- maos
			[4] = { 37,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 27,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 250,1 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["cacador"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 97,18 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { 2,2 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 244,19 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 100,18 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { 44,1 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 252,19 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pescador"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 98,19 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { 85,2 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 247,12 }, -- jaqueta		
			["p0"] = { 104,20 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 14,0 }, -- maos
			[4] = { 101,19 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { 88,1 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 255,13 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 11,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	}
}

RegisterCommand('roupas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if args[1] then
					local custom = roupas[tostring(args[1])]
					if custom then
						local old_custom = vRPclient.getCustomization(source)
						local idle_copy = {}

						idle_copy = vRP.save_idle_custom(source,old_custom)
						idle_copy.modelhash = nil

						for l,w in pairs(custom[old_custom.modelhash]) do
							idle_copy[l] = w
						end
						vRPclient._playAnim(source,true,{{"clothingshirt","try_shirt_positive_d"}},false)
						Citizen.Wait(2500)
						vRPclient._stopAnim(source,true)
						vRPclient._setCustomization(source,idle_copy)
					end
				else
					vRPclient._playAnim(source,true,{{"clothingshirt","try_shirt_positive_d"}},false)
					Citizen.Wait(2500)
					vRPclient._stopAnim(source,true)
					vRP.removeCloak(source)
				end
			end
		end
	end
end)

RegisterCommand("fps20", function()
    TriggerEvent("lafa2k_flag:fps20")
end)
----------------------------------------------------------------------
RegisterNetEvent('guardararmas')
AddEventHandler('guardararmas', function()
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if user_id then
        local weapons = vRPclient.replaceWeapons(source,{})
		for k,v in pairs(weapons) do
			Citizen.Wait(math.random(20000,30000))
            vRP.giveInventoryItem(user_id,"wbody_"..k,1)
            if v.ammo > 0 then
                vRP.giveInventoryItem(user_id,"wammo_"..k,v.ammo)
            end
            if v.ammo == 250 then 
            end
        end
    end
end)