local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
src = Tunnel.getInterface("vrp_player",src)



RegisterNetEvent( 'lafa2k_flag:fps20' )
AddEventHandler( 'lafa2k_flag:fps20', function()   
    SetTimecycleModifier("int_hospital2_dm")
end)
----------------------------------------------------------------------------------------------------------------------------------------
-- /VTUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("vtuning",function(source,args)
	local vehicle = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(vehicle) then
		local motor = GetVehicleMod(vehicle,11)
		local freio = GetVehicleMod(vehicle,12)
		local transmissao = GetVehicleMod(vehicle,13)
		local suspensao = GetVehicleMod(vehicle,15)
		local blindagem = GetVehicleMod(vehicle,16)
		local body = GetVehicleBodyHealth(vehicle)
		local engine = GetVehicleEngineHealth(vehicle)
		local fuel = GetVehicleFuelLevel(vehicle)

		if motor == -1 then
			motor = "Desativado"
		elseif motor == 0 then
			motor = "Nível 1 / "..GetNumVehicleMods(vehicle,11)
		elseif motor == 1 then
			motor = "Nível 2 / "..GetNumVehicleMods(vehicle,11)
		elseif motor == 2 then
			motor = "Nível 3 / "..GetNumVehicleMods(vehicle,11)
		elseif motor == 3 then
			motor = "Nível 4 / "..GetNumVehicleMods(vehicle,11)
		elseif motor == 4 then
			motor = "Nível 5 / "..GetNumVehicleMods(vehicle,11)
		end

		if freio == -1 then
			freio = "Desativado"
		elseif freio == 0 then
			freio = "Nível 1 / "..GetNumVehicleMods(vehicle,12)
		elseif freio == 1 then
			freio = "Nível 2 / "..GetNumVehicleMods(vehicle,12)
		elseif freio == 2 then
			freio = "Nível 3 / "..GetNumVehicleMods(vehicle,12)
		end

		if transmissao == -1 then
			transmissao = "Desativado"
		elseif transmissao == 0 then
			transmissao = "Nível 1 / "..GetNumVehicleMods(vehicle,13)
		elseif transmissao == 1 then
			transmissao = "Nível 2 / "..GetNumVehicleMods(vehicle,13)
		elseif transmissao == 2 then
			transmissao = "Nível 3 / "..GetNumVehicleMods(vehicle,13)
		elseif transmissao == 3 then
			transmissao = "Nível 4 / "..GetNumVehicleMods(vehicle,13)
		end

		if suspensao == -1 then
			suspensao = "Desativado"
		elseif suspensao == 0 then
			suspensao = "Nível 1 / "..GetNumVehicleMods(vehicle,15)
		elseif suspensao == 1 then
			suspensao = "Nível 2 / "..GetNumVehicleMods(vehicle,15)
		elseif suspensao == 2 then
			suspensao = "Nível 3 / "..GetNumVehicleMods(vehicle,15)
		elseif suspensao == 3 then
			suspensao = "Nível 4 / "..GetNumVehicleMods(vehicle,15)
		end

		if blindagem == -1 then
			blindagem = "Desativado"
		elseif blindagem == 0 then
			blindagem = "Nível 1 / "..GetNumVehicleMods(vehicle,16)
		elseif blindagem == 1 then
			blindagem = "Nível 2 / "..GetNumVehicleMods(vehicle,16)
		elseif blindagem == 2 then
			blindagem = "Nível 3 / "..GetNumVehicleMods(vehicle,16)
		elseif blindagem == 3 then
			blindagem = "Nível 4 / "..GetNumVehicleMods(vehicle,16)
		elseif blindagem == 4 then
			blindagem = "Nível 5 / "..GetNumVehicleMods(vehicle,16)
		end

		TriggerEvent("Notify","importante","<b>Motor:</b> "..motor.."<br><b>Freio:</b> "..freio.."<br><b>Transmissão:</b> "..transmissao.."<br><b>Suspensão:</b> "..suspensao.."<br><b>Blindagem:</b> "..blindagem.."<br><b>Chassi:</b> "..parseInt(body/10).."%<br><b>Engine:</b> "..parseInt(engine/10).."%<br><b>Gasolina:</b> "..parseInt(fuel).."%",15000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALÁRIO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30*60000)
		TriggerServerEvent('salario:pagamento')
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMACAO DA BOCA AO FALAR
-----------------------------------------------------------------------------------------------------------------------------------------
function GetPlayers()
  local players = {}
  for i = 0, 256 do
      if NetworkIsPlayerActive(i) then
          players[#players + 1] = i
      end
  end
  return players
end

Citizen.CreateThread(function()
  RequestAnimDict("facials@gen_male@variations@normal")
  RequestAnimDict("mp_facial")

  local talkingPlayers = {}
  while true do
      Citizen.Wait(300)

      for k,v in pairs(GetPlayers()) do
          local boolTalking = NetworkIsPlayerTalking(v)
          if v ~= PlayerId() then
              if boolTalking and not talkingPlayers[v] then
                  PlayFacialAnim(GetPlayerPed(v), "mic_chatter", "mp_facial")
                  talkingPlayers[v] = true
              elseif not boolTalking and talkingPlayers[v] then
                  PlayFacialAnim(GetPlayerPed(v), "mood_normal_1", "facials@gen_male@variations@normal")
                  talkingPlayers[v] = nil
              end
          end
      end
  end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOCARJACK
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
			local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
			if GetVehicleDoorLockStatus(veh) >= 2 or GetPedInVehicleSeat(veh,-1) then
				TriggerServerEvent("TryDoorsEveryone",veh,2,GetVehicleNumberPlateText(veh))
			end
		end
	end
end)

RegisterNetEvent("SyncDoorsEveryone")
AddEventHandler("SyncDoorsEveryone",function(veh,doors)
	SetVehicleDoorsLocked(veh,doors)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /ATTACHS
-----------------------------------------------------------------------------------------------------------------------------------------
weapons = {
    [GetHashKey('WEAPON_PISTOL')] = { silenciador = GetHashKey('COMPONENT_AT_PI_SUPP_02'), lanterna = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"), mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_PISTOL_CLIP_02"), mira2 = nil },
    [GetHashKey('WEAPON_COMBATPISTOL')] = { silenciador = GetHashKey('COMPONENT_AT_PI_SUPP'), lanterna = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey("COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER"), mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_APPISTOL')] = { silenciador = GetHashKey("COMPONENT_AT_PI_SUPP"), lanterna = GetHashKey("COMPONENT_AT_PI_FLSH"), grip = nil, skin = GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"), mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_APPISTOL_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_PISTOL50')] = { silenciador = GetHashKey("COMPONENT_AT_AR_SUPP_02"), lanterna = GetHashKey("COMPONENT_AT_PI_FLSH"), grip = nil, skin = GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"), mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_PISTOL50_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_HEAVYPISTOL')] = { silenciador = GetHashKey("COMPONENT_AT_PI_SUPP"), lanterna = GetHashKey("COMPONENT_AT_PI_FLSH"), grip = nil, skin = GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"), mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_PISTOL_MK2')] = { silenciador = GetHashKey("COMPONENT_AT_PI_SUPP_02"), lanterna = GetHashKey("COMPONENT_AT_PI_FLSH_02"), grip = nil, skin = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE"), mira = GetHashKey("COMPONENT_AT_PI_RAIL"), compensador = GetHashKey("COMPONENT_AT_PI_COMP"), carregador = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_VINTAGEPISTOL')] = { silenciador = GetHashKey('COMPONENT_AT_PI_SUPP'), lanterna = nil, grip = nil, skin = nil, mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02"), mira2 = nil, mira3 = nil },
    [GetHashKey('WEAPON_SNSPISTOL')] = { silenciador = GetHashKey('COMPONENT_AT_PI_SUPP'), lanterna = nil, grip = nil, skin = nil, mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_SNSPISTOL_CLIP_02"), mira2 = nil, mira3 = nil },
    [GetHashKey('WEAPON_SNSPISTOL_MK2')] = { silenciador = GetHashKey('COMPONENT_AT_PI_SUPP_02'), lanterna = GetHashKey('COMPONENT_AT_PI_FLSH_03'), grip = nil, skin = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE"), mira = GetHashKey('COMPONENT_AT_PI_RAIL_02'), compensador = GetHashKey('COMPONENT_AT_PI_COMP_02'), carregador = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_02"), mira2 = nil, mira3 = nil },
    [GetHashKey('WEAPON_REVOLVER_MK2')] = { silenciador = nil, lanterna = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_IND_01"), mira = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2'), compensador = GetHashKey('COMPONENT_AT_PI_COMP_03'), carregador = nil, mira2 = nil, mira3 = nil },
    [GetHashKey('WEAPON_MICROSMG')] = { silenciador = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lanterna = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"), mira = GetHashKey('COMPONENT_AT_SCOPE_MACRO'), compensador = nil, carregador = GetHashKey("COMPONENT_MICROSMG_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_SMG')] = { silenciador = GetHashKey('COMPONENT_AT_PI_SUPP'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_SMG_VARMOD_LUXE'), mira = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"), compensador = nil, carregador = GetHashKey("COMPONENT_SMG_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_ASSAULTSMG')] = { silenciador = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER'), mira = GetHashKey("COMPONENT_AT_SCOPE_MACRO"), compensador = nil, carregador = GetHashKey("COMPONENT_ASSAULTSMG_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_MINISMG')] = { silenciador = nil, lanterna = nil, grip = nil, skin = nil, mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_MINISMG_CLIP_02"), mira2 = nil, mira3 = nil },
    [GetHashKey('WEAPON_SMG_MK2')] = { silenciador = GetHashKey('COMPONENT_AT_PI_SUPP'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_SMG_MK2_CAMO_IND_01'), mira = GetHashKey('COMPONENT_AT_SCOPE_SMALL_SMG_MK2'), compensador = GetHashKey("COMPONENT_AT_MUZZLE_01"), carregador = GetHashKey('COMPONENT_SMG_MK2_CLIP_02'), mira2 = GetHashKey('COMPONENT_AT_SIGHTS_SMG'), mira3 = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2') },
	[GetHashKey('WEAPON_MACHINEPISTOL')] = { silenciador = GetHashKey('COMPONENT_AT_PI_SUPP'), lanterna = nil, grip = nil, skin = nil, mira = nil, compensador = nil, carregador = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_02'), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_COMBATPDW')] = { silenciador = nil, lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = nil, mira = GetHashKey("COMPONENT_AT_SCOPE_SMALL"), compensador = nil, carregador = GetHashKey("COMPONENT_COMBATPDW_CLIP_02"), mira2 = nil, mira3 = nil },    
    [GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = { silenciador = GetHashKey('COMPONENT_AT_SR_SUPP_03'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01'), mira = GetHashKey('COMPONENT_AT_SCOPE_SMALL_MK2'), compensador = nil, carregador = nil, mira2 = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2'), mira3 = nil },    
	[GetHashKey('WEAPON_ASSAULTRIFLE')] = { silenciador = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'), mira = GetHashKey("COMPONENT_AT_SCOPE_MACRO"), compensador = nil, carregador = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02"), mira2 = nil, mira3 = nil },    
	[GetHashKey('WEAPON_CARBINERIFLE')] = { silenciador = GetHashKey('COMPONENT_AT_AR_SUPP'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'), mira = GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE'), compensador = nil, carregador = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"), mira2 = nil, mira3 = nil },    
    [GetHashKey('WEAPON_SPECIALCARBINE')] = { silenciador = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = GetHashKey("COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER"), mira = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"), compensador = nil, carregador = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02"), mira2 = nil, mira3 = nil },    
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = { silenciador = GetHashKey('COMPONENT_AT_AR_SUPP'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = GetHashKey("COMPONENT_BULLPUPRIFLE_VARMOD_LOW"), mira = GetHashKey("COMPONENT_AT_SCOPE_SMALL"), compensador = nil, carregador = GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_02"), mira2 = nil, mira3 = nil },    
    [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = { silenciador = GetHashKey('COMPONENT_AT_AR_SUPP'), lanterna = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), skin = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01"), mira = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"), compensador = GetHashKey("COMPONENT_AT_MUZZLE_01"), carregador = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"), mira2 = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_MK2'), mira3 = nil },    
	[GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = { silenciador = GetHashKey("COMPONENT_AT_AR_SUPP_02"), lanterna = GetHashKey("COMPONENT_AT_AR_FLSH"), grip = GetHashKey("COMPONENT_AT_AR_AFGRIP_02"), skin = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01"), mira = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"), compensador = GetHashKey("COMPONENT_AT_MUZZLE_01"), carregador = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_02"), mira2 = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_MK2'), mira3 = nil },    
	[GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = { silenciador = GetHashKey('COMPONENT_AT_AR_SUPP_02'), lanterna = GetHashKey("COMPONENT_AT_AR_FLSH"), grip = GetHashKey("COMPONENT_AT_AR_AFGRIP_02"), skin = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01"), mira = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"), compensador = GetHashKey("COMPONENT_AT_MUZZLE_01"), carregador = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"), mira2 = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_MK2'), mira3 = nil },    
	[GetHashKey('WEAPON_CARBINERIFLE_MK2')] = { silenciador = GetHashKey("COMPONENT_AT_AR_SUPP"), lanterna = GetHashKey("COMPONENT_AT_AR_FLSH"), grip = GetHashKey("COMPONENT_AT_AR_AFGRIP_02"), skin = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01"), mira = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"), compensador = GetHashKey("COMPONENT_AT_MUZZLE_01"), carregador = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_02"), mira2 = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_MK2'), mira3 = nil },
	[GetHashKey('WEAPON_COMPACTRIFLE')] = { silenciador = nil, lanterna = nil, grip = nil, skin = nil, mira = nil, compensador = nil, carregador = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02"), mira2 = nil, mira3 = nil },
	[GetHashKey('WEAPON_HEAVYSNIPER')] = { silenciador = nil, lanterna = nil, grip = nil, skin = nil, mira = GetHashKey("COMPONENT_AT_SCOPE_LARGE"), compensador = nil, carregador = nil, mira2 = GetHashKey("COMPONENT_AT_SCOPE_MAX"), mira3 = nil },
	[GetHashKey('WEAPON_HEAVYSNIPER_MK2')] = { silenciador = GetHashKey("COMPONENT_AT_SR_SUPP_03"), lanterna = GetHashKey("COMPONENT_AT_AR_FLSH"), grip = GetHashKey("COMPONENT_AT_AR_AFGRIP_02"), skin = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01"), mira = GetHashKey("COMPONENT_AT_SCOPE_LARGE_MK2"), compensador = GetHashKey("COMPONENT_AT_MUZZLE_08"), carregador = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_02"), mira2 = GetHashKey('COMPONENT_AT_SCOPE_MAX'), mira3 = GetHashKey('COMPONENT_AT_SCOPE_THERMAL') }
}
RegisterCommand("attachs",function(source,args,rawCommand)
	if not args[1] then 
		tipos = {"lanterna", "grip", "mira", "compensador", "carregador"}
		for k,v in pairs(tipos) do
			if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][v] then
				if not HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][v]) then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][v])  
				else
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][v])
					if HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())]["silenciador"]) then  
						RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())]["silenciador"])						
					end
					if HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())]["compensador"]) then  
						RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())]["compensador"])						
					end
					if HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())]["mira2"]) then  
						RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())]["mira2"])						
					end
					if HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())]["mira3"]) then  
						RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())]["mira3"])						
					end
				end
			end
		end
	else
		local type = args[1]
		if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][type] then
			if not HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type]) then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
				TriggerEvent('Notify','sucesso','Você equipou '..type)
			else
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
				TriggerEvent('Notify','sucesso','Você desequipou '..type)
			end
		else
			TriggerEvent('Notify','aviso','Não foi Possivel equipar '..type..' para essa arma.')
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BEBIDAS ENERGETICAS
-----------------------------------------------------------------------------------------------------------------------------------------
local energetico = false
RegisterNetEvent('energeticos')
AddEventHandler('energeticos',function(status)
	energetico = status
	if energetico then
		SetRunSprintMultiplierForPlayer(PlayerId(),1.20)
	else
		SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local ORTiming = 500
		if energetico then
			ORTiming = 4
			RestorePlayerStamina(PlayerId(),1.0)
		end
		Citizen.Wait(ORTiming)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cor",function(source,args)
	local tinta = parseInt(args[1])
	if src.checarPermissao() then	
		if tinta >= 0 then
			SetPedWeaponTintIndex(PlayerPedId(),GetSelectedPedWeapon(PlayerPedId()),tinta)
		else
			TriggerEvent('Notify', 'negado', 'Você precisa especificar uma pintura válida.')
		end
	else
		TriggerEvent('Notify', 'negado', 'Somente membros <b>VIP</b> e <b>Booster</b> podem utilizar esse comando.')
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO O F6
-----------------------------------------------------------------------------------------------------------------------------------------
local cancelando = false
RegisterNetEvent('cancelando')
AddEventHandler('cancelando',function(status)
    cancelando = status
end)

Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if cancelando then
			timeDistance = 4
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,29,true)
			DisableControlAction(0,38,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,56,true)
			DisableControlAction(0,57,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,137,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,169,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,188,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,243,true)
			DisableControlAction(0,245,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,344,true)			
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AFKSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(1000)
--         local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
--         if x == px and y == py then
--             if tempo > 0 then
--                 tempo = tempo - 1
--                 if tempo == 60 then
--                     TriggerEvent("Notify","importante","Você vai ser desconectado em <b>60 segundos</b>.",8000)
--                 end
--             else
--                 TriggerServerEvent("kickAFK")
--             end
--         else
--             tempo = 1800
--         end
--         px = x
--         py = y
--     end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ABRIR CAPO DO VEICULO ]--------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("capo",function(source,args)
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("tryhood",VehToNet(vehicle))
	end
end)

RegisterNetEvent("synchood")
AddEventHandler("synchood",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local isopen = GetVehicleDoorAngleRatio(v,4)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if isopen == 0 then
					SetVehicleDoorOpen(v,4,0,0)
				else
					SetVehicleDoorShut(v,4,0)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ABRE E FECHA OS VIDROS ]-------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local vidros = false
RegisterCommand("vidros",function(source,args)
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("trywins",VehToNet(vehicle))
	end
end)

RegisterNetEvent("syncwins")
AddEventHandler("syncwins",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if vidros then
					vidros = false
					RollUpWindow(v,0)
					RollUpWindow(v,1)
					RollUpWindow(v,2)
					RollUpWindow(v,3)
				else
					vidros = true
					RollDownWindow(v,0)
					RollDownWindow(v,1)
					RollDownWindow(v,2)
					RollDownWindow(v,3)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ABRIR PORTAS DO VEICULO ]------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("portas",function(source,args)
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		if parseInt(args[1]) == 5 then
			TriggerServerEvent("trytrunk",VehToNet(vehicle))
		else
			TriggerServerEvent("trydoors",VehToNet(vehicle),args[1])
		end
	end
end)

RegisterNetEvent("syncdoors")
AddEventHandler("syncdoors",function(index,door)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local isopen = GetVehicleDoorAngleRatio(v,0) and GetVehicleDoorAngleRatio(v,1)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if door == "1" then
					if GetVehicleDoorAngleRatio(v,0) == 0 then
						SetVehicleDoorOpen(v,0,0,0)
					else
						SetVehicleDoorShut(v,0,0)
					end
				elseif door == "2" then
					if GetVehicleDoorAngleRatio(v,1) == 0 then
						SetVehicleDoorOpen(v,1,0,0)
					else
						SetVehicleDoorShut(v,1,0)
					end
				elseif door == "3" then
					if GetVehicleDoorAngleRatio(v,2) == 0 then
						SetVehicleDoorOpen(v,2,0,0)
					else
						SetVehicleDoorShut(v,2,0)
					end
				elseif door == "4" then
					if GetVehicleDoorAngleRatio(v,3) == 0 then
						SetVehicleDoorOpen(v,3,0,0)
					else
						SetVehicleDoorShut(v,3,0)
					end
				elseif door == nil then
					if isopen == 0 then
						SetVehicleDoorOpen(v,0,0,0)
						SetVehicleDoorOpen(v,1,0,0)
						SetVehicleDoorOpen(v,2,0,0)
						SetVehicleDoorOpen(v,3,0,0)
					else
						SetVehicleDoorShut(v,0,0)
						SetVehicleDoorShut(v,1,0)
						SetVehicleDoorShut(v,2,0)
						SetVehicleDoorShut(v,3,0)
					end
				end
			end
		end
	end
end)

RegisterNetEvent("synctrunk")
AddEventHandler("synctrunk",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local isopen = GetVehicleDoorAngleRatio(v,5)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if isopen == 0 then
					SetVehicleDoorOpen(v,5,0,0)
				else
					SetVehicleDoorShut(v,5,0)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMASCARA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setmascara')
AddEventHandler('setmascara',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkRoupas() then
		if modelo == nil then
			vRP._playAnim(true,{{"missfbi4","takeoff_mask"}},false)
			Wait(1100)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,1,0,0,2)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") or GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"misscommon@van_put_on_masks","put_on_mask_ps"}},false)
			Wait(1500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,1,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETBLUSA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setblusa')
AddEventHandler('setblusa',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkPermVip() then
		if not modelo then
			vRP._playAnim(true,{{"clothingtie","try_tie_negative_a"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,8,15,0,2)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(true,{{"clothingtie","try_tie_negative_a"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,8,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"clothingtie","try_tie_negative_a"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,8,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMOCHILA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setmochila')
AddEventHandler('setmochila',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkPermVip() then
		if not modelo then
			vRP._playAnim(true,{{"missmic4","michael_tux_fidget"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,5,0,0,2)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(true,{{"missmic4","michael_tux_fidget"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,5,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"missmic4","michael_tux_fidget"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,5,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETCOLETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setcolete')
AddEventHandler('setcolete',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkPermVip() then
		if not modelo then
			vRP._playAnim(true,{{"clothingtie","try_tie_negative_a"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,9,0,0,2)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(true,{{"clothingtie","try_tie_negative_a"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,9,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"clothingtie","try_tie_negative_a"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,9,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETJAQUETA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setjaqueta')
AddEventHandler('setjaqueta',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkPermVip() then
		if not modelo then
			vRP._playAnim(true,{{"missmic4","michael_tux_fidget"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,11,15,0,2)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(true,{{"missmic4","michael_tux_fidget"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,11,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"missmic4","michael_tux_fidget"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,11,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMAOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setmaos')
AddEventHandler('setmaos',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkRoupas() then
		if not modelo then
			vRP._playAnim(true,{{"nmt_3_rcm-10","cs_nigel_dual-10"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,3,15,0,2)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(true,{{"nmt_3_rcm-10","cs_nigel_dual-10"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,3,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"nmt_3_rcm-10","cs_nigel_dual-10"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,3,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETCALCA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setcalca')
AddEventHandler('setcalca',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkPermVip() then
		if not modelo then
			if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
				vRP._playAnim(true,{{"re@construction","out_of_breath"}},false)
				Wait(2500)
				ClearPedTasks(ped)
				SetPedComponentVariation(ped,4,18,0,2)
			elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
				vRP._playAnim(true,{{"re@construction","out_of_breath"}},false)
				Wait(2500)
				ClearPedTasks(ped)
				SetPedComponentVariation(ped,4,15,0,2)
			end
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(true,{{"re@construction","out_of_breath"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,4,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"re@construction","out_of_breath"}},false)
			Wait(2500)
			ClearPedTasks(ped)
			SetPedComponentVariation(ped,4,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETACESSORIOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setacessorios')
AddEventHandler('setacessorios',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkPermVip() then
		if not modelo then
			SetPedComponentVariation(ped,7,0,0,2)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			SetPedComponentVariation(ped,7,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			SetPedComponentVariation(ped,7,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETSAPATOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setsapatos')
AddEventHandler('setsapatos',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkPermVip() and not IsPedInAnyVehicle(ped) then
		if not modelo then
			if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
				vRP._playAnim(false,{{"random@domestic","pickup_low"}},false)
				Wait(2200)
				SetPedComponentVariation(ped,6,34,0,2)
				Wait(500)
				ClearPedTasks(ped)
			elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
				vRP._playAnim(false,{{"random@domestic","pickup_low"}},false)
				Wait(2200)
				SetPedComponentVariation(ped,6,35,0,2)
				Wait(500)
				ClearPedTasks(ped)
			end
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(false,{{"random@domestic","pickup_low"}},false)
			Wait(2200)
			SetPedComponentVariation(ped,6,parseInt(modelo),parseInt(cor),2)
			Wait(500)
			ClearPedTasks(ped)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(false,{{"random@domestic","pickup_low"}},false)
			Wait(2200)
			SetPedComponentVariation(ped,6,parseInt(modelo),parseInt(cor),2)
			Wait(500)
			ClearPedTasks(ped)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETCHAPEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setchapeu')
AddEventHandler('setchapeu',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkRoupas() then
		if not modelo then
			vRP._playAnim(true,{{"missheist_agency2ahelmet","take_off_helmet_stand"}},false)
			Wait(1200)
			ClearPedProp(ped,0)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") and parseInt(modelo) ~= 39 then
			vRP._playAnim(true,{{"mp_masks@standard_car@ds@","put_on_mask"}},false)
			Wait(600)
			SetPedPropIndex(ped,0,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") and parseInt(modelo) ~= 38 then
			vRP._playAnim(true,{{"mp_masks@standard_car@ds@","put_on_mask"}},false)
			Wait(600)
			SetPedPropIndex(ped,0,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETOCULOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setoculos')
AddEventHandler('setoculos',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkRoupas() then
		if not modelo then
			vRP._playAnim(true,{{"missheist_agency2ahelmet", "take_off_helmet_stand"}},false)
			Wait(1200)
			ClearPedTasks(ped)
			ClearPedProp(ped,1)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(true,{{"mp_masks@standard_car@ds@","put_on_mask"}},false)
			Wait(600)
			ClearPedTasks(ped)
			SetPedPropIndex(ped,1,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"mp_masks@standard_car@ds@","put_on_mask"}},false)
			Wait(600)
			ClearPedTasks(ped)
			SetPedPropIndex(ped,1,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETORELHA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setorelha')
AddEventHandler('setorelha',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkRoupas() then
		if not modelo then
			ClearPedTasks(ped)
			ClearPedProp(ped,2)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			ClearPedTasks(ped)
			SetPedPropIndex(ped,2,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			ClearPedTasks(ped)
			SetPedPropIndex(ped,2,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETRELOGIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setrelogio')
AddEventHandler('setrelogio',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkRoupas() then
		if not modelo then
			ClearPedTasks(ped)
			ClearPedProp(ped,6)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			ClearPedTasks(ped)
			SetPedPropIndex(ped,6,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			ClearPedTasks(ped)
			SetPedPropIndex(ped,6,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETBRACELETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('setbracelete')
AddEventHandler('setbracelete',function(modelo,cor)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and src.checkRoupas() then
		if not modelo then
			ClearPedTasks(ped)
			ClearPedProp(ped,7)
			return
		end
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			ClearPedTasks(ped)
			SetPedPropIndex(ped,7,parseInt(modelo),parseInt(cor),2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			ClearPedTasks(ped)
			SetPedPropIndex(ped,7,parseInt(modelo),parseInt(cor),2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /me
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('me', function(source, args, rawCommand)
    local text = '*' .. rawCommand:sub(4) .. '*'
    local ped = PlayerPedId()
    if GetEntityHealth(ped) > 101 then
        TriggerServerEvent('ChatMe', text)
    end
end)

local DisplayMe = false
RegisterNetEvent('DisplayMe')
AddEventHandler('DisplayMe',function(text,source)
    local DisplayMe = true
    local id = GetPlayerFromServerId(source)
    if id == -1 then
        return
    end
    Citizen.CreateThread(function()
        while DisplayMe do
            local ped = PlayerPedId()
            Wait(1)
            local coordsMe = GetEntityCoords(GetPlayerPed(id),false)
            local coords = GetEntityCoords(ped,false)
            local distance = Vdist2(coordsMe,coords)
            if distance <= 30 then
                DrawText3Ds(coordsMe['x'],coordsMe['y'],coordsMe['z']+0.90,text)
            end
        end
    end)
    Wait(7000)
    DisplayMe = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /TOW
-----------------------------------------------------------------------------------------------------------------------------------------
local reboque = nil
local rebocado = nil
RegisterCommand("tow",function(source,args)
    local vehicle = GetPlayersLastVehicle()
    local vehicletow = IsVehicleModel(vehicle,GetHashKey("flatbed"))

    if vehicletow and not IsPedInAnyVehicle(PlayerPedId()) then
        rebocado = getVehicleInDirection(GetEntityCoords(PlayerPedId()),GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,5.0,0.0))
        if IsEntityAVehicle(vehicle) and IsEntityAVehicle(rebocado) then
            TriggerServerEvent("trytow",VehToNet(vehicle),VehToNet(rebocado))
        end
    end
end)

RegisterNetEvent('synctow')
AddEventHandler('synctow',function(vehid,rebid)
    if NetworkDoesNetworkIdExist(vehid) and NetworkDoesNetworkIdExist(rebid) then
        local vehicle = NetToVeh(vehid)
        local rebocado = NetToVeh(rebid)
        if DoesEntityExist(vehicle) and DoesEntityExist(rebocado) then
            if reboque == nil then
                if vehicle ~= rebocado then
                    local min,max = GetModelDimensions(GetEntityModel(rebocado))
                    AttachEntityToEntity(rebocado,vehicle,GetEntityBoneIndexByName(vehicle,"bodyshell"),0,-2.2,0.4-min.z,0,0,0,1,1,0,1,0,1)
                    reboque = rebocado
                end
            else
                AttachEntityToEntity(reboque,vehicle,20,-0.5,-15.0,-0.3,0.0,0.0,0.0,false,false,true,false,20,true)
                DetachEntity(reboque,false,false)
                PlaceObjectOnGroundProperly(reboque)
                reboque = nil
                rebocado = nil
            end
        end
    end
end)

function getVehicleInDirection(coordsfrom,coordsto)
	local handle = CastRayPointToPoint(coordsfrom.x,coordsfrom.y,coordsfrom.z,coordsto.x,coordsto.y,coordsto.z,10,PlayerPedId(),false)
	local a,b,c,d,vehicle = GetRaycastResult(handle)
	return vehicle
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR
-----------------------------------------------------------------------------------------------------------------------------------------
	RegisterNetEvent('reparar')
	AddEventHandler('reparar',function()
		local vehicle = vRP.getNearestVehicle(3)
		if IsEntityAVehicle(vehicle) then
			TriggerServerEvent("tryreparar",VehToNet(vehicle))
		end
	end)



RegisterNetEvent('syncreparar')
AddEventHandler('syncreparar',function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local fuel = GetVehicleFuelLevel(v)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleFixed(v)
				SetVehicleDirtLevel(v,0.0)
				SetVehicleUndriveable(v,false)
				Citizen.InvokeNative(0xAD738C3085FE7E11,v,true,true)
				SetVehicleOnGroundProperly(v)
				SetVehicleFuelLevel(v,fuel)
			end
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR MOTOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('repararmotor')
AddEventHandler('repararmotor',function()
	local vehicle = vRP.getNearestVehicle(3)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("trymotor",VehToNet(vehicle))
	end
end)

RegisterNetEvent('syncmotor')
AddEventHandler('syncmotor',function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleEngineHealth(v,1000.0)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANDAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('bandagem')
AddEventHandler('bandagem',function()
    local ped = PlayerPedId()
    local bandagem = 0
    repeat
        Citizen.Wait(600)
        bandagem = bandagem + 1
        if GetEntityHealth(ped) > 101 then
            SetEntityHealth(ped,GetEntityHealth(ped)+1)
        end
    until GetEntityHealth(ped) >= 399 or GetEntityHealth(ped) <= 101 or bandagem == 60
	TriggerEvent("Notify","sucesso","Sucesso","Tratamento concluido.")
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
    TriggerEvent("Notify","sucesso","Sucesso","Tratamento iniciado, aguarde a liberação do paramédico.",8000)
    TriggerEvent('resetWarfarina')
    TriggerEvent('resetDiagnostic')
    

    if tratamento then
        repeat
			Citizen.Wait(400)
			if IsEntityPlayingAnim(ped, "amb@world_human_sunbathe@female@back@idle_a","idle_a", 3) then
				if GetEntityHealth(ped) > 101 then
					SetEntityHealth(ped,GetEntityHealth(ped)+1)
				else
					TriggerEvent('Notify', 'negado',"Negado", 'O tratamento foi cancelado.')
					tratamento = false
					return
				end
			else
				TriggerEvent('Notify', 'negado',"Negado", 'O tratamento foi cancelado.')
				tratamento = false
				return
			end
        until GetEntityHealth(ped) >= 399 or GetEntityHealth(ped) <= 101
		TriggerEvent("Notify","sucesso","Sucesso","Tratamento concluido.",8000)
		tratamento = false
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
local carregado = false
RegisterCommand("carregar",function(source,args)
	local ped = PlayerPedId()
	local randomico,npcs = FindFirstPed()
	repeat
		local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),GetEntityCoords(npcs),true)
		if not IsPedAPlayer(npcs) and distancia <= 3 and not IsPedInAnyVehicle(ped) and not IsPedInAnyVehicle(npcs) then
			if carregado then
				ClearPedTasksImmediately(carregado)
				DetachEntity(carregado,true,true)
				TaskWanderStandard(carregado,10.0,10)
				Citizen.InvokeNative(0xAD738C3085FE7E11,carregado,true,true)
				carregado = false
			else
				Citizen.InvokeNative(0xAD738C3085FE7E11,npcs,true,true)
				AttachEntityToEntity(npcs,ped,4103,11816,0.48,0.0,0.0,0.0,0.0,0.0,false,false,true,false,2,true)
				carregado = npcs
				sucess = true
			end
		end
	sucess,npcs = FindNextPed(randomico)
	until not sucess
	EndFindPed(randomico)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sequestro2
-----------------------------------------------------------------------------------------------------------------------------------------
local sequestrado = nil
RegisterCommand("sequestro2",function(source,args)
	local ped = PlayerPedId()
	local random,npc = FindFirstPed()
	repeat
		local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),GetEntityCoords(npc),true)
		if not IsPedAPlayer(npc) and distancia <= 3 and not IsPedInAnyVehicle(npc) then
			vehicle = vRP.getNearestVehicle(7)
			if IsEntityAVehicle(vehicle) then
				if vRP.getCarroClass(vehicle) then
					if sequestrado then
						AttachEntityToEntity(sequestrado,vehicle,GetEntityBoneIndexByName(vehicle,"bumper_r"),0.6,-1.2,-0.6,60.0,-90.0,180.0,false,false,false,true,2,true)
						DetachEntity(sequestrado,true,true)
						SetEntityVisible(sequestrado,true)
						-- SetEntityInvincible(sequestrado,false)
						Citizen.InvokeNative(0xAD738C3085FE7E11,sequestrado,true,true)
						ClearPedTasksImmediately(sequestrado)
						sequestrado = nil
					elseif not sequestrado then
						Citizen.InvokeNative(0xAD738C3085FE7E11,npc,true,true)
						AttachEntityToEntity(npc,vehicle,GetEntityBoneIndexByName(vehicle,"bumper_r"),0.6,-0.4,-0.1,60.0,-90.0,180.0,false,false,false,true,2,true)
						SetEntityVisible(npc,false)
						-- SetEntityInvincible(npc,true)
						sequestrado = npc
						complet = true
					end
					TriggerServerEvent("trymala",VehToNet(vehicle))
				end
			end
		end
		complet,npc = FindNextPed(random)
	until not complet
	EndFindPed(random)
end)


RegisterCommand("checkhash",function(source,args)
    local ped = PlayerPedId()
    if ped then
        local xesquedele = GetHashKey("mp_m_freemode_01") 
        print(xesquedele)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.2) 
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0) 
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PUMPSHOTGUN"), 2.3)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SAWNOFFSHOTGUN"), 2.5)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL_MK2"), 2.7)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"), 2.9)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 2.5)
		N_0x4757f00bc6323cfe(GetHashKey("weapon_carbinerifle_mk2"), 2.8)
		N_0x4757f00bc6323cfe(GetHashKey("weapon_assaultrifle_mk2"), 2.4)
		N_0x4757f00bc6323cfe(GetHashKey("weapon_carbinerifle"), 2.2)
		N_0x4757f00bc6323cfe(GetHashKey("weapon_smg"), 2.4)
		N_0x4757f00bc6323cfe(GetHashKey("weapon_smg_mk2"), 2.2)
		N_0x4757f00bc6323cfe(GetHashKey("weapon_combatpdw"), 2.3)
		N_0x4757f00bc6323cfe(GetHashKey("weapon_specialcarbine_mk2"), 2.3)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMPURRAR
-----------------------------------------------------------------------------------------------------------------------------------------
local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc,moveFunc,disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = { handle = iter, destructor = disposeFunc }
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next,id = moveFunc(iter)
		until not next

		enum.destructor,enum.handle = nil,nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle,FindNextVehicle,EndFindVehicle)
end

function GetVeh()
    local vehicles = {}
    for vehicle in EnumerateVehicles() do
        table.insert(vehicles,vehicle)
    end
    return vehicles
end

function GetClosestVeh(coords)
	local vehicles = GetVeh()
	local closestDistance = -1
	local closestVehicle = -1
	local coords = coords

	if coords == nil then
		local ped = PlayerPedId()
		coords = GetEntityCoords(ped)
	end

	for i=1,#vehicles,1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance = GetDistanceBetweenCoords(vehicleCoords,coords.x,coords.y,coords.z,true)
		if closestDistance == -1 or closestDistance > distance then
			closestVehicle  = vehicles[i]
			closestDistance = distance
		end
	end
	return closestVehicle,closestDistance
end

local First = vector3(0.0,0.0,0.0)
local Second = vector3(5.0,5.0,5.0)
local Vehicle = { Coords = nil, Vehicle = nil, Dimension = nil, IsInFront = false, Distance = nil }

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local closestVehicle,Distance = GetClosestVeh()
		if Distance < 6.1 and not IsPedInAnyVehicle(ped) then
			Vehicle.Coords = GetEntityCoords(closestVehicle)
			Vehicle.Dimensions = GetModelDimensions(GetEntityModel(closestVehicle),First,Second)
			Vehicle.Vehicle = closestVehicle
			Vehicle.Distance = Distance
			if GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle), GetEntityCoords(ped), true) > GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle) * -1, GetEntityCoords(ped), true) then
				Vehicle.IsInFront = false
			else
				Vehicle.IsInFront = true
			end
		else
			Vehicle = { Coords = nil, Vehicle = nil, Dimensions = nil, IsInFront = false, Distance = nil }
		end
		Citizen.Wait(500)
	end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(500)
		if Vehicle.Vehicle ~= nil then
			local ped = PlayerPedId()
			if IsControlPressed(0,244) and GetEntityHealth(ped) > 101 and IsVehicleSeatFree(Vehicle.Vehicle,-1) and not IsEntityInAir(ped) and not IsPedBeingStunned(ped) and not IsEntityAttachedToEntity(ped,Vehicle.Vehicle) and not (GetEntityRoll(Vehicle.Vehicle) > 75.0 or GetEntityRoll(Vehicle.Vehicle) < -75.0) then
				RequestAnimDict('missfinale_c2ig_11')
				TaskPlayAnim(ped,'missfinale_c2ig_11','pushcar_offcliff_m',2.0,-8.0,-1,35,0,0,0,0)
				NetworkRequestControlOfEntity(Vehicle.Vehicle)

				if Vehicle.IsInFront then
					AttachEntityToEntity(ped,Vehicle.Vehicle,GetPedBoneIndex(6286),0.0,Vehicle.Dimensions.y*-1+0.1,Vehicle.Dimensions.z+1.0,0.0,0.0,180.0,0.0,false,false,true,false,true)
				else
					AttachEntityToEntity(ped,Vehicle.Vehicle,GetPedBoneIndex(6286),0.0,Vehicle.Dimensions.y-0.3,Vehicle.Dimensions.z+1.0,0.0,0.0,0.0,0.0,false,false,true,false,true)
				end

				while true do
					Citizen.Wait(5)
					if IsDisabledControlPressed(0,34) then
						TaskVehicleTempAction(ped,Vehicle.Vehicle,11,100)
					end

					if IsDisabledControlPressed(0,9) then
						TaskVehicleTempAction(ped,Vehicle.Vehicle,10,100)
					end

					if Vehicle.IsInFront then
						SetVehicleForwardSpeed(Vehicle.Vehicle,-1.0)
					else
						SetVehicleForwardSpeed(Vehicle.Vehicle,1.0)
					end

					if not IsDisabledControlPressed(0,244) then
						DetachEntity(ped,false,false)
						StopAnimTask(ped,'missfinale_c2ig_11','pushcar_offcliff_m',2.0)
						break
					end
				end
			end
		end
	end
end)
--------------------------------------------
--- Desativar Q
--------------------------------------------
Citizen.CreateThread(function()
    while true do
        local timeDistance = 500
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
		if health >= 101 then
		timeDistance = 4
		DisableControlAction(0,44,true)
		end
		Citizen.Wait(timeDistance)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("updateRoupas")
AddEventHandler("updateRoupas",function(custom)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 then
		if custom[1] == -1 then
			SetPedComponentVariation(ped,1,0,0,2)
		else
			SetPedComponentVariation(ped,1,custom[1],custom[2],2)
		end

		if custom[3] == -1 then
			SetPedComponentVariation(ped,5,0,0,2)
		else
			SetPedComponentVariation(ped,5,custom[3],custom[4],2)
		end

		if custom[5] == -1 then
			SetPedComponentVariation(ped,7,0,0,2)
		else
			SetPedComponentVariation(ped,7,custom[5],custom[6],2)
		end

		if custom[7] == -1 then
			SetPedComponentVariation(ped,3,15,0,2)
		else
			SetPedComponentVariation(ped,3,custom[7],custom[8],2)
		end

		if custom[9] == -1 then
			if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
				SetPedComponentVariation(ped,4,18,0,2)
			elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
				SetPedComponentVariation(ped,4,15,0,2)
			end
		else
			SetPedComponentVariation(ped,4,custom[9],custom[10],2)
		end

		if custom[11] == -1 then
			SetPedComponentVariation(ped,8,15,0,2)
		else
			SetPedComponentVariation(ped,8,custom[11],custom[12],2)
		end

		if custom[13] == -1 then
			if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
				SetPedComponentVariation(ped,6,34,0,2)
			elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
				SetPedComponentVariation(ped,6,35,0,2)
			end
		else
			SetPedComponentVariation(ped,6,custom[13],custom[14],2)
		end

		if custom[15] == -1 then
			SetPedComponentVariation(ped,11,15,0,2)
		else
			SetPedComponentVariation(ped,11,custom[15],custom[16],2)
		end

		if custom[17] == -1 then
			SetPedComponentVariation(ped,9,0,0,2)
		else
			SetPedComponentVariation(ped,9,custom[17],custom[18],2)
		end

		if custom[19] == -1 then
			SetPedComponentVariation(ped,10,0,0,2)
		else
			SetPedComponentVariation(ped,10,custom[19],custom[20],2)
		end

		if custom[21] == -1 then
			ClearPedProp(ped,0)
		else
			SetPedPropIndex(ped,0,custom[21],custom[22],2)
		end

		if custom[23] == -1 then
			ClearPedProp(ped,1)
		else
			SetPedPropIndex(ped,1,custom[23],custom[24],2)
		end

		if custom[25] == -1 then
			ClearPedProp(ped,2)
		else
			SetPedPropIndex(ped,2,custom[25],custom[26],2)
		end

		if custom[27] == -1 then
			ClearPedProp(ped,6)
		else
			SetPedPropIndex(ped,6,custom[27],custom[28],2)
		end

		if custom[29] == -1 then
			ClearPedProp(ped,7)
		else
			SetPedPropIndex(ped,7,custom[29],custom[30],2)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELA CINZA QUANDO MORRER
-----------------------------------------------------------------------------------------------------------------------------------------
local locksound = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local ped = PlayerPedId()
        if GetEntityHealth(ped) <= 101 then
            alreadyDead = true
            StartScreenEffect("DeathFailOut", 0, 0)
            if not locksound then
                locksound = true
            end
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
            
            local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(5) -- TODO 0
            end

            if HasScaleformMovieLoaded(scaleform) then
                Citizen.Wait(5) -- TODO 0

                Citizen.Wait(500)

                PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
                while GetEntityHealth(PlayerPedId()) <= 101 do
                    DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                    Citizen.Wait(5) -- TODO 0
                end

                StopScreenEffect("DeathFailOut")
                locksound = false
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3DS
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(0)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/300
end
--ACHAR AQ SE PRECISAR GUARDARARMA GUARDAR ARMA COMENTADO
-----------------------------------------------------------------------------------------------------------------------------------------
-- arma guarda quando Morre
-----------------------------------------------------------------------------------------------------------------------------------------
-- Citizen.CreateThread(function()
--     while true do
--         Wait(1000)
--         local ped = PlayerPedId()
--         if GetEntityHealth(ped) <= 101 then
--             source = source
--             TriggerServerEvent('guardararmas', source)
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- correr no hospital
-----------------------------------------------------------------------------------------------------------------------------------------
--[[local LocaisHp = {
    {320.8,-591.79,43.3},
    {352.14,-588.0,43.32},
}
-- PARAR DE CORRER NO HP
local delayNot = 0 
Citizen.CreateThread(function() 
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local vida = GetEntityHealth(ped)
        for k, v in pairs(LocaisHp) do
            if Vdist2(GetEntityCoords(ped), v[1], v[2], v[3]) < 250 then
                
                if vida > 150 then
                    ResetPedMovementClipset(ped, 0.0)
                end
                -- if IsPedRunning(ped) and delayNot == 0 then
                if IsPedRunning(ped) and not string.match(GetPlayerName(PlayerId()), ' Rusher ') and delayNot == 0 then
                    SetPedToRagdoll(ped, 1000, 1000, 0, 1, 1, 1)
					TriggerEvent("Notify","aviso","CUIDADO RAPAZ! O chão foi encerado recentemente.")
                    SetEntityHealth(ped, vida - 60)
                    delayNot = 2
                end
            end
        end
    end
end)


Citizen.CreateThread(function() 
    while true do
        Wait(1000)
        if delayNot > 0 then delayNot = delayNot - 1 end
    end
end)]]--