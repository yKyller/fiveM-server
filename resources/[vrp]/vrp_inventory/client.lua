local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPNserver = Tunnel.getInterface("vrp_inventory")

client = {}
Tunnel.bindInterface("vrp_inventory_client",client)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local invOpen = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("invClose",function(data)
	StopScreenEffect("MenuMGSelectionIn")
	SetCursorLocation(0.5,0.5)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideMenu" })
	invOpen = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ABRIR INVENTARIO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
        if IsControlJustPressed(0,243) then
            if GetEntityHealth(ped) > 101 and not vRP.isHandcuffed() and not IsPedBeingStunned(ped) and not IsPlayerFreeAiming(ped) then
                if not invOpen then
                	StartScreenEffect("MenuMGSelectionIn", 0, true)
                    invOpen = true
                    SetNuiFocus(true,true)
                    SendNUIMessage({ action = "showMenu" })
                else
                	StopScreenEffect("MenuMGSelectionIn")
                    SetNuiFocus(false,false)
                    SendNUIMessage({ action = "hideMenu" })
                    invOpen = false
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEANCHOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('vehicleanchor')
AddEventHandler('vehicleanchor',function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(ped)
    FreezeEntityPosition(vehicle,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFICAR FAZENDO ANIMACAO
------------------------------------------ 1 -------- 2 -----------------------------------------------------------------------------------

function client.EstiverFazendoAnimacao(zoio, tandera)
    local ped = PlayerPedId()
    if IsEntityPlayingAnim(ped, zoio, tandera, 3) then return true  else return false end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- TRATAMENTO BANDAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
local contagemBandagem = 0
function client.SetBandagem(QtdBandagem)
    contagemBandagem = QtdBandagem
end

Citizen.CreateThread(function() 
    while true do
        Wait(1000)
        if contagemBandagem > 0 then
            contagemBandagem = contagemBandagem - 1
            local ped = PlayerPedId()
            local vida = GetEntityHealth(ped)
            if vida + 1 <= 399 then
                if vida > 101 then
                    SetEntityHealth(ped, vida + 1)
                else
                    contagemBandagem = 0
                    TriggerEvent('Notify', 'importante',"Importante", 'A bandagem foi cancelada por você estar em coma.')
                end
            else 
                TriggerEvent('Notify', 'sucesso',"Sucesso", 'Tratamento finalizado.')
                SetEntityHealth(ped, 399)
                -- TriggerEvent('Notify', 'sucesso',"Sucesso", 'VIDA 400')
                contagemBandagem = 0
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("dropItem",function(data)
	vRPNserver.dropItem(data.item,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SENDITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sendItem",function(data)
	vRPNserver.sendItem(data.item,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("useItem",function(data)
	vRPNserver.useItem(data.item,data.type,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOCHILA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestMochila",function(data,cb)
	local inventario,peso,maxpeso = vRPNserver.Mochila()
	if inventario then
		cb({ inventario = inventario, peso = peso, maxpeso = maxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AUTO-UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Creative:Update")
AddEventHandler("Creative:Update",function(action)
	SendNUIMessage({ action = action })
end)

function drawTxt(text,font,x,y,scale)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(255,255,255,150)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end