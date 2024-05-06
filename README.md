# NT CORE By Nutto.jsx

ADD NPC

```lua
exports('addStaticNPC', function(loc, model, anim, heading)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do
        Wait(1)
    end
    
    RequestAnimDict(anim.dict)
    while not HasAnimDictLoaded(anim.dict) do
        Wait(1)
    end
    
    local npcPed = CreatePed(4, 0xC99F21C4, loc.x, loc.y, loc.z, 3374176, false, true)
    SetEntityHeading(npcPed, heading)
    FreezeEntityPosition(npcPed, true)
    SetEntityInvincible(npcPed, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    TaskPlayAnim(npcPed, anim.dict, anim.set, 8.0, 0.0, -1, 1, 0, 0, 0, 0)

    return npcPed
end)
```
ADD BLIP
```lua
exports('addBlip', function(loc, sprite, scale, color, label)
    local blip = AddBlipForCoord(loc)
    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, scale * 1.0)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)

    return blip
end)
```
ResourceStatus
```lua
Citizen.CreateThread(function()
    Citizen.Wait(1000)
	exports.nt_core:ResourceStatus(GetCurrentResourceName())
end)
```
ResourceSV
```lua
Citizen.CreateThread(function()
	TriggerEvent('nt_core:ResourceSv', GetCurrentResourceName())
end)
```
CheckMoney
```lua
exports('CheckMoney')
```
notify
```lua
exports.nt_core:notify('su', 'คาดเข็มขัดแล้ว', 5000)
```