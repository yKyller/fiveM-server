local pcy = false
local textoDisplay = ''
local porcentagem = 0

RegisterNetEvent("progress")
AddEventHandler("progress",function(time, text)
	textoDisplay = text
	if not text then textoDisplay = '...' end
	porcentagem = time
	pcy = true
	SendNUIMessage({ type = "ui", display = true, text = text, time = time})
end)

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end