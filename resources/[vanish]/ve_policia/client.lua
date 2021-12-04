local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("ve_policia")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
local locs = {
	{ x = 467.51, y = -988.62, z = 24.93 },
	{ x = 470.27, y = -987.95, z = 24.93 }
}
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	if data == "armamentos-comprar-taser" then
		if HasPedGotWeapon(ped, 0x3656C8C1) then
			TriggerEvent("Notify", "negado", "Você já possui um <b>Taser</b>.")
		else
			TriggerServerEvent("policia-comprar",1)
		end
	elseif data == "armamentos-comprar-cassetete" then
		if HasPedGotWeapon(ped, 0x678B81B1) then
			TriggerEvent("Notify", "negado", "Você já possui um <b>Cassetete</b>.")
		else
			TriggerServerEvent("policia-comprar",2)
		end
	elseif data == "armamentos-comprar-lanterna" then
		if HasPedGotWeapon(ped, 0x8BB05FD7) then
			TriggerEvent("Notify", "negado", "Você já possui uma <b>Lanterna</b>.")
		else
			TriggerServerEvent("policia-comprar",3)
		end
	elseif data == "armamentos-comprar-glock" then
		if HasPedGotWeapon(ped, 0x5EF9FEC4) then
			TriggerEvent("Notify", "negado", "Você já possui uma <b>Glock</b>.")
		else
			TriggerServerEvent("policia-comprar",5)
		end
	elseif data == "armamentos-comprar-mp5" then
		if HasPedGotWeapon(ped, 0x2BE6766B) then
			TriggerEvent("Notify", "negado", "Você já possui uma <b>MP5</b>.")
		else
			TriggerServerEvent("policia-comprar",6)
		end
	elseif data == "armamentos-comprar-sigsauer" then
		if HasPedGotWeapon(ped, 0x0A3D4D34) then
			TriggerEvent("Notify", "negado", "Você já possui uma <b>SIG Sauer MPX</b>.")
		else
			TriggerServerEvent("policia-comprar",7)
		end
	elseif data == "armamentos-comprar-deagle" then
		if HasPedGotWeapon(ped, 0xD205520E) then
			TriggerEvent("Notify", "negado", "Você já possui uma <b>Deagle</b>.")
		else
			TriggerServerEvent("policia-comprar",8)
		end
	elseif data == "armamentos-comprar-m4a1" then
		if HasPedGotWeapon(ped, 0x83BF0278) then
			TriggerEvent("Notify", "negado", "Você já possui uma <b>M4A1</b>.")
		else
			TriggerServerEvent("policia-comprar",9)
		end
	elseif data == "armamentos-comprar-m4a4" then
		if HasPedGotWeapon(ped, 0xFAD1F1C9) then
			TriggerEvent("Notify", "negado", "Você já possui uma <b>M4A4</b>.")
		else
			TriggerServerEvent("policia-comprar",10)
		end
	elseif data == "armamentos-comprar-limpar" then
		TriggerServerEvent("policia-comprar",11)
	elseif data == "armamentos-comprar-radio" then
		TriggerServerEvent("policia-comprar",23)


	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Wait(0)
		for k, v in pairs(locs) do
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
			if distance <= 1.4 then
				if IsControlJustPressed(0,38) and emP.checkPermission() then
					ToggleActionMenu()
				end
			end
		end
	end
end)