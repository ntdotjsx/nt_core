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

exports('ShowToolTip',function (msg, coords)
    AddTextEntry('CrystalHelpNotification', msg)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('CrystalHelpNotification')
    EndTextCommandDisplayHelp(2, false, false, -1)
end)
