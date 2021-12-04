local system = {}

RegisterServerEvent("eblips:add")
AddEventHandler("eblips:add", function(person)
	system[person.src] = person

	local playerPed = GetPlayerPed(person.src)
	if(DoesEntityExist(playerPed)) then
		local coord = GetEntityCoords(playerPed)
		system[person.src].position = { x = coord.x, y = coord.y, z = coord.z }
	end
	
	for k,v in pairs(system) do
		TriggerClientEvent("eblips:updateAll",k,system)
	end

	TriggerClientEvent("eblips:toggle",person.src,true)
end)

RegisterServerEvent("eblips:remove")
AddEventHandler("eblips:remove",function(src)
	
	system[src] = nil
	
	TriggerClientEvent("eblips:toggle",src,false)
	
	for k,v in pairs(system) do
		TriggerClientEvent("eblips:remove",tonumber(k),src)
	end
	
end)

Citizen.CreateThread(function()
	while true do
		for k,v in pairs(system) do
			local playerPed = GetPlayerPed(k)
			if(DoesEntityExist(playerPed)) then
				local coord = GetEntityCoords(playerPed)
				system[k].position = { x = coord.x, y = coord.y, z = coord.z }
				TriggerClientEvent("eblips:updateAll",k,system)
			end
		end
		Citizen.Wait(3000)
    end
end)

AddEventHandler("playerDropped",function()
	if system[source] then
		system[source] = nil
	end
end)