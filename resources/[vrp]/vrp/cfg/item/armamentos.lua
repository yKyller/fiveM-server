local items = {}

local nomes = {
	Switchblade = "Canivete",
	Hammer = "Martelo",
	Hatchet = "Machado",
	Flashlight = "Lanterna",
	Bat = "Taco de Beisebol",
	hatchet = "Machado",
	Machinepistol = "TEC-9",
	Gadget_parachute = "Paraquedas",
	Combatpistol = "Glock 19",
	Carbinerifle = "M4A1",
	Carbinerifle_mk2 = "MPX",
	Heavypistol = "HEAVYPISTOL",
	Smg = "MP5",
	Smg_mk2 = "MP5 MK2",
	Stungun = "Taser",
	Nightstick = "Cassetete",
	Snspistol = "HK P7M10",
	Microsmg = "Uzi",
	Assaultrifle_mk2 = "AK-103 MK2",
	Specialcarbine_mk2 = "G36 MK2",
	Fireextinguisher = "Extintor",
	Flare = "Sinalizador",
	Pistol_mk2 = "FN Five Seven",
	Assaultsmg = "MTAR-21",
	Combatpdw = "Sig Sauer MPX",
}

local get_wname = function(weapon_id)
	local name = string.gsub(weapon_id,"WEAPON_","")
	name = string.upper(string.sub(name,1,1))..string.lower(string.sub(name,2))
	return nomes[name]
end

local wammo_name = function(args)
	if args[2] == "WEAPON_PETROLCAN" then
		return "Combustível"
	else
		return "Munição de "..get_wname(args[2])
	end
end

local wbody_name = function(args)
	return get_wname(args[2])
end

items["wbody"] = { wbody_name,5 }
items["wammo"] = { wammo_name,0.03 }

return items