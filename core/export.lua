ESX = nil

exports('getPlayerData', function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end

    local toSend = ESX.GetPlayerData()
    ESX = nil
    return toSend
end)

exports('draw3DText', function(x,y,z, text, scl, font) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
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

-- exports.nt_core:notify('su', 'คาดเข็มขัดแล้ว', 5000)

-- exports('addBlip', function(loc, sprite, scale, color, label)
--     local blip = AddBlipForCoord(loc)
--     SetBlipSprite(blip, sprite)
--     SetBlipDisplay(blip, 4)
--     SetBlipScale(blip, scale * 1.0)
--     SetBlipColour(blip, color)
--     SetBlipAsShortRange(blip, true)
--     BeginTextCommandSetBlipName('STRING')
--     AddTextComponentString(label)
--     EndTextCommandSetBlipName(blip)

--     return blip
-- end)

-- exports('addStaticNPC', function(loc, model, anim, heading)
--     RequestModel(GetHashKey(model))
--     while not HasModelLoaded(GetHashKey(model)) do
--         Wait(1)
--     end
    
--     RequestAnimDict(anim.dict)
--     while not HasAnimDictLoaded(anim.dict) do
--         Wait(1)
--     end
    
--     local npcPed = CreatePed(4, 0xC99F21C4, loc.x, loc.y, loc.z, 3374176, false, true)
--     SetEntityHeading(npcPed, heading)
--     FreezeEntityPosition(npcPed, true)
--     SetEntityInvincible(npcPed, true)
--     SetBlockingOfNonTemporaryEvents(npcPed, true)
--     TaskPlayAnim(npcPed, anim.dict, anim.set, 8.0, 0.0, -1, 1, 0, 0, 0, 0)

--     return npcPed
-- end)