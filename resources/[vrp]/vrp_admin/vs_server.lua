local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTROLE CLIMA/TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
-- Set this to false if you don't want the weather to change automatically every 10 minutes.
DynamicWeather = false

--------------------------------------------------
debugprint = false -- don't touch this unless you know what you're doing or you're being asked by Vespura to turn this on.
--------------------------------------------------

-------------------- DON'T CHANGE THIS --------------------
AvailableWeatherTypes = {
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS', 
    'CLEARING', 
    'RAIN', 
    'THUNDER', 
    'SNOW', 
    'BLIZZARD', 
    'SNOWLIGHT', 
    'XMAS', 
    'HALLOWEEN',
}
CurrentWeather = "EXTRASUNNY"
local baseTime = 0
local timeOffset = -856.99999999255
local freezeTime = false
local blackout = false
local newWeatherTimer = 10

RegisterServerEvent('requestSync')
AddEventHandler('requestSync', function()
    TriggerClientEvent('updateWeather', -1, CurrentWeather, blackout)
    TriggerClientEvent('updateTime', -1, baseTime, timeOffset, freezeTime)
end)

-- function isAllowedToChange(player)
--     local allowed = false
--     for i,id in ipairs(admins) do
--         for x,pid in ipairs(GetPlayerIdentifiers(player)) do
--             if debugprint then print('admin id: ' .. id .. '\nplayer id:' .. pid) end
--             if string.lower(pid) == string.lower(id) then
--                 allowed = true
--             end
--         end
--     end
--     return allowed
-- end
function isAllowedToChange(source)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"ceo.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
        return true
    end
    return false
end

RegisterCommand('congelarhora', function(source, args)
    if source ~= 0 then
        if isAllowedToChange(source) then
            freezeTime = not freezeTime
            if freezeTime then
                TriggerClientEvent('notify2', source, 'Agora a Hora ~b~está Congelada~s~.')
            else
                TriggerClientEvent('notify2', source, 'A Hora ~y~não está mais Congelada~s~.')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You are not allowed to use this command.')
        end
    else
        freezeTime = not freezeTime
        if freezeTime then
            print("Time is now frozen.")
        else
            print("Time is no longer frozen.")
        end
    end
end)

RegisterCommand('congelarclima', function(source, args)
    if source ~= 0 then
        if isAllowedToChange(source) then
            DynamicWeather = not DynamicWeather
            if not DynamicWeather then
                TriggerClientEvent('notify2', source, 'Clima Dinamico ~r~Desabilitado~s~.')
            else
                TriggerClientEvent('notify2', source, 'Clima Dinamico ~b~Habilitado~s~.')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You are not allowed to use this command.')
        end
    else
        DynamicWeather = not DynamicWeather
        if not DynamicWeather then
            print("Weather is now frozen.")
        else
            print("Weather is no longer frozen.")
        end
    end
end)

RegisterCommand('clima', function(source, args)
    if source == 0 then
        local validWeatherType = false
        if args[1] == nil then
            print("Invalid syntax, correct syntax is: /weather <weathertype> ")
            return
        else
            for i,wtype in ipairs(AvailableWeatherTypes) do
                if wtype == string.upper(args[1]) then
                    validWeatherType = true
                end
            end
            if validWeatherType then
                print("Weather has been updated.")
                CurrentWeather = string.upper(args[1])
                newWeatherTimer = 10
                TriggerEvent('requestSync')
            else
                print("Invalid weather type, valid weather types are: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ")
            end
        end
    else
        if isAllowedToChange(source) then
            local validWeatherType = false
            if args[1] == nil then
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid syntax, use ^0/clima <weatherType> ^1instead!')
            else
                for i,wtype in ipairs(AvailableWeatherTypes) do
                    if wtype == string.upper(args[1]) then
                        validWeatherType = true
                    end
                end
                if validWeatherType then
                    TriggerClientEvent('notify2', source, 'Clima vai mudar para: ~y~' .. string.lower(args[1]) .. "~s~.")
                    CurrentWeather = string.upper(args[1])
                    newWeatherTimer = 10
                    TriggerEvent('requestSync')
                else
                    TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid weather type, valid weather types are: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ')
                end
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You do not have access to that command.')
            print('Access for command /weather denied.')
        end
    end
end, false)

RegisterCommand('blackout', function(source)
    if source == 0 then
        blackout = not blackout
        if blackout then
            print("Blackout is now enabled.")
        else
            print("Blackout is now disabled.")
        end
    else
        if isAllowedToChange(source) then
            blackout = not blackout
            if blackout then
                TriggerClientEvent('notify2', source, 'Blackout ~b~Habilitado~s~.')
            else
                TriggerClientEvent('notify2', source, 'Blackout ~r~Desabilitado~s~.')
            end
            TriggerEvent('requestSync')
        end
    end
end)

RegisterCommand('manha', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(0)
        ShiftToHour(9)
        TriggerClientEvent('notify2', source, 'Hora alterada para ~y~Manhã~s~.')
        TriggerEvent('requestSync')
    end
end)
RegisterCommand('meiodia', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(0)
        ShiftToHour(12)
        TriggerClientEvent('notify2', source, 'Hora alterada para ~y~Meio Dia~s~.')
        TriggerEvent('requestSync')
    end
end)
RegisterCommand('tarde', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(0)
        ShiftToHour(18)
        TriggerClientEvent('notify2', source, 'Hora alterada para ~y~Tarde~s~.')
        TriggerEvent('requestSync')
    end
end)
RegisterCommand('noite', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(0)
        ShiftToHour(23)
        TriggerClientEvent('notify2', source, 'Hora alterada para ~y~Noite~s~.')
        TriggerEvent('requestSync')
    end
end)

function ShiftToMinute(minute)
    timeOffset = timeOffset - ( ( (baseTime+timeOffset) % 60 ) - minute )
end

function ShiftToHour(hour)
    timeOffset = timeOffset - ( ( ((baseTime+timeOffset)/60) % 24 ) - hour ) * 60
end

RegisterCommand('hora', function(source, args, rawCommand)
    if source == 0 then
        if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
            local argh = tonumber(args[1])
            local argm = tonumber(args[2])
            if argh < 24 then
                ShiftToHour(argh)
            else
                ShiftToHour(0)
            end
            if argm < 60 then
                ShiftToMinute(argm)
            else
                ShiftToMinute(0)
            end
            print("Time has changed to " .. argh .. ":" .. argm .. ".")
            TriggerEvent('requestSync')
        else
            print("Invalid syntax, correct syntax is: time <hour> <minute> !")
        end
    elseif source ~= 0 then
        if isAllowedToChange(source) then
            if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
                local argh = tonumber(args[1])
                local argm = tonumber(args[2])
                if argh < 24 then
                    ShiftToHour(argh)
                else
                    ShiftToHour(0)
                end
                if argm < 60 then
                    ShiftToMinute(argm)
                else
                    ShiftToMinute(0)
                end
                local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
				local minute = math.floor((baseTime+timeOffset)%60)
                if minute < 10 then
                    newtime = newtime .. "0" .. minute
                else
                    newtime = newtime .. minute
                end
                TriggerClientEvent('notify2', source, 'A hora foi alterada para: ~y~' .. newtime .. "~s~!")
                TriggerEvent('requestSync')
            else
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid syntax. Use ^0/time <hour> <minute> ^1instead!')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You do not have access to that command.')
            print('Access for command /time denied.')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local newBaseTime = os.time(os.date("!*t"))/2 + 360
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime			
        end
        baseTime = newBaseTime
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        TriggerClientEvent('updateTime', -1, baseTime, timeOffset, freezeTime)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)
        TriggerClientEvent('updateWeather', -1, CurrentWeather, blackout)
    end
end)

Citizen.CreateThread(function()
    while true do
        newWeatherTimer = newWeatherTimer - 1
        Citizen.Wait(60000)
        if newWeatherTimer == 0 then
            if DynamicWeather then
                NextWeatherStage()
            end
            newWeatherTimer = 10
        end
    end
end)

function NextWeatherStage()
    if CurrentWeather == "CLEAR" or CurrentWeather == "CLOUDS" or CurrentWeather == "EXTRASUNNY"  then
        local new = math.random(1,2)
        if new == 1 then
            CurrentWeather = "CLEARING"
        else
            CurrentWeather = "OVERCAST"
        end
    elseif CurrentWeather == "CLEARING" or CurrentWeather == "OVERCAST" then
        local new = math.random(1,6)
        if new == 1 then
            if CurrentWeather == "CLEARING" then CurrentWeather = "FOGGY" else CurrentWeather = "RAIN" end
        elseif new == 2 then
            CurrentWeather = "CLOUDS"
        elseif new == 3 then
            CurrentWeather = "CLEAR"
        elseif new == 4 then
            CurrentWeather = "EXTRASUNNY"
        elseif new == 5 then
            CurrentWeather = "SMOG"
        else
            CurrentWeather = "FOGGY"
        end
    elseif CurrentWeather == "THUNDER" or CurrentWeather == "RAIN" then
        CurrentWeather = "CLEARING"
    elseif CurrentWeather == "SMOG" or CurrentWeather == "FOGGY" then
        CurrentWeather = "CLEAR"
    end
    TriggerEvent("requestSync")
    if debugprint then
        print("[vSync] New random weather type has been generated: " .. CurrentWeather .. ".\n")
        print("[vSync] Resetting timer to 10 minutes.\n")
    end
end