local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vanish = Tunnel.getInterface("vrp_lavagem",vanish)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCALIZAÇÃO DAS LAVAGENS DE DINHEIRO --
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ -1375.82,-626.17,30.82,"bahamas.permissao" },
	{ -1053.79,-230.6,44.03,"lifeinvader.permissao" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMANDO PARA LAVAR O DINHEIRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('lavagem',function(source,args,rawCommand)
	local ped = PlayerPedId()
	for _,v in pairs(locais) do
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local distance = Vdist(v[1],v[2],v[3],x,y,z)
		if distance <= 3.5 then
			if vanish.PermissaoPlayer(v[4]) then
				if vanish.ChecarPagamento() then
					if args[1] == "s" then
						if vanish.VerificarComponente("alvejante",10) then
							vanish.EnviarPagamento("lavagemsimples")
						end
					elseif args[1] == "a" then 
						if vanish.VerificarComponente("alvejantemodificado",1) then
							vanish.EnviarPagamento("lavagemavancada")
						end
					end 

				end
			end
		end
	end
end)