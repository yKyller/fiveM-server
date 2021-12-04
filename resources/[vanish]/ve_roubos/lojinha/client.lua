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
Tunnel.bindInterface("ve_lojinha",src)
vSERVER = Tunnel.getInterface("ve_lojinha")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbery = false
local timedown = 0
local robmark = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbers = {
	[1] = { ['x'] = 2549.20, ['y'] = 384.92, ['z'] = 108.62 },
	[2] = { ['x'] = -709.18, ['y'] = -904.26, ['z'] = 19.21 },
	[3] = { ['x'] = -3250.06, ['y'] = 1004.43, ['z'] = 12.83 },
	[4] = { ['x'] = 1734.88, ['y'] = 6420.87, ['z'] = 35.03 },
	[5] = { ['x'] = 546.36, ['y'] = 2662.74, ['z'] = 42.15 },
	[6] = { ['x'] = 1160.16, ['y'] = -314.12, ['z'] = 69.20 },
	[7] = { ['x'] = 2672.84, ['y'] = 3286.63, ['z'] = 55.25 },
	[8] = { ['x'] = 378.08, ['y'] = 332.77, ['z'] = 103.56 },
	[9] = { ['x'] = -1828.58, ['y'] = 799.10, ['z'] = 138.17 },
	[10] = { ['x'] = -43.45, ['y'] = -1748.65, ['z'] = 29.43 },	
	[11] = { ['x'] = 1707.94, ['y'] = 4920.35, ['z'] = 42.07 },
	[12] = { ['x'] = -2959.61, ['y'] = 387.06, ['z'] = 14.05 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERSBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		timeDistance = 1000
		if robbery then
			timeDistance = 1
			drawText("PARA CANCELAR O ROUBO SAIA PELA PORTA DA FRENTE",4,0.5,0.88,0.36,255,255,255,50)
			drawText("AGUARDE ~g~"..timedown.." SEGUNDOS~w~ ATÉ QUE TERMINE O ROUBO",4,0.5,0.9,0.46,255,255,255,150)
			if GetEntityHealth(PlayerPedId()) <= 101 then
				robbery = false
				vSERVER.stopRobbery()
			end
		end
		Citizen.Wait(timeDistance)
	end
end)

RegisterCommand('lojinha', function(source, args, rawCmd)
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	for k,v in pairs(robbers) do
		local distance = Vdist(x,y,z,v.x,v.y,v.z)
		if distance <= 1.1 and GetEntityHealth(ped) > 101 then
			timeDistance = 5
				timedown = 4
				if vSERVER.checkPolice(k) then
				vSERVER.startRobbery(k,v.x,v.y,v.z)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobbery(time,x2,y2,z2)
	robbery = true
	timedown = time
	Citizen.CreateThread(function()
		while robbery do
			local timeDistance = 500
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local distance = Vdist(x,y,z,x2,y2,z2)
			if distance >= 10.0 then
				timeDistance = 4
				robbery = false
				vSERVER.stopRobbery()
			end
			Citizen.Wait(timeDistance)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERYPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobberyPolice(x,y,z,localidade)
	if not DoesBlipExist(robmark) then
		robmark = AddBlipForCoord(x,y,z)
		SetBlipScale(robmark,0.5)
		SetBlipSprite(robmark,161)
		SetBlipColour(robmark,59)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Roubo: "..localidade)
		EndTextCommandSetBlipName(robmark)
		SetBlipAsShortRange(robmark,false)
		SetBlipRoute(robmark,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPROBBERYPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.stopRobberyPolice()
	if DoesBlipExist(robmark) then
		RemoveBlip(robmark)
		robmark = nil
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
				robbery = false
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