ESX = exports["es_extended"]:getSharedObject()

exports('getPlayerData', function()
    ESX = exports["es_extended"]:getSharedObject()
    local toSend = ESX.GetPlayerData()
    ESX = nil
    return toSend
end)

exports('onNetworkPlayerActive', function(cb)
    Citizen.CreateThread(function(threadId)
        while not NetworkIsPlayerActive(PlayerId()) do
            Citizen.Wait(500)
        end
        Citizen.Wait(500)
        cb(threadId)
    end)
end)

exports('notify', function(type, text, length)
    if length == nil then
        length = 3000
    end

    exports['nt_notify']:SendNotify(text, type, length)
end)

exports('ResourceStatus', function(name)
    Citizen.Wait(1000)
    local message = "^6 [" .. name .. "] ^2IS READY BRO :3"
    print(message)
end)