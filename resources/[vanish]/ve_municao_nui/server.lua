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
Tunnel.bindInterface("ve_municao_nui",src)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local armas = {
	{ item = "ak103" },
    { item = "five" },
    { item = "mp5mk2" },
    { item = "tec9" },
    { item = "g3" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAIN MENU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("MuniTransformar")
AddEventHandler("MuniTransformar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(armas) do
            if item == v.item then
                if item == "five" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo_WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"materialmunicao") >= 10 then
                            if vRP.tryGetInventoryItem(user_id,"materialmunicao",10) then
                                TriggerClientEvent("MuniFecharNui",source)

                                TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                SetTimeout(10000,function()
                                    vRPclient._stopAnim(source,false)
                                    vRP.giveInventoryItem(user_id,"wammo_WEAPON_PISTOL_MK2",50)
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
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo_WEAPON_ASSAULTRIFLE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"materialak") >= 1 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 20000 then
                                if vRP.tryGetInventoryItem(user_id,"materialak",1) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",20000) then
                                    TriggerClientEvent("MuniFecharNui",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wammo_WEAPON_ASSAULTRIFLE_MK2",250)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de AK</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "mp5mk2" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo_WEAPON_SMG_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"materialmp5") >= 1 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 15000 then
                                if vRP.tryGetInventoryItem(user_id,"materialmp5",1) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",15000) then
                                    TriggerClientEvent("MuniFecharNui",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wammo_WEAPON_SMG_MK2",250)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de MP5</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "tec9" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("armacaodetec") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"materialtec") >= 1 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 10000 then
                                if vRP.tryGetInventoryItem(user_id,"materialtec",1) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",10000) then
                                    TriggerClientEvent("MuniFecharNui",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wammo_WEAPON_MACHINEPISTOL",250)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem <b>Material de TEC</b> na mochila.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "g3" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("armacaodeg3") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"materialg3") >= 1 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 10000 then
                                if vRP.tryGetInventoryItem(user_id,"materialg3",1) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",10000) then
                                    TriggerClientEvent("MuniFecharNui",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wammo_WEAPON_SPECIALCARBINE_MK2",250)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem <b>Material de G3</b> na mochila.")
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
function src.ChecarMunicaoPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"siciliana.permissao") or vRP.hasPermission(user_id,"triade.permissao") then
        return true
    end
end