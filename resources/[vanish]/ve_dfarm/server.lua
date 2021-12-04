local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vanish = {}
Tunnel.bindInterface("ve_dfarm",vanish)

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookballas = "https://discord.com/api/webhooks/867449444106502255/sEW1Cqd2dIupKn3tWA_eSFcekV_NO96jC7JHtJOkiXz0ZdPMlWkjgSROwLT5iWqzZ0tP"
local webhookfarmballas = "https://discord.com/api/webhooks/867449444106502255/sEW1Cqd2dIupKn3tWA_eSFcekV_NO96jC7JHtJOkiXz0ZdPMlWkjgSROwLT5iWqzZ0tP"
local webhookgrove = "https://discord.com/api/webhooks/867449540733566976/cTZGUQ1xye5ZzCSvexOG7NGL7UCPI6qU6j2377ZOu2iX3UoAEbdV5C4Kno_oLrclmd60"
local webhookvagos = "https://discord.com/api/webhooks/867449626667909190/AdbUKx1uqiJrh-fn21dozxjTzgxUxxhbJqVrqnve5VwXQ4czpbF5hZHMl0aNls4Ct8_y"
local webhookfarmfamilies = "https://discord.com/api/webhooks/867449626667909190/AdbUKx1uqiJrh-fn21dozxjTzgxUxxhbJqVrqnve5VwXQ4czpbF5hZHMl0aNls4Ct8_y"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


function vanish.checkPermission(perm)
	local source = source
    local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end

function vanish.GiveItem(perm, item1, qtd, item2)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)

    if user_id then
        if perm == "grove.permissao" then
            if item1 == "folhademaconha" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(item1)*1 <= vRP.getInventoryMaxWeight(user_id) then
                    vRP.giveInventoryItem(user_id,item1,1)
                    SendWebhookMessage(webhookgrove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RECEBEU]: 1 "..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")
                    return false    
                end
            elseif item2 == "folhademaconha" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("maconhamacerada")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"folhademaconha", 1) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                        SendWebhookMessage(webhookfarmballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."[ENTREGOU]: 1 Folha de Mconha \n[RECEBEU]: "..parseInt(qtd).." "..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Folha de Maconha!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end                    
            elseif item2 == "maconhamacerada" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("maconha")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"maconhamacerada", 1) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                        SendWebhookMessage(webhookfarmballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."[ENTREGOU]: 1 Maconha Macerada \n[RECEBEU]: "..parseInt(qtd).." "..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Maconha Macerada!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end
            end                        
        elseif perm == "vagos.permissao" then
            if item1 == "folhadecoca" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(item1)*1 <= vRP.getInventoryMaxWeight(user_id) then
                    vRP.giveInventoryItem(user_id,item1,1)
                    SendWebhookMessage(webhookvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\n[RECEBEU]: 1"..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")
                    return false    
                end
            elseif item2 == "folhadecoca" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cocamisturada")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"folhadecoca", 1) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                        SendWebhookMessage(webhookfarmfamilies,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."[ENTREGOU]: 1 Folha de Coca \n[RECEBEU]: "..parseInt(qtd).." "..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Folha de Cocaina!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end                    
            elseif item2 == "cocamisturada" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cocaina")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"cocamisturada", 1) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                        SendWebhookMessage(webhookfarmfamilies,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."[ENTREGOU]: 1 Cocaina Misturada \n[RECEBEU]: "..parseInt(qtd).." "..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Cocaina Misturada!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end
            end      
        elseif perm == "ballas.permissao" then
            if item1 == "acidobateria" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(item1)*1 <= vRP.getInventoryMaxWeight(user_id) then
                    vRP.giveInventoryItem(user_id,item1,1)
                    SendWebhookMessage(webhookballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."[RECEBEU]: 1 "..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")
                    return false    
                end
            elseif item2 == "acidobateria" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("dietilamina")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"acidobateria", 1) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                        SendWebhookMessage(webhookballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."[ENTREGOU]: 1 Acido de Bateria \n[RECEBEU]: "..parseInt(qtd).." "..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Componentes de LSD!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end                    
            elseif item2 == "anfetamina" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("metanfetamina")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"anfetamina", 1) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                        SendWebhookMessage(webhookballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."[ENTREGOU]: 1 Anfetamina \n[RECEBEU]: "..parseInt(qtd).." "..item1.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Ácido!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end
            end
        elseif perm == "ninethree.permissao" then
            if item1 == "pastadeecstasy" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(item1)*1 <= vRP.getInventoryMaxWeight(user_id) then
                    vRP.giveInventoryItem(user_id,item1,1)
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")
                    return false    
                end
            elseif item2 == "pastadeecstasy" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("essenciadeecstasy")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"pastadeecstasy", 1) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Folha de Cocaina!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end                    
            elseif item2 == "essenciadeecstasy" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("ecstasy")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"essenciadeecstasy", 1) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Cocaina Misturada!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end
            end


        elseif perm == "driftking.permissao" then
            if item2 == "metal" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("lockpick")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"metal", 20) then
                        vRP.giveInventoryItem(user_id, "lockpick", parseInt(qtd))
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Folha de Cocaina!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end                    
            end  


        elseif perm == "native.permissao" then
            if item2 == "metal" then
                if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("lockpick")*parseInt(qtd) <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"metal", 20) then
                        vRP.giveInventoryItem(user_id, item1, parseInt(qtd))
                    else
                        TriggerClientEvent("Notify",source,"negado","Você Não Possui Folha de Cocaina!")
                    end    
                else
                    TriggerClientEvent("Notify",source,"negado","Mochila Cheia!")    
                end                    
            end  
        end                         
    end        
end    
