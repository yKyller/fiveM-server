lightsConfigColor = {
	--BALLAS
	{103.01, -1938.72, 30.80, 148, 0, 211, 60.0, 0.2},
	--LOS VAGOS
	{349.65,-2049.13,29.99, 255, 255, 0, 60.0, 0.3},
	--GROOVE 
	{-181.19,-1616.68,33.6, 0, 128, 0, 100.0, 0.3},
	--PRAÇA
	{160.66, -1005.40, 49.42, 128, 128, 128, 75.0, 0.1},
	---BLOODS
	{-1079.93,-1658.31,4.4, 255, 0, 0, 60.0, 0.2},
	---CRIPS
	{1285.01,-1731.86,52.84, 0, 0, 255, 75.0, 0.3},
}

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        for k,v in ipairs(lightsConfigColor) do
        	local x,y,z,r,g,b,range,intensity = table.unpack(v)
			if GetClockHours() > 20 or GetClockHours() < 6 then
				DrawLightWithRangeAndShadow(x, y, z, r, g, b, range, intensity, 0.1)
			end
		end
	end
end)