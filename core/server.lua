Citizen.CreateThread(function()
    Citizen.Wait(1000)
	print("^6 [" .. GetCurrentResourceName() .. "] ^2SCRIPTS => ON :D")
end)

RegisterServerEvent('nt_core:status')
AddEventHandler('nt_core:status', function(id)
    print("^6 [" .. GetCurrentResourceName() .. "] ^1SCRIPTS => OFF :(")
end)