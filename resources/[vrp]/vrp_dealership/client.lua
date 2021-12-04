-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_dealership",src)
vSERVER = Tunnel.getInterface("vrp_dealership")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local dealerOpen = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEALERS
-----------------------------------------------------------------------------------------------------------------------------------------
local dealers = {
	{ ['x'] = -30.03, ['y'] = -1104.67, ['z'] = 26.42 },
	{ ['x'] = -57.47, ['y'] = -1097.11, ['z'] = 26.43 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPEN DEALER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local x,y,z = table.unpack(GetEntityCoords(ped))
			for k,v in pairs(dealers) do
				local distance = Vdist(x,y,z,v.x,v.y,v.z)
				if distance <= 3 then
					DrawMarker(36,v.x,v.y,v.z-0.3,0,0,0,0.0,0,0,0.9,0.8,0.8,0,60,255,50,0,0,0,1)
					-- if distance <= 1.5 and IsControlJustPressed(0,38) and vSERVER.permissao() then
					if distance <= 1.5 and IsControlJustPressed(0,38) then
						SetNuiFocus(true,true)
						SendNUIMessage({ action = "showMenu" })
						dealerOpen = true
						vRP._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_b","prop_cs_tablet",49,28422)
					end
				end
			end
		end
	end
end)

RegisterCommand('conce', function(source, args, rawCmd)
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) then
		local x,y,z = table.unpack(GetEntityCoords(ped))
		-- for k,v in pairs(dealers) do
			-- local distance = Vdist(x,y,z,v.x,v.y,v.z)
			-- if distance <= 25 and vSERVER.permissao() then
			if vSERVER.permissao() then
				SetNuiFocus(true,true)
				SendNUIMessage({ action = "showMenu" })
				dealerOpen = true
				vRP._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_b","prop_cs_tablet",49,28422)
			end
		-- end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEALERCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("dealerClose",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideMenu" })
	dealerOpen = false
	vRP._DeletarObjeto()
	vRP._stopAnim(false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCARROS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestCarros",function(data,cb)
	local veiculos = vSERVER.Carros()
	if veiculos then
		cb({ veiculos = veiculos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTMOTOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestMotos",function(data,cb)
	local veiculos = vSERVER.Motos()
	if veiculos then
		cb({ veiculos = veiculos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTIMPORT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestImport",function(data,cb)
	local veiculos = vSERVER.Import()
	if veiculos then
		cb({ veiculos = veiculos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPOSSUIDOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestPossuidos",function(data,cb)
	local veiculos = vSERVER.Possuidos()
	if veiculos then
		cb({ veiculos = veiculos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUYDEALER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("buyDealer",function(data)
	if data.name ~= nil then
		vSERVER.buyDealer(data.name)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELLDEALER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sellDealer",function(data)
	if data.name ~= nil then
		vSERVER.sellDealer(data.name)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AUTO-UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dealership:Update")
AddEventHandler("dealership:Update",function(action)
	SendNUIMessage({ action = action })
end)