-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_chest",src)
vCLIENT = Tunnel.getInterface("vrp_chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbaupolicia = "https://discord.com/api/webhooks/867278084162846770/tYpJ3Rl9lx2qqXNXOzrWfUKcBn4HLnQoi5MUTFBXMpxfVNPnQg3ChvnpRCB_dvY20lTj"
local webhookbaugangues = "https://discord.com/api/webhooks/867278167534075904/DeAVk6ZmVFcc-Ux8MhCaNk9Q7t0ZMaWoNVEhIt93pHOcF7_y9_HK7lOgvfF6hGCO-UTe"
local webhookbaubloods = "https://discord.com/api/webhooks/867278253966229505/unKNZY5Rw1EjXQEwm1HmzgIaDs5IPBEPG0z-_r5vICFKmswoRTmnfOizVRVF5aVHnYf4"
local webhookbaucrips = "https://discord.com/api/webhooks/867278336538443776/jCS_kg65cWFDqNKUS-Wq1PVIrm3pVtBWrZMC4PxzUZISnygjOSNJl6a6xD2mxsat0Zjb"
local webhookbauvagos = "https://discord.com/api/webhooks/867278430474338324/8H0_-XCwhNCivBbqtW4VVl8fCZBDILrdwYAtSfPD0POm6Wvd7bFFHhV-AetgIcKTzwbM"
local webhookbautriade = "https://discord.com/api/webhooks/867278749456400385/VBrhYs-Xg1oDa1IZboUPDTDUug0qDNBUeRNSP0rZ-8Zkw4ryWgZFZgXR-NU6RLDOquhr"
local webhookbaugrove = "https://discord.com/api/webhooks/867278843307229214/SKVPPqgVZ9msVJjstVKgzUD89OfT4kcerskY3_WHp3Qz7L7rej5MWkD1QVtWzMkkHrxo"
local webhookbausiciliana = "https://discord.com/api/webhooks/867278939902312459/uH9EQzjJTyWDuyQitxvQ0OxTOPR87edjsvGD_0HxA-be78HK34neaZltDt7REN5W7T-M"
local webhookbaubahamas = "https://discord.com/api/webhooks/867279026288853002/cgLp1YyoQYeVeS0fRFJkTswiW_IKyMcA6GZyLfIR22dnSxbFEDCHxWj5zkcjJudRQ6o6"
local webhookbaulifeinvader = "https://discord.com/api/webhooks/867279111529037884/NQ7xcUb8bl-TWcRSdHr0QC5ldmfuTdQ3s59JV7SudtL7jn6jBuDA8F4u_w0rQb9gdCqa"
local webhookbauballas = "https://discord.com/api/webhooks/867279185666899988/OlcItC3lPiw0p2rvPQktv28Kz_-YaGqs9SaVkZNSpfOkjNDeVGbAr_kLftkEQ0UgOV0X"
local webhookbaunative = "https://discord.com/api/webhooks/867279471789867019/jyPnxtczhmv9AGwQMl6KRSEHo1zNADmgDbePn40Lt0r1Fh0pHTYFnHDXJEAUVKrWEyag"
local webhookbaudriftking = "https://discord.com/api/webhooks/867279556871979018/kTuTeI3yPYLvrYrcR1U8QNXssjHOyw2_8usJWQzEn9MFnJy78kFbLiFgnleQkFdCS5uZ"
local webhookbauninethree = "https://discord.com/api/webhooks/867279636576469012/T7HL_StMKLiIB1PcyrfgJI5NFlUWkZmCcV0NTrgMzfH9juHhHVb89LspGlbJhgyCsbYa"
local webhookbau = "https://discord.com/api/webhooks/867278009299107840/reSIUELp-d0XIvmVbQXLj9uBdmFctHAVc9br0A6OrLb0ZVJFVAZXD8tiG37RsTROAKWf"
 
function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
local chest = {
	["Policia"] = { 15000,"policia.permissao" },
	["Ballas"] = { 50000,"ballas.permissao" },
	["Vagos"] = { 50000,"vagos.permissao" },
    ["Grove"] = { 50000,"grove.permissao" },
    ["NineThree"] = { 50000,"ninethree.permissao" },
	["Crips"] = { 50000,"crips.permissao" },
	["Bloods"] = { 50000,"bloods.permissao" },
	["Triade"] = { 50000,"triade.permissao" },
	["Siciliana"] = { 50000,"siciliana.permissao" },
	["Bennys"] = { 50000,"mecanico.permissao" },
	["Bahamas"] = { 50000,"bahamas.permissao" },
	["LifeInvader"] = { 50000,"lifeinvader.permissao" },
    ["Native"] = { 50000,"native.permissao" },
    ["Driftking"] = { 50000,"driftking.permissao" },
	["Hospital"] = { 50000,"medico.permissao" },
	["Galaxy"] = { 50000,"galaxy.permissao" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processando = {}
local actived = {}
local chestTimer = 0
local beingUsed = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEDOWNTIME
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k,v in pairs(actived) do
            if v > 0 then
                actived[k] = v - 1
                if v == 0 then
                    actived[k] = nil
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSANDO (METODO DE NÃO DUPAR)
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(8000)
		local t = os.time()
		for idx,v in pairs(processando) do
			if (t - v) >= 5 then
				processando[idx] = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if chestTimer > 0 then
            chestTimer = chestTimer - 1
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINTPERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkIntPermissions(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)

	if nuser_id then
		TriggerClientEvent("Notify",source,"negado","Você não consegue acessar o báu com pessoas ao lado.")
	else
		if user_id then
			if not vRP.searchReturn(source,user_id) then
				if vRP.hasPermission(user_id,chest[chestName][2]) then
					return true
				else
					TriggerClientEvent("Notify",source,"negado","Você não tem permissão para isso",8000)
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function src.openChest(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local hsinventory = {}
		local myinventory = {}
		local data = vRP.getSData("chest:"..tostring(chestName))
		local result = json.decode(data) or {}
		if result then
			for k,v in pairs(result) do
				table.insert(hsinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
			end

			local inv = vRP.getInventory(parseInt(user_id))
			for k,v in pairs(inv) do
				table.insert(myinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
			end
		end
		return hsinventory,myinventory,vRP.getInventoryWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeItemsWeight(result),parseInt(chest[tostring(chestName)][1])
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function src.storeItem(chestName,itemName,amount)
    local source = source
    if itemName then
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        if user_id and not processando[chestName]then
            processando[chestName] = os.time()
            if string.match(itemName,"identidade") then
                TriggerClientEvent("Notify",source,"importante","Não pode guardar este item.",8000)
                processando[chestName] = nil
                return
            end
 
            local data = vRP.getSData("chest:"..tostring(chestName))
            local items = json.decode(data) or {}
            if items then
                if parseInt(amount) > 0 then
                    local new_weight = vRP.computeItemsWeight(items)+vRP.getItemWeight(itemName)*parseInt(amount)
                    if new_weight <= parseInt(chest[tostring(chestName)][1]) then
                        if actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
                            if chestName == "Policia" then
									SendWebhookMessage(webhookbaupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end							
									if chestName == "Ballas" or chestName == "Vagos" or chestName == "Grove" or chestName == "Crips" or chestName == "Triade" or chestName == "siciliana" or chestName == "Bahamas" or chestName == "Native" or chestName == "Driftking" or chestName == "LifeInvader" or chestName == "Bloods" or chestName == "NineThree" then
									SendWebhookMessage(webhookbaugangues,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Ballas" then
									SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Vagos" then			
									SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Grove" then					
									SendWebhookMessage(webhookbaugrove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Crips" then					
									SendWebhookMessage(webhookbaucrips,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Native" then					
									SendWebhookMessage(webhookbaunative,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Bahamas" then					
									SendWebhookMessage(webhookbaubahamas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Bloods" then					
									SendWebhookMessage(webhookbaubloods,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Siciliana" then					
									SendWebhookMessage(webhookbausiciliana,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Triade" then					
									SendWebhookMessage(webhookbautriade,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "LifeInvader" then					
									SendWebhookMessage(webhookbaulifeinvader,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                end
                                     if chestName == "NineThree" then					
									SendWebhookMessage(webhookbauninethree,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
									if chestName == "Driftking" then					
									SendWebhookMessage(webhookbaudriftking,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								end
                            if user_id and vRP.tryGetInventoryItem(parseInt(user_id),itemName,parseInt(amount)) then
                                actived[parseInt(user_id)] = 4
                                chestTimer = 10
                                if items[itemName] ~= nil then
                                    items[itemName].amount = parseInt(items[itemName].amount) + parseInt(amount)
                                else
                                    items[itemName] = { amount = parseInt(amount) }
                                end
                                vRP.setSData("chest:"..tostring(chestName),json.encode(items))
                                TriggerClientEvent('Creative:UpdateChest',source,'updateChest')
                            else
                                TriggerClientEvent("Notify",source,"aviso","Você está fazendo ações muito rapido!")
                            end 
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","<b>Chest</b> cheio.",8000)
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Digite o valor corretamente.",8000)
                end
            end
            processando[chestName] = nil
        else
            TriggerClientEvent("Notify",source,"negado","Aguarde o item está indo pro báu.",8000)
        end 
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function src.takeItem(chestName,itemName,amount)
    local source = source
    if itemName then
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        if user_id and not processando[chestName] then
            processando[chestName] = os.time()
            local data = vRP.getSData("chest:"..tostring(chestName))
            local items = json.decode(data) or {}
            if items then
                if parseInt(amount) > 0 then
                    if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then
                        if vRP.getInventoryWeight(parseInt(user_id))+vRP.getItemWeight(itemName)*parseInt(amount) <= vRP.getInventoryMaxWeight(parseInt(user_id)) then
                                    if chestName == "Policia" then
										SendWebhookMessage(webhookbaupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end							
										if chestName == "Ballas" or chestName == "Vagos" or chestName == "Grove" or chestName == "Crips" or chestName == "Triade" or chestName == "siciliana" or chestName == "Bahamas" or chestName == "Natvie" or chestName == "Driftking" or chestName == "LifeInvader" or chestName == "Bloods" or chestName == "NineThree" then
										SendWebhookMessage(webhookbaugangues,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Ballas" then
										SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Vagos" then			
										SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Grove" then					
										SendWebhookMessage(webhookbaugrove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Crips" then					
										SendWebhookMessage(webhookbaucrips,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Native" then					
										SendWebhookMessage(webhookbaunative,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Bahamas" then					
										SendWebhookMessage(webhookbaubahamas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Bloods" then					
										SendWebhookMessage(webhookbaubloods,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Siciliana" then					
										SendWebhookMessage(webhookbausiciliana,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Triade" then					
										SendWebhookMessage(webhookbautriade,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "LifeInvader" then					
										SendWebhookMessage(webhookbaulifeinvader,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                        if chestName == "NineThree" then					
										SendWebhookMessage(webhookbauninethree,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
										if chestName == "Driftking" then					
										SendWebhookMessage(webhookbaudriftking,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end
                            if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] and chestTimer <= 0 then
                                actived[parseInt(user_id)] = 4
                                chestTimer = 10
                                vRP.giveInventoryItem(parseInt(user_id),itemName,parseInt(amount))
                                items[itemName].amount = parseInt(items[itemName].amount) - parseInt(amount)
                                if parseInt(items[itemName].amount) <= 0 then
                                    items[itemName] = nil
                                end
                                TriggerClientEvent('Creative:UpdateChest',source,'updateChest')
                                vRP.setSData("chest:"..tostring(chestName),json.encode(items))
                            else
                                TriggerClientEvent("Notify",source,"aviso","Você está fazendo ações muito rapido!")
                            end 
                        else
                            TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
                        end
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Digite o valor corretamente.",8000)
                end
            end
            processando[chestName] = nil
        else
			TriggerClientEvent("Notify",source,"negado","Aguarde o item está indo pro inventário.",8000)
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.chestClose(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		beingUsed[chest[chestName][2]] = false
	end
	return false
end