-----------------------------------------------------------------------------------------------------------------------------------------
-- ITENSNOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("itensNotify")
AddEventHandler("itensNotify",function(mode,mensagem,item,index)
	print(index)
	SendNUIMessage({ mode = mode, mensagem = mensagem, item = item })
end)