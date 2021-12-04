local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = Tunnel.getInterface("ve_corrida")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local inrace = false
local timerace = 0
local racePoint = 1
local racepos = 0 
local CoordenadaX, CoordenadaY, CoordenadaZ = 1371.05,-739.9,66.81
local PlateIndex = nil
local bomba = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local races = {
	[1] = {
		['time'] = 150,
    	[1] = { ['x'] = 1295.13, ['y'] = -713.94, ['z'] = 64.53 },
		[2] = { ['x'] = 1218.76, ['y'] = -758.45, ['z'] = 58.33 },
		[3] = { ['x'] = 1063.93, ['y'] = -758.51, ['z'] = 57.43 },
		[4] = { ['x'] = 1044.44, ['y'] = -781.81, ['z'] = 57.73 },
		[5] = { ['x'] = 958.66, ['y'] = -841.7, ['z'] = 44.41 },
		[6] = { ['x'] = 959.29, ['y'] = -899.53, ['z'] = 43.08 },
		[7] = { ['x'] = 875.51, ['y'] = -911.57, ['z'] = 25.81 },
		[8] = { ['x'] = 797.8, ['y'] = -918.39, ['z'] = 25.28 },
		[9] = { ['x'] = 676.86, ['y'] = -954.82, ['z'] = 22.06 },
		[10] = { ['x'] = 689.51, ['y'] = -988.29, ['z'] = 23.26 },
		[11] = { ['x'] = 761.86, ['y'] = -1031.73, ['z'] = 20.56 },
		[12] = { ['x'] = 767.93, ['y'] = -1099.07, ['z'] = 22.07 },
		[13] = { ['x'] = 767.23, ['y'] = -1044.97, ['z'] = 26.37 },
		[14] = { ['x'] = 807.59, ['y'] = -1085.62, ['z'] = 28.42 },
		[15] = { ['x'] = 885.72, ['y'] = -1084.05, ['z'] = 29.86 },
		[16] = { ['x'] = 902.57, ['y'] = -1007.58, ['z'] = 33.98 },
		[17] = { ['x'] = 618.63, ['y'] = -1021.19, ['z'] = 36.65 },
		[18] = { ['x'] = 404.19, ['y'] = -1046.98, ['z'] = 29.03 },
		[19] = { ['x'] = 301.99, ['y'] = -1095.43, ['z'] = 29.13 },
		[20] = { ['x'] = 400.02, ['y'] = -1133.08, ['z'] = 29.17 },
		[21] = { ['x'] = 467.67, ['y'] = -1091.4, ['z'] = 28.94 },
		[22] = { ['x'] = 405.76, ['y'] = -1067.89, ['z'] = 29.06 },
		[23] = { ['x'] = 331.55, ['y'] = -1004.85, ['z'] = 29.04 },
		[24] = { ['x'] = 258.74, ['y'] = -990.51, ['z'] = 29.02 },
		[25] = { ['x'] = 252.38, ['y'] = -901.39, ['z'] = 28.76 },
		[26] = { ['x'] = 215.47, ['y'] = -940.14, ['z'] = 23.87 },
	},
	[2] = {
		['time'] = 200,
		[1] = { ['x'] = 1295.13, ['y'] = -713.94, ['z'] = 64.53 },
		[2] = { ['x'] = 1263.35, ['y'] = -560.67, ['z'] = 68.8 },
		[3] = { ['x'] = 1265.23, ['y'] = -399.26, ['z'] = 68.85 },
		[4] = { ['x'] = 1262.59, ['y'] = -343.25, ['z'] = 68.82 },
		[5] = { ['x'] = 1168.56, ['y'] = -337.95, ['z'] = 68.43 },
		[6] = { ['x'] = 1102.17, ['y'] = -371.46, ['z'] = 66.81 },
		[7] = { ['x'] = 974.79, ['y'] = -294.6, ['z'] = 66.74 },
		[8] = { ['x'] = 773.71, ['y'] = -345.39, ['z'] = 48.36 },
		[9] = { ['x'] = 664.52, ['y'] = -342.5, ['z'] = 36.15 },
		[10] = { ['x'] = 606.76, ['y'] = -408.78, ['z'] = 24.49 },
		[11] = { ['x'] = 600.72, ['y'] = -463.87, ['z'] = 25.39 },
		[12] = { ['x'] = 559.94, ['y'] = -564.17, ['z'] = 24.54 },
		[13] = { ['x'] = 527.49, ['y'] = -663.08, ['z'] = 24.57 },
	    [14] = { ['x'] = 502.84, ['y'] = -809.43, ['z'] = 24.64 },
		[15] = { ['x'] = 492.89, ['y'] = -1127.35, ['z'] = 29.08 },
		[16] = { ['x'] = 406.23, ['y'] = -1143.7, ['z'] = 29.14 },
		[17] = { ['x'] = 254.29, ['y'] = -1183.9, ['z'] = 37.98 },
		[18] = { ['x'] = -282.81, ['y'] = -1200.38, ['z'] = 36.98 },
		[19] = { ['x'] = -440.3, ['y'] = -1246.74, ['z'] = 45.58 },
		[20] = { ['x'] = -458.28, ['y'] = -1397.86, ['z'] = 29.11 },
		[21] = { ['x'] = -627.2, ['y'] = -1721.72, ['z'] = 36.99 },
		[22] = { ['x'] = -506.06, ['y'] = -1699.75, ['z'] = 36.59 },
		[23] = { ['x'] = -430.56, ['y'] = -1699.77, ['z'] = 18.75 },
		[24] = { ['x'] = -481.74, ['y'] = -1656.83, ['z'] = 18.53 },
		[25] = { ['x'] = -504.18, ['y'] = -1732.88, ['z'] = 18.79 },
		[26] = { ['x'] = -463.02, ['y'] = -1724.35, ['z'] = 18.38 },
		[27] = { ['x'] = -426.1, ['y'] = -1709.3, ['z'] = 18.94 },
	},
	[3] = {
		['time'] = 270,
		[1] = { ['x'] = 1295.13, ['y'] = -713.94, ['z'] = 64.53 },
		[2] = { ['x'] = 1251.47, ['y'] = -741.57, ['z'] = 61.54 },
		[3] = { ['x'] = 1236.29, ['y'] = -652.8, ['z'] = 65.71 },
		[4] = { ['x'] = 1225.64, ['y'] = -542.86, ['z'] = 67.25 },
		[5] = { ['x'] = 1197.94, ['y'] = -514.14, ['z'] = 64.87 },
		[6] = { ['x'] = 1170.27, ['y'] = -267.83, ['z'] = 68.85 },
		[7] = { ['x'] = 882.53, ['y'] = -105.34, ['z'] = 79.17	},
		[8] = { ['x'] = 924.39, ['y'] = -15.08, ['z'] = 78.49 },
		[9] = { ['x'] = 920.41, ['y'] = 50.53, ['z'] = 80.5 },
		[10] = { ['x'] = 1146.11, ['y'] = 374.82, ['z'] = 91.08 },
		[11] = { ['x'] = 1035.71, ['y'] = 481.69, ['z'] = 95.21 },
		[12] = { ['x'] = 879.92, ['y'] = 541.17, ['z'] = 124.78 },
		[13] = { ['x'] = 732.3, ['y'] = 629.2, ['z'] = 128.58 },
		[14] = { ['x'] = 606.34, ['y'] = 645.81, ['z'] = 128.64 },
		[15] = { ['x'] = 716.82, ['y'] = 620.94, ['z'] = 128.64 },
		[16] = { ['x'] = 899.76, ['y'] = 518.27, ['z'] = 122.15 },
		[17] = { ['x'] = 621.35, ['y'] = 309.6, ['z'] = 106.7 },
		[18] = { ['x'] = 623.29, ['y'] = 217.86, ['z'] = 100.0 },
		[19] = { ['x'] = 569.89, ['y'] = 118.51, ['z'] = 97.77 },
		[20] = { ['x'] = 498.51, ['y'] = 70.22, ['z'] = 96.03 },
		[21] = { ['x'] = 400.12, ['y'] = -113.44, ['z'] = 64.75 },
		[22] = { ['x'] = 358.63, ['y'] = -193.59, ['z'] = 58.05 },
		[23] = { ['x'] = 263.33, ['y'] = -160.88, ['z'] = 61.28 },
		[24] = { ['x'] = 92.26, ['y'] = -584.87, ['z'] = 43.78 },
		[25] = { ['x'] = 13.91, ['y'] = -785.51, ['z'] = 43.88 },
		[26] = { ['x'] = -33.09, ['y'] = -911.29, ['z'] = 29.14 },
		[27] = { ['x'] = 54.46, ['y'] = -1057.99, ['z'] = 29.14 },
		[28] = { ['x'] = -2.54, ['y'] = -1036.82, ['z'] = 38.2 },
		[29] = { ['x'] = -2.54, ['y'] = -1036.82, ['z'] = 38.2 },
		[30] = { ['x'] = -59.36, ['y'] = -1016.66, ['z'] = 28.57 },
		[31] = { ['x'] = -82.37, ['y'] = -1010.82, ['z'] = 27.78 },
		[32] = { ['x'] = -77.0, ['y'] = -962.56, ['z'] = 28.19 },
		[33] = { ['x'] = -124.25, ['y'] = -942.23, ['z'] = 28.88 },
		[34] = { ['x'] = -161.71, ['y'] = -937.42, ['z'] = 29.03 },
		[35] = { ['x'] = -194.16, ['y'] = -1017.07, ['z'] = 29.05 },
		[36] = { ['x'] = -228.77, ['y'] = -1096.49, ['z'] = 29.02 },
		[37] = { ['x'] = -254.9, ['y'] = -1144.38, ['z'] = 22.82 },
		[38] = { ['x'] = -296.82, ['y'] = -1258.98, ['z'] = 29.21 },
		[39] = { ['x'] = -350.31, ['y'] = -1377.56, ['z'] = 31.0 },
		[40] = { ['x'] = -363.07, ['y'] = -1450.33, ['z'] = 29.01 },
		[41] = { ['x'] = -376.77, ['y'] = -1488.49, ['z'] = 25.99 },
		[42] = { ['x'] = -384.66, ['y'] = -1045.38, ['z'] = 23.23 },
		[43] = { ['x'] = -360.92, ['y'] = -976.29, ['z'] = 30.18 },
		[44] = { ['x'] = -354.46, ['y'] = -806.48, ['z'] = 32.32 },
		[45] = { ['x'] = -310.93, ['y'] = -743.37, ['z'] = 33.7 },
		[46] = { ['x'] = -223.78, ['y'] = -631.23, ['z'] = 33.05},
		[47] = { ['x'] = -127.89, ['y'] = -665.34, ['z'] = 34.9 },
		[48] = { ['x'] = -22.85, ['y'] = -686.57, ['z'] = 32.07 },
		[49] = { ['x'] = 59.32, ['y'] = -626.01, ['z'] = 31.41 }
	}
}

RegisterCommand('correr', function(source, args, rawCmd)
	if not inrace then
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsUsing(ped)
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
		local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) ~= 8 and GetPedInVehicleSeat(vehicle,-1) == ped then
				if distance <= 30 then
						if emP.CorridaLiberada() then
							emP.checkPolice()
							vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
							racepos = 1
							racepoint = emP.ReicePointe()
							inrace = true
							timerace = races[racepoint].time
							PlateIndex = GetVehicleNumberPlateText(vehicle)
							SetVehicleNumberPlateText(vehicle,"CORREDOR")
							CriandoBlip(races,racepoint,racepos)
							emP.startBombRace()
							bomba = CreateObject(GetHashKey("prop_c4_final_green"),x,y,z,true,false,false)
							AttachEntityToEntity(bomba,vehicle,GetEntityBoneIndexByName(vehicle,"exhaust"),0.0,0.0,0.0,180.0,-90.0,180.0,false,false,false,true,2,true)
							TriggerEvent("Notify","sucesso","Sucesso","Você iniciou uma <b>corrida</b>, acabe ela antes do tempo previstoe e <b>NÃO</b> desça do veículo, caso contrário seu veículo explodirá.")
						end
				end
			end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOINTS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if inrace then
			timeDistance = 4
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z)
			local distance = GetDistanceBetweenCoords(races[racepoint][racepos].x,races[racepoint][racepos].y,cdz,x,y,z,true)

			if distance <= 15.0 then
				if IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) ~= 8 then
					DrawMarker(1,races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z-3,0,0,0,0,0,0,12.0,12.0,8.0,0,0,255,25,0,0,0,0)
					DrawMarker(21,races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z+1,0,0,0,0,180.0,130.0,3.0,3.0,2.0,0,0,255,50,1,0,0,1)
					if distance <= 15.1 then
						RemoveBlip(blips)
						if racepos == #races[racepoint] then
							inrace = false
							timerace = 0
							SetVehicleNumberPlateText(GetPlayersLastVehicle(),PlateIndex)
							PlateIndex = nil
							PlaySoundFrontend(-1,"RACE_PLACED","HUD_AWARDS",false)
							DetachEntity(bomba,false,false)
							TriggerServerEvent("trydeleteobj",ObjToNet(bomba))
							emP.removeBombRace()
							emP.paymentCheck(racepoint,1)
							TriggerEvent('Notify', 'importante',"Importante", 'Você finalizou a corrida com sucesso!')
						else
							racepos = racepos + 1
							CriandoBlip(races,racepoint,racepos)
						end
						vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEDRAWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if inrace and timerace > 0 and GetVehiclePedIsUsing(PlayerPedId()) then
			timeDistance = 4
			drawTxt("RESTAM ~b~"..timerace.." SEGUNDOS ~w~PARA CHEGAR AO DESTINO FINAL DA CORRIDA",4,0.5,0.905,0.45,255,255,255,100)
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERACE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if inrace and timerace > 0 then
			timerace = timerace - 1
			if timerace <= 0 or not IsPedInAnyVehicle(PlayerPedId()) then
				inrace = false
				RemoveBlip(blips)
				SetVehicleNumberPlateText(GetPlayersLastVehicle(),PlateIndex)
				PlateIndex = nil
				SetTimeout(3000,function()
					DetachEntity(bomba,false,false)
					TriggerServerEvent("trydeleteobj",ObjToNet(bomba))
					emP.removeBombRace()
					AddExplosion(GetEntityCoords(GetPlayersLastVehicle()),1,1.0,true,true,true)
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(races,racepoint,racepos)
	blips = AddBlipForCoord(races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z)
	SetBlipSprite(blips,433)
	SetBlipColour(blips,1)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Corrida Clandestina")
	EndTextCommandSetBlipName(blips)
end

RegisterNetEvent("emp_race:defuse")
AddEventHandler("emp_race:defuse",function()
	inrace = false
	SetVehicleNumberPlateText(GetPlayersLastVehicle(),PlateIndex)
	PlateIndex = nil
	RemoveBlip(blips)
	DetachEntity(bomba,false,false)
	TriggerServerEvent("trydeleteobj",ObjToNet(bomba))
	emP.removeBombRace()
end)