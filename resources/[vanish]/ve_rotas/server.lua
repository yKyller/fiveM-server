-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
pcy = {}
Tunnel.bindInterface("ve_rotas",pcy)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local quantity = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUANTITY
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.Quantidade()
	local source = source
	if quantity[source] == nil then
		quantity[source] = math.random(4,7)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.checkPayment(index)
	pcy.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(index)*quantity[source] <= vRP.getInventoryMaxWeight(user_id) then
		vRP.giveInventoryItem(user_id,"dinheirosujo",math.random(300,500))
		vRP.giveInventoryItem(user_id,index,math.random(5,7))
		quantity[source] = nil
		return true
		end
	end
end
