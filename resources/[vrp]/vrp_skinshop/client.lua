-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{21, 75.40, -1392.92, 28.80}, 
	{21, -709.40, -153.66, 36.90}, 
	{21, -163.20, -302.03, 39.33},
	{21, 425.58, -806.23, 29.1}, 
	{21, -822.34, -1073.49, 10.90}, 
	{21, -1193.81, -768.49, 16.90},
	{21, -1450.85, -238.15, 49.41}, 
	{21, 4.90, 6512.47, 31.47}, 
	{21, 1693.95, 4822.67, 41.76},
	{21, 126.05, -223.10, 54.15}, 
	{21, 614.26, 2761.91, 41.70}, 
	{21, 1196.74, 2710.21, 37.9},
	{21, -3170.18, 1044.54, 20.46}, 
	{21, -1101.46, 2710.57, 18.70}, 
	{23, 452.57, -990.80, 29.69},
	{21, 342.34, -586.42, 43.0}, 
	{23, 268.78, -1363.42, 23.54}
}

RegisterCommand("open", function()
    TriggerEvent("skinshop:toggleMenu")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        for _, mark in pairs(marcacoes) do
            local v, x, y, z = table.unpack(mark)
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), x, y, z, true)
            if distance <= 30 then
                DrawMarker(v, x, y, z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.4, 0, 0, 255, 100, 0, 0, 0, 1)
                if distance <= 2.0 then
                    if IsControlJustPressed(0,38) then
						TriggerEvent("skinshop:toggleMenu")
                    end
                end
            end
        end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Menu toggle
-----------------------------------------------------------------------------------------------------------------------------------------
local m, f = GetHashKey("mp_m_freemode_01"), GetHashKey("mp_f_freemode_01")
local cor = 0
local menuactive = false
RegisterNetEvent("skinshop:toggleMenu")
AddEventHandler("skinshop:toggleMenu", function()
    menuactive = not menuactive
    if menuactive then
        SetNuiFocus(true, true)

        local ped = PlayerPedId()
        if IsPedModel(ped, m) then
            SendNUIMessage({
                showMenu = true,
                masc = true
            })
        elseif IsPedModel(ped, f) then
            SendNUIMessage({
                showMenu = true,
                masc = false
            })
        end
    else
        cor = 0
        dados, tipo = nil
        SetNuiFocus(false)
        SendNUIMessage({
            showMenu = false,
            masc = true
        })
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if menuactive then
            InvalidateIdleCam()
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Retornos
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("exit", function()
    TriggerEvent("skinshop:toggleMenu")
end)

RegisterNUICallback("rotate", function(data, cb)
    local ped = PlayerPedId()
    local heading = GetEntityHeading(ped)
    if data == "left" then
        SetEntityHeading(ped, heading + 15)
    elseif data == "right" then
        SetEntityHeading(ped, heading - 15)
    end
end)

RegisterNUICallback("update", function(data, cb)
    dados = tonumber(json.encode(data[1]))
    tipo = tonumber(json.encode(data[2]))
    cor = 0
    setRoupa(dados, tipo, cor)
end)

RegisterNUICallback("color", function(data, cb)
    if data == "left" then
        if cor ~= 0 then
            cor = cor - 1
        else
            cor = 20
        end
    elseif data == "right" then
        if cor ~= 21 then
            cor = cor + 1
        else
            cor = 0
        end
    end
    if dados and tipo then
        setRoupa(dados, tipo, cor)
    end
end)

function setRoupa(dados, tipo, cor)
    local ped = PlayerPedId()
    if dados < 100 then
        SetPedComponentVariation(ped, dados, tipo, cor, 1)
    else
        SetPedPropIndex(ped, dados - 100, tipo, cor, 1)
    end
end
