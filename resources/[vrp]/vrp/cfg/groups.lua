local cfg = {}

cfg.groups = {
	["ceoKy"] = {
		_config = {
			title = "Kyller"
		},
		"kyller.permissao",
		"ceo.permissao",
		"administrador.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"aprovadorwl.permissao",
		"sc.permissao",
		"streamer.permissao",
		"vanish.permissao",
		"mochila.permissao",
		"cor.permissao",
		"advanced.permissao",
		"booster.permissao",
		"bloods.permissao",
		"crips.permissao",
		"siciliana.permissao",
		"triade.permissao",
		"bahamas.permissao",
		"lifeinvader.permissao",
		"bennys.permissao",
		"galaxy.permissao",
		"native.permissao",
		"driftking.permissao",
		"pvp.permissao"
	},
	["ceove"] = {
		_config = {
			title = "CEO"
		},
		"ceo.permissao",
		"administrador.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"aprovadorwl.permissao",
		"sc.permissao",
		"streamer.permissao",
		"vanish.permissao",
		"mochila.permissao",
		"cor.permissao",
		"advanced.permissao",
		"booster.permissao",
		"bloods.permissao",
		"crips.permissao",
		"siciliana.permissao",
		"triade.permissao",
		"bahamas.permissao",
		"lifeinvader.permissao",
		"bennys.permissao",
		"galaxy.permissao",
		"native.permissao",
		"driftking.permissao",
		"pvp.permissao"
	},
	["adminve"] = {
		_config = {
			title = "Administrador(a)"
		},
		"administrador.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"aprovadorwl.permissao",
		"sc.permissao",
		"streamer.permissao"
	},
	["moderador"] = {
		_config = {
			title = "Moderador(a)"
		},
		"moderador.permissao",
		"suporte.permissao",
		"aprovadorwl.permissao",
		"sc.permissao",
		"streamer.permissao"
	},
	["suporte"] = {
		_config = {
			title = "Suporte"
		},
		"suporte.permissao",
		"aprovadorwl.permissao",
		"sc.permissao",
		"streamer.permissao"
	},
	["aprovadorwl"] = {
		_config = {
			title = "Aprovador de WL"
		},
		"aprovadorwl.permissao",
		"sc.permissao"
	},
	["pvp"] = {
		_config = {
			title = "PvPlayer"
		},
		"aprovadorwl.permissao",
		"sc.permissao",
		"streamer.permissao",
		"vanish.permissao",
		"mochila.permissao",
		"cor.permissao",
		"advanced.permissao",
		"booster.permissao",
		"bloods.permissao",
		"crips.permissao",
		"siciliana.permissao",
		"triade.permissao",
		"bahamas.permissao",
		"lifeinvader.permissao",
		"bennys.permissao",
		"galaxy.permissao",
		"native.permissao",
		"driftking.permissao",
		"pvp.permissao"
	},
	--["streamer"] = {
		--_config = {
		--	title = "Streamer"
		--},
		--"streamer.permissao"
	--},
	-----------------------------------------------------------------------------
	--[	Setagens Vips ]----------------------------------------------------------
	-----------------------------------------------------------------------------
	["vanish"] = {
		_config = {
			title = "Vanish",
			gtype = "vip"
		},
		"vanish.permissao",
		"mochila.permissao",
		"cor.permissao"
	},
	["advanced"] = {
		_config = {
			title = "Advanced",
			gtype = "vip"
		},
		"advanced.permissao",
		"cor.permissao"
	},
	["booster"] = {
		_config = {
			title = "Booster",
		},
		"booster.permissao",
		"cor.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Departamento de Justiça ]------------------------------------------------
	-----------------------------------------------------------------------------
	["juiz"] = {
		_config = {
			title = "Juiz(a)",
			gtype = "job"
		},
		"juiz.permissao",
	},
	["advogado"] = {
		_config = {
			title = "Advogado(a)",
			gtype = "job"
		},
		"advogado.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Empregos Cidade ]--------------------------------------------------------
	-----------------------------------------------------------------------------
	["dealership"] = {
		_config = {
			title = "Dealership",
			gtype = "job"
		},
		"dealership.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Departamento de Policia ]------------------------------------------------
	-----------------------------------------------------------------------------
	["policia"] = {
		_config = {
			title = "Policia",
			gtype = "job"
		},
		"policia.permissao",
		"policiasaque.permissao"
	},
	["policiaacao"] = {
		_config = {
			title = "Policia Ação",
			gtype = "job"
		},
		"policiaacao.permissao",
		"mochila.permissao",
		"policiasaque.permissao"
	},
	["paisanapolicia"] = {
		_config = {
			title = "Paisana Policia",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"policiasaque.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Departamento Médico ]----------------------------------------------------
	-----------------------------------------------------------------------------
	["medico"] = {
		_config = {
			title = "Medico",
			gtype = "job"
		},
		"medico.permissao",
	}, 
	["paisanamedico"] = {
		_config = {
			title = "Paisana Medico",
			gtype = "job"
		},
		"paisanamedico.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Mecânico e Bennys ]------------------------------------------------------
	-----------------------------------------------------------------------------
	["chefemec"] = {
		_config = {
			title = "Mêcanico Chefe",
			gtype = "job"
		},
		"mecanico.permissao",
		"bennys.permissao",
	},
	["mecanico"] = {
		_config = {
			title = "Mêcanico",
			gtype = "job"
		},
		"mecanico.permissao",
		"bennys.permissao"
	},
	["paisanamecanico"] = {
		_config = {
			title = "Mecânico de folga",
			gtype = "job"
		},
		"paisanamecanico.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de drogas ]------------------------------
	-----------------------------------------------------------------------------
	["ballas"] = {
		_config = {
			title = "Ballas",
			gtype = "job",
		},
		"ballas.permissao",
		"drogas.permissao"
	},

	["grove"] = {
		_config = {
			title = "Grove",
			gtype = "job",
		},
		"grove.permissao",
		"drogas.permissao"
	},

	["vagos"] = {
		_config = {
			title = "Vagos",
			gtype = "job",
		},
		"vagos.permissao",
		"drogas.permissao"
	},

	["ninethree"] = {
		_config = {
			title = "Nine Three",
			gtype = "job",
		},
		"ninethree.permissao",
		"drogas.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de armas ]-------------------------------
	-----------------------------------------------------------------------------
	["crips"] = {
		_config = {
			title = "Crips",
			gtype = "job",
		},
		"crips.permissao",
		"armas.permissao"
	},

	["bloods"] = {
		_config = {
			title = "Bloods",
			gtype = "job",
		},
		"bloods.permissao",
		"armas.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de munições ]----------------------------
	-----------------------------------------------------------------------------
	["triade"] = {
		_config = {
			title = "Triade",
			gtype = "job",
		},
		"triade.permissao",
		"municao.permissao"
	},

	["siciliana"] = {
		_config = {
			title = "Siciliana",
			gtype = "job",
		},
		"siciliana.permissao",
		"municao.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de lavagem ]------------------------------------------------------
	-----------------------------------------------------------------------------
	["bahamas"] = {
		_config = {
			title = "Bahamas",
			gtype = "job",
		},
		"bahamas.permissao",
		"lavagem.permissao"
	},

	["lifeinvader"] = {
		_config = {
			title = "Life Invader",
			gtype = "job",
		},
		"lifeinvader.permissao",
		"lavagem.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de desmanche ]-----------------------------------------------
	-----------------------------------------------------------------------------
	["driftking"] = {
		_config = {
			title = "Driftking",
			gtype = "job",
		},
		"driftking.permissao",
		"desmanche.permissao"
	},

	["native"] = {
		_config = {
			title = "Native",
			gtype = "job",
		},
		"native.permissao",
		"desmanche.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Emprego secundario ]------------------------------------------------------
	-----------------------------------------------------------------------------
	["olhinho"] = {
		_config = {
			title = "Monster",
			gtype = "jobdois",
		},
		"monster.permissao"
	},
	["policiaftu"] = {
		_config = {
			title = "F.T.U",
			gtype = "jobdois"
		},
		"policiaftu.permissao",
	},
	-----------------------------------------------------------------------------
	--[	Festas ]------------------------------------------------------
	-----------------------------------------------------------------------------
	["galaxy"] = {
		_config = {
			title = "Galaxy",
			gtype = "job",
		},
		"galaxy.permissao"
	}
}

cfg.users = {
	[0] = { "ceoKy" },
	[1] = { "ceoKy" }
}

cfg.selectors = {}

return cfg