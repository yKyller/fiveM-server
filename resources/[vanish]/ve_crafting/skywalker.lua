local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
oC = {}
Tunnel.bindInterface("ve_crafting",oC)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ARRAY ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local craft = {
	{ item = "gps" },
	{ item = "alg" },
    { item = "cpz" },
    { item = "pendrive"},
    { item = "c4"},
	{ item = "hk" },
    { item = "mhk" }
}
-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("produzir-craft")
AddEventHandler("produzir-craft",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(craft) do
			if item == v.item then
				if item == "gps" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("gps") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 2200 then
                            if vRP.getInventoryItemAmount(user_id,"vidro") >= 1 then
                                if vRP.getInventoryItemAmount(user_id,"fioeletronico") >= 25 then
                                    if vRP.getInventoryItemAmount(user_id,"bateria") >= 1 then
                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",2200) and vRP.tryGetInventoryItem(user_id,"vidro",1) and vRP.tryGetInventoryItem(user_id,"fioeletronico",25) and vRP.tryGetInventoryItem(user_id,"bateria",1) then
                                            TriggerClientEvent("fechar-nui",source)

                                            TriggerClientEvent("progress",source,5000,"Montando GPS")

                                            SetTimeout(5000,function()
                                                vRP.giveInventoryItem(user_id,"gps",1)
                                                TriggerClientEvent("Notify",source,"Sucesso","Você montou um <b>GPS</b>.")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"Negado","Você não tem <b>1x Bateria</b> na mochila.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"Negado","Você precisa de <b1x Fio Eletronico</b>.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"Negado","Você precisa de <b>1x Vidro</b>.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"Negado","Você não tem <b>2200x Dinheiro Sujo</b> na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "alg" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("algemas") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 50000 then
                            if vRP.getInventoryItemAmount(user_id,"cobre") >= 20 then
                                if vRP.getInventoryItemAmount(user_id,"plastico") >= 2 then
                                    if vRP.getInventoryItemAmount(user_id,"borracha") >= 4 then
                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",50000) and vRP.tryGetInventoryItem(user_id,"cobre",20) and vRP.tryGetInventoryItem(user_id,"plastico",2) and vRP.tryGetInventoryItem(user_id,"borracha",4) then
                                            TriggerClientEvent("fechar-nui",source)

                                            TriggerClientEvent("progress",source,5000,"Montando Algema")

                                            SetTimeout(5000,function()
                                                vRP.giveInventoryItem(user_id,"algemas",1)
                                                TriggerClientEvent("Notify",source,"Sucesso","Você montou uma <b>Algema</b>.")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"Negado","Você não tem <b>4x Borracha</b> na mochila.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"Negado","Você precisa de <b2x Plastico</b>.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"Negado","Você precisa de <b>20x Cobre</b>.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"Negado","Você não tem <b>50000x Dinheiro Sujo</b> na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "cpz" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("capuz") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 50000 then
                            if vRP.getInventoryItemAmount(user_id,"linha") >= 12 then
                                if vRP.getInventoryItemAmount(user_id,"pano") >= 20 then
                                    if vRP.tryGetInventoryItem(user_id,"dinheirosujo",50000) and vRP.tryGetInventoryItem(user_id,"linha",12) and vRP.tryGetInventoryItem(user_id,"pano",20) then
                                        TriggerClientEvent("fechar-nui",source)

                                        TriggerClientEvent("progress",source,5000,"Montando CAPUZ")

                                        SetTimeout(5000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,"capuz",1)
                                            TriggerClientEvent("Notify",source,"Sucesso","Você montou uma <b>CAPUZ</b>.")
                                        end)
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"Negado","Você não tem <b>20x Pano</b> na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"Negado","Você precisa de <b>12x Linha</b>.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"Negado","Você precisa de <b>50000x Dinheiro Sujo</b>.")
                        end
				    else
					    TriggerClientEvent("Notify",source,"Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "pendrive" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pendrive") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 80000 then
                            if vRP.getInventoryItemAmount(user_id,"cobre") >= 10 then
                                if vRP.getInventoryItemAmount(user_id,"fioeletronico") >= 25 then
                                    if vRP.getInventoryItemAmount(user_id,"bateria") >= 5 then
                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",80000) and vRP.tryGetInventoryItem(user_id,"cobre",1) and vRP.tryGetInventoryItem(user_id,"fioeletronico",25) and vRP.tryGetInventoryItem(user_id,"bateria",5) then
                                            TriggerClientEvent("fechar-nui",source)

                                            TriggerClientEvent("progress",source,5000,"Montando PENDRIVE")

                                            SetTimeout(5000,function()
                                                vRP.giveInventoryItem(user_id,"pendrive",1)
                                                TriggerClientEvent("Notify",source,"Sucesso","Você montou um <b>PENDRIVE</b>.")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"Negado","Você não tem <b>5x Bateria</b> na mochila.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"Negado","Você precisa de <b10x Plastico</b>.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"Negado","Você precisa de <b>3x cobre</b>.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"Negado","Você não tem <b>80000x Dinheiro Sujo</b> na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "c4" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("c4") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 80000 then
                            if vRP.getInventoryItemAmount(user_id,"fioeletronico") >= 25 then
                                if vRP.getInventoryItemAmount(user_id,"plastico") >= 10 then
                                    if vRP.getInventoryItemAmount(user_id,"pilha") >= 5 then
                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",80000) and vRP.tryGetInventoryItem(user_id,"fioeletronico",25) and vRP.tryGetInventoryItem(user_id,"plastico",10) and vRP.tryGetInventoryItem(user_id,"pilha",5) then
                                            TriggerClientEvent("fechar-nui",source)

                                            TriggerClientEvent("progress",source,5000,"Montando C4")

                                            SetTimeout(5000,function()
                                                vRP.giveInventoryItem(user_id,"c4",1)
                                                TriggerClientEvent("Notify",source,"Sucesso","Você montou um <b>C4</b>.")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"Negado","Você não tem <b>5x Bateria</b> na mochila.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"Negado","Você precisa de <b10x Plastico</b>.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"Negado","Você precisa de <b>3x cobre</b>.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"Negado","Você não tem <b>80000x Dinheiro Sujo</b> na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "hk" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody_WEAPON_SNSPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"distintivopolicial") >= 21 then
                            if vRP.tryGetInventoryItem(user_id,"distintivopolicial",21) then
                                TriggerClientEvent("fechar-nui",source)

                                TriggerClientEvent("progress",source,5000,"Montando HK")

                                SetTimeout(5000,function()
                                    vRPclient._stopAnim(source,false)
                                    vRP.giveInventoryItem(user_id,"wbody_WEAPON_SNSPISTOL",1)
                                    TriggerClientEvent("Notify",source,"Sucesso","Você montou uma <b>PISTOL HK</b>.")
                                end)
                            end
                        else
                            TriggerClientEvent("Notify",source,"Negado","Você não tem <b>21x Distintivo Policial</b> na mochila.")
                        end
                    else
					    TriggerClientEvent("Notify",source,"Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "mhk" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo_WEAPON_SNSPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"distintivopolicial") >= 6 then
                            if vRP.tryGetInventoryItem(user_id,"distintivopolicial",6) then
                                TriggerClientEvent("fechar-nui",source)

                                TriggerClientEvent("progress",source,5000,"Montando HK")

                                SetTimeout(5000,function()
                                    vRPclient._stopAnim(source,false)
                                    vRP.giveInventoryItem(user_id,"wammo_WEAPON_SNSPISTOL",25)
                                    TriggerClientEvent("Notify",source,"Sucesso","Você montou uma <b>M.PISTOL HK</b>.")
                                end)
                            end
                        else
                            TriggerClientEvent("Notify",source,"Negado","Você não tem <b>6x Distintivo Policial</b> na mochila.")
                        end
                    end
				end
			end
		end
	end
end)