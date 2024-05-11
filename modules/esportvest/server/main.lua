ESX = exports["es_extended"]:getSharedObject()

for k, v in pairs(Config.Armour) do
    ESX.RegisterUsableItem('armor', function(source)
        local xPlayer  = ESX.GetPlayerFromId(source)

        TriggerClientEvent('nt_vest:addarmour', source , v , '')
    end)
end


RegisterServerEvent('nt_vest:remove')
AddEventHandler('nt_vest:remove', function(item)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	xPlayer.removeInventoryItem(item, 1)
end)