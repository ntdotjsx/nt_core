resource_name   = GetCurrentResourceName()
local police          = 0
local ambulance       = 0
local mechanic        = 0
local chefs            = 0
local players         = 0
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    ESX.TriggerServerCallback(resource_name..'sv:getplayerconnect', function(Police, Ambulance, Mechanic, chef, Players)
        police = Police
        ambulance = Ambulance
        mechanic = Mechanic
        chefs = chef
        players = Players
    end)
end)

RegisterNetEvent(resource_name..'sv:updateplayerconnect')
AddEventHandler(resource_name..'sv:updateplayerconnect', function(Police, Ambulance, Mechanic, chef, Players)
    police = Police
    ambulance = Ambulance
    mechanic = Mechanic
    chefs = chef
    players = Players
end)

function CheckPolice(requestcop)
    if police >= requestcop then
        return true
    else
        return false
    end
end

function Checkems(requestems)
    if ambulance >= requestems then
        return true 
    else
        return false
    end
end

function Checkemsx()
    return ambulance 
end


function CheckPolicetoscoreboard()
    return police
end

function Checkambulancetoscoreboard()
    return ambulance
end

function Checkmechanictoscoreboard()
    return mechanic
end

function Checkplayerstoscoreboard()
    return players
end

function Checkcheftoscoreboard()
    return chefs
end