local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("ve_desmanche")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local segundos = 0
local roubando = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS  
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = { 
	{ ['x'] = 1534.75, ['y'] = 3547.63, ['z'] = 36.64, ['perm'] = "native.permissao" },
	{ ['x'] = 111.46, ['y'] = 6626.86, ['z'] = 31.79, ['perm'] = "driftking.permissao" }
}  
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESMANCHE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local sleep = 500
		if not roubando then
			for _,v in pairs(locais) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(v)
				local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.x,v.y,v.z)
				if distance <= 50 and GetPedInVehicleSeat(GetVehiclePedIsUsing(ped),-1) == ped then
					sleep = 4
					DrawMarker(23,v.x,v.y,v.z-0.96,0,0,0,0,0,0,5.0,5.0,0.5,0,0,255,50,0,0,0,0)
					if distance <= 3.1 and IsControlJustPressed(0,38) then
						if emP.checkPermission(v.perm) then
							emP.checkVehicle()
							roubando = true
							segundos = 40
							FreezeEntityPosition(GetVehiclePedIsUsing(ped),true)

							repeat
								Citizen.Wait(10)
							until segundos == 0

							TriggerServerEvent("desmancheVehicles")
							roubando = false
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXTO
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		if roubando then
			
			if segundos >= 33 then
				sleep = 4
				DisableControlAction(0,75)	
			elseif segundos > 19 and segundos < 33 then
				sleep = 4
				Citizen.Wait(2000)
				TriggerEvent("Notify","sucesso","Abrindo a Porta da Frente Direita.")
				SetVehicleDoorOpen(veh,0,0,0)
				Citizen.Wait(2000)
				TriggerEvent("Notify","sucesso","Abrindo a Porta da Frente Esquerda.")	
				SetVehicleDoorOpen(veh,1,0,0)
				Citizen.Wait(2000)
				TriggerEvent("Notify","sucesso","Abrindo a Porta da Traseira Direita.")	
				SetVehicleDoorOpen(veh,2,0,0)
				Citizen.Wait(2000)
				TriggerEvent("Notify","sucesso","Abrindo a Porta da Traseira Esquerda.")	
				SetVehicleDoorOpen(veh,3,0,0)
				Citizen.Wait(2000)
				TriggerEvent("Notify","sucesso","Abrindo o Capo.")	
				SetVehicleDoorOpen(veh,4,0,0)
				Citizen.Wait(2000)
				TriggerEvent("Notify","sucesso","Abrindo o o Porta Mala.")	
				SetVehicleDoorOpen(veh,5,0,0)
				Citizen.Wait(2000)
				SetVehicleDoorOpen(veh,6,0,0)
			elseif segundos <= 16 and segundos >= 4 then
				sleep = 4
				SetVehicleDoorBroken(veh, 0	, false)
				Citizen.Wait(2000)
				SetVehicleDoorBroken(veh, 1	, false)
				Citizen.Wait(2000)
				SetVehicleDoorBroken(veh, 2	, false)
				Citizen.Wait(2000)
				SetVehicleDoorBroken(veh, 3	, false)
				Citizen.Wait(2000)
				SetVehicleDoorBroken(veh, 4	, false)
				Citizen.Wait(2000)
				SetVehicleDoorBroken(veh, 5	, false)
				Citizen.Wait(2000)
				SetVehicleDoorBroken(veh, 6	, false)
				Citizen.Wait(2000)
				TriggerEvent("Notify","sucesso","Veiculo desmontado.")
				TriggerEvent("Notify","importante","Dinheiro recebido.")
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		if roubando then
			if segundos >= 33 then
				sleep = 4
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, ESTAMOS DESATIVANDO O ~y~RASTREADOR ~w~DO VEÍCULO",4,0.50,0.87,0.50,255,255,255,180)
			elseif segundos > 19 and segundos < 33 then
				sleep = 4
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, ESTAMOS CALCULANDO PEÇAS",4,0.50,0.87,0.50,255,255,255,180)
			elseif segundos < 19 and segundos > 16 then
				sleep = 4
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, PEÇAS CALCULADAS",4,0.50,0.87,0.50,255,255,255,180)
			elseif segundos <= 16 and segundos >= 4 then
				sleep = 4
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, DESMANCHANDO ",4,0.50,0.87,0.50,255,255,255,180)
			elseif segundos < 4 then
				sleep = 4
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, FINALIZANDO DESMANCHE ",4,0.50,0.87,0.50,255,255,255,180)
			end
		end
		Citizen.Wait(sleep)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMINUINDO O TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if roubando then
			if segundos > 0 then
				segundos = segundos - 1
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

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end