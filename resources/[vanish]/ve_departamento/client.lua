-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
    menuactive = not menuactive
    if menuactive then
        SetNuiFocus(true, true)
        SendNUIMessage({
            showmenu = true
        })
    else
        SetNuiFocus(false)
        SendNUIMessage({
            hidemenu = true
        })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick", function(data, cb)
    if data == "utilidades-comprar-reparos" then
        TriggerServerEvent("departamento-comprar", "repairkit")
    elseif data == "utilidades-comprar-serra" then
        TriggerServerEvent("departamento-comprar", "serra")
    elseif data == "utilidades-comprar-furadeira" then
        TriggerServerEvent("departamento-comprar", "furadeira")
    elseif data == "utilidades-comprar-radio" then
        TriggerServerEvent("departamento-comprar", "radio")
    elseif data == "utilidades-vender-reparos" then
        TriggerServerEvent("departamento-vender", "repairkit")
    elseif data == "utilidades-vender-serra" then
        TriggerServerEvent("departamento-vender", "serra")
    elseif data == "utilidades-comprar-celular" then
        TriggerServerEvent("departamento-comprar", "celular")
    elseif data == "utilidades-vender-furadeira" then
        TriggerServerEvent("departamento-vender", "furadeira")
    elseif data == "vestuario-comprar-mochila" then
        TriggerServerEvent("departamento-comprar", "mochila")
    elseif data == "vestuario-comprar-roupas" then
        TriggerServerEvent("departamento-comprar", "roupas")
    elseif data == "vestuario-vender-mochila" then
        TriggerServerEvent("departamento-vender", "mochila")
    elseif data == "bebidas-comprar-energetico" then
        TriggerServerEvent("departamento-comprar", "energetico")
    elseif data == "bebidas-vender-energetico" then
        TriggerServerEvent("departamento-vender", "energetico")
    elseif data == "fechar" then
        ToggleActionMenu()
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
    {25.65, -1346.58, 28.80}, 
    {2556.75, 382.01, 107.90}, 
    {1163.54, -323.04, 68.80},
    {-707.37, -913.68, 18.80}, {-47.73, -1757.17, 28.80}, {373.90, 326.91, 103.0},
    {-3243.10, 1001.23, 12.2}, {1729.38, 6415.54, 34.80}, {547.90, 2670.36, 41.80},
    {1960.75, 3741.33, 31.80}, {2677.90, 3280.88, 54.80}, {1698.45, 4924.15, 41.60},
    {-1820.93, 793.18, 137.80}, {1392.46, 3604.95, 34.58}, {-2967.82, 390.93, 14.60},
    {-3040.10, 585.44, 7.50}, {1135.56, -982.20, 45.81}, {1165.91, 2709.41, 37.60},
    {-1487.18, -379.02, 39.80}, {-1222.78, -907.22, 11.82}
}

RegisterCommand('dcomprar', function(source, args, rawCmd)
    SetNuiFocus(false, false)
    ToggleActionMenu()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        for _, mark in pairs(marcacoes) do
            local x, y, z = table.unpack(mark)
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), x, y, z, true)
            if distance <= 30 then
                DrawMarker(21,x,y,z,0,0,0,0,0,0,0.5,0.5,0.4,0,0,255,100,0,0,0,1)
                if distance <= 2.0 then
                    if IsControlJustPressed(0,38) then
                    ToggleActionMenu()
                    end
                end
            end
        end
	end
end)
