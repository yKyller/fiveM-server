local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("ve_roubojewelry")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local andamento = false
local tipo = 0
local segundos = 0
local coordenadaX = -631.39
local coordenadaY = -230.25
local coordenadaZ = 38.05
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DO ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 1 , ['x'] = -626.69 , ['y'] = -238.60 , ['z'] = 38.05 , ['h'] = 213.77 },
	{ ['id'] = 2 , ['x'] = -625.63 , ['y'] = -237.83 , ['z'] = 38.05 , ['h'] = 214.21 },
	{ ['id'] = 3 , ['x'] = -625.78 , ['y'] = -234.56 , ['z'] = 38.05 , ['h'] = 31.36 },
	{ ['id'] = 4 , ['x'] = -626.84 , ['y'] = -235.33 , ['z'] = 38.05 , ['h'] = 31.36 },
	{ ['id'] = 5 , ['x'] = -627.95 , ['y'] = -233.90 , ['z'] = 38.05 , ['h'] = 212.49 },
	{ ['id'] = 6 , ['x'] = -626.90 , ['y'] = -233.15 , ['z'] = 38.05 , ['h'] = 220.39 },
	{ ['id'] = 7 , ['x'] = -620.21 , ['y'] = -234.46 , ['z'] = 38.05 , ['h'] = 218.81 },
	{ ['id'] = 8 , ['x'] = -619.16 , ['y'] = -233.70 , ['z'] = 38.05 , ['h'] = 214.12 },
	{ ['id'] = 9 , ['x'] = -617.54 , ['y'] = -230.52 , ['z'] = 38.05 , ['h'] = 303.29 },
	{ ['id'] = 10 , ['x'] = -618.27 , ['y'] = -229.50 , ['z'] = 38.05 , ['h'] = 302.42 },
	{ ['id'] = 11 , ['x'] = -619.64 , ['y'] = -227.63 , ['z'] = 38.05 , ['h'] = 301.53 },
	{ ['id'] = 12 , ['x'] = -620.40 , ['y'] = -226.56 , ['z'] = 38.05 , ['h'] = 306.27 },
	{ ['id'] = 13 , ['x'] = -623.90 , ['y'] = -227.06 , ['z'] = 38.05 , ['h'] = 34.69 },
	{ ['id'] = 14 , ['x'] = -624.94 , ['y'] = -227.86 , ['z'] = 38.05 , ['h'] = 33.12 },
	{ ['id'] = 15 , ['x'] = -624.40 , ['y'] = -231.09 , ['z'] = 38.05 , ['h'] = 306.53 },
	{ ['id'] = 16 , ['x'] = -623.99 , ['y'] = -228.19 , ['z'] = 38.05 , ['h'] = 212.40 },
	{ ['id'] = 17 , ['x'] = -621.07 , ['y'] = -228.57 , ['z'] = 38.05 , ['h'] = 121.42 },
	{ ['id'] = 18 , ['x'] = -619.72 , ['y'] = -230.43 , ['z'] = 38.05 , ['h'] = 123.59 },
	{ ['id'] = 19 , ['x'] = -620.15 , ['y'] = -233.33 , ['z'] = 38.05 , ['h'] = 33.98 },
	{ ['id'] = 20 , ['x'] = -623.05 , ['y'] = -232.93 , ['z'] = 38.05 , ['h'] = 302.85 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- HACKEAR O SISTEMA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local bowz,cdz = GetGroundZFor_3dCoord(coordenadaX,coordenadaY,coordenadaZ)
		local distance = GetDistanceBetweenCoords(coordenadaX,coordenadaY,cdz,x,y,z,true)
		if distance <= 1.1 and not andamento then
			timeDistance = 5
			text3D(coordenadaX,coordenadaY,coordenadaZ,"~g~E~w~  HACKEAR")
			if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
				func.checkJewelry(coordenadaX,coordenadaY,coordenadaZ,213.52,30,1)
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUBANDO AS JOIAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 1000
		for _,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)

			if distance <= 1.3 and not andamento then
				timeDistance = 5
				text3D(v.x,v.y,v.z,"~g~E~w~  ROUBAR")
				if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
					if func.returnJewelry() then
						func.checkJewels(v.id,v.x,v.y,v.z,v.h,2)
					else
						TriggerEvent("Notify",'negado',"Negado","Hackeie as câmeras de segurança.")
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO O ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("iniciandojewelry")
AddEventHandler("iniciandojewelry",function(x,y,z,h,sec,mod,status)
	andamento = status
	if status then
		tipo = mod
		segundos = sec
		ClearPedTasks(PlayerPedId())
		SetEntityHeading(PlayerPedId(),h)
		SetEntityCoords(PlayerPedId(),x,y,z-1,false,false,false,false)
		SetCurrentPedWeapon(PlayerPedId(),GetHashKey("WEAPON_UNARMED"),true)
		TriggerEvent('cancelando',true)
	else
		TriggerEvent('cancelando',false)
		ClearPedTasks(PlayerPedId())
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if andamento then
			segundos = segundos - 1
			if segundos <= 0 then
				tipo = 0
				andamento = false
				ClearPedTasks(PlayerPedId())
				TriggerEvent('cancelando',false)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function text3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end