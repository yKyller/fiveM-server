-----------------------------------------------------------------------------------------------------------------------------------------
--[ vRP ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÕES ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Resg = {}
Tunnel.bindInterface("vrp_hospital",Resg)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ VARIÁVEL ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ RE ] -------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('re',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"medico.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isInComa(nplayer) then
				local identity_user = vRP.getUserIdentity(user_id)
				local nuser_id = vRP.getUserId(nplayer)
				local identity_coma = vRP.getUserIdentity(nuser_id)
				local set_user = "Policia"
				if vRP.hasPermission(user_id,"medico.permissao") then
					set_user = "Paramedico"
				end
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
				TriggerClientEvent("progress",source,30000,"reanimando")
				SetTimeout(30000,function()
					vRPclient.killGod(nplayer)
					vRPclient._stopAnim(source,false)
					TriggerClientEvent("resetBleeding",nplayer)
					TriggerClientEvent('cancelando',source,false)
				end)
			else
				TriggerClientEvent("Notify",source,"Importante","A pessoa precisa estar em coma para prosseguir.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRATAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tratamento',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"medico.permissao") then
        local nplayer = vRPclient.getNearestPlayer(source,3)
        if nplayer then
            if not vRPclient.isComa(nplayer) then
                TriggerClientEvent("tratamento",nplayer)
                TriggerClientEvent("Notify",source,"sucesso","Tratamento no paciente iniciado com sucesso.",10000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÕES ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function Resg.checkServices()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local dmla = vRP.getUsersByPermission("medico.permissao")
		if parseInt(#dmla) == 0 then
			return true
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Resg.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryFullPayment(user_id,5000) then
	 		TriggerClientEvent("Notify",source,"Sucesso","Pagamento de <b>$5.000 dólares</b> efetuado e o tratamento foi iniciado.")
	 		return true
		else
			TriggerClientEvent("Notify",source,"Negado","Dinheiro Insuficiente.")
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
function Resg.receiveBandagem()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"medico.permissao") then
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("bandagem")*1 <= vRP.getInventoryMaxWeight(user_id) then
				if vRP.tryPayment(user_id,8000) then
					vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
					TriggerClientEvent("cancelando",source,true)
					TriggerClientEvent("progress",source,8000,"PRODUZINDO")
					TriggerClientEvent("Notify",source,'importante',"Importante","Você gastou <b>$5.000 dólares</b> para fazer bandagem")
					SetTimeout(5000,function()
						vRP.giveInventoryItem(user_id,"bandagem",1)
						TriggerClientEvent("cancelando",source,false)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"Negado","Você precisa de <b>$8.000 dólares</b> para finalizar a produção.",8000)
				end
			else
				TriggerClientEvent("Notify",source,"Negado","Mochila cheia.",8000)
			end
		else
			TriggerClientEvent("Notify",source,"Negado","Você precisa ser um medico.",8000)
		end
	end
end