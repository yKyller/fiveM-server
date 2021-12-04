local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
HUDserver = Tunnel.getInterface("vrp_hud")
vRPhud = {}
Tunnel.bindInterface("vrp_hud",vRPhud)

local vida = false

RegisterNetEvent('Hud:sendStatus')
AddEventHandler('Hud:sendStatus',function(level)
	local ped = PlayerPedId()
	SendNUIMessage({
		show = IsPauseMenuActive(),
		vida = vida
	})
end)


RegisterNUICallback('fechar', function(data)
	local tipo = data.id
	SendNUIMessage({show = tipo})
end)

local entityExist = false
local entityDead = false
local isInAnyVehicle = false
local sBuffer = {}
local vBuffer = {}
local CintoSeguranca = false
local ExNoCarro = false
local segundos = 0


Citizen.CreateThread(function()
    while true do
		local player = PlayerPedId()
      	entityExist = DoesEntityExist(player)
		entityDead = IsEntityDead(player)
		isInAnyVehicle = IsPedInAnyVehicle(player, true)
		vida = math.floor((GetEntityHealth(player)-100)/(GetEntityMaxHealth(player)-100)*100)
		TriggerEvent('Hud:sendStatus')
        Citizen.Wait(500)
    end
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(500)
	end
end

local disableShuffle = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		local ui = GetMinimapAnchor()

		if IsPedInAnyVehicle(ped) then
			SetRadarZoom(1000)
			DisplayRadar(true)
			local carro = GetVehiclePedIsIn(ped,false)
			local velocidade = GetEntitySpeed(carro)
			drawTxt(ui.left_x,ui.bottom_y-0.20,0.25,"KM/H: " ..parseInt(velocidade*3.6),255,255,255,180)
			if GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped then
				drawTxt(ui.left_x+0.052,ui.bottom_y-0.20,0.25,"COMB: " .. parseInt(GetVehicleFuelLevel(carro)) .. '%',255,255,255,180)
			end
			

			if CintoSeguranca then
				disableShuffle = true
				drawTxt(ui.left_x+0.115,ui.bottom_y-0.20,0.25,"~g~CINTO",255,255,255,180)
			else
				disableShuffle = false
				drawTxt(ui.left_x+0.115,ui.bottom_y-0.20,0.25,"~r~CINTO",255,255,255,140)
			end
		else
			CintoSeguranca = false
			DisplayRadar(false)
		end
	end
end)

RegisterCommand('seat', function(source, args, rawCmd)
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then	
		local carrinhu = GetVehiclePedIsIn(ped, false)
		if not CintoSeguranca then
			if args[1] then
				local acento = parseInt(args[1])
				
				if acento == 1 then
					if IsVehicleSeatFree(carrinhu, -1) then 
						SetPedIntoVehicle(ped, carrinhu, -1)
					else
						TriggerEvent('Notify', 'negado', 'O acento deve estar livre.')
					end
				elseif acento == 2 then
					if IsVehicleSeatFree(carrinhu, 0) then 
						SetPedIntoVehicle(ped, carrinhu, 0)
					else
						TriggerEvent('Notify', 'negado', 'O acento deve estar livre.')
					end
				elseif acento == 3 then
					if IsVehicleSeatFree(carrinhu, 1) then 
						SetPedIntoVehicle(ped, carrinhu, 1)
					else
						TriggerEvent('Notify', 'negado', 'O acento deve estar livre.')
					end
				elseif acento == 4 then
					if IsVehicleSeatFree(carrinhu, 2) then 
						SetPedIntoVehicle(ped, carrinhu, 2)
					else
						TriggerEvent('Notify', 'negado', 'O acento deve estar livre.')
					end
				end
			else
				TriggerEvent('Notify', 'negado', 'Especifique o acento que quer ir!')
			end
		else
			TriggerEvent('Notify', 'negado', 'Você não pode utilizar esse comando com o cinto de segurança!')
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if disableShuffle and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)

		if (GetEntityHealth(PlayerPedId())-100) < 100 then
			TriggerEvent("vrp_sound:source",'heartbeat',0.1)
			ShakeGameplayCam("VIBRATE_SHAKE",0.5)
		else
			StopGameplayCamShaking()
		end
	end
end)


IsCar = function(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end	

Fwv = function (entity)
	local hr = GetEntityHeading(entity) + 90.0
	if hr < 0.0 then
		hr = 360.0 + hr
	end
	hr = hr * 0.0174533
	return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end


Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local car = GetVehiclePedIsIn(ped)

		if car ~= 0 and (ExNoCarro or IsCar(car)) then
			ExNoCarro = true
			if CintoSeguranca then
				DisableControlAction(0,75)
			end

			sleep = 4
			sBuffer[2] = sBuffer[1]
			sBuffer[1] = GetEntitySpeed(car)

			if sBuffer[2] ~= nil and not CintoSeguranca and GetEntitySpeedVector(car,true).y > 1.0 and sBuffer[1] > 10.25 and (sBuffer[2] - sBuffer[1]) > (sBuffer[1] * 0.255) then
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityHealth(ped,GetEntityHealth(ped)-150)
				SetEntityCoords(ped,co.x+fw.x,co.y+fw.y,co.z-0.47,true,true,true)
				SetEntityVelocity(ped,vBuffer[2].x,vBuffer[2].y,vBuffer[2].z)
				segundos = 5
			end

			vBuffer[2] = vBuffer[1]
			vBuffer[1] = GetEntityVelocity(car)

			if IsControlJustReleased(1,73) then
				TriggerEvent("cancelando",true)
				if CintoSeguranca then
					TriggerEvent("vrp_sound:source",'unbelt',0.5)
					-- SetTimeout(0,function()
						CintoSeguranca = false
						TriggerEvent("cancelando",false)
					-- end)
				else
					TriggerEvent("vrp_sound:source",'belt',0.5)
					SetTimeout(1000,function()
						CintoSeguranca = true
						TriggerEvent("cancelando",false)
					end)
				end
			end
		elseif ExNoCarro then
			ExNoCarro = false
			CintoSeguranca = false
			sBuffer[1],sBuffer[2] = 0.0,0.0
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent('pcy:PoliciaToggleCinto')
AddEventHandler('pcy:PoliciaToggleCinto', function(nsource)
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		if CintoSeguranca then
			TriggerEvent("vrp_sound:source",'unbelt',0.5)
			CintoSeguranca = false
			TriggerEvent("cancelando",false)
			TriggerEvent('Notify', 'sucesso', 'O cinto foi retirado de você.')
			TriggerServerEvent('pcy:AvisarCintoPolicia', nsource, 'semcinto')
		else
			TriggerEvent("vrp_sound:source",'belt',0.5)
			TriggerServerEvent('pcy:AvisarCintoPolicia', nsource, 'comcinto')
			SetTimeout(1000,function()
				CintoSeguranca = true
				TriggerEvent("cancelando",false)
				TriggerEvent('Notify', 'sucesso', 'O cinto foi colocado em você.')
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AGACHAR
-----------------------------------------------------------------------------------------------------------------------------------------
local agachar = false
local movimento = false
local ctrl = 0
Citizen.CreateThread( function()
    while true do 
        Citizen.Wait(5)
        local ped = PlayerPedId()
		if DoesEntityExist(ped) and not IsEntityDead(ped) then 
            if not IsPauseMenuActive() then 
                if IsPedJumping(ped) then
                    movimento = false
                end
            end
        end
        if DoesEntityExist(ped) and not IsEntityDead(ped) then 
            DisableControlAction(0,36,true)
            if not IsPauseMenuActive() then 
				if IsDisabledControlJustPressed(0,36) and not IsPedInAnyVehicle(ped) and ctrl == 0 then
					ctrl = 1
                    RequestAnimSet("move_ped_crouched")
                    RequestAnimSet("move_ped_crouched_strafing")
                    if agachar == true then 
                        ResetPedMovementClipset(ped,0.30)
                        ResetPedStrafeClipset(ped)
                        movimento = false
                        agachar = false 
                    elseif agachar == false then
                        SetPedMovementClipset(ped,"move_ped_crouched",0.30)
                        SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
                        agachar = true 
                    end 
                end
            end 
		end 
    end
end)

Citizen.CreateThread(function() 
    while true do
        Wait(0)
        if agachar then DisablePlayerFiring(PlayerId(), true) end
    end
end)

RegisterNetEvent('pcy:SetAgachado')
AddEventHandler('pcy:SetAgachado', function()
	local ped = PlayerPedId()
	agachar = true
	SetPedMovementClipset(ped,"move_ped_crouched",0.30)
	SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VIDA BAIXA
-----------------------------------------------------------------------------------------------------------------------------------------
-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(1)
-- 		local ped = PlayerPedId()
-- 		local vida = GetEntityHealth(ped)
-- 		if vida <= 251 and vida >= 201 and not agachar then
-- 			RequestAnimSet("move_injured_generic")     
--       		SetPedMovementClipset(ped,"move_injured_generic",true)			
-- 		elseif vida <= 200 and vida >= 151 and not agachar then
-- 			RequestAnimSet("move_heist_lester")  
--       		SetPedMovementClipset(ped,"move_heist_lester",true)			
-- 		elseif vida <= 150 and vida >= 101 and not agachar then
-- 			RequestAnimSet("MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP") 
--       		SetPedMovementClipset(ped,"MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP",true)			
-- 		elseif vida <= 400  and vida >= 251 and not agachar and not movimento then
-- 			ResetPedMovementClipset(ped,0.0)			
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
		end
		if ctrl > 0 then
			ctrl = ctrl - 1
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- RAGDOLL
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if segundos > 0 and GetEntityHealth(PlayerPedId()) > 100 then
			SetPedToRagdoll(PlayerPedId(),1000,1000,0,0,0,0)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANDAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("homem",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@confident")
end)

RegisterCommand("mulher",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@heels@c")
end)

RegisterCommand("depressivo",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@depressed@a")
end)

RegisterCommand("depressiva",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@depressed@a")
end)

RegisterCommand("empresario",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@business@a")
end)

RegisterCommand("determinado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@brave@a")
end)

RegisterCommand("descontraido",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@casual@a")
end)

RegisterCommand("farto",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@fat@a")
end)

RegisterCommand("estiloso",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@hipster@a")
end)

RegisterCommand("ferido",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@injured")
end)

RegisterCommand("nervoso",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@hurry@a")
end)

RegisterCommand("desleixado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@hobo@a")
end)

RegisterCommand("infeliz",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@sad@a")
end)

RegisterCommand("musculoso",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@muscle@a")
end)

RegisterCommand("desligado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@shadyped@a")
end)

RegisterCommand("fadiga",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@buzzed")
end)

RegisterCommand("apressado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@hurry_butch@a")
end)

RegisterCommand("descolado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@money")
end)

RegisterCommand("corridinha",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@quick")
end)

RegisterCommand("piriguete",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@maneater")
end)

RegisterCommand("petulante",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@sassy")
end)

RegisterCommand("arrogante",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@arrogant@a")
end)

RegisterCommand("bebado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@drunk@slightlydrunk")
end)

RegisterCommand("bebado2",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@drunk@verydrunk")
end)

RegisterCommand("bebado3",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@drunk@moderatedrunk")
end)

RegisterCommand("irritado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@fire")
end)

RegisterCommand("intimidado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_m@intimidation@cop@unarmed")
end)

RegisterCommand("poderosa",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@handbag")
end)

RegisterCommand("chateado",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@injured")
end)

RegisterCommand("estilosa",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@posh@")
end)

RegisterCommand("sensual",function(source,args)
	movimento = true
	vRP.loadAnimSet("move_f@sexy@a")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------

function drawTxt(x,y,scale,text,r,g,b,a)
	SetTextFont(Arial)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function drawTxt2(x,y,scale,text,r,g,b,a, font)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function GetMinimapAnchor()
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end