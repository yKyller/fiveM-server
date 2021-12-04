local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
pcy = {}
Tunnel.bindInterface("ve_dominacao",pcy)

-----------------------------------------------------------
-- CHECK USE
-----------------------------------------------------------
local locais = {
    -- DROGAS

    [1] = {  ['timer'] = 15 },
    [2] = {  ['timer'] = 15 },

    -- ARMAS

    [3] = {  ['timer'] = 15 },
    [4] = {  ['timer'] = 15 },
    [5] = {  ['timer'] = 15 },

    -- Muni

    [6] = {  ['timer'] = 15 },
    [7] = {  ['timer'] = 15 },
    [8] = {  ['timer'] = 15 },

    -- Lavagem

    [9] = {  ['timer'] = 0 },

    -- Desmanche
    
    [10] = {  ['timer'] = 15 },
}

function pcy.lootear(k)
    return (locais[k].timer <= 0)
end

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(locais) do
            if v.timer > 0 then
                v.timer = v.timer - 2
            end
        end
        Citizen.Wait(2000)
    end
end)

-----------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------
function pcy.permissao(perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then 
        if vRP.hasPermission(user_id, perm) then
            return true
        else
            return false
        end
    end            
end    
----------------------------------------------------------------
-- PAGAMENTO
----------------------------------------------------------------
function pcy.pagamento(perm,blip,k)

    local source = source
    local user_id = vRP.getUserId(source)
    local qtdDrogas = math.random(80,100)
    local qtdArmas = 12
    local qtdMunicao = 12
    local qtdLavagem = 40
    local qtdDesmanche = 10

    if user_id then 
        
        if perm == "drogas.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("lsd")*qtdDrogas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "lsd", qtdDrogas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end
        elseif perm == "drogas.permissao" and blip == 2 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("lsd")*qtdDrogas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "lsd", qtdDrogas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end
        elseif perm == "armas.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("armacaodeak")*qtdArmas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "armacaodeak", qtdArmas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end
        elseif perm == "armas.permissao" and blip == 2 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("armacaodemp5")*qtdArmas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "armacaodemp5", qtdArmas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end
        elseif perm == "armas.permissao" and blip == 3 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("armacaodetec")*qtdArmas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "armacaodetec", qtdArmas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end                   
        elseif perm == "municao.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("materialtec")*qtdMunicao <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "materialtec", qtdMunicao)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end            
        elseif perm == "municao.permissao" and blip == 2 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("materialmp5")*qtdMunicao <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "materialmp5", qtdMunicao)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end            
        elseif perm == "municao.permissao" and blip == 3 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("materialak")*qtdMunicao <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "materialak", qtdMunicao)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end            
        elseif perm == "lavagem.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("alvejantemodificado")*qtdLavagem <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "alvejantemodificado", qtdLavagem)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end  
        elseif perm == "desmanche.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("masterpick")*qtdLavagem <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "masterpick", qtdDesmanche)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end      
        end  
    end    
end