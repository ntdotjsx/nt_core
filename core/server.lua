RegisterServerEvent('nt_core:ResourceStatus')
AddEventHandler('nt_core:ResourceStatus', function(resource)
    if resource == GetCurrentResourceName() then
        print("^7[^2SCRIPT^7] ".. GetCurrentResourceName() .." Status ^5200 ^7OK")
    end
end)