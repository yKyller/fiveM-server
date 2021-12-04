-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL - 1000
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		N_0xf4f2c0d4ee209e20()
		DistantCopCarSirens(false)

		if IsMinimapRendering() then
			SetRadarZoom(1100)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL - 5
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(2)
		HideHudComponentThisFrame(3) 
		HideHudComponentThisFrame(4) 
		HideHudComponentThisFrame(5)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(10)
		HideHudComponentThisFrame(11)
		HideHudComponentThisFrame(12)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(15)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(18)
		HideHudComponentThisFrame(20)
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)

		RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_KNIFE"))
		RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_PISTOL"))
		RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_MINISMG"))
		RemoveAllPickupsOfType(GetHashKey("PICKUP_'WEAPON_PUMPSHOTGUN'"))
		RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_CARBINERIFLE"))

		DisablePlayerVehicleRewards(PlayerId())

		if IsPedArmed(PlayerPedId(),6) then
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end

		Citizen.Wait(5)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL - 0
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	AddTextEntry("FE_THDR_GTAO","VANISH EVOLUTION")
	StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
	SetAudioFlag("PoliceScannerDisabled",true)

	while true do
		Citizen.Wait(0)

		--SetRandomBoats(false)
		--SetGarbageTrucks(false)
		SetCreateRandomCops(false)
		DisableVehicleDistantlights(true)
		SetCreateRandomCopsOnScenarios(false)
		SetCreateRandomCopsNotOnScenarios(false)

		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HATCHET"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BATTLEAXE"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BOTTLE"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_DAGGER"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GOLFCLUB"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHETE"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_POOLCUE"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_STONE_HATCHET"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SWITCHBLADE"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_WRENCH"),0.1)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNUCKLE"),0.1)

		-- SetPedDensityMultiplierThisFrame(0.50)
		-- SetVehicleDensityMultiplierThisFrame(0.50)
		-- SetSomeVehicleDensityMultiplierThisFrame(1.00)
		-- SetParkedVehicleDensityMultiplierThisFrame(0.50)
		-- SetScenarioPedDensityMultiplierThisFrame(0.50,0.50)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MINIMAPZOOM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetMapZoomDataLevel(0,0.96,0.9,0.08,0.0,0.0)
	SetMapZoomDataLevel(1,1.6,0.9,0.08,0.0,0.0)
	SetMapZoomDataLevel(2,8.6,0.9,0.08,0.0,0.0)
	SetMapZoomDataLevel(3,12.3,0.9,0.08,0.0,0.0)
	SetMapZoomDataLevel(4,22.3,0.9,0.08,0.0,0.0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL - 5
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		RemoveVehiclesFromGeneratorsInArea(65.95 - 5.0,-1719.34 - 5.0,29.32 - 5.0,65.95 + 5.0,-1719.34 + 5.0,29.32 + 5.0)
		RemoveVehiclesFromGeneratorsInArea(115.57 - 5.0,-1758.6 - 5.0,29.34 - 5.0,115.57 + 5.0,-1758.6 + 5.0,29.34 + 5.0)
		RemoveVehiclesFromGeneratorsInArea(-4.02 - 5.0,-1533.7 - 5.0,29.63 - 5.0,-4.02 + 5.0,-1533.7 + 5.0,29.63 + 5.0)
		RemoveVehiclesFromGeneratorsInArea(100.79 - 5.0,-1605.9 - 5.0,29.52 - 5.0,100.79 + 5.0,-1605.9 + 5.0,29.52 + 5.0)
		RemoveVehiclesFromGeneratorsInArea(43.77 - 5.0,-1288.61 - 5.0,29.15 - 5.0,43.77 + 5.0,-1288.61 + 5.0,29.15 + 5.0)
	end
end)