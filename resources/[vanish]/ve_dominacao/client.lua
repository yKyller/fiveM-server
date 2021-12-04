local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
pcy = Tunnel.getInterface("ve_dominacao", pcy)

-------------------------------------------------------------
-- VARIAVEIS
-------------------------------------------------------------
local segundos = 0
local pegando = false

-------------------------------------------------------------
-- COORDENADAS
-------------------------------------------------------------
local locais = {
    -- DROGAS

    [1] = {
        ['x'] = 2715.17,
        ['y'] = 1480.29,
        ['z'] = 44.56,
        ['perm'] = "drogas.permissao",
        ['blip'] = 1
    },
    [2] = {
        ['x'] = 2813.09,
        ['y'] = 1469.05,
        ['z'] = 24.74,
        ['perm'] = "drogas.permissao",
        ['blip'] = 2
    },

    -- ARMAS

    [3] = {
        ['x'] = 1109.91,
        ['y'] = 2204.97,
        ['z'] = 48.89,
        ['perm'] = "armas.permissao",
        ['blip'] = 1
    },
    [4] = {
        ['x'] = 849.58,
        ['y'] = 2383.51,
        ['z'] = 54.16,
        ['perm'] = "armas.permissao",
        ['blip'] = 2
    },
    [5] = {
        ['x'] = 1129.15,
        ['y'] = 2125.17,
        ['z'] = 55.55,
        ['perm'] = "armas.permissao",
        ['blip'] = 3
    },

    -- MUNICAO

    [6] = {
        ['x'] = 52.13,
        ['y'] = 3742.04,
        ['z'] = 40.09,
        ['perm'] = "municao.permissao",
        ['blip'] = 1
    },
    [7] = {
        ['x'] = 15.37,
        ['y'] = 3688.73,
        ['z'] = 39.99,
        ['perm'] = "municao.permissao",
        ['blip'] = 2
    },
    [8] = {
        ['x'] = 101.07,
        ['y'] = 3652.69,
        ['z'] = 40.65,
        ['perm'] = "municao.permissao",
        ['blip'] = 3
    },

    -- LAVAGEM

    [9] = {
        ['x'] = 2323.77,
        ['y'] = 2518.49,
        ['z'] = 46.67,
        ['perm'] = "lavagem.permissao",
        ['blip'] = 1
    },

    -- DESMANCHE

    [10] = {
        ['x'] = 2335.37,
        ['y'] = 4859.95,
        ['z'] = 41.81,
        ['perm'] = "desmanche.permissao",
        ['blip'] = 1
    }

}

Citizen.CreateThread(function()
    while true do
        local timeDistance = 1000
        local ped = GetPlayerPed(-1)
        local x, y, z = table.unpack(GetEntityCoords(ped))
        for k, v in pairs(locais) do
            local dist = GetDistanceBetweenCoords(v.x, v.y, v.z, x, y, z, true)
            if dist <= 15 and not pegando then
                timeDistance = 4
                DrawMarker(23, v.x, v.y, v.z - 1, 0, 0, 0, 0.0, 0, 0, 1.5, 1.5, 1.5, 0, 0, 255, 50, 0, 0, 0, 1)
                if IsControlJustPressed(0, 38) and pcy.permissao(v.perm) and dist <= 1 then
                    if pcy.lootear(k) then
                        pegando = true
                        TriggerEvent('cancelando', true)
                        FreezeEntityPosition(ped, true)
                        vRP._playAnim(false, {{"anim@heists@ornate_bank@grab_cash_heels", "grab"}}, true)
                        TriggerEvent("progress", 13000, "pegando")
                        SetTimeout(13000, function()
                            FreezeEntityPosition(ped, false)
                            vRP._stopAnim(false)
                            pcy.pagamento(v.perm, v.blip, k)
                            TriggerEvent('cancelando', false)
                            pegando = false
                        end)
                    else
                        TriggerEvent("Notify", "negado", "Já coletaram o farm!")
                    end
                end
            end
        end
        Citizen.Wait(timeDistance)
    end
end)

