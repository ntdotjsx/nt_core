RegisterNetEvent('nt_core:sendInventoryItem')
AddEventHandler('nt_core:sendInventoryItem', function(type, item, count, source)
    TriggerEvent('azael_ui-itemnotify:sendInventoryItem', type, item, count, source)
end)
