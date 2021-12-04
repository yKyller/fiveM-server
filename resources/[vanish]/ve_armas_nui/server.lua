-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("ve_armas_nui",src)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local armas = {
    { item = "armacaodearma" },
	{ item = "ak103" },
    { item = "five" },
    { item = "mp5mk2" },
    { item = "tec9" },
    { item = "g3" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAIN MENU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("ArmasTransformar")
AddEventHandler("ArmasTransformar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(armas) do
            if item == v.item then
                if item == "armacaodearma" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("armacaodearma") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecadearma") >= 10 then
                            if vRP.tryGetInventoryItem(user_id,"pecadearma",10) then
                                TriggerClientEvent("ArmasFecharNui",source)

                                TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                SetTimeout(10000,function()
                                    vRPclient._stopAnim(source,false)
                                    vRP.giveInventoryItem(user_id,"armacaodearma",1)
                                end)
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de Arma</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
				elseif item == "ak103" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody_WEAPON_ASSAULTRIFLE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodeak") >= 1 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 100000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodeak",1) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",100000) then
                                    TriggerClientEvent("ArmasFecharNui",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody_WEAPON_ASSAULTRIFLE_MK2",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de Arma</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "mp5mk2" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody_WEAPON_SMG_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodemp5") >= 1 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 70000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodemp5",1) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",70000) then
                                    TriggerClientEvent("ArmasFecharNui",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody_WEAPON_SMG_MK2",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de Arma</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "five" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody_WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodearma") >= 5 then
                            if vRP.tryGetInventoryItem(user_id,"armacaodearma",5) then
                                TriggerClientEvent("ArmasFecharNui",source)

                                TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                TriggerClientEvent("cancelando",source,true)
                                vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                SetTimeout(10000,function()
                                    TriggerClientEvent("cancelando",source,false)
                                    vRPclient._stopAnim(source,false)
                                    vRP.giveInventoryItem(user_id,"wbody_WEAPON_PISTOL_MK2",1)
                                end)
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de Arma</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "tec9" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody_WEAPON_MACHINEPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodetec") >= 1 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 60000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodetec",1) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",60000) then
                                    TriggerClientEvent("ArmasFecharNui",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody_WEAPON_MACHINEPISTOL",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem <b>Armação de Arma</b> na mochila.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "g3" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody_WEAPON_SPECIALCARBINE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodeg3") >= 1 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 60000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodeg3",1) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",60000) then
                                    TriggerClientEvent("ArmasFecharNui",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody_WEAPON_SPECIALCARBINE_MK2",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem <b>Armação de Arma</b> na mochila.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function src.ChecarArmasPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"bloods.permissao") or vRP.hasPermission(user_id,"crips.permissao") then
        return true
    end
end