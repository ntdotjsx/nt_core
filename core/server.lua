RegisterServerEvent('nt_core:ResourceSv')
AddEventHandler('nt_core:ResourceSv', function(name)
    Citizen.Wait(1000)
    print("^2["..name.."] ^7Status ^2200 ^7OK")
end)

-- Citizen.CreateThread(function()
-- 	TriggerEvent('nt_core:ResourceSv', GetCurrentResourceName())
-- end)