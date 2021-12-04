
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vanish = Tunnel.getInterface("ve_dfarm")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


-- FARM MACONHA
local PermMaconha = 'grove.permissao'
local PosMaconha1 = {101.72,6339.7,31.38}
local PosMaconha2 = {112.64,6359.72,32.31}
local PosMaconha3 = {116.8,6361.67,32.3}

-- FARM COCAINA
local PermCocaina = 'vagos.permissao'
local PosCocaina1 = {-1108.65,4952.42,218.65}
local PosCocaina2 = {-1108.18,4946.42,218.65}
local PosCocaina3 = {-1107.3,4941.63,218.65}

-- FARM META
local PermMETA = 'ballas.permissao'
local PosMETA1 = {1505.52,6392.08,20.79}
local PosMETA2 = {1494.65,6395.41,20.79}
local PosMETA3 = {1493.24,6390.32,21.26}

-- FARM NINETHREE
local PermEcstasy = 'ninethree.permissao'
local PosEcstasy1 = {1389.8,3608.75,38.95}
local PosEcstasy2 = {1389.01,3605.6,38.95}
local PosEcstasy3 = {1394.2,3601.73,38.95}

-- FARM DRIFTKING
local PermDriftKing = 'driftking.permissao'
local PosDriftKing1 = {101.35,6616.33,32.44}

-- FARM NATIVE
local PermNative = 'native.permissao'
local PosNative1 = {1550.22,3513.22,36.01}

Citizen.CreateThread(function() 
    while true do
        local timeDistance = 500
        local ped = PlayerPedId()
        local PedCoord = GetEntityCoords(ped)

        -- FARM DE MACONHA (GROVE)

        -- ETAPA 1 
        if Vdist2(PedCoord, PosMaconha1[1], PosMaconha1[2], PosMaconha1[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR COLHER A FOLHA DE ~g~MACONHA",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermMaconha) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermMaconha, 'folhademaconha')
            end
        end
        -- ETAPA 2
        if Vdist2(PedCoord, PosMaconha2[1], PosMaconha2[2], PosMaconha2[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR MACERAR A ~g~MACONHA",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermMaconha) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermMaconha, 'maconhamacerada', 1, 'folhademaconha')
            end
        end
        -- ETAPA 3 
        if Vdist2(PedCoord, PosMaconha3[1], PosMaconha3[2], PosMaconha3[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA ~g~FINALIZAR~w~ O PROCESSO",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermMaconha) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermMaconha, 'maconha', 3, 'maconhamacerada')
            end
        end

        -- FARM DE COCAINA (VAGOS)

        -- ETAPA 1 
        if Vdist2(PedCoord, PosCocaina1[1], PosCocaina1[2], PosCocaina1[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA PEGAR AS FOLHAS DE ~y~COCA",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermCocaina) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermCocaina, 'folhadecoca')
            end
        end
        -- ETAPA 2
        if Vdist2(PedCoord, PosCocaina2[1], PosCocaina2[2], PosCocaina2[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA FAZER A MISTURA DE ~y~COCA",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermCocaina) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermCocaina, 'cocamisturada', 1, 'folhadecoca')
            end
        end
        -- ETAPA 3 
        if Vdist2(PedCoord, PosCocaina3[1], PosCocaina3[2], PosCocaina3[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~FINALIZAR~w~ O PROCESSO",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermCocaina) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermCocaina, 'cocaina', 3, 'cocamisturada')
            end
        end

        -- FARM DE META (BALLAS)


        -- ETAPA 1 
        if Vdist2(PedCoord, PosMETA1[1], PosMETA1[2], PosMETA1[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA COLETAR ~p~ÁCIDOS DE BATERIA",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermMETA) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermMETA, 'acidobateria')
            end
        end
        -- ETAPA 2
        if Vdist2(PedCoord, PosMETA2[1], PosMETA2[2], PosMETA2[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA PRODUZIR ~p~ANFETAMINA",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermMETA) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermMETA, 'anfetamina', 1, 'acidobateria')
            end
        end
        -- ETAPA 3 
        if Vdist2(PedCoord, PosMETA3[1], PosMETA3[2], PosMETA3[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA ~p~FINALIZAR~w~ O PROCESSO",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermMETA) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermMETA, 'metanfetamina', 3, 'anfetamina')
            end
        end

        -- FARM DE ECSTASY (NINETHREE)

        -- ETAPA 1 
        if Vdist2(PedCoord, PosEcstasy1[1], PosEcstasy1[2], PosEcstasy1[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PEGAR PASTA DE ~o~ECSTASY",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermEcstasy) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermEcstasy, 'pastadeecstasy')
            end
        end
        -- ETAPA 2
        if Vdist2(PedCoord, PosEcstasy2[1], PosEcstasy2[2], PosEcstasy2[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA TRANSFORMAR ~o~PASTA~w~ EM ~o~ESSÊNCIA",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermEcstasy) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermEcstasy, 'essenciadeecstasy', 1, 'pastadeecstasy')
            end
        end
        -- ETAPA 3 
        if Vdist2(PedCoord, PosEcstasy3[1], PosEcstasy3[2], PosEcstasy3[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA ~o~FINALIZAR~w~ O PROCESSO",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermEcstasy) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermEcstasy, 'ecstasy', 3, 'essenciadeecstasy')
            end
        end

        -- FARM DE LOCKPICK (DRIFTKING)

        -- ETAPA 1 (UNICA ETAPA DO FARM)
        if Vdist2(PedCoord, PosDriftKing1[1], PosDriftKing1[2], PosDriftKing1[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~ PRODUZIR ~y~LOCKPICK",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermDriftKing) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermDriftKing, 'lockpick', 1, 'metal')
            end
        end

         -- FARM DE LOCKPICK (NATIVE)

        -- ETAPA 1 (UNICA ETAPA DO FARM)
        if Vdist2(PedCoord, PosNative1[1], PosNative1[2], PosNative1[3]) < 1.5 then
            drawTxt("PRESSIONE  ~r~E~w~  PARA PRODUZIR ~y~LOCKPICK",4,0.5,0.92,0.45,255,255,255,180)
            timeDistance = 5
            if IsControlJustPressed(0, 38) and vanish.checkPermission(PermNative) then
                timeDistance = 5
                FreezeEntityPosition(ped, true)
                vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true)
                TriggerEvent('progress', 10000)
                Wait(10000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vanish.GiveItem(PermNative, 'lockpick', 1, 'metal')
            end
        end
        Citizen.Wait(timeDistance)
    end
end)

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

