local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = Tunnel.getInterface("ve_municao_nui")
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
RegisterNetEvent('MuniFecharNui')
AddEventHandler('MuniFecharNui', function()
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
	if data == "five" then
		TriggerServerEvent("MuniTransformar","five")
	--TEC
	elseif data == "tec9" then
		TriggerServerEvent("MuniTransformar","tec9")
	--MP5
	elseif data == "mp5mk2" then
		TriggerServerEvent("MuniTransformar","mp5mk2")
	--AK
	elseif data == "ak" then
		TriggerServerEvent("MuniTransformar","ak103")
		
	--G3
	elseif data == "g3" then
		TriggerServerEvent("MuniTransformar","g3")
		
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{1068.04,-2004.34,32.09},  -- SICILIANA
	{566.16,-3121.45,18.77}  -- TRIADE
}

RegisterCommand('fmunicao', function(source, args, rawCmd)
	SetNuiFocus(false,false)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 2.0 then
				if src.ChecarMunicaoPermissao() then
				ToggleActionMenu()
			else
				TriggerEvent('Notify', 'negado',"Negado", 'Você não tem permissão para isso.')
			end
		end
	end
end)