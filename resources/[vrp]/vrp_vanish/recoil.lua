local recoils = {
	[453432689] = 0.3, -- PISTOL
	[3219281620] = 0.8, -- PISTOL MK2
	[584646201] = 0.1, -- AP PISTOL
	[2578377531] = 0.6, -- PISTOL .50
	[324215364] = 0.2, -- MICRO SMG
	[4024951519] = 0.1, -- ASSAULT SMG
	[3220176749] = 0.2, -- ASSAULT RIFLE
	[2937143193] = 0.1, -- ADVANCED RIFLE
	[2634544996] = 0.1, -- MG
	[2144741730] = 0.1, -- COMBAT MG
	[3686625920] = 0.1, -- COMBAT MG MK2
	[487013001] = 0.9, -- PUMP SHOTGUN



	[961495388] = 0.230, -- ASSAULT RIFLE MK2
	[-2084633992] = 0.100, -- CARBINE RIFLE
	[-86904375] = 0.150, -- CARBINE RIFLE MK2
	[-1768145561] = 0.230, -- SPECIAL CARBINE MK2


	[-1075685676] = 0.220, -- PISTOL MK2
	[1593441988] = 0.180, -- COMBAT PISTOL
	[-1076751822] = 0.180, -- SNS PISTOL
	[-771403250] = 0.180, -- HEAVY PISTOL

	[1432025498] = 0.9, -- PUMP SHOTGUN MK2
	[2017895192] = 0.9, -- SAWNOFF SHOTGUN
	[3800352039] = 0.4, -- ASSAULT SHOTGUN
	[2640438543] = 0.2, -- BULLPUP SHOTGUN
	[911657153] = 0.1, -- STUN GUN
	[100416529] = 0.5, -- SNIPER RIFLE
	[205991906] = 0.7, -- HEAVY SNIPER
	[177293209] = 0.6, -- HEAVY SNIPER MK2
	[856002082] = 1.2, -- REMOTE SNIPER
	[2726580491] = 1.0, -- GRENADE LAUNCHER
	[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
	[2982836145] = 0.0, -- RPG
	[1752584910] = 0.0, -- STINGER
	[1119849093] = 0.01, -- MINIGUN
	[3218215474] = 0.2, -- SNS PISTOL
	[1627465347] = 0.1, -- GUSENBERG
	[3523564046] = 0.5, -- HEAVY PISTOL
	[2132975508] = 0.2, -- BULLPUP RIFLE

	[-619010992] = 0.1, -- MACHINE PISTOL
	[736523883] = 0.1, -- SMG
	[2024373456] = 0.1, -- SMG MK2
	[171789620] = 0.1, -- COMBAT PDW

	[-2066285827] = 0.15, -- BULLPUP RIFLE MK2
	[137902532] = 0.4, -- VINTAGE PISTOL
	[2828843422] = 0.7, -- MUSKET
	[984333226] = 0.2, -- HEAVY SHOTGUN
	[3342088282] = 0.3, -- MARKSMAN RIFLE
	[1785463520] = 0.25, -- MARKSMAN RIFLE MK2
	[1672152130] = 0, -- HOMING LAUNCHER
	[1198879012] = 0.9, -- FLARE GUN
	[3696079510] = 0.9, -- MARKSMAN PISTOL
	[1834241177] = 2.4, -- RAILGUN
	[3675956304] = 0.3, -- MACHINE PISTOL
	[3249783761] = 0.6, -- REVOLVER
	[-879347409] = 0.6, -- REVOLVER MK2
	[4019527611] = 0.7, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 0.3, -- COMPACT RIFLE
	[317205821] = 0.2, -- AUTO SHOTGUN
	[125959754] = 0.5, -- COMPACT LAUNCHER
	[3173288789] = 0.1, -- MINI SMG		
}
------------------------------------------------------------------------------
-- ARMA DAR DANO POR OSSO
------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) then
			local wep = GetSelectedPedWeapon(PlayerPedId())
			if recoils[wep] and recoils[wep] ~= 0 then
				Wait(0)
				p = GetGameplayCamRelativePitch()
				if not IsPedInAnyHeli(PlayerPedId()) then
					SetGameplayCamRelativePitch(p+recoils[wep], 1.2)
				end
			end
		end

		local hsByAk = HasPedBeenDamagedByWeapon(PlayerPedId(), 961495388, 0)
		local hsByMpx = HasPedBeenDamagedByWeapon(PlayerPedId(), -86904375, 0)
		local hsByM4 = HasPedBeenDamagedByWeapon(PlayerPedId(), -2084633992, 0)
		local hsByG3 = HasPedBeenDamagedByWeapon(PlayerPedId(), -1768145561, 0)
		local a, b = GetPedLastDamageBone(PlayerPedId())
		if a and b == 31086 then
			if hsByAk or hsByG3 then
				SetEntityHealth(PlayerPedId(), 101)
			elseif hsByMpx or hsByM4 then
				SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 101)
			end
			a, b, hsByAk, hsByMpx, hsByG3, hsByM4 = nil, nil, nil, nil, nil, nil
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local ORTiming = 100

		if IsPedArmed(PlayerPedId(),6) then
			ORTiming = 4
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end
		Citizen.Wait(ORTiming)
	end
end)