-----------------------------------------------------------------------------------------------------------------------------------------
--[ vRP ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Resg = Tunnel.getInterface("vrp_hospital")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MACAS DO HOSPITAL ]------------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------------------
local macas = {
	{ ['x'] = 344.24, ['y'] = -582.21, ['z'] = 43.31, ['x2'] = 344.66, ['y2'] = -580.87, ['z2'] = 44.01, ['h'] = 70.0 },
	{ ['x'] = 348.82, ['y'] = -583.36, ['z'] = 43.31, ['x2'] = 349.71, ['y2'] = -583.56, ['z2'] = 44.01, ['h'] = 330.0 },
	{ ['x'] = 352.31, ['y'] = -584.43, ['z'] = 43.31, ['x2'] = 353.10, ['y2'] = -584.77, ['z2'] = 44.10, ['h'] = 330.0 },
	{ ['x'] = 355.82, ['y'] = -585.73, ['z'] = 43.31, ['x2'] = 356.56, ['y2'] = -585.94, ['z2'] = 44.10, ['h'] = 330.0 },
	{ ['x'] = 359.60, ['y'] = -586.81, ['z'] = 43.31, ['x2'] = 360.55, ['y2'] = -587.08, ['z2'] = 44.01, ['h'] = 330.0 },
	{ ['x'] = 346.12, ['y'] = -590.31, ['z'] = 43.31, ['x2'] = 346.99, ['y2'] = -590.55, ['z2'] = 44.10, ['h'] = 150.0 },
	{ ['x'] = 349.93, ['y'] = -591.46, ['z'] = 43.31, ['x2'] = 350.78, ['y2'] = -591.64, ['z2'] = 44.10, ['h'] = 150.0 },
	{ ['x'] = 353.42, ['y'] = -592.40, ['z'] = 43.31, ['x2'] = 354.26, ['y2'] = -592.52, ['z2'] = 44.10, ['h'] = 150.0 },
	{ ['x'] = 356.51, ['y'] = -593.99, ['z'] = 43.31, ['x2'] = 357.42, ['y2'] = -594.18, ['z2'] = 44.10, ['h'] = 150.0 },
	{ ['x'] = 333.62, ['y'] = -579.58, ['z'] = 43.32, ['x2'] = 334.05, ['y2'] = -578.29, ['z2'] = 44.01, ['h'] = 68.98 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ USO ]-------------------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------------------
local emMaca = false
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		for k,v in pairs(macas) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local cod = macas[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),cod.x,cod.y,cod.z,true) < 2.2 then
				idle = 5
				text3D(cod.x,cod.y,cod.z,"~g~E ~w~ DEITAR       ~y~G ~w~ TRATAMENTO")
			end

			if distance < 1.2 then
				idle = 4
				if IsControlJustPressed(0,38) then
					SetEntityCoords(ped,v.x2,v.y2,v.z2)
					SetEntityHeading(ped,v.h)
					vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
					emMaca = true
				end

				if IsControlJustPressed(0,47) then
					if Resg.checkServices() then
						if Resg.checkPayment() then
							TriggerEvent('tratamento-macas')
							SetEntityCoords(ped,v.x2,v.y2,v.z2)
							SetEntityHeading(ped,v.h)
							vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
						end
					else
						TriggerEvent("Notify","Aviso","Existem paramédicos em serviço.")
					end
				end

			end

			if IsControlJustPressed(0,167) and emMaca then
				ClearPedTasks(GetPlayerPed(-1))
				emMaca = false
			end
		end

		Citizen.Wait(idle)
	end
end)

RegisterNetEvent('tratamento-macas')
AddEventHandler('tratamento-macas',function()
	TriggerEvent("cancelando",true)
	repeat
		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+3)
		Citizen.Wait(1500)
	until GetEntityHealth(PlayerPedId()) >= 399 or GetEntityHealth(PlayerPedId()) <= 101
	TriggerEvent("Notify","Importante","Tratamento concluido.")
	TriggerEvent("cancelando",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRATAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
local tratamento = false
RegisterNetEvent("tratamento")
AddEventHandler("tratamento",function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    local armour = GetPedArmour(ped)

    local x,y,z = table.unpack(GetEntityCoords(ped))
    --NetworkResurrectLocalPlayer(x,y,z,GetEntityHeading(ped),true,false)
    SetEntityHealth(ped,health)
    -- SetPedArmour(ped,armour)

    if tratamento then
        return
    end

    tratamento = true
    TriggerEvent("Notify","Sucesso","Tratamento iniciado, aguarde a liberação do paramédico.",8000)
    TriggerEvent('resetWarfarina')
    TriggerEvent('resetDiagnostic')
    

    if tratamento then
        repeat
			Citizen.Wait(400)
			if IsEntityPlayingAnim(ped, "amb@world_human_sunbathe@female@back@idle_a","idle_a", 3) then
				if GetEntityHealth(ped) > 101 then
					SetEntityHealth(ped,GetEntityHealth(ped)+1)
				else
					TriggerEvent('Notify',"Negado",'O tratamento foi cancelado.')
					tratamento = false
					return
				end
			else
				TriggerEvent('Notify',"Negado",'O tratamento foi cancelado.')
				tratamento = false
				return
			end
        until GetEntityHealth(ped) >= 399 or GetEntityHealth(ped) <= 101
		TriggerEvent("Notify","Sucesso","Tratamento concluido.",8000)
		tratamento = false
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TEXT3D ]----------------------------------------------------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local checkinX, checkinY, checkinZ = 323.84,-581.83,43.32
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCHECKIN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local distance = Vdist(x,y,z,checkinX,checkinY,checkinZ)
		if distance <= 2.0 then
			text3D(checkinX,checkinY,checkinZ,"~g~E~w~  PARA PRODUZIR BANDAGEM")
			if IsControlJustPressed(1,38) then
				Resg.receiveBandagem()
			end
		end
		Citizen.Wait(1)
	end
end)