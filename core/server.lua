RegisterServerEvent('nt_core:ResourceStatus')
AddEventHandler('nt_core:ResourceStatus', function(resource)
    if resource == GetCurrentResourceName() then
        print("^6 [" .. GetCurrentResourceName() .. "] ^2STATUS => 200 OK")
    end
end)