local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = Tunnel.getInterface("ve_armas_nui")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FECHAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('ArmasFecharNui')
AddEventHandler('ArmasFecharNui', function()
	SetNuiFocus(false)
	TransitionFromBlurred(1000)
	SendNUIMessage({ hidemenu = true })
end)

RegisterNetEvent('TravarPed')
AddEventHandler('TravarPed', function(status)
	FreezeEntityPosition(PlayerPedId(), status)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)

	-- FIVE
	if data == "five-etapa1" then
		TriggerServerEvent("ArmasTransformar","pecadearma")
	elseif data == "five-etapa2" then
		TriggerServerEvent("ArmasTransformar","armacaodearma")
	elseif data == "five-etapa3" then
		TriggerServerEvent("ArmasTransformar","five")

	--TEC
	elseif data == "tec-etapa1" then
		TriggerServerEvent("ArmasTransformar","pecadetec")
	elseif data == "tec-etapa2" then
		TriggerServerEvent("ArmasTransformar","armacaodetec")
	elseif data == "tec-etapa3" then
		TriggerServerEvent("ArmasTransformar","tec9")
 
	-- G3
	elseif data == "g3-etapa1" then
		TriggerServerEvent("ArmasTransformar","pecadeg3")
	elseif data == "g3-etapa2" then
		TriggerServerEvent("ArmasTransformar","armacaodeg3")
	elseif data == "g3-etapa3" then
		TriggerServerEvent("ArmasTransformar","g3")

	--MP5
	elseif data == "mp5-etapa1" then
		TriggerServerEvent("ArmasTransformar","pecademp5")
	elseif data == "mp5-etapa2" then
		TriggerServerEvent("ArmasTransformar","armacaodemp5")
	elseif data == "mp5-etapa3" then
		TriggerServerEvent("ArmasTransformar","mp5mk2")

	--AK
	elseif data == "ak-etapa1" then
		TriggerServerEvent("ArmasTransformar","pecadeak")
	elseif data == "ak-etapa2" then
		TriggerServerEvent("ArmasTransformar","armacaodeak")
	elseif data == "ak-etapa3" then
		TriggerServerEvent("ArmasTransformar","ak103")
		
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{1272.18,-1711.65,54.78},  -- CRIPS
    {-1075.41,-1678.81,4.58}  -- BLOODS
}

RegisterCommand('farmas', function(source, args, rawCmd)
	SetNuiFocus(false,false)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 2.0 then
				if src.ChecarArmasPermissao() then
				ToggleActionMenu()
			else
				TriggerEvent('Notify',"Negado", 'Você não tem permissão para isso.')
			end
		end
	end
end)