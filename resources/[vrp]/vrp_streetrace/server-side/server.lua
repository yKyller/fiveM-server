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
cnVRP = {}
Tunnel.bindInterface("vrp_streetrace",cnVRP)
vCLIENT = Tunnel.getInterface("vrp_streetrace")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local race = 1
local totalRaces = 18
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACE
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.checkTicket()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then

		if true then
			TriggerEvent("vrp_sysblips:ToggleService",source,"Corredor",75)
			vRP.upgradeStress(user_id,5)
			return true
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACE
-----------------------------------------------------------------------------------------------------------------------------------------
--[[function cnVRP.startRace()
	local copAmount = vRP.getUsersByPermission("policia.permissao")
	for k,v in pairs(copAmount) do
		async(function()
			TriggerClientEvent("Notify",player,"importante","Recebemos um relato de um corredor ilegal.",5000)
		end)
	end
	return parseInt(race)
end]]
function cnVRP.startRace()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	local policia = vRP.getUsersByPermission("policia.permissao")
	--TriggerEvent('vrp_sysblips:ToggleService',{ name = "Corredor", src = source, color = 83 })
	TriggerClientEvent("vrp_sysblips:ToggleService",source,"Corredor",83)
	for l,w in pairs(policia) do
		local player = vRP.getUserSource(parseInt(w))
		if player then
			async(function()
				vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
				TriggerClientEvent("NotifyPush",player,{ time = os.date("%H:%M:%S - %d/%m/%Y"), text = "Recebemos um relato de um corredor ilegal.", code = 31, title = "Corredor ilegal", x = x, y = y, z = z, rgba = {170,80,25} })
			end)
		end
	end
	return parseInt(race)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RANDOMPOINT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		race = math.random(totalRaces)
		Citizen.Wait(5*60000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.paymentMethod(vehPlate)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		TriggerEvent("vrp_sysblips:ExitService",source)
		vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(math.random(15000,20000)))
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFUSAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("defusar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			local nplayer = vRPclient.nearestPlayer(source,10)
			if nplayer then
				vCLIENT.defuseRace(nplayer)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_STREETRACE:EXPLOSIVEPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_streetrace:explosivePlayers")
AddEventHandler("vrp_streetrace:explosivePlayers",function()
	local source = source
	TriggerEvent("vrp_sysblips:ExitService",source)
end)