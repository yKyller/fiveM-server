local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("ve_policia",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = 1}, -- taser
	{ item = 2}, -- cassetete
	{ item = 3}, -- lanterna
	{ item = 5}, -- combatpistol
	{ item = 6}, -- smg
	{ item = 7}, -- combatpdw
	{ item = 8}, -- deagle
	{ item = 9}, -- ar15
	{ item = 10}, -- mpx
	{ item = 11}, -- limpar
	{ item = 23}, -- radio

	-- Munições
	{ item = 12 },
	{ item = 13 },
	{ item = 14 },
	{ item = 15 },
	{ item = 16 },
	{ item = 17 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("policia-comprar")
AddEventHandler("policia-comprar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if item == 1 then
					vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "Taser".."</b> do arsenal. <b>")					
				elseif item == 2 then
					vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "Cassetete".."</b> do arsenal. <b>")				
				elseif item == 3 then
					vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "Lanterna".."</b> do arsenal. <b>")
				elseif item == 5 then
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "Glock".."</b> do arsenal. <b>")				
				elseif item == 6 then
					vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_SMG", 250)
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "MP5".."</b> do arsenal. <b>")				
				elseif item == 7 then
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_COMBATPDW", 250)
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "SIG Sauer MPX".."</b> do arsenal. <b>")				
				elseif item == 8 then
					vRPclient.giveWeapons(source,{["WEAPON_HEAVYPISTOL"] = { ammo = 250 }})
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "Deagle".."</b> do arsenal. <b>")				
				elseif item == 9 then
					vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE", 250)
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "AR-15".."</b> do arsenal. <b>")	
				elseif item == 10 then
					vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE_MK2"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE_MK2", 250)
					TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "Mpx".."</b> do arsenal. <b>")
				elseif item == 22 then
					if vRP.getInventoryItemAmount(user_id,"compattach") >= 1 then
						TriggerClientEvent("Notify",source,"negado","Você já possui um <b>Compattach</b>.", 8000)
					else
						vRP.giveInventoryItem(user_id, "compattach", 1)
						TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "compattach".."</b> do arsenal. <b>")
					end
				elseif item == 23 then
					if vRP.getInventoryItemAmount(user_id,"radio") >= 1 then
						TriggerClientEvent("Notify",source,"negado","Você já possui um <b>Rádio</b>.", 8000)
					else
						vRP.giveInventoryItem(user_id, "radio", 1)
						TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "rádio".."</b> do arsenal. <b>")
					end
			   elseif item == 24 then
					if vRP.getInventoryItemAmount(user_id,"celular") >= 1 then
						TriggerClientEvent("Notify",source,"negado","Você já possui um <b>Celular</b>.", 8000)
					else
						vRP.giveInventoryItem(user_id, "celular", 1)
						TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>" .. "celular".."</b> do arsenal. <b>")		
					end
				elseif item == 11 then
					vRPclient.giveWeapons(source,{},true)

					-- Limpa munição reserva de MP5
					ammo_smg = vRP.getInventoryItemAmount(user_id, "wammo|WEAPON_SMG")
					vRP.tryGetInventoryItem(user_id,"wammo|WEAPON_SMG", ammo_smg)

					-- Limpa munição reserva de SIG Sauer MPX
					ammo_pdw = vRP.getInventoryItemAmount(user_id, "wammo|WEAPON_COMBATPDW")
					vRP.tryGetInventoryItem(user_id,"wammo|WEAPON_COMBATPDW", ammo_pdw)

					-- Limpa munição reserva de M4A1
					ammo_m4a1 = vRP.getInventoryItemAmount(user_id, "wammo|WEAPON_CARBINERIFLE")
					vRP.tryGetInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE", ammo_m4a1)

					-- Limpa munição reserva de M4A4
					ammo_m4a4 = vRP.getInventoryItemAmount(user_id, "wammo|WEAPON_CARBINERIFLE_MK2")
					vRP.tryGetInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE_MK2", ammo_m4a4)
					TriggerClientEvent("Notify",source,"sucesso","Guardou <b>" .. "".."</b> todo o armamento. <b>")
				end
			end
		end
	end
end)

function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"paisanapolicia.permissao") or vRP.hasPermission(user_id,"policiaacao.permissao")
end