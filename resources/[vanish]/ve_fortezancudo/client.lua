-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
pcy = {}
Tunnel.bindInterface("ve_fortezancudo",pcy)
vSERVER = Tunnel.getInterface("ve_fortezancudo")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local roubos = false
local roubosmarcacao = nil
local pegando = false 
local timedown = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL DOS ROUBOS
-----------------------------------------------------------------------------------------------------------------------------------------
local fortezancudo = {
	[1] = { ['x'] = -2357.08, ['y'] = 3251.37, ['z'] = 101.46 }, -- FORTE ZANCUDO
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FORTE ZANCUDO PUXAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fortezancudo', function(source, args, rawCmd)
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	for k,v in pairs(fortezancudo) do
		local distance = Vdist(x,y,z,v.x,v.y,v.z)
		if distance <= 1.1 and GetEntityHealth(ped) > 101 then
			if vSERVER.checarPolicia() then
				vSERVER.comecarRoubos(k,v.x,v.y,v.z)
				pegando = true 
                TriggerEvent('cancelando',true)
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false,{{"anim@heists@prison_heistig1_p1_guard_checks_bus","loop"}},true)
                TriggerEvent("progress", 60000, "pegando")
                SetTimeout(60000, function()
                    FreezeEntityPosition(ped, false)
                    vRP._stopAnim(false)
                    TriggerEvent('cancelando',false)
					pegando = false
				end)
			end
		else
			if GetEntityHealth(PlayerPedId()) <= 101 then
				roubos = false
				vSERVER.pararRoubos()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Começar Roubos
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.comecarRoubos(tempo,x2,y2,z2)
	roubos = true
	timedown = tempo
	Citizen.CreateThread(function()
		while roubos do
			Citizen.Wait(5)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local distance = Vdist(x,y,z,x2,y2,z2)
			if distance >= 10.0 then
				roubos = false
				vSERVER.pararRoubos()
			end
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Começar Roubos (Policia)
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.comecarRoubosPolicia(x,y,z,localidade)
	if not DoesBlipExist(roubosmarcacao) then
		roubosmarcacao = AddBlipForCoord(x,y,z)
		SetBlipScale(roubosmarcacao,0.5)
		SetBlipSprite(roubosmarcacao,161)
		SetBlipColour(roubosmarcacao,59)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Roubo: "..localidade)
		EndTextCommandSetBlipName(roubosmarcacao)
		SetBlipAsShortRange(roubosmarcacao,false)
		SetBlipRoute(roubosmarcacao,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Parar Roubos (Policia)
-----------------------------------------------------------------------------------------------------------------------------------------
function pcy.pararRoubosPolicia()
	if DoesBlipExist(roubosmarcacao) then
		RemoveBlip(roubosmarcacao)
		roubosmarcacao = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if timedown >= 1 then
			timedown = timedown - 1
			if timedown == 0 then
				roubos = false
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function drawText(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end