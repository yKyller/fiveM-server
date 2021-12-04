-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTROLE DE TEMPO/CLIMA
-----------------------------------------------------------------------------------------------------------------------------------------
CurrentWeather = 'EXTRASUNNY'
local lastWeather = CurrentWeather
local baseTime = 0
local timeOffset = 0
local timer = 0
local freezeTime = false
local blackout = false

RegisterNetEvent('updateWeather')
AddEventHandler('updateWeather', function(NewWeather, newblackout)
    CurrentWeather = NewWeather
    blackout = newblackout
end)

Citizen.CreateThread(function()
    while true do
        if lastWeather ~= CurrentWeather then
            lastWeather = CurrentWeather
            SetWeatherTypeOverTime(CurrentWeather, 15.0)
            Citizen.Wait(15000)
        end
        Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
        SetBlackout(blackout)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(lastWeather)
        SetWeatherTypeNow(lastWeather)
        SetWeatherTypeNowPersist(lastWeather)
        if lastWeather == 'XMAS' then
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
        else
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        end
    end
end)

RegisterNetEvent('updateTime')
AddEventHandler('updateTime', function(base, offset, freeze)
    freezeTime = freeze
    timeOffset = offset
    baseTime = base
end)

Citizen.CreateThread(function()
    local hour = 0
    local minute = 0
    while true do
        Citizen.Wait(0)
        local newBaseTime = baseTime
        if GetGameTimer() - 500  > timer then
            newBaseTime = newBaseTime + 0.25
            timer = GetGameTimer()
        end
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime			
        end
        baseTime = newBaseTime
        hour = math.floor(((baseTime+timeOffset)/60)%24)
        minute = math.floor((baseTime+timeOffset)%60)
        NetworkOverrideClockTime(hour, minute, 0)
    end
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('requestSync')
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/clima', 'Muda o Clima.', {{ name="TiposClima", help="Tipos Disponiveis: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween"}})
    TriggerEvent('chat:addSuggestion', '/hora', 'Muda a Hora.', {{ name="hora", help="Numero entre 0 - 23"}, { name="minutos", help="Numero entre 0 - 59"}})
    TriggerEvent('chat:addSuggestion', '/congelarhora', 'Congela/Descongela a hora.')
    TriggerEvent('chat:addSuggestion', '/congelarclima', 'Ativa/Desativar mudança de clima Dinamico.')
    TriggerEvent('chat:addSuggestion', '/manha', 'Muda a hora para 09:00')
    TriggerEvent('chat:addSuggestion', '/meiodia', 'Muda a hora para 12:00')
    TriggerEvent('chat:addSuggestion', '/tarde', 'Muda a hora para 18:00')
    TriggerEvent('chat:addSuggestion', '/noite', 'Muda a hora para 23:00')
    TriggerEvent('chat:addSuggestion', '/blackout', 'Ativa/Desativa o modo blackout.')
end)

-- Display a notification above the minimap.
function ShowNotification(text, blink)
    if blink == nil then blink = false end
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(blink, false)
end

RegisterNetEvent('notify2')
AddEventHandler('notify2', function(message, blink)
    ShowNotification(message, blink)
end)