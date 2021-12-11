local cfg = module("cfg/inventory")

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbaustaticpolicia = "https://discord.com/api/webhooks/867278084162846770/tYpJ3Rl9lx2qqXNXOzrWfUKcBn4HLnQoi5MUTFBXMpxfVNPnQg3ChvnpRCB_dvY20lTj"
local webhookbaustatic = "https://discord.com/api/webhooks/867278009299107840/reSIUELp-d0XIvmVbQXLj9uBdmFctHAVc9br0A6OrLb0ZVJFVAZXD8tiG37RsTROAKWf"
local webhookbaucrips = "https://discord.com/api/webhooks/867278336538443776/jCS_kg65cWFDqNKUS-Wq1PVIrm3pVtBWrZMC4PxzUZISnygjOSNJl6a6xD2mxsat0Zjb"
local webhookbauballas = "https://discord.com/api/webhooks/867279185666899988/OlcItC3lPiw0p2rvPQktv28Kz_-YaGqs9SaVkZNSpfOkjNDeVGbAr_kLftkEQ0UgOV0X"
local webhookbauvagos = "https://discord.com/api/webhooks/867278430474338324/8H0_-XCwhNCivBbqtW4VVl8fCZBDILrdwYAtSfPD0POm6Wvd7bFFHhV-AetgIcKTzwbM"
local webhookbaugroove = "https://discord.com/api/webhooks/867278843307229214/SKVPPqgVZ9msVJjstVKgzUD89OfT4kcerskY3_WHp3Qz7L7rej5MWkD1QVtWzMkkHrxo"
local webhookbautriade = "https://discord.com/api/webhooks/867278749456400385/VBrhYs-Xg1oDa1IZboUPDTDUug0qDNBUeRNSP0rZ-8Zkw4ryWgZFZgXR-NU6RLDOquhr"
local webhookbaulifeinvader = "https://discord.com/api/webhooks/867279111529037884/NQ7xcUb8bl-TWcRSdHr0QC5ldmfuTdQ3s59JV7SudtL7jn6jBuDA8F4u_w0rQb9gdCqa"
local webhookbaubahamas = "https://discord.com/api/webhooks/867279026288853002/cgLp1YyoQYeVeS0fRFJkTswiW_IKyMcA6GZyLfIR22dnSxbFEDCHxWj5zkcjJudRQ6o6"
local webhookbausiciliana = "https://discord.com/api/webhooks/867278939902312459/uH9EQzjJTyWDuyQitxvQ0OxTOPR87edjsvGD_0HxA-be78HK34neaZltDt7REN5W7T-M"
local webhookbaublood = "https://discord.com/api/webhooks/867278253966229505/unKNZY5Rw1EjXQEwm1HmzgIaDs5IPBEPG0z-_r5vICFKmswoRTmnfOizVRVF5aVHnYf4"
local webhookbau = "https://discord.com/api/webhooks/867278009299107840/reSIUELp-d0XIvmVbQXLj9uBdmFctHAVc9br0A6OrLb0ZVJFVAZXD8tiG37RsTROAKWf"
local webhookbaucasa = "https://discord.com/api/webhooks/867458876671655966/JOYgovVvS1__3Qgil_5Jv0jJcy0Vq_F2bnkTfq5MkzccqRQFibogTuRxx6zWH5mKTBul"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local itemlist = {
	["laranja"] = { index = "laranja", nome = "Laranja", type = "usar" },
	["ferramenta"] = { index = "ferramenta", nome = "Ferramenta", type = "usar" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda", type = "usar" },
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de Lixo", type = "usar" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia", type = "usar" },
	["garrafadeleite"] = { index = "garrafadeleite", nome = "Garrafa de Leite", type = "usar" },
	["celular"] = { index = "celular", nome = "Celular", type = "usar" },
	["casinotoken"] = { index = "casinotoken", nome = "Ficha", type = "usar" },
	["tora"] = { index = "tora", nome = "Tora de Madeira", type = "usar" },
	["alianca"] = { index = "alianca", nome = "Aliança", type = "usar" },
	["bandagem"] = { index = "bandagem", nome = "Bandagem", type = "usar" },
	["dorflex"] = { index = "dorflex", nome = "Dorflex", type = "usar" },
	["cicatricure"] = { index = "cicatricure", nome = "Cicatricure", type = "usar" },
	["dipiroca"] = { index = "dipiroca", nome = "Dipiroca", type = "usar" },
	["nocucedin"] = { index = "nocucedin", nome = "Nocucedin", type = "usar" },
	["paracetanal"] = { index = "paracetanal", nome = "Paracetanal", type = "usar" },
	["decupramim"] = { index = "decupramim", nome = "Decupramim", type = "usar" },
	["buscopau"] = { index = "buscopau", nome = "Buscopau", type = "usar" },
	["navagina"] = { index = "navagina", nome = "Navagina", type = "usar" },
	["analdor"] = { index = "analdor", nome = "Analdor", type = "usar" },
	["sefodex"] = { index = "sefodex", nome = "Sefodex", type = "usar" },
	["nokusin"] = { index = "nokusin", nome = "Nokusin", type = "usar" },
	["glicoanal"] = { index = "glicoanal", nome = "Glicoanal", type = "usar" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja", type = "usar" },
	["fardo"] = { index = "fardo", nome = "Fardo de Cerveja", type = "usar" },
	["uva"] = { index = "uva", nome = "Uva", type = "usar" },
	["tequila"] = { index = "tequila", nome = "Tequila", type = "usar" },
	["vodka"] = { index = "vodka", nome = "Vodka", type = "usar" },
	["whisky"] = { index = "whisky", nome = "Whisky", type = "usar" },
	["conhaque"] = { index = "conhaque", nome = "Conhaque", type = "usar" },
	["absinto"] = { index = "absinto", nome = "Absinto", type = "usar" },
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo", type = "usar" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos", type = "usar" },
	["distintivopolicial"] = { index = "distintivopolicial", nome = "Distintivo Policial", type = "usar" },
	["morfina"] = { index = "morfina", nome = "Morfina", type = "usar" },
	["placa"] = { index = "placa", nome = "Placa", type = "usar" },
	["algemas"] = { index = "algemas", nome = "Algemas", type = "usar" },
	["capuz"] = { index = "capuz", nome = "Capuz", type = "usar" },
	["compattach"] = { index = "compattach", nome = "Modificador de Arma", type = "usar" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick", type = "usar" },
	["identidade"] = { index = "identidade", nome = "Identidade", type = "usar" },
	["masterpick"] = { index = "masterpick", nome = "Masterpick", type = "usar" },
	["militec"] = { index = "militec", nome = "Militec-1", type = "usar" },
	["pneus"] = { index = "pneus", nome = "Pneus", type = "usar" },
	["rebite"] = { index = "rebite", nome = "Rebite", type = "usar" },
	["notebook"] = { index = "notebook", nome = "Notebook", type = "usar" },
	["roupas"] = { index = "roupas", nome = "Roupas", type = "usar" },
	["carnedecormorao"] = { index = "carnedecormorao", nome = "Carne de Cormorão", type = "usar" },
	["carnedecorvo"] = { index = "carnedecorvo", nome = "Carne de Corvo", type = "usar" },
	["carnedeaguia"] = { index = "carnedeaguia", nome = "Carne de Águia", type = "usar" },
	["carnedecervo"] = { index = "carnedecervo", nome = "Carne de Cervo", type = "usar" },
	["carnedecoelho"] = { index = "carnedecoelho", nome = "Carne de Coelho", type = "usar" },
	["carnedecoyote"] = { index = "carnedecoyote", nome = "Carne de Coyote", type = "usar" },
	["carnedelobo"] = { index = "carnedelobo", nome = "Carne de Lobo", type = "usar" },
	["carnedepuma"] = { index = "carnedepuma", nome = "Carne de Puma", type = "usar" },
	["carnedejavali"] = { index = "carnedejavali", nome = "Carne de Javali", type = "usar" },
	["isca"] = { index = "isca", nome = "Isca", type = "usar" },
	["dourado"] = { index = "dourado", nome = "Dourado", type = "usar" },
	["corvina"] = { index = "corvina", nome = "Corvina", type = "usar" },
	["salmao"] = { index = "salmao", nome = "Salmão", type = "usar" },
	["pacu"] = { index = "pacu", nome = "Pacu", type = "usar" },
	["pintado"] = { index = "pintado", nome = "Pintado", type = "usar" },
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu", type = "usar" },
	["tilapia"] = { index = "tilapia", nome = "Tilápia", type = "usar" },
	["tucunare"] = { index = "tucunare", nome = "Tucunaré", type = "usar" },
	["lambari"] = { index = "lambari", nome = "Lambari", type = "usar" },
	["energetico"] = { index = "energetico", nome = "Energético", type = "usar" },
	["mochila"] = { index = "mochila", nome = "Mochila", type = "usar" },
	["maconha"] = { index = "maconha", nome = "Maconha", type = "usar" },
	["armacaodetec"] = { index = "armacaodetec", nome = "Armação de TEC-9", type = "usar" },
	["armacaodeg3"] = { index = "armacaodeg3", nome = "Armação de G36", type = "usar" },
	["armacaodeak"] = { index = "armacaodeak", nome = "Armação de AK", type = "usar" },
	["armacaodemp5"] = { index = "armacaodemp5", nome = "Armação de MP5", type = "usar" },
	["materialtec"] = { index = "materialtec", nome = "Material de TEC-9", type = "usar" },
	["materialg3"] = { index = "materialg3", nome = "Material de G36", type = "usar" },
	["materialak"] = { index = "materialak", nome = "Material de AK", type = "usar" },
	["materialmp5"] = { index = "materialmp5", nome = "Material de MP5", type = "usar" },
	["alvejante"] = { index = "alvejante", nome = "Alvejante", type = "usar" },
	["alvejantemodificado"] = { index = "alvejantemodificado", nome = "Alvejante Modificado", type = "usar" },
	["folhademaconha"] = { index = "folhademaconha", nome = "Folha de Maconha", type = "usar" },
	["maconhamacerada"] = { index = "maconhamacerada", nome = "Maconha Macerada", type = "usar" },
	["capsula"] = { index = "capsula", nome = "Cápsula", type = "usar" },
	["polvora"] = { index = "polvora", nome = "Pólvora", type = "usar" },
	["orgao"] = { index = "orgao", nome = "Órgão", type = "usar" },
	["etiqueta"] = { index = "etiqueta", nome = "Etiqueta", type = "usar" },
	["pendrive"] = { index = "pendrive", nome = "Pendrive", type = "usar" },
	["relogioroubado"] = { index = "relogioroubado", nome = "Relógio Roubado", type = "usar" },
	["pulseiraroubada"] = { index = "pulseiraroubada", nome = "Pulseira Roubada", type = "usar" },
	["anelroubado"] = { index = "anelroubado", nome = "Anel Roubado", type = "usar" },
	["colarroubado"] = { index = "colarroubado", nome = "Colar Roubado", type = "usar" },
	["brincoroubado"] = { index = "brincoroubado", nome = "Brinco Roubado", type = "usar" },
	["carteiraroubada"] = { index = "carteiraroubada", nome = "Carteira Roubada", type = "usar" },
	["tabletroubado"] = { index = "tabletroubado", nome = "Tablet Roubado", type = "usar" },
	["sapatosroubado"] = { index = "sapatosroubado", nome = "Sapatos Roubado", type = "usar" },
	["folhadecoca"] = { index = "folhadecoca", nome = "Folha de Coca", type = "usar" },
	["cocamisturada"] = { index = "cocamisturada", nome = "Cocaina Misturada", type = "usar" },
	["cocaina"] = { index = "cocaina", nome = "Cocaína", type = "usar" },
	["essenciadeecstasy"] = { index = "essenciadeecstasy", nome = "Essencia de Ecstasy", type = "usar" },
	["pastadeecstasy"] = { index = "pastadeecstasy", nome = "Pasta de Ecstasy", type = "usar" },
	["ecstasy"] = { index = "ecstasy", nome = "Ecstasy", type = "usar" },
	["fungo"] = { index = "fungo", nome = "Fungo", type = "usar" },
	["bateria"] = { index = "bateria", nome = "Bateria", type = "usar" },
	["gps"] = { index = "gps", nome = "GPS", type = "usar" },
	["cobre"] = { index = "cobre", nome = "Cobre", type = "usar" },
	["plastico"] = { index = "plastico", nome = "Plastico", type = "usar" },
	["borracha"] = { index = "borracha", nome = "Borracha", type = "usar" },
	["linha"] = { index = "linha", nome = "Linha", type = "usar" },
	["pano"] = { index = "pano", nome = "Pano", type = "usar" },
	["vidro"] = { index = "vidro", nome = "Vidro", type = "usar" },
	["pilha"] = { index = "pilha", nome = "Pilha", type = "usar" },
	["fioeletronico"] = { index = "fioeletronico", nome = "Fio Eletronico", type = "usar" },
	["metal"] = { index = "metal", nome = "Metal", type = "usar" },
    ["dietilamina"] = { index = "dietilamina", nome = "Dietilamina", type = "usar" },
    ["lsd"] = { index = "lsd", nome = "LSD", type = "usar" },
	["acidobateria"] = { index = "acidobateria", nome = "Ácido de Bateria", type = "usar" },
	["anfetamina"] = { index = "anfetamina", nome = "Anfetamina", type = "usar" },
	["metanfetamina"] = { index = "metanfetamina", nome = "Metanfetamina", type = "usar" },
	["armacaodearma"] = { index = "armacaodearma", nome = "Armação de Arma", type = "usar" },
	["pecadearma"] = { index = "pecadearma", nome = "Peça de Arma", type = "usar" },
	["materialmunicaopesada"] = { index = "materialmunicaopesada", nome = "Material de Munição Pesada", type = "usar" },
	["materialmunicao"] = { index = "materialmunicao", nome = "Material de Munição", type = "usar" },
	["logsinvasao"] = { index = "logsinvasao", nome = "L. Inv. Banco", type = "usar" },
	["keysinvasao"] = { index = "keysinvasao", nome = "K. Inv. Banco", type = "usar" },
	["pendriveinformacoes"] = { index = "pendriveinformacoes", nome = "P. Info.", type = "usar" },
	["acessodeepweb"] = { index = "acessodeepweb", nome = "P. DeepWeb", type = "usar" },
	["diamante"] = { index = "diamante", nome = "Min. Diamante", type = "usar" },
	["ouro"] = { index = "ouro", nome = "Min. Ouro", type = "usar" },
	["bronze"] = { index = "bronze", nome = "Min. Bronze", type = "usar" },
	["ferro"] = { index = "ferro", nome = "Min. Ferro", type = "usar" },
	["rubi"] = { index = "rubi", nome = "Min. Rubi", type = "usar" },
	["esmeralda"] = { index = "esmeralda", nome = "Min. Esmeralda", type = "usar" },
	["safira"] = { index = "safira", nome = "Min. Safira", type = "usar" },
	["topazio"] = { index = "topazio", nome = "Min. Topazio", type = "usar" },
	["ametista"] = { index = "ametista", nome = "Min. Ametista", type = "usar" },
	["diamante2"] = { index = "diamante2", nome = "Diamante", type = "usar" },
	["ouro2"] = { index = "ouro2", nome = "Ouro", type = "usar" },
	["bronze2"] = { index = "bronze2", nome = "Bronze", type = "usar" },
	["ferro2"] = { index = "ferro2", nome = "Ferro", type = "usar" },
	["radio"] = { index = "radio", nome = "Radio", type = "usar" },
	["c4"] = { index = "c4", nome = "C4", type = "usar" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira", type = "usar" },
	["serra"] = { index = "serra", nome = "Serra", type = "usar" },
	["rubi2"] = { index = "rubi2", nome = "Rubi", type = "usar" },
	["esmeralda2"] = { index = "esmeralda2", nome = "Esmeralda", type = "usar" },
	["safira2"] = { index = "safira2", nome = "Safira", type = "usar" },
	["topazio2"] = { index = "topazio2", nome = "Topazio", type = "usar" },
	["ametista2"] = { index = "ametista2", nome = "Ametista", type = "usar" },
	["graos"] = { index = "graos", nome = "Graos", type = "usar" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Graos Impuros", type = "usar" },
	["keycard"] = { index = "keycard", nome = "Keycard", type = "usar" },
	["xerelto"] = { index = "xerelto", nome = "Xerelto", type = "usar" },
	["coumadin"] = { index = "coumadin", nome = "Coumadin", type = "usar" },
	["aneldecompromisso"] = { index = "aneldecompromisso", nome = "Anel de Compromisso", type = "usar" },
	["colardeperolas"] = { index = "colardeperolas", nome = "Colar de Pérolas", type = "usar" },
	["pulseiradeouro"] = { index = "pulseiradeouro", nome = "Pulseira de Ouro", type = "usar" },
	["chocolate"] = { index = "chocolate", nome = "Chocolate", type = "usar" },
	["pirulito"] = { index = "pirulito", nome = "Pirulito", type = "usar" },
	["buque"] = { index = "buque", nome = "Buquê de Flores", type = "usar" },
	["wbody_WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga", type = "equipar" },
	["wbody_WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol", type = "equipar" },
	["wbody_WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa", type = "equipar" },
	["wbody_WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra", type = "equipar" },
	["wbody_WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna", type = "equipar" },
	["wbody_WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf", type = "equipar" },
	["wbody_WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo", type = "equipar" },
	["wbody_WEAPON_HATCHET"] = { index = "machado", nome = "Machado", type = "equipar" },
	["wbody_WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês", type = "equipar" },
	["wbody_WEAPON_KNIFE"] = { index = "faca", nome = "Faca", type = "equipar" },
	["wbody_WEAPON_MACHETE"] = { index = "machete", nome = "Machete", type = "equipar" },
	["wbody_WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete", type = "equipar" },
	["wbody_WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete", type = "equipar" },
	["wbody_WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo", type = "equipar" },
	["wbody_WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha", type = "equipar" },
	["wbody_WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca", type = "equipar" },
	["wbody_WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra", type = "equipar" },
	["wbody_WEAPON_PISTOL"] = { index = "m1911", nome = "M1911", type = "equipar" },
	["wbody_WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven", type = "equipar" },
	["wbody_WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19", type = "equipar" },
	["wbody_WEAPON_STUNGUN"] = { index = "taser", nome = "Taser", type = "equipar" },
	["wbody_WEAPON_SNSPISTOL"] = { index = "hkp7m10", nome = "HK P7M10", type = "equipar" },
	["wbody_WEAPON_VINTAGEPISTOL"] = { index = "m1922", nome = "M1922", type = "equipar" },
	["wbody_WEAPON_REVOLVER"] = { index = "magnum44", nome = "Magnum 44", type = "equipar" },
	["wbody_WEAPON_REVOLVER_MK2"] = { index = "magnum357", nome = "Magnum 357", type = "equipar" },
	["wbody_WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22", type = "equipar" },
	["wbody_WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador", type = "equipar" },
	["wbody_GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas", type = "equipar" },
	["wbody_WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor", type = "equipar" },
	["wbody_WEAPON_MICROSMG"] = { index = "uzi", nome = "Uzi", type = "equipar" },
	["wbody_WEAPON_SMG"] = { index = "mp5", nome = "MP5", type = "equipar" },
	["wbody_WEAPON_SMG_MK2"] = { index = "mp5mk2", nome = "MP5 MK2", type = "equipar" },
	["wbody_WEAPON_ASSAULTSMG"] = { index = "mtar21", nome = "MTAR-21", type = "equipar" },
	["wbody_WEAPON_COMBATPDW"] = { index = "sig", nome = "Sig Sauer MPX", type = "equipar" },
	["wbody_WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870", type = "equipar" },
	["wbody_WEAPON_CARBINERIFLE"] = { index = "m4a1", nome = "M4A1", type = "equipar" },
	["wbody_WEAPON_HEAVYPISTOL"] = { index = "desert", nome = "Heavy Pistol", type = "equipar" },
	["wbody_WEAPON_ASSAULTRIFLE"] = { index = "ak103", nome = "AK-103", type = "equipar" },
	["wbody_WEAPON_ASSAULTRIFLE_MK2"] = { index = "ak74", nome = "AK-47 MK2", type = "equipar" },
	["wbody_WEAPON_SPECIALCARBINE_MK2"] = { index = "g36mk2", nome = "G36 MK2", type = "equipar" },	
	["wbody_WEAPON_GUSENBERG"] = { index = "thompson", nome = "Thompson", type = "equipar" },		
	["wbody_WEAPON_MACHINEPISTOL"] = { index = "tec9", nome = "Tec-9", type = "equipar" },
	["wbody_WEAPON_COMPACTRIFLE"] = { index = "aks", nome = "AKS", type = "equipar" },
	["wbody_WEAPON_CARBINERIFLE_MK2"] = { index = "mpx", nome = "MPX", type = "equipar" },
	["wammo_WEAPON_PISTOL"] = { index = "m-m1911", nome = "M.M1911", type = "recarregar" },
	["wammo_WEAPON_HEAVYPISTOL"] = { index = "m-desert", nome = "M.HEAVYPISTOL", type = "recarregar" },
	["wammo_WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "M.FN Five Seven", type = "recarregar" },
	["wammo_WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "M.Glock 19", type = "recarregar" },
	["wammo_WEAPON_STUNGUN"] = { index = "m-taser", nome = "M.Taser", type = "recarregar" },
	["wammo_WEAPON_SNSPISTOL"] = { index = "m-hkp7m10", nome = "M.HK P7M10", type = "recarregar" },
	["wammo_WEAPON_VINTAGEPISTOL"] = { index = "m-m1922", nome = "M.M1922", type = "recarregar" },
	["wammo_WEAPON_REVOLVER"] = { index = "m-magnum44", nome = "M.Magnum 44", type = "recarregar" },
	["wammo_WEAPON_REVOLVER_MK2"] = { index = "m-magnum357", nome = "M.Magnum 357", type = "recarregar" },
	["wammo_WEAPON_MUSKET"] = { index = "m-winchester22", nome = "M.Winchester 22", type = "recarregar" },
	["wammo_WEAPON_FLARE"] = { index = "m-sinalizador", nome = "M.Sinalizador", type = "recarregar" },
	["wammo_GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "M.Paraquedas", type = "recarregar" },
	["wammo_WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "M.Extintor", type = "recarregar" },
	["wammo_WEAPON_MICROSMG"] = { index = "m-uzi", nome = "M.Uzi", type = "recarregar" },
	["wammo_WEAPON_SMG"] = { index = "m-mp5", nome = "M.MP5", type = "recarregar" },
	["wammo_WEAPON_SMG_MK2"] = { index = "m-mp5mk2", nome = "M.MP5 MK2", type = "recarregar" },
	["wammo_WEAPON_ASSAULTSMG"] = { index = "m-mtar21", nome = "M.MTAR-21", type = "recarregar" },
	["wammo_WEAPON_COMBATPDW"] = { index = "m-sig", nome = "M.Sig Sauer MPX", type = "recarregar" },
	["wammo_WEAPON_PUMPSHOTGUN"] = { index = "m-shotgun", nome = "M.Shotgun", type = "recarregar" },
	["wammo_WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "M.Remington 870", type = "recarregar" },
	["wammo_WEAPON_CARBINERIFLE"] = { index = "m-m4a1", nome = "M.M4A1", type = "recarregar" },
	["wammo_WEAPON_ASSAULTRIFLE"] = { index = "m-ak103", nome = "M.AK-103", type = "recarregar" },
	["wammo_WEAPON_ASSAULTRIFLE_MK2"] = { index = "m-ak74", nome = "M.AK47 MK2", type = "recarregar" },
	["wammo_WEAPON_GUSENBERG"] = { index = "m-thompson", nome = "M.Thompson", type = "recarregar" },
	["wammo_WEAPON_MACHINEPISTOL"] = { index = "m-tec9", nome = "M.Tec-9", type = "recarregar" },
	["wammo_WEAPON_COMPACTRIFLE"] = { index = "m-aks", nome = "M.AKS", type = "recarregar" },
	["wammo_WEAPON_CARBINERIFLE_MK2"] = { index = "m-mpx", nome = "M.MPX", type = "recarregar" },
	["wammo_WEAPON_SPECIALCARBINE_MK2"] = { index = "m-g36mk2", nome = "M.G36 MK2", type = "recarregar" },
}

function vRP.itemNameList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].nome
	end
end

function vRP.itemIndexList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].index
	end
end

function vRP.itemTypeList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].type
	end
end

function vRP.itemBodyList(item)
	if itemlist[item] ~= nil then
		return itemlist[item]
	end
end

vRP.items = {}
function vRP.defInventoryItem(idname,name,weight)
	if weight == nil then
		weight = 0
	end
	local item = { name = name, weight = weight }
	vRP.items[idname] = item
end

function vRP.computeItemName(item,args)
	if type(item.name) == "string" then
		return item.name
	else
		return item.name(args)
	end
end

function vRP.computeItemWeight(item,args)
	if type(item.weight) == "number" then
		return item.weight
	else
		return item.weight(args)
	end
end

function vRP.parseItem(idname)
	return splitString(idname,"|")
end

function vRP.getItemDefinition(idname)
	local args = vRP.parseItem(idname)
	local item = vRP.items[args[1]]
	if item then
		return vRP.computeItemName(item,args),vRP.computeItemWeight(item,args)
	end
	return nil,nil
end

function vRP.getItemWeight(idname)
	local args = vRP.parseItem(idname)
	local item = vRP.items[args[1]]
	if item then
		return vRP.computeItemWeight(item,args)
	end
	return 0
end

function vRP.computeItemsWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		local iweight = vRP.getItemWeight(k)
		weight = weight+iweight*v.amount
	end
	return weight
end

function vRP.giveInventoryItem(user_id,idname,amount)
	local source = vRP.getUserSource(user_id)
	local amount = parseInt(amount)
	local data = vRP.getInventory(user_id)
	if data and amount > 0 then
		local entry = data[idname]
		if entry then
			entry.amount = entry.amount + amount
		else
			data[idname] = { amount = amount }
		end
		TriggerClientEvent("itensNotify",source,"sucesso",""..vRP.format(amount).." "..vRP.itemNameList(idname).."",vRP.itemIndexList(idname))
	end
end

function vRP.tryGetInventoryItem(user_id,idname,amount)
	local source = vRP.getUserSource(user_id)
	local amount = parseInt(amount)
	local data = vRP.getInventory(user_id)
	if data and amount > 0 then
		local entry = data[idname]
		if entry and entry.amount >= amount then
			entry.amount = entry.amount - amount

			if entry.amount <= 0 then
				data[idname] = nil
			end
			
			TriggerClientEvent("itensNotify",source,"negado",""..vRP.format(amount).." "..vRP.itemNameList(idname).."",vRP.itemIndexList(idname))
			return true
		end
	end
	return false
end

function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getUserDataTable(user_id)
	if data and data.inventory then
		local entry = data.inventory[idname]
		if entry then
			return entry.amount
		end
	end
	return 0
end

function vRP.getInventory(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		return data.inventory
	end
end

function vRP.getInventoryWeight(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data and data.inventory then
		return vRP.computeItemsWeight(data.inventory)
	end
	return 0
end

function vRP.getInventoryMaxWeight(user_id)
	return math.floor(vRP.expToLevel(vRP.getExp(user_id,"physical","strength")))*3
end

RegisterServerEvent("clearInventory")
AddEventHandler("clearInventory",function()
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local x,y,z = vRPclient.getPosition(source)
    if user_id then
    	local data = vRP.getUserDataTable(user_id)
    	if data then
        	data.inventory = {}
    	end

    	vRP.setMoney(user_id,0)
    	vRPclient._clearWeapons(source)
    	vRPclient._setHandcuffed(source,false)

		if not vRP.hasPermission(user_id,"mochila.permissao") then
			vRP.setExp(user_id,"physical","strength",20)
		end
		TriggerClientEvent("respawnPlayer",source)
    end
end)

function vRP.clearInventory(user_id)
    local data = vRP.getUserDataTable(user_id)
    if data then
        data.inventory = {}
    end
end

AddEventHandler("vRP:playerJoin", function(user_id,source,name)
	local data = vRP.getUserDataTable(user_id)
	if not data.inventory then
		data.inventory = {}
	end
end)

function vRP.openChest(source,name,max_weight,cb_close,cb_in,cb_out)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		local identity = vRP.getUserIdentity(user_id)
		if data.inventory then
			if not chests[name] then
				local close_count = 0
				local chest = { max_weight = max_weight }
				chests[name] = chest 
				local cdata = vRP.getSData("chest:"..name)
				chest.items = json.decode(cdata) or {}

				local menu = { name = "Baú" }
				local cb_take = function(idname)
					local citem = chest.items[idname]
					local amount = vRP.prompt(source,"Quantidade:","")
					if parseInt(amount) > 0 and parseInt(amount) <= citem.amount then
						local new_weight = vRP.getInventoryWeight(user_id)+vRP.getItemWeight(idname)*parseInt(amount)
						if new_weight <= vRP.getInventoryMaxWeight(user_id) then
							vRP.giveInventoryItem(user_id,idname,parseInt(amount))
								if name == "static:1" then
									SendWebhookMessage(webhookbaustaticpolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Policia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&628630606649098276>")
								elseif name == "static:2" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaucrips,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:3" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Marabunta "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:4" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:5" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:6" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Grove "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaugroove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Grove "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:7" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Triade "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbautriade,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Triade "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:8" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: LifeInvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaulifeinvader,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: LifeInvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:9" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:10" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bahamas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaubahamas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bahamas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:11" then
									-- Colocar depois
								elseif name == "static:12" then
									--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Corleone "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:13" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: siciliana "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbausiciliana,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: siciliana "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:14" then
									--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Concessionaria "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:15" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bloods "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaublood,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bloods "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end
							citem.amount = citem.amount - parseInt(amount)

							if citem.amount <= 0 then
								chest.items[idname] = nil
							end

							if cb_out then
								cb_out(idname,parseInt(amount))
							end
							vRP.closeMenu(source)
						else
							TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Valor inválido.",8000)
					end
				end

				local ch_take = function(player,choice)
					local weight = vRP.computeItemsWeight(chest.items)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",chest.items,cb_take)

					submenu.onclose = function()
						close_count = close_count - 1
						vRP.openMenu(player,menu)
					end
					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				local cb_put = function(idname)
					if string.match(idname,"identidade") then
						TriggerClientEvent("Notify",source,"importante","Não pode guardar a <b>Identidade</b> em veículos.",8000)
						return
					end

					local amount = vRP.prompt(source,"Quantidade:","")
					local new_weight = vRP.computeItemsWeight(chest.items)+vRP.getItemWeight(idname)*parseInt(amount)
					if new_weight <= max_weight then
						if parseInt(amount) > 0 and vRP.tryGetInventoryItem(user_id,idname,parseInt(amount)) then
							
							if name == "static:1" then
								SendWebhookMessage(webhookbaustaticpolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Policia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:2" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaucrips,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:3" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Marabunta "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:4" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:5" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:6" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Grove "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaugroove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Grove "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:7" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Triade "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbautriade,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Triade "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:8" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: LifeInvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaulifeinvader,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: LifeInvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:9" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:10" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bahamas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaubahamas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bahamas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:11" then
								-- Colocar depois
							elseif name == "static:12" then
								--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Corleone "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:13" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: siciliana "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbausiciliana,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: siciliana "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:14" then
								--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Concessionaria "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:15" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bloods "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaubloods,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bloods "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end

							local citem = chest.items[idname]

							if citem ~= nil then
								citem.amount = citem.amount + parseInt(amount)
							else
								chest.items[idname] = { amount = parseInt(amount) }
							end

							if cb_in then
								cb_in(idname,parseInt(amount))
							end
							vRP.closeMenu(source)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Baú cheio.",8000)
					end
				end

				local ch_put = function(player,choice)
					local weight = vRP.computeItemsWeight(data.inventory)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",data.inventory,cb_put)

					submenu.onclose = function()
						close_count = close_count-1
						vRP.openMenu(player,menu)
					end

					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				menu["Retirar"] = { ch_take }
				menu["Colocar"] = { ch_put }

				menu.onclose = function()
					if close_count == 0 then
						vRP.setSData("chest:"..name,json.encode(chest.items))
						chests[name] = nil
						if cb_close then
							cb_close()
						end
					end
				end
				vRP.openMenu(source,menu)
			else
				TriggerClientEvent("Notify",source,"importante","Está sendo utilizado no momento.",8000)
			end
		end
	end
end

local chests = {}
local function build_itemlist_menu(name,items,cb)
	local menu = { name = name }
	local kitems = {}

	local choose = function(player,choice)
		local idname = kitems[choice]
		if idname then
			cb(idname)
		end
	end

	for k,v in pairs(items) do 
		local name,weight = vRP.getItemDefinition(k)
		if name then
			kitems[name] = k
			menu[name] = { choose,"<text01>Quantidade:</text01> <text02>"..v.amount.."</text02><text01>Peso:</text01> <text02>"..string.format("%.2f",weight).."kg</text02>" }
		end
	end

	return menu
end

function vRP.openChest(source,name,max_weight,cb_close,cb_in,cb_out)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		local identity = vRP.getUserIdentity(user_id)
		if data.inventory then
			if not chests[name] then
				local close_count = 0
				local chest = { max_weight = max_weight }
				chests[name] = chest 
				local cdata = vRP.getSData("chest:"..name)
				chest.items = json.decode(cdata) or {}

				local menu = { name = "Baú" }
				local cb_take = function(idname)
					local citem = chest.items[idname]
					local amount = vRP.prompt(source,"Quantidade:","")
					if parseInt(amount) > 0 and parseInt(amount) <= citem.amount then
						local new_weight = vRP.getInventoryWeight(user_id)+vRP.getItemWeight(idname)*parseInt(amount)
						if new_weight <= vRP.getInventoryMaxWeight(user_id) then
							vRP.giveInventoryItem(user_id,idname,parseInt(amount))
								if name == "static:1" then
									SendWebhookMessage(webhookbaustaticpolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Policia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&628630606649098276>")
								elseif name == "static:2" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaucrips,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:3" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Marabunta "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:4" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:5" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:6" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Grove "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaugroove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Grove "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:7" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Triade "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbautriade,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Triade "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:8" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: LifeInvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaulifeinvader,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: LifeInvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:9" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:10" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bahamas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaubahamas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bahamas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:11" then
									-- Colocar depois
								elseif name == "static:12" then
									--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Corleone "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:13" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: siciliana "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbausiciliana,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: siciliana "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:14" then
									--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Concessionaria "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:15" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bloods "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaubloods,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bloods "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end
							citem.amount = citem.amount - parseInt(amount)

							if citem.amount <= 0 then
								chest.items[idname] = nil
							end

							if cb_out then
								cb_out(idname,parseInt(amount))
							end
							vRP.closeMenu(source)
						else
							TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Valor inválido.",8000)
					end
				end

				local ch_take = function(player,choice)
					local weight = vRP.computeItemsWeight(chest.items)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",chest.items,cb_take)

					submenu.onclose = function()
						close_count = close_count - 1
						vRP.openMenu(player,menu)
					end
					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				local cb_put = function(idname)
					if string.match(idname,"identidade") then
						TriggerClientEvent("Notify",source,"importante","Não pode guardar a <b>Identidade</b> em veículos.",8000)
						return
					end

					local amount = vRP.prompt(source,"Quantidade:","")
					local new_weight = vRP.computeItemsWeight(chest.items)+vRP.getItemWeight(idname)*parseInt(amount)
					if new_weight <= max_weight then
						if parseInt(amount) > 0 and vRP.tryGetInventoryItem(user_id,idname,parseInt(amount)) then
							
							if name == "static:1" then
								SendWebhookMessage(webhookbaustaticpolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Policia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:2" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaucrips,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:3" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Marabunta "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:4" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:5" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:6" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Grove "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaugroove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Grove "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:7" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Triade "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbautriade,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Triade "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:8" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: LifeInvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaulifeinvader,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: LifeInvader "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:9" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Crips "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:10" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bahamas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaubahamas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bahamas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:11" then
								-- Colocar depois
							elseif name == "static:12" then
								--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Corleone "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:13" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: siciliana "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbausiciliana,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: siciliana "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:14" then
								--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Concessionaria "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:15" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bloods "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbau,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bloods "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end

							local citem = chest.items[idname]

							if citem ~= nil then
								citem.amount = citem.amount + parseInt(amount)
							else
								chest.items[idname] = { amount = parseInt(amount) }
							end

							if cb_in then
								cb_in(idname,parseInt(amount))
							end
							vRP.closeMenu(source)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Baú cheio.",8000)
					end
				end

				local ch_put = function(player,choice)
					local weight = vRP.computeItemsWeight(data.inventory)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",data.inventory,cb_put)

					submenu.onclose = function()
						close_count = close_count-1
						vRP.openMenu(player,menu)
					end

					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				menu["Retirar"] = { ch_take }
				menu["Colocar"] = { ch_put }

				menu.onclose = function()
					if close_count == 0 then
						vRP.setSData("chest:"..name,json.encode(chest.items))
						chests[name] = nil
						if cb_close then
							cb_close()
						end
					end
				end
				vRP.openMenu(source,menu)
			else
				TriggerClientEvent("Notify",source,"importante","Está sendo utilizado no momento.",8000)
			end
		end
	end
end

local function build_client_static_chests(source)
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(cfg.static_chests) do
			local mtype,x,y,z = table.unpack(v)
			local schest = cfg.static_chest_types[mtype]

			if schest then
				local function schest_enter(source)
					local user_id = vRP.getUserId(source)
					if user_id and vRP.hasPermissions(user_id,schest.permissions or {}) then
						vRP.openChest(source,"static:"..k,schest.weight or 0)
					end
				end

				local function schest_leave(source)
					vRP.closeMenu(source)
				end

				vRP.setArea(source,"vRP:static_chest:"..k,x,y,z,1,1,schest_enter,schest_leave)
			end
		end
	end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
		build_client_static_chests(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
local vehglobal = {
	["blista"] = { ['name'] = "Blista", ['price'] = 60000, ['tipo'] = "carros" },
	["brioso"] = { ['name'] = "Brioso", ['price'] = 35000, ['tipo'] = "carros" },
	["emperor"] = { ['name'] = "Emperor", ['price'] = 50000, ['tipo'] = "carros" },
	["emperor2"] = { ['name'] = "Emperor 2", ['price'] = 50000, ['tipo'] = "carros" },
	["dilettante"] = { ['name'] = "Dilettante", ['price'] = 60000, ['tipo'] = "carros" },
	["issi2"] = { ['name'] = "Issi2", ['price'] = 90000, ['tipo'] = "carros" },
	["panto"] = { ['name'] = "Panto", ['price'] = 25000, ['tipo'] = "carros" },
	["prairie"] = { ['name'] = "Prairie", ['price'] = 10000, ['tipo'] = "carros" },
	["rhapsody"] = { ['name'] = "Rhapsody", ['price'] = 70000, ['tipo'] = "carros" },
	["cogcabrio"] = { ['name'] = "Cogcabrio", ['price'] = 130000, ['tipo'] = "carros" },
	["exemplar"] = { ['name'] = "Exemplar", ['price'] = 80000, ['tipo'] = "carros" },
	["f620"] = { ['name'] = "F620", ['price'] = 55000, ['tipo'] = "carros" },
	["felon"] = { ['name'] = "Felon", ['price'] = 70000, ['tipo'] = "carros" },
	["ingot"] = { ['name'] = "Ingot", ['price'] = 160000, ['tipo'] = "carros" },
	["jackal"] = { ['name'] = "Jackal", ['price'] = 60000, ['tipo'] = "carros" },
	["oracle"] = { ['name'] = "Oracle", ['price'] = 60000, ['tipo'] = "carros" },
	["oracle2"] = { ['name'] = "Oracle2", ['price'] = 80000, ['tipo'] = "carros" },
	["sentinel"] = { ['name'] = "Sentinel", ['price'] = 50000, ['tipo'] = "carros" },
	["sentinel2"] = { ['name'] = "Sentinel2", ['price'] = 60000, ['tipo'] = "carros" },
	["windsor"] = { ['name'] = "Windsor", ['price'] = 150000, ['tipo'] = "carros" },
	["windsor2"] = { ['name'] = "Windsor2", ['price'] = 170000, ['tipo'] = "carros" },
	["zion"] = { ['name'] = "Zion", ['price'] = 50000, ['tipo'] = "carros" },
	["zion2"] = { ['name'] = "Zion2", ['price'] = 60000, ['tipo'] = "carros" },
	["blade"] = { ['name'] = "Blade", ['price'] = 110000, ['tipo'] = "carros" },
	["buccaneer"] = { ['name'] = "Buccaneer", ['price'] = 130000, ['tipo'] = "carros" },
	["buccaneer2"] = { ['name'] = "Buccaneer2", ['price'] = 260000, ['tipo'] = "carros" },
	["primo"] = { ['name'] = "Primo", ['price'] = 130000, ['tipo'] = "carros" },
	["chino"] = { ['name'] = "Chino", ['price'] = 130000, ['tipo'] = "carros" },
	["coquette3"] = { ['name'] = "Coquette3", ['price'] = 195000, ['tipo'] = "carros" },
	["dukes"] = { ['name'] = "Dukes", ['price'] = 150000, ['tipo'] = "carros" },
	["faction"] = { ['name'] = "Faction", ['price'] = 150000, ['tipo'] = "carros" },
	["faction3"] = { ['name'] = "Faction3", ['price'] = 350000, ['tipo'] = "carros" },
	["gauntlet"] = { ['name'] = "Gauntlet", ['price'] = 165000, ['tipo'] = "carros" },
	["gauntlet2"] = { ['name'] = "Gauntlet2", ['price'] = 165000, ['tipo'] = "carros" },
	["hermes"] = { ['name'] = "Hermes", ['price'] = 280000, ['tipo'] = "carros" },
	["hotknife"] = { ['name'] = "Hotknife", ['price'] = 180000, ['tipo'] = "carros" },
	["moonbeam"] = { ['name'] = "Moonbeam", ['price'] = 220000, ['tipo'] = "carros" },
	["moonbeam2"] = { ['name'] = "Moonbeam2", ['price'] = 250000, ['tipo'] = "carros" },
	["nightshade"] = { ['name'] = "Nightshade", ['price'] = 270000, ['tipo'] = "carros" },
	["picador"] = { ['name'] = "Picador", ['price'] = 150000, ['tipo'] = "carros" },
	["ruiner"] = { ['name'] = "Ruiner", ['price'] = 150000, ['tipo'] = "carros" },
	["sabregt"] = { ['name'] = "Sabregt", ['price'] = 260000, ['tipo'] = "carros" },
	["sabregt2"] = { ['name'] = "Sabregt2", ['price'] = 250000, ['tipo'] = "carros" },
	["slamvan"] = { ['name'] = "Slamvan", ['price'] = 180000, ['tipo'] = "carros" },
	["slamvan3"] = { ['name'] = "Slamvan3", ['price'] = 230000, ['tipo'] = "carros" },
	["stalion"] = { ['name'] = "Stalion", ['price'] = 150000, ['tipo'] = "carros" },
	["stalion2"] = { ['name'] = "Stalion2", ['price'] = 150000, ['tipo'] = "carros" },
	["tampa"] = { ['name'] = "Tampa", ['price'] = 170000, ['tipo'] = "carros" },
	["vigero"] = { ['name'] = "Vigero", ['price'] = 170000, ['tipo'] = "carros" },
	["virgo"] = { ['name'] = "Virgo", ['price'] = 150000, ['tipo'] = "carros" },
	["virgo2"] = { ['name'] = "Virgo2", ['price'] = 250000, ['tipo'] = "carros" },
	["virgo3"] = { ['name'] = "Virgo3", ['price'] = 180000, ['tipo'] = "carros" },
	["voodoo"] = { ['name'] = "Voodoo", ['price'] = 220000, ['tipo'] = "carros" },
	["voodoo2"] = { ['name'] = "Voodoo2", ['price'] = 220000, ['tipo'] = "carros" },
	["yosemite"] = { ['name'] = "Yosemite", ['price'] = 350000, ['tipo'] = "carros" },
	["bfinjection"] = { ['name'] = "Bfinjection", ['price'] = 80000, ['tipo'] = "carros" },
	["bifta"] = { ['name'] = "Bifta", ['price'] = 210000, ['tipo'] = "carros" },
	["bodhi2"] = { ['name'] = "Bodhi2", ['price'] = 170000, ['tipo'] = "carros" },
	["brawler"] = { ['name'] = "Brawler", ['price'] = 250000, ['tipo'] = "carros" },
	["trophytruck"] = { ['name'] = "Trophytruck", ['price'] = 400000, ['tipo'] = "carros" },
	["trophytruck2"] = { ['name'] = "Trophytruck2", ['price'] = 400000, ['tipo'] = "carros" },
	["dubsta3"] = { ['name'] = "Dubsta3", ['price'] = 300000, ['tipo'] = "carros" },
	["mesa3"] = { ['name'] = "Mesa3", ['price'] = 300000, ['tipo'] = "carros" },
	["rancherxl"] = { ['name'] = "Rancherxl", ['price'] = 220000, ['tipo'] = "carros" },
	["rebel2"] = { ['name'] = "Rebel2", ['price'] = 250000, ['tipo'] = "carros" },
	["riata"] = { ['name'] = "Riata", ['price'] = 250000, ['tipo'] = "carros" },
	["dloader"] = { ['name'] = "Dloader", ['price'] = 150000, ['tipo'] = "carros" },
	["sandking"] = { ['name'] = "Sandking", ['price'] = 400000, ['tipo'] = "carros" },
	["sandking2"] = { ['name'] = "Sandking2", ['price'] = 370000, ['tipo'] = "carros" },
	["baller"] = { ['name'] = "Baller", ['price'] = 400000, ['tipo'] = "carros" },
	["baller2"] = { ['name'] = "Baller2", ['price'] = 420000, ['tipo'] = "carros" },
	["baller3"] = { ['name'] = "Baller3", ['price'] = 430000, ['tipo'] = "carros" },
	["baller4"] = { ['name'] = "Baller4", ['price'] = 440000, ['tipo'] = "carros" },
	["baller5"] = { ['name'] = "Baller5", ['price'] = 450000, ['tipo'] = "carros" },
	["baller6"] = { ['name'] = "Baller6", ['price'] = 460000, ['tipo'] = "carros" },
	["bjxl"] = { ['name'] = "Bjxl", ['price'] = 110000, ['tipo'] = "carros" },
	["cavalcade"] = { ['name'] = "Cavalcade", ['price'] = 110000, ['tipo'] = "carros" },
	["cavalcade2"] = { ['name'] = "Cavalcade2", ['price'] = 130000, ['tipo'] = "carros" },
	["contender"] = { ['name'] = "Contender", ['price'] = 300000, ['tipo'] = "carros" },
	["dubsta"] = { ['name'] = "Dubsta", ['price'] = 210000, ['tipo'] = "carros" },
	["dubsta2"] = { ['name'] = "Dubsta2", ['price'] = 240000, ['tipo'] = "carros" },
	["fq2"] = { ['name'] = "Fq2", ['price'] = 110000, ['tipo'] = "carros" },
	["granger"] = { ['name'] = "Granger", ['price'] = 445000, ['tipo'] = "carros" },
	["gresley"] = { ['name'] = "Gresley", ['price'] = 150000, ['tipo'] = "carros" },
	["habanero"] = { ['name'] = "Habanero", ['price'] = 110000, ['tipo'] = "carros" },
	["seminole"] = { ['name'] = "Seminole", ['price'] = 110000, ['tipo'] = "carros" },
	["serrano"] = { ['name'] = "Serrano", ['price'] = 150000, ['tipo'] = "carros" },
	["xls"] = { ['name'] = "Xls", ['price'] = 450000, ['tipo'] = "carros" },
	["xls2"] = { ['name'] = "Xls2", ['price'] = 450000, ['tipo'] = "carros" },
	["asea"] = { ['name'] = "Asea", ['price'] = 55000, ['tipo'] = "carros" },
	["asterope"] = { ['name'] = "Asterope", ['price'] = 65000, ['tipo'] = "carros" },
	["cog552"] = { ['name'] = "Cog552", ['price'] = 400000, ['tipo'] = "carros" },
	["cognoscenti"] = { ['name'] = "Cognoscenti", ['price'] = 280000, ['tipo'] = "carros" },
	["cognoscenti2"] = { ['name'] = "Cognoscenti2", ['price'] = 400000, ['tipo'] = "carros" },
	["stanier"] = { ['name'] = "Stanier", ['price'] = 60000, ['tipo'] = "carros" },
	["stratum"] = { ['name'] = "Stratum", ['price'] = 90000, ['tipo'] = "carros" },
	["surge"] = { ['name'] = "Surge", ['price'] = 210000, ['tipo'] = "carros" },
	["tailgater"] = { ['name'] = "Tailgater", ['price'] = 110000, ['tipo'] = "carros" },
	["warrener"] = { ['name'] = "Warrener", ['price'] = 90000, ['tipo'] = "carros" },
	["washington"] = { ['name'] = "Washington", ['price'] = 130000, ['tipo'] = "carros" },
	["alpha"] = { ['name'] = "Alpha", ['price'] = 330000, ['tipo'] = "carros" },
	["banshee"] = { ['name'] = "Banshee", ['price'] = 300000, ['tipo'] = "carros" },
	["bestiagts"] = { ['name'] = "Bestiagts", ['price'] = 400000, ['tipo'] = "carros" },
	["blista2"] = { ['name'] = "Blista2", ['price'] = 55000, ['tipo'] = "carros" },
	["blista3"] = { ['name'] = "Blista3", ['price'] = 80000, ['tipo'] = "carros" },
	["buffalo"] = { ['name'] = "Buffalo", ['price'] = 300000, ['tipo'] = "carros" },
	["buffalo2"] = { ['name'] = "Buffalo2", ['price'] = 300000, ['tipo'] = "carros" },
	["buffalo3"] = { ['name'] = "Buffalo3", ['price'] = 300000, ['tipo'] = "carros" },
	["carbonizzare"] = { ['name'] = "Carbonizzare", ['price'] = 490000, ['tipo'] = "carros" },
	["comet2"] = { ['name'] = "Comet2", ['price'] = 350000, ['tipo'] = "carros" },
	["comet3"] = { ['name'] = "Comet3", ['price'] = 390000, ['tipo'] = "carros" },
	["comet5"] = { ['name'] = "Comet5", ['price'] = 400000, ['tipo'] = "carros" },
	["coquette"] = { ['name'] = "Coquette", ['price'] = 450000, ['tipo'] = "carros" },
	["elegy"] = { ['name'] = "Elegy", ['price'] = 550000, ['tipo'] = "carros" },
	["elegy2"] = { ['name'] = "Elegy2", ['price'] = 655000, ['tipo'] = "carros" },
	["feltzer2"] = { ['name'] = "Feltzer2", ['price'] = 255000, ['tipo'] = "carros" },
	["furoregt"] = { ['name'] = "Furoregt", ['price'] = 290000, ['tipo'] = "carros" },
	["fusilade"] = { ['name'] = "Fusilade", ['price'] = 210000, ['tipo'] = "carros" },
	["futo"] = { ['name'] = "Futo", ['price'] = 200000, ['tipo'] = "carros" },
	["jester"] = { ['name'] = "Jester", ['price'] = 600000, ['tipo'] = "carros" },
	["khamelion"] = { ['name'] = "Khamelion", ['price'] = 210000, ['tipo'] = "carros" },
	["kuruma"] = { ['name'] = "Kuruma", ['price'] = 330000, ['tipo'] = "carros" },
	["massacro"] = { ['name'] = "Massacro", ['price'] = 330000, ['tipo'] = "carros" },
	["massacro2"] = { ['name'] = "Massacro2", ['price'] = 330000, ['tipo'] = "carros" },
	["ninef"] = { ['name'] = "Ninef", ['price'] = 290000, ['tipo'] = "carros" },
	["ninef2"] = { ['name'] = "Ninef2", ['price'] = 290000, ['tipo'] = "carros" },
	["omnis"] = { ['name'] = "Omnis", ['price'] = 240000, ['tipo'] = "carros" },
	["pariah"] = { ['name'] = "Pariah", ['price'] = 500000, ['tipo'] = "carros" },
	["penumbra"] = { ['name'] = "Penumbra", ['price'] = 150000, ['tipo'] = "carros" },
	["raiden"] = { ['name'] = "Raiden", ['price'] = 240000, ['tipo'] = "carros" },
	["rapidgt"] = { ['name'] = "Rapidgt", ['price'] = 450000, ['tipo'] = "carros" },
	["rapidgt2"] = { ['name'] = "Rapidgt2", ['price'] = 300000, ['tipo'] = "carros" },
	["ruston"] = { ['name'] = "Ruston", ['price'] = 370000, ['tipo'] = "carros" },
	["schafter3"] = { ['name'] = "Schafter3", ['price'] = 275000, ['tipo'] = "carros" },
	["schafter4"] = { ['name'] = "Schafter4", ['price'] = 275000, ['tipo'] = "carros" },
	["schafter5"] = { ['name'] = "Schafter5", ['price'] = 275000, ['tipo'] = "carros" },
	["schwarzer"] = { ['name'] = "Schwarzer", ['price'] = 170000, ['tipo'] = "carros" },
	["sentinel3"] = { ['name'] = "Sentinel3", ['price'] = 170000, ['tipo'] = "carros" },
	["seven70"] = { ['name'] = "Seven70", ['price'] = 770000, ['tipo'] = "carros" },
	["specter"] = { ['name'] = "Specter", ['price'] = 320000, ['tipo'] = "carros" },
	["specter2"] = { ['name'] = "Specter2", ['price'] = 355000, ['tipo'] = "carros" },
	["streiter"] = { ['name'] = "Streiter", ['price'] = 250000, ['tipo'] = "carros" },
	["sultan"] = { ['name'] = "Sultan", ['price'] = 510000, ['tipo'] = "carros" },
	["surano"] = { ['name'] = "Surano", ['price'] = 310000, ['tipo'] = "carros" },
	["tampa2"] = { ['name'] = "Tampa2", ['price'] = 200000, ['tipo'] = "carros" },
	["tropos"] = { ['name'] = "Tropos", ['price'] = 170000, ['tipo'] = "carros" },
	["verlierer2"] = { ['name'] = "Verlierer2", ['price'] = 380000, ['tipo'] = "carros" },
	["btype2"] = { ['name'] = "Btype2", ['price'] = 460000, ['tipo'] = "carros" },
	["btype3"] = { ['name'] = "Btype3", ['price'] = 390000, ['tipo'] = "carros" },
	["casco"] = { ['name'] = "Casco", ['price'] = 355000, ['tipo'] = "carros" },
	["cheetah"] = { ['name'] = "Cheetah", ['price'] = 425000, ['tipo'] = "carros" },
	["coquette2"] = { ['name'] = "Coquette2", ['price'] = 285000, ['tipo'] = "carros" },
	["feltzer3"] = { ['name'] = "Feltzer3", ['price'] = 220000, ['tipo'] = "carros" },
	["gt500"] = { ['name'] = "Gt500", ['price'] = 250000, ['tipo'] = "carros" },
	["infernus2"] = { ['name'] = "Infernus2", ['price'] = 250000, ['tipo'] = "carros" },
	["jb700"] = { ['name'] = "Jb700", ['price'] = 220000, ['tipo'] = "carros" },
	["mamba"] = { ['name'] = "Mamba", ['price'] = 300000, ['tipo'] = "carros" },
	["manana"] = { ['name'] = "Manana", ['price'] = 130000, ['tipo'] = "carros" },
	["monroe"] = { ['name'] = "Monroe", ['price'] = 260000, ['tipo'] = "carros" },
	["peyote"] = { ['name'] = "Peyote", ['price'] = 150000, ['tipo'] = "carros" },
	["pigalle"] = { ['name'] = "Pigalle", ['price'] = 250000, ['tipo'] = "carros" },
	["rapidgt3"] = { ['name'] = "Rapidgt3", ['price'] = 220000, ['tipo'] = "carros" },
	["retinue"] = { ['name'] = "Retinue", ['price'] = 200000, ['tipo'] = "carros" },
	["stinger"] = { ['name'] = "Stinger", ['price'] = 220000, ['tipo'] = "carros" },
	["stingergt"] = { ['name'] = "Stingergt", ['price'] = 230000, ['tipo'] = "carros" },
	["torero"] = { ['name'] = "Torero", ['price'] = 250000, ['tipo'] = "carros" },
	["tornado"] = { ['name'] = "Tornado", ['price'] = 150000, ['tipo'] = "carros" },
	["tornado2"] = { ['name'] = "Tornado2", ['price'] = 400000, ['tipo'] = "carros" },
	["tornado6"] = { ['name'] = "Tornado6", ['price'] = 450000, ['tipo'] = "carros" },
	["turismo2"] = { ['name'] = "Turismo2", ['price'] = 420000, ['tipo'] = "carros" },
	["ztype"] = { ['name'] = "Ztype", ['price'] = 500000, ['tipo'] = "carros" },
	["adder"] = { ['name'] = "Adder", ['price'] = 1500000, ['tipo'] = "carros" },
	["autarch"] = { ['name'] = "Autarch", ['price'] = 760000, ['tipo'] = "carros" },
	["banshee2"] = { ['name'] = "Banshee2", ['price'] = 370000, ['tipo'] = "carros" },
	["bullet"] = { ['name'] = "Bullet", ['price'] = 600000, ['tipo'] = "carros" },
	["cheetah2"] = { ['name'] = "Cheetah2", ['price'] = 240000, ['tipo'] = "carros" },
	["entityxf"] = { ['name'] = "Entityxf", ['price'] = 460000, ['tipo'] = "carros" },
	["fmj"] = { ['name'] = "Fmj", ['price'] = 520000, ['tipo'] = "carros" },
	["gp1"] = { ['name'] = "Gp1", ['price'] = 495000, ['tipo'] = "carros" },
	["infernus"] = { ['name'] = "Infernus", ['price'] = 600000, ['tipo'] = "carros" },
	["nero"] = { ['name'] = "Nero", ['price'] = 1000000, ['tipo'] = "carros" },
	["nero2"] = { ['name'] = "Nero2", ['price'] = 1200000, ['tipo'] = "carros" },
	["osiris"] = { ['name'] = "Osiris", ['price'] = 1200000, ['tipo'] = "carros" },
	["penetrator"] = { ['name'] = "Penetrator", ['price'] = 480000, ['tipo'] = "carros" },
	["pfister811"] = { ['name'] = "Pfister811", ['price'] = 530000, ['tipo'] = "carros" },
	["reaper"] = { ['name'] = "Reaper", ['price'] = 620000, ['tipo'] = "carros" },
	["sc1"] = { ['name'] = "Sc1", ['price'] = 550000, ['tipo'] = "carros" },
	["sultanrs"] = { ['name'] = "Sultan RS", ['price'] = 550000, ['tipo'] = "carros" },
	["t20"] = { ['name'] = "T20", ['price'] = 1100000, ['tipo'] = "carros" },
	["tempesta"] = { ['name'] = "Tempesta", ['price'] = 600000, ['tipo'] = "carros" },
	["turismor"] = { ['name'] = "Turismor", ['price'] = 620000, ['tipo'] = "carros" },
	["tyrus"] = { ['name'] = "Tyrus", ['price'] = 620000, ['tipo'] = "carros" },
	["vacca"] = { ['name'] = "Vacca", ['price'] = 620000, ['tipo'] = "carros" },
	["visione"] = { ['name'] = "Visione", ['price'] = 690000, ['tipo'] = "carros" },
	["voltic"] = { ['name'] = "Voltic", ['price'] = 440000, ['tipo'] = "carros" },
	["zentorno"] = { ['name'] = "Zentorno", ['price'] = 920000, ['tipo'] = "carros" },
	["sadler"] = { ['name'] = "Sadler", ['price'] = 180000, ['tipo'] = "carros" },
	["bison"] = { ['name'] = "Bison", ['price'] = 220000, ['tipo'] = "carros" },
	["bison2"] = { ['name'] = "Bison2", ['price'] = 180000, ['tipo'] = "carros" },
	["bobcatxl"] = { ['name'] = "Bobcatxl", ['price'] = 260000, ['tipo'] = "carros" },
	["burrito"] = { ['name'] = "Burrito", ['price'] = 260000, ['tipo'] = "carros" },
	["burrito2"] = { ['name'] = "Burrito2", ['price'] = 260000, ['tipo'] = "carros" },
	["burrito3"] = { ['name'] = "Burrito3", ['price'] = 260000, ['tipo'] = "carros" },
	["burrito4"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros" },
	["mule4"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros" },
	["rallytruck"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros" },
	["minivan"] = { ['name'] = "Minivan", ['price'] = 110000, ['tipo'] = "carros" },
	["minivan2"] = { ['name'] = "Minivan2", ['price'] = 220000, ['tipo'] = "carros" },
	["paradise"] = { ['name'] = "Paradise", ['price'] = 260000, ['tipo'] = "carros" },
	["pony"] = { ['name'] = "Pony", ['price'] = 260000, ['tipo'] = "carros" },
	["pony2"] = { ['name'] = "Pony2", ['price'] = 260000, ['tipo'] = "carros" },
	["rumpo"] = { ['name'] = "Rumpo", ['price'] = 260000, ['tipo'] = "carros" },
	["rumpo2"] = { ['name'] = "Rumpo2", ['price'] = 260000, ['tipo'] = "carros" },
	["rumpo3"] = { ['name'] = "Rumpo3", ['price'] = 350000, ['tipo'] = "carros" },
	["surfer"] = { ['name'] = "Surfer", ['price'] = 100000, ['tipo'] = "carros" },
	["youga"] = { ['name'] = "Youga", ['price'] = 260000, ['tipo'] = "carros" },
	["huntley"] = { ['name'] = "Huntley", ['price'] = 110000, ['tipo'] = "carros" },
	["landstalker"] = { ['name'] = "Landstalker", ['price'] = 130000, ['tipo'] = "carros" },
	["mesa"] = { ['name'] = "Mesa", ['price'] = 200000, ['tipo'] = "carros" },
	["patriot"] = { ['name'] = "Patriot", ['price'] = 250000, ['tipo'] = "carros" },
	["radi"] = { ['name'] = "Radi", ['price'] = 110000, ['tipo'] = "carros" },
	["rocoto"] = { ['name'] = "Rocoto", ['price'] = 110000, ['tipo'] = "carros" },
	["tyrant"] = { ['name'] = "Tyrant", ['price'] = 690000, ['tipo'] = "carros" },
	["entity2"] = { ['name'] = "Entity2", ['price'] = 550000, ['tipo'] = "carros" },
	["cheburek"] = { ['name'] = "Cheburek", ['price'] = 170000, ['tipo'] = "carros" },
	["hotring"] = { ['name'] = "Hotring", ['price'] = 300000, ['tipo'] = "carros" },
	["jester3"] = { ['name'] = "Jester3", ['price'] = 650000, ['tipo'] = "carros" },
	["flashgt"] = { ['name'] = "Flashgt", ['price'] = 370000, ['tipo'] = "carros" },
	["ellie"] = { ['name'] = "Ellie", ['price'] = 320000, ['tipo'] = "carros" },
	["michelli"] = { ['name'] = "Michelli", ['price'] = 160000, ['tipo'] = "carros" },
	["fagaloa"] = { ['name'] = "Fagaloa", ['price'] = 320000, ['tipo'] = "carros" },
	["dominator"] = { ['name'] = "Dominator", ['price'] = 230000, ['tipo'] = "carros" },
	["dominator2"] = { ['name'] = "Dominator2", ['price'] = 230000, ['tipo'] = "carros" },
	["dominator3"] = { ['name'] = "Dominator3", ['price'] = 370000, ['tipo'] = "carros" },
	["issi3"] = { ['name'] = "Issi3", ['price'] = 190000, ['tipo'] = "carros" },
	["taipan"] = { ['name'] = "Taipan", ['price'] = 620000, ['tipo'] = "carros" },
	["gb200"] = { ['name'] = "Gb200", ['price'] = 195000, ['tipo'] = "carros" },
	["stretch"] = { ['name'] = "Stretch", ['price'] = 520000, ['tipo'] = "carros" },
	["guardian"] = { ['name'] = "Guardian", ['price'] = 540000, ['tipo'] = "carros" },
	["kamacho"] = { ['name'] = "Kamacho", ['price'] = 460000, ['tipo'] = "carros" },
	["neon"] = { ['name'] = "Neon", ['price'] = 370000, ['tipo'] = "carros" },
	["cyclone"] = { ['name'] = "Cyclone", ['price'] = 920000, ['tipo'] = "carros" },
	["italigtb"] = { ['name'] = "Italigtb", ['price'] = 600000, ['tipo'] = "carros" },
	["italigtb2"] = { ['name'] = "Italigtb2", ['price'] = 610000, ['tipo'] = "carros" },
	["vagner"] = { ['name'] = "Vagner", ['price'] = 680000, ['tipo'] = "carros" },
	["xa21"] = { ['name'] = "Xa21", ['price'] = 630000, ['tipo'] = "carros" },
	["tezeract"] = { ['name'] = "Tezeract", ['price'] = 920000, ['tipo'] = "carros" },
	["prototipo"] = { ['name'] = "Prototipo", ['price'] = 1030000, ['tipo'] = "carros" },
	["patriot2"] = { ['name'] = "Patriot2", ['price'] = 550000, ['tipo'] = "carros" },
	["swinger"] = { ['name'] = "Swinger", ['price'] = 250000, ['tipo'] = "carros" },
	["clique"] = { ['name'] = "Clique", ['price'] = 360000, ['tipo'] = "carros" },
	["deveste"] = { ['name'] = "Deveste", ['price'] = 920000, ['tipo'] = "carros" },
	["deviant"] = { ['name'] = "Deviant", ['price'] = 370000, ['tipo'] = "carros" },
	["impaler"] = { ['name'] = "Impaler", ['price'] = 450000, ['tipo'] = "carros" },
	["italigto"] = { ['name'] = "Italigto", ['price'] = 1200000, ['tipo'] = "carros" },
	["schlagen"] = { ['name'] = "Schlagen", ['price'] = 690000, ['tipo'] = "carros" },
	["toros"] = { ['name'] = "Toros", ['price'] = 700000, ['tipo'] = "carros" },
	["tulip"] = { ['name'] = "Tulip", ['price'] = 320000, ['tipo'] = "carros" },
	["vamos"] = { ['name'] = "Vamos", ['price'] = 320000, ['tipo'] = "carros" },
	["freecrawler"] = { ['name'] = "Freecrawler", ['price'] = 350000, ['tipo'] = "carros" },
	["fugitive"] = { ['name'] = "Fugitive", ['price'] = 50000, ['tipo'] = "carros" },
	["glendale"] = { ['name'] = "Glendale", ['price'] = 70000, ['tipo'] = "carros" },
	["intruder"] = { ['name'] = "Intruder", ['price'] = 60000, ['tipo'] = "carros" },
	["le7b"] = { ['name'] = "Le7b", ['price'] = 900000, ['tipo'] = "carros" },
	["lurcher"] = { ['name'] = "Lurcher", ['price'] = 150000, ['tipo'] = "carros" },
	["lynx"] = { ['name'] = "Lynx", ['price'] = 650000, ['tipo'] = "carros" },
	["phoenix"] = { ['name'] = "Phoenix", ['price'] = 250000, ['tipo'] = "carros" },
	["premier"] = { ['name'] = "Premier", ['price'] = 35000, ['tipo'] = "carros" },
	["raptor"] = { ['name'] = "Raptor", ['price'] = 350000, ['tipo'] = "carros" },
	["sheava"] = { ['name'] = "Sheava", ['price'] = 700000, ['tipo'] = "carros" },
	["z190"] = { ['name'] = "Z190", ['price'] = 400000, ['tipo'] = "carros" },

	--MOTOS
	
	["akuma"] = { ['name'] = "Akuma", ['price'] = 1500000, ['tipo'] = "motos" },
	["avarus"] = { ['name'] = "Avarus", ['price'] = 440000, ['tipo'] = "motos" },
	["bagger"] = { ['name'] = "Bagger", ['price'] = 300000, ['tipo'] = "motos" },
	["bati"] = { ['name'] = "Bati", ['price'] = 470000, ['tipo'] = "motos" },
	["bati2"] = { ['name'] = "Bati2", ['price'] = 480000, ['tipo'] = "motos" },
	["bf400"] = { ['name'] = "Bf400", ['price'] = 920000, ['tipo'] = "motos" },
	["carbonrs"] = { ['name'] = "Carbonrs", ['price'] = 370000, ['tipo'] = "motos" },
	["chimera"] = { ['name'] = "Chimera", ['price'] = 345000, ['tipo'] = "motos" },
	["cliffhanger"] = { ['name'] = "Cliffhanger", ['price'] = 310000, ['tipo'] = "motos" },
	["daemon2"]  = { ['name'] = "Daemon2", ['price'] = 240000, ['tipo'] = "motos" },
	["defiler"] = { ['name'] = "Defiler", ['price'] = 560000, ['tipo'] = "motos" },
	["diablous"] = { ['name'] = "Diablous", ['price'] = 430000, ['tipo'] = "motos" },
	["diablous2"] = { ['name'] = "Diablous2", ['price'] = 460000, ['tipo'] = "motos" },
	["double"] = { ['name'] = "Double", ['price'] = 500000, ['tipo'] = "motos" },
	["enduro"] = { ['name'] = "Enduro", ['price'] = 300000, ['tipo'] = "motos" },
	["esskey"] = { ['name'] = "Esskey", ['price'] = 320000, ['tipo'] = "motos" },
	["faggio"] = { ['name'] = "Faggio", ['price'] = 7000, ['tipo'] = "motos" },
	["faggio2"] = { ['name'] = "Faggio2", ['price'] = 20000, ['tipo'] = "motos" },
	["faggio3"] = { ['name'] = "Faggio3", ['price'] = 8000, ['tipo'] = "motos" },
	["fcr"] = { ['name'] = "Fcr", ['price'] = 390000, ['tipo'] = "motos" },
	["fcr2"] = { ['name'] = "Fcr2", ['price'] = 390000, ['tipo'] = "motos" },
	["gargoyle"] = { ['name'] = "Gargoyle", ['price'] = 345000, ['tipo'] = "motos" },
	["hakuchou"] = { ['name'] = "Hakuchou", ['price'] = 900000, ['tipo'] = "motos" },
	["hakuchou2"] = { ['name'] = "Hakuchou2", ['price'] = 550000, ['tipo'] = "motos" },
	["hexer"] = { ['name'] = "Hexer", ['price'] = 250000, ['tipo'] = "motos" },
	["innovation"] = { ['name'] = "Innovation", ['price'] = 250000, ['tipo'] = "motos" },
	["lectro"] = { ['name'] = "Lectro", ['price'] = 380000, ['tipo'] = "motos" },
	["manchez"] = { ['name'] = "Manchez", ['price'] = 380000, ['tipo'] = "motos" },
	["nemesis"] = { ['name'] = "Nemesis", ['price'] = 550000, ['tipo'] = "motos" },
	["nightblade"] = { ['name'] = "Nightblade", ['price'] = 415000, ['tipo'] = "motos" },
	["pcj"] = { ['name'] = "Pcj", ['price'] = 80000, ['tipo'] = "motos" },
	["ruffian"] = { ['name'] = "Ruffian", ['price'] = 845000, ['tipo'] = "motos" },
	["sanchez"] = { ['name'] = "Sanchez", ['price'] = 185000, ['tipo'] = "motos" },
	["sanchez2"] = { ['name'] = "Sanchez2", ['price'] = 185000, ['tipo'] = "motos" },
	["sovereign"] = { ['name'] = "Sovereign", ['price'] = 285000, ['tipo'] = "motos" },
	["thrust"] = { ['name'] = "Thrust", ['price'] = 375000, ['tipo'] = "motos" },
	["vader"] = { ['name'] = "Vader", ['price'] = 345000, ['tipo'] = "motos" },
	["vindicator"] = { ['name'] = "Vindicator", ['price'] = 340000, ['tipo'] = "motos" },
	["vortex"] = { ['name'] = "Vortex", ['price'] = 1500000, ['tipo'] = "motos" },
	["wolfsbane"] = { ['name'] = "Wolfsbane", ['price'] = 290000, ['tipo'] = "motos" },
	["zombiea"] = { ['name'] = "Zombiea", ['price'] = 290000, ['tipo'] = "motos" },
	["zombieb"] = { ['name'] = "Zombieb", ['price'] = 300000, ['tipo'] = "motos" },
	["shotaro"] = { ['name'] = "Shotaro", ['price'] = 1000000, ['tipo'] = "motos" },
	["ratbike"] = { ['name'] = "Ratbike", ['price'] = 230000, ['tipo'] = "motos" },
	["blazer"] = { ['name'] = "Blazer", ['price'] = 230000, ['tipo'] = "motos" },
	["blazer4"] = { ['name'] = "Blazer4", ['price'] = 370000, ['tipo'] = "motos" },

	--TRABALHO

	["youga2"] = { ['name'] = "Youga2", ['price'] = 1000, ['tipo'] = "work" },
	["felon2"] = { ['name'] = "Felon2", ['price'] = 1000, ['tipo'] = "work" },
	["pbus"] = { ['name'] = "PBus", ['price'] = 1000, ['tipo'] = "work" },
	["amarokp"] = { ['name'] = "Amarok Policia", ['price'] = 1000, ['tipo'] = "work" },
	["av-gt63"] = { ['name'] = "Mercedes GT 63 Policia", ['price'] = 1000, ['tipo'] = "work" },
	["av-m8"] = { ['name'] = "BMW M8 Policia", ['price'] = 1000, ['tipo'] = "work" },
	["nc7"] = { ['name'] = "NC 750X Policia", ['price'] = 1000, ['tipo'] = "work" },
	["polmav"] = { ['name'] = "Policia Heli", ['price'] = 1000, ['tipo'] = "work" },
	["policiamustanggt"] = { ['name'] = "Mustang GT", ['price'] = 1000, ['tipo'] = "work" },
	["policiacapricesid"] = { ['name'] = "GM Caprice SID", ['price'] = 1000, ['tipo'] = "work" },
	["policiaschaftersid"] = { ['name'] = "GM Schafter SID", ['price'] = 1000, ['tipo'] = "work" },
	["ffocus_speed"] = { ['name'] = "Focus", ['price'] = 1000, ['tipo'] = "work" },
	["policiatahoe"] = { ['name'] = "Chevrolet Tahoe", ['price'] = 1000, ['tipo'] = "work" },
	["policiaexplorer"] = { ['name'] = "Ford Explorer", ['price'] = 1000, ['tipo'] = "work" },
	["11caprice"] = { ['name'] = "Caprice", ['price'] = 1000, ['tipo'] = "work" },
	["policiavictoria"] = { ['name'] = "Ford Victoria", ['price'] = 1000, ['tipo'] = "work" },
	["africatp"] = { ['name'] = "Africatp", ['price'] = 1000, ['tipo'] = "work" },
	["policiaheli"] = { ['name'] = "Policia Helicóptero", ['price'] = 1000, ['tipo'] = "work" },
	["fbi2"] = { ['name'] = "Granger SOG", ['price'] = 1000, ['tipo'] = "work" },
	["policeb"] = { ['name'] = "Harley Davidson", ['price'] = 1000, ['tipo'] = "work" },
	["riot"] = { ['name'] = "Blindado", ['price'] = 1000, ['tipo'] = "work" },
	["paramedicoambu"] = { ['name'] = "Ambulância", ['price'] = 1000, ['tipo'] = "work" },
	["paramedicocharger2014"] = { ['name'] = "Dodge Charger 2014", ['price'] = 1000, ['tipo'] = "work" },
	["paramedicoheli"] = { ['name'] = "Paramédico Helicóptero", ['price'] = 1000, ['tipo'] = "work" },
	["seasparrow"] = { ['name'] = "Paramédico Helicóptero Água", ['price'] = 1000, ['tipo'] = "work" },
	["coach"] = { ['name'] = "Coach", ['price'] = 1000, ['tipo'] = "work" },
	["bus"] = { ['name'] = "Ônibus", ['price'] = 1000, ['tipo'] = "work" },
	["flatbed"] = { ['name'] = "Reboque", ['price'] = 1000, ['tipo'] = "work" },
	["towtruck"] = { ['name'] = "Towtruck", ['price'] = 1000, ['tipo'] = "work" },
	["towtruck2"] = { ['name'] = "Towtruck2", ['price'] = 1000, ['tipo'] = "work" },
	["ratloader"] = { ['name'] = "Caminhão", ['price'] = 1000, ['tipo'] = "work" },
	["ratloader2"] = { ['name'] = "Ratloader2", ['price'] = 1000, ['tipo'] = "work" },
	["rubble"] = { ['name'] = "Caminhão", ['price'] = 1000, ['tipo'] = "work" },
	["taxi"] = { ['name'] = "Taxi", ['price'] = 1000, ['tipo'] = "work" },
	["boxville4"] = { ['name'] = "Caminhão", ['price'] = 1000, ['tipo'] = "work" },
	["trash2"] = { ['name'] = "Caminhão", ['price'] = 1000, ['tipo'] = "work" },
	["tiptruck"] = { ['name'] = "Tiptruck", ['price'] = 1000, ['tipo'] = "work" },
	["scorcher"] = { ['name'] = "Scorcher", ['price'] = 1000, ['tipo'] = "work" },
	["tribike"] = { ['name'] = "Tribike", ['price'] = 1000, ['tipo'] = "work" },
	["tribike2"] = { ['name'] = "Tribike2", ['price'] = 1000, ['tipo'] = "work" },
	["tribike3"] = { ['name'] = "Tribike3", ['price'] = 1000, ['tipo'] = "work" },
	["fixter"] = { ['name'] = "Fixter", ['price'] = 1000, ['tipo'] = "work" },
	["cruiser"] = { ['name'] = "Cruiser", ['price'] = 1000, ['tipo'] = "work" },
	["bmx"] = { ['name'] = "Bmx", ['price'] = 1000, ['tipo'] = "work" },
	["dinghy"] = { ['name'] = "Dinghy", ['price'] = 1000, ['tipo'] = "work" },
	["jetmax"] = { ['name'] = "Jetmax", ['price'] = 1000, ['tipo'] = "work" },
	["marquis"] = { ['name'] = "Marquis", ['price'] = 1000, ['tipo'] = "work" },
	["seashark3"] = { ['name'] = "Seashark3", ['price'] = 1000, ['tipo'] = "work" },
	["speeder"] = { ['name'] = "Speeder", ['price'] = 1000, ['tipo'] = "work" },
	["speeder2"] = { ['name'] = "Speeder2", ['price'] = 1000, ['tipo'] = "work" },
	["squalo"] = { ['name'] = "Squalo", ['price'] = 1000, ['tipo'] = "work" },
	["suntrap"] = { ['name'] = "Suntrap", ['price'] = 1000, ['tipo'] = "work" },
	["toro"] = { ['name'] = "Toro", ['price'] = 1000, ['tipo'] = "work" },
	["toro2"] = { ['name'] = "Toro2", ['price'] = 1000, ['tipo'] = "work" },
	["tropic"] = { ['name'] = "Tropic", ['price'] = 1000, ['tipo'] = "work" },
	["tropic2"] = { ['name'] = "Tropic2", ['price'] = 1000, ['tipo'] = "work" },
	["phantom"] = { ['name'] = "Phantom", ['price'] = 1000, ['tipo'] = "work" },
	["packer"] = { ['name'] = "Packer", ['price'] = 1000, ['tipo'] = "work" },
	["supervolito"] = { ['name'] = "Supervolito", ['price'] = 1000, ['tipo'] = "work" },
	["supervolito2"] = { ['name'] = "Supervolito2", ['price'] = 1000, ['tipo'] = "work" },
	["cuban800"] = { ['name'] = "Cuban800", ['price'] = 1000, ['tipo'] = "work" },
	["mammatus"] = { ['name'] = "Mammatus", ['price'] = 1000, ['tipo'] = "work" },
	["vestra"] = { ['name'] = "Vestra", ['price'] = 1000, ['tipo'] = "work" },
	["velum2"] = { ['name'] = "Velum2", ['price'] = 1000, ['tipo'] = "work" },
	["buzzard2"] = { ['name'] = "Buzzard2", ['price'] = 1000, ['tipo'] = "work" },
	["frogger"] = { ['name'] = "Frogger", ['price'] = 1000, ['tipo'] = "work" },
	["maverick"] = { ['name'] = "Maverick", ['price'] = 1000, ['tipo'] = "work" },
	["tanker2"] = { ['name'] = "Gas", ['price'] = 1000, ['tipo'] = "work" },
	["armytanker"] = { ['name'] = "Diesel", ['price'] = 1000, ['tipo'] = "work" },
	["tvtrailer"] = { ['name'] = "Show", ['price'] = 1000, ['tipo'] = "work" },
	["trailerlogs"] = { ['name'] = "Woods", ['price'] = 1000, ['tipo'] = "work" },
	["tr4"] = { ['name'] = "Cars", ['price'] = 1000, ['tipo'] = "work" },
	["18charger"] = { ['name'] = "Dodge Charger 2018", ['price'] = 1000, ['tipo'] = "work" },
	["speedo"] = { ['name'] = "Speedo", ['price'] = 200000, ['tipo'] = "work" },
	["primo2"] = { ['name'] = "Primo2", ['price'] = 200000, ['tipo'] = "work" },
	["faction2"] = { ['name'] = "Faction2", ['price'] = 200000, ['tipo'] = "work" },
	["chino2"] = { ['name'] = "Chino2", ['price'] = 200000, ['tipo'] = "work" },
	["tornado5"] = { ['name'] = "Tornado5", ['price'] = 200000, ['tipo'] = "work" },
	["daemon"] = { ['name'] = "Daemon", ['price'] = 200000, ['tipo'] = "work" },
	["sanctus"] = { ['name'] = "Sanctus", ['price'] = 200000, ['tipo'] = "work" },
	["gburrito"] = { ['name'] = "GBurrito", ['price'] = 200000, ['tipo'] = "work" },
	["slamvan2"] = { ['name'] = "Slamvan2", ['price'] = 200000, ['tipo'] = "work" },
	["stafford"] = { ['name'] = "Stafford", ['price'] = 200000, ['tipo'] = "work" },
	["cog55"] = { ['name'] = "Cog55", ['price'] = 200000, ['tipo'] = "work" },
	["superd"] = { ['name'] = "Superd", ['price'] = 200000, ['tipo'] = "work" },
	["btype"] = { ['name'] = "Btype", ['price'] = 200000, ['tipo'] = "work" },
	["tractor2"] = { ['name'] = "Tractor2", ['price'] = 1000, ['tipo'] = "work" },
	["rebel"] = { ['name'] = "Rebel", ['price'] = 1000, ['tipo'] = "work" },
	["flatbed3"] = { ['name'] = "flatbed3", ['price'] = 1000, ['tipo'] = "work" },
	["volatus"] = { ['name'] = "Volatus", ['price'] = 1000000, ['tipo'] = "work" },
	["cargobob2"] = { ['name'] = "Cargo Bob", ['price'] = 1000000, ['tipo'] = "work" },		
	
	--IMPORTADOS

	["mazdarx7"] = { ['name'] = "Mazda RX7", ['price'] = 8000000, ['tipo'] = "import" },
	["h2carb"] = { ['name'] = "H2 Carbon", ['price'] = 15000000, ['tipo'] = "import" },
	["xt700"] = { ['name'] = "Yamaha XT-700", ['price'] = 7000000, ['tipo'] = "import" },

	["488gtb"] = { ['name'] = "Ferrari Italia", ['price'] = 7000000, ['tipo'] = "import" },
	["ferrariitalia"] = { ['name'] = "Ferrari Italia", ['price'] = 7000000, ['tipo'] = "import" },
	["mustang"] = { ['name'] = "Ford Mustang", ['price'] = 7000000, ['tipo'] = "import" },
	["nissanskyliner34"] = { ['name'] = "Nissan Skyline R34", ['price'] = 7000000, ['tipo'] = "import" },
	["nissangtr"] = { ['name'] = "Nissan GTR", ['price'] = 7000000, ['tipo'] = "import" },
	["gtrnismo"] = { ['name'] = "Nissan GTR Nismo", ['price'] = 7000000, ['tipo'] = "import" },
	["audirs6"] = { ['name'] = "Audi RS6", ['price'] = 7000000, ['tipo'] = "import" },
	["bmwm3f80"] = { ['name'] = "BMW M3 F80", ['price'] = 7000000, ['tipo'] = "import" },
	["bmwm4gts"] = { ['name'] = "BMW M4 GTS", ['price'] = 7000000, ['tipo'] = "import" },
	["typer"] = { ['name'] = "Honda Civic TypeR", ['price'] = 7000000, ['tipo'] = "import" },
	["a45"] = { ['name'] = "Mercedes A45", ['price'] = 7000000, ['tipo'] = "import" },
	["gl63"] = { ['name'] = "Mercedes GL63", ['price'] = 7000000, ['tipo'] = "import" },
	["giulia"] = { ['name'] = "AlfaRomeo_Giulia", ['price'] = 7000000, ['tipo'] = "import" },
	["tiger"] = { ['name'] = "TIGER 800", ['price'] = 1000000, ['tipo'] = "import" },
	["amggt63s"] = { ['name'] = "Mercedes AMG GT 63s", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodmi8lb"] = { ['name'] = "BMW i8", ['price'] = 7000000, ['tipo'] = "import" },
	["lp770r"] = { ['name'] = "Lamborghini Centenario LP770r", ['price'] = 7000000, ['tipo'] = "import" },
	["fusca"] = { ['name'] = "Fusca", ['price'] = 7000000, ['tipo'] = "import" },
	["alpinab7"] = { ['name'] = "Alpina B7 Mm", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodjeep"] = { ['name'] = "Jeep Grand Cherokee", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodmartin"] = { ['name'] = "Aston Martin DBS Superleggera", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodm5e34"] = { ['name'] = "BMW M5 E34", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodcharger69"] = { ['name'] = "Dodge Charger RT69", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodjesko"] = { ['name'] = "Koenigsegg Jesko", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodc63amg"] = { ['name'] = "Mercedes C63S Coupe", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodgtr50"] = { ['name'] = "Nissan GTR50", ['price'] = 7000000, ['tipo'] = "import" },
	["m3f80wb"] = { ['name'] = "BMW M3 F80 LW", ['price'] = 7000000, ['tipo'] = "import" },
	["2019gt3rs"] = { ['name'] = "Porsche 911 GT3RS", ['price'] = 7000000, ['tipo'] = "import" },
	["lancer9"] = { ['name'] = "Lancer Evolution 9", ['price'] = 7000000, ['tipo'] = "import" },
	["toyotasupra"] = { ['name'] = "Toyota Supra", ['price'] = 7000000, ['tipo'] = "import" },
	["370z"] = { ['name'] = "Nissan 370z", ['price'] = 7000000, ['tipo'] = "import" },
	["huracan"] = { ['name'] = "Lamborghini Huracan", ['price'] = 7000000, ['tipo'] = "import" },
	["lamborghinihuracan"] = { ['name'] = "Lamborghini Huracan", ['price'] = 7000000, ['tipo'] = "import" },
	["dodgechargersrt"] = { ['name'] = "Dodge Charger SRT", ['price'] = 7000000, ['tipo'] = "import" },
	["gs1"] = { ['name'] = "BMW GS 1200", ['price'] = 7000000, ['tipo'] = "import" },
	["r1250"] = { ['name'] = "BMW R1200", ['price'] = 7000000, ['tipo'] = "import" },
	["r1"] = { ['name'] = "Yamaha R1", ['price'] = 7000000, ['tipo'] = "import" },
	["20r1"] = { ['name'] = "Yamaha R1 2020", ['price'] = 7000000, ['tipo'] = "import" },
	["nh2r"] = { ['name'] = "NH2R", ['price'] = 7000000, ['tipo'] = "import" },
	["evoq"] = { ['name'] = "Range Rover Evoque", ['price'] = 7000000, ['tipo'] = "import" },
	["golfgti"] = { ['name'] = "VW Golf GTI V", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodrs6"] = { ['name'] = "Audi RS6 C8", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodf40"] = { ['name'] = "Ferrari F40 Competizione", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodsianr"] = { ['name'] = "Lamborghini Sian Roadster", ['price'] = 7000000, ['tipo'] = "import" },
	["rmode63s"] = { ['name'] = "Mercedes E63S", ['price'] = 7000000, ['tipo'] = "import" },
	["pmansory"] = { ['name'] = "Porsche Panamera", ['price'] = 7000000, ['tipo'] = "import" },
	["m3gtr"] = { ['name'] = "BMW M3 GTR", ['price'] = 7000000, ['tipo'] = "import" },
	["MonalisaFF3"] = { ['name'] = "Silvia S15 MonalisaFF3", ['price'] = 7000000, ['tipo'] = "import" },
	["africat"] = { ['name'] = "Honda Africa Twin", ['price'] = 7000000, ['tipo'] = "import" },
	["r6"] = { ['name'] = "Yamaha R6", ['price'] = 7000000, ['tipo'] = "import" },
	["r8ppi"] = { ['name'] = "Audi R8", ['price'] = 7000000, ['tipo'] = "import" },
	["aperta"] = { ['name'] = "La Ferrari", ['price'] = 7000000, ['tipo'] = "import" },
	["agera"] = { ['name'] = "Koenigsegg Agera", ['price'] = 7000000, ['tipo'] = "import" },
	["regera"] = { ['name'] = "Koenigsegg Regera", ['price'] = 7000000, ['tipo'] = "import" },
	["918"] = { ['name'] = "Porsche 918 Spyder", ['price'] = 7000000, ['tipo'] = "import" },
	["ttrs"] = { ['name'] = "Audi TTRS", ['price'] = 7000000, ['tipo'] = "import" },
	["aventador"] = { ['name'] = "Lamborghini Aventador", ['price'] = 7000000, ['tipo'] = "import" },
	["ySbrImpS11"] = { ['name'] = "Subaru Impreza", ['price'] = 7000000, ['tipo'] = "import" },
	["mach1"] = { ['name'] = "Mustange Mach", ['price'] = 7000000, ['tipo'] = "import" },
	["18Velar"] = { ['name'] = "Range Rover Velar", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodcamaro"] = { ['name'] = "Camaro ZL1", ['price'] = 7000000, ['tipo'] = "import" },
	["rmodmk7"] = { ['name'] = "Golf MK7 JP Pandem", ['price'] = 7000000, ['tipo'] = "import" },
	["jellybigpeen"] = { ['name'] = "Ferrari Antiga", ['price'] = 7000000, ['tipo'] = "import" },
	["silvia"] = { ['name'] = "Silvia Hari", ['price'] = 7000000, ['tipo'] = "import" },

	--EXCLUSIVE 
	
	["audirs7"] = { ['name'] = "Audi RS7", ['price'] = 1800000, ['tipo'] = "exclusive" },
	["gtr"] = { ['name'] = "Nissan GTR", ['price'] = 1000000, ['tipo'] = "exclusive" },
	["720stc"] = { ['name'] = "McLaren 720S", ['price'] = 1000000, ['tipo'] = "exclusive" },	
	["lanex400"] = { ['name'] = "Lancer Evolution X", ['price'] = 1000000, ['tipo'] = "exclusive" },
	["rmodgt63"] = { ['name'] = "Mercedes AMG GT 63", ['price'] = 1000000, ['tipo'] = "exclusive" },
	["r820"] = { ['name'] = "Audi R8 2020", ['price'] = 1000000, ['tipo'] = "exclusive" },
	["mlnovitec"] = { ['name'] = "McLaren Novitec", ['price'] = 1000000, ['tipo'] = "exclusive" },
	["amarok"] = { ['name'] = "VW Amarok", ['price'] = 1000000, ['tipo'] = "exclusive" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleGlobal()
	return vehglobal
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLENAME
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleName(vname)
	return vehglobal[vname].name
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEPRICE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehiclePrice(vname)
	return vehglobal[vname].price
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLETYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleType(vname)
	return vehglobal[vname].tipo
end

function vRP.openChest2(source,name,max_weight,cb_close,cb_in,cb_out)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		local identity = vRP.getUserIdentity(user_id)
		if data.inventory then
			if not chests[name] then
				local close_count = 0
				local chest = { max_weight = max_weight }
				chests[name] = chest 
				local cdata = vRP.getSData("chest:"..name)
				chest.items = json.decode(cdata) or {}

				local menu = { name = "Baú" }
				local cb_take = function(idname)
					local citem = chest.items[idname]
					local amount = vRP.prompt(source,"Quantidade:","")
					amount = parseInt(amount)
					if amount > 0 and amount <= citem.amount then
						local new_weight = vRP.getInventoryWeight(user_id)+vRP.getItemWeight(idname)*amount
						if new_weight <= vRP.getInventoryMaxWeight(user_id) then
							vRP.giveInventoryItem(user_id,idname,amount)
							SendWebhookMessage(webhookbaucasa,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: "..name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							citem.amount = citem.amount - amount

							if citem.amount <= 0 then
								chest.items[idname] = nil
							end

							if cb_out then
								cb_out(idname,amount)
							end
							vRP.closeMenu(source)
						else
							TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.")
						end
					else
						TriggerClientEvent("Notify",source,"negado","Valor inválido.")
					end
				end

				local ch_take = function(player,choice)
					local weight = vRP.computeItemsWeight(chest.items)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",chest.items,cb_take)

					submenu.onclose = function()
						close_count = close_count - 1
						vRP.openMenu(player,menu)
					end
					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				local cb_put = function(idname)
					local amount = vRP.prompt(source,"Quantidade:","")
					amount = parseInt(amount)
					local new_weight = vRP.computeItemsWeight(chest.items)+vRP.getItemWeight(idname)*amount
					if new_weight <= max_weight then
						if amount > 0 and vRP.tryGetInventoryItem(user_id,idname,amount) then
							SendWebhookMessage(webhookbaucasa,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: "..name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							local citem = chest.items[idname]

							if citem ~= nil then
								citem.amount = citem.amount + amount
							else
								chest.items[idname] = { amount = amount }
							end

							if cb_in then
								cb_in(idname,amount)
							end
							vRP.closeMenu(source)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Baú cheio.")
					end
				end

				local ch_put = function(player,choice)
					local weight = vRP.computeItemsWeight(data.inventory)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",data.inventory,cb_put)

					submenu.onclose = function()
						close_count = close_count-1
						vRP.openMenu(player,menu)
					end

					close_count = close_count+1
					vRP.openMenu(player,submenu)
				end

				menu["Retirar"] = { ch_take }
				menu["Colocar"] = { ch_put }

				menu.onclose = function()
					if close_count == 0 then
						vRP.setSData("chest:"..name,json.encode(chest.items))
						chests[name] = nil
						if cb_close then
							cb_close()
						end
					end
				end
				vRP.openMenu(source,menu)
			else
				TriggerClientEvent("Notify",source,"importante","O baú está sendo utilizado no momento.")
			end
		end
	end
end