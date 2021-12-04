-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _, i in ipairs(GetActivePlayers()) do
		EnableDispatchService(i,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR A CORONHADA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local timeDistance = 500
    local ped = PlayerPedId()
		if IsPedArmed(ped, 6) then
			timeDistance = 4
       DisableControlAction(1, 140, true)
              DisableControlAction(1, 141, true)
           DisableControlAction(1, 142, true)
		end
		Citizen.Wait(timeDistance)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER ARMA ABAIXO DE 40MPH DENTRO DO CARRO
-----------------------------------------------------------------------------------------------------------------------------------------
-- Citizen.CreateThread(function()
-- 	while true do
-- 		local timeDistance = 500
-- 		local ped = PlayerPedId()
-- 		if IsPedInAnyVehicle(ped) then
-- 			timeDistance = 4
-- 			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
-- 			local speed = GetEntitySpeed(vehicle)*3.6
-- 			if GetEntityModel(vehicle) ~= GetHashKey('buzzard2') and GetEntityModel(vehicle) ~= GetHashKey('polmav') then
-- 				timeDistance = 4
-- 				if speed >= 40 or GetSelectedPedWeapon(ped) ~= GetHashKey("WEAPON_STUNGUN") then
-- 					timeDistance = 4
-- 					DisableControlAction(0, 69, true)
-- 					DisableControlAction(0, 92, true)
-- 				end
-- 			end
-- 		end
-- 		Citizen.Wait(timeDistance)
-- 	end
-- end)

Citizen.CreateThread( function()
    while true do
         Citizen.Wait(0)
         RestorePlayerStamina(PlayerId(), 1.0)
     end
 end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERDER A ADERÊNCIA QUANDO ESTIVER COM A RODA ESTOURADA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(PlayerPedId())
		if IsPedInAnyVehicle(ped) then
			timeDistance = 4
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				for i = 0, 5 do
					if IsVehicleTyreBurst(vehicle, i, true) then
						SetVehicleReduceGrip(vehicle,true)
					end
				end   
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TASERTIME
-----------------------------------------------------------------------------------------------------------------------------------------
local tasertime = false
Citizen.CreateThread(function()
	while true do
		local ORTiming = 500
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			ORTiming = 4
			SetPedToRagdoll(ped,10000,10000,0,0,0,0)
		end

		if IsPedBeingStunned(ped) and not tasertime then
			tasertime = true
			ORTiming = 4
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
		elseif not IsPedBeingStunned(ped) and tasertime then
			tasertime = false
			SetTimeout(5000,function()
				SetTimecycleModifier("hud_def_desat_Trevor")
				SetTimeout(10000,function()
					SetTimecycleModifier("")
					SetTransitionTimecycleModifier("")
					StopGameplayCamShaking()
				end)
			end)
		end
		
		Citizen.Wait(ORTiming)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST WEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
blackWeapons = {}

Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if IsPedInAnyVehicle(PlayerPedId(),true) then
			DisablePlayerVehicleRewards(PlayerId()) -- Desabilitar reward dos veículos
			timeDistance = 4
		end
		for k,v in ipairs(blackWeapons) do
			if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(v) then
				RemoveWeaponFromPed(PlayerPedId(),GetHashKey(v))
				TriggerServerEvent("adminLogs:Armamentos", v)
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR X NA MOTO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local timeDistance = 500
        local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
			if (GetPedInVehicleSeat(vehicle, -1) == ped or GetPedInVehicleSeat(vehicle, 0) == ped) and GetVehicleClass(vehicle) == 8 then
				timeDistance = 4
                DisableControlAction(0, 345, true)
            end
		end
		Citizen.Wait(timeDistance)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR AUTO-CAPACETE NA MOTO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread( function()
	while true do
		Citizen.Wait(5)  
		local veh = GetVehiclePedIsUsing(PlayerPedId())
		if veh ~= 0 then 
			SetPedConfigFlag(PlayerPedId(),35,false) 
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESATIVA O ROUBO DO VEÍCULO SEGURANDO F [ CAR JACKING ]
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
    local timeDistance = 500
    local ped = PlayerPedId()
	if IsPedJacking(ped) then
		timeDistance = 4
      local veh = GetVehiclePedIsIn(ped)
      SetPedIntoVehicle(ped, veh, 0)
      ClearPedTasks(ped)
		end
		Citizen.Wait(timeDistance)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ DRIFT ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(PlayerPedId())
		if IsPedInAnyVehicle(ped) then
			local speed = GetEntitySpeed(vehicle)*2.236936
			if GetPedInVehicleSeat(vehicle,-1) == ped 
				and (GetEntityModel(vehicle) ~= GetHashKey("coach") 
					and GetEntityModel(vehicle) ~= GetHashKey("bus") 
					and GetEntityModel(vehicle) ~= GetHashKey("youga2") 
					and GetEntityModel(vehicle) ~= GetHashKey("ratloader") 
					and GetEntityModel(vehicle) ~= GetHashKey("taxi") 
					and GetEntityModel(vehicle) ~= GetHashKey("boxville4") 
					and GetEntityModel(vehicle) ~= GetHashKey("trash2") 
					and GetEntityModel(vehicle) ~= GetHashKey("tiptruck") 
					and GetEntityModel(vehicle) ~= GetHashKey("rebel") 
					and GetEntityModel(vehicle) ~= GetHashKey("speedo") 
					and GetEntityModel(vehicle) ~= GetHashKey("phantom") 
					and GetEntityModel(vehicle) ~= GetHashKey("packer") 
					and GetEntityModel(vehicle) ~= GetHashKey("paramedicoambu")) then
					if speed <= 100.0 then
					if IsControlPressed(1,21) then
						SetVehicleReduceGrip(vehicle,true)
					else
						SetVehicleReduceGrip(vehicle,false)
					end
				end    
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ STATUS DO DISCORD ] ----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		players = {}
		for i = 0,31 do
			if NetworkIsPlayerActive(i) then
				table.insert(players,i)
			end
		end
		SetDiscordAppId(742506883105030159)
		SetDiscordRichPresenceAsset('no_pvp')
        SetRichPresence("Kyller#0001 - #StayHome \nJogadores Conectados: "..#players)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DAMAGE WALK MODE
-----------------------------------------------------------------------------------------------------------------------------------------
-- local hurt = falsec
-- Citizen.CreateThread(function()
-- 	while true do
-- 		local delayThread = 500
-- 		local ped = PlayerPedId()
-- 		if not IsEntityInWater(ped) then
-- 			if GetEntityHealth(ped) <= 199 then
-- 				delayThread = 5
-- 				setHurt()
-- 			elseif hurt and GetEntityHealth(ped) > 200 then
-- 				setNotHurt()
-- 			end
-- 		end
-- 		Citizen.Wait(delayThread)
-- 	end
-- end)

-- function setHurt()
--     hurt = true
--     RequestAnimSet("move_m@injured")
--     SetPedMovementClipset(PlayerPedId(),"move_m@injured",true)
-- 	SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
-- 	DisableControlAction(0,21) 
-- 	DisableControlAction(0,22)
-- end

-- function setNotHurt()
--     hurt = false
-- 	SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
--     ResetPedMovementClipset(PlayerPedId())
--     ResetPedWeaponMovementClipset(PlayerPedId())
--     ResetPedStrafeClipset(PlayerPedId())
-- end


---ESTOURAR OS PNEUS QUANDO CAPOTA 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
            if GetPedInVehicleSeat(vehicle,-1) == ped then
                local roll = GetEntityRoll(vehicle)
                if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
                      if IsVehicleTyreBurst(vehicle, wheel_rm1, 0) == false then
                    SetVehicleTyreBurst(vehicle, 0, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 1, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 2, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 3, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 4, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 5, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 45, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 47, 1)
                    end
                end
            end
        end
    end
end)

local Teleport = { -- 275.79,-1361.3,24.54
	["HOSPITALHELIPONTO"] = {
		positionFrom = { ['x'] = 298.71, ['y'] = -599.65, ['z'] = 43.3 },
		positionTo = { ['x'] = 338.48, ['y'] = -583.91, ['z'] = 74.17 }
	},
	["HOSPITALNECRO"] = {
		positionFrom = { ['x'] = 340.31, ['y'] = -592.77, ['z'] = 43.29 },
		positionTo = { ['x'] = 275.71, ['y'] = -1361.54, ['z'] = 24.54 }
	}
}

Citizen.CreateThread(function()
	while true do
		local delayThread = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local x,y,z = table.unpack(GetEntityCoords(ped))
			for k,v in pairs(Teleport) do
				if Vdist(v.positionFrom.x,v.positionFrom.y,v.positionFrom.z,x,y,z) <= 1.2 then
					delayThread = 5
					--DrawMarker(21,v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,204,255,50,0,0,0,1)
					if IsControlJustPressed(0,38) then
						SetEntityCoords(ped,v.positionTo.x,v.positionTo.y,v.positionTo.z-0.50)
					end
				end

				if Vdist(v.positionTo.x,v.positionTo.y,v.positionTo.z,x,y,z) <= 1.2 then
					delayThread = 5
					--DrawMarker(21,v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,204,255,50,0,0,0,1)
					if IsControlJustPressed(0,38) then
						SetEntityCoords(ped,v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.50)
					end
				end
			end
		end
		Citizen.Wait(delayThread)
	end
end)
