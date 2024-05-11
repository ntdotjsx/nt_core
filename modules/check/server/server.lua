ESX = exports["es_extended"]:getSharedObject()

Police 			= 0
Ambulance		= 0
Mechanic		= 0
chef		    = 0
Players			= 0
resource_name   = GetCurrentResourceName()

ESX.RegisterServerCallback(resource_name..'sv:getplayerconnect', function(source, cb)
	local num = Police
	local num2 = Ambulance
	local num3 = Mechanic
	local num4 = chef
	local num5 = Players
	cb(num, num2, num3, num4, num5)
end)

function CheckPlayer()
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		Players = Players +1
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			Police = Police + 1
		elseif xPlayer.job.name == 'ambulance' then
			Ambulance = Ambulance + 1
		elseif xPlayer.job.name == 'mechanic' then 
			Mechanic = Mechanic + 1
		elseif xPlayer.job.name == 'chef' then 
			chef = chef + 1
		end
	end
end

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	if lastJob.name == "police" then
        Police = Police -1
    elseif  lastJob.name == "ambulance" then
        Ambulance = Ambulance -1 
	elseif  lastJob.name == "mechanic" then
        Mechanic = Mechanic -1 
	elseif  lastJob.name == "chef" then
        chef = chef -1 
   	end
    if ESX.GetPlayerFromId(playerId).job.name == "ambulance" then
        Ambulance = Ambulance +1
    elseif ESX.GetPlayerFromId(playerId).job.name == "police" then
        Police = Police +1
	elseif ESX.GetPlayerFromId(playerId).job.name == "mechanic" then
        Mechanic = Mechanic +1
	elseif ESX.GetPlayerFromId(playerId).job.name == "chef" then
        chef = chef +1
	end
	TriggerClientEvent(resource_name..'sv:updateplayerconnect',-1 ,Police, Ambulance, Mechanic, chef, Players)    
end)

AddEventHandler('esx:playerLoaded', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	Players = Players +1
	if xPlayer.job.name == "ambulance" then
		Ambulance = Ambulance +1       
	elseif xPlayer.job.name == "police" then
		Police = Police +1        
	elseif xPlayer.job.name == "mechanic" then
		Mechanic = Mechanic +1       
	elseif xPlayer.job.name == "chef" then
		chef = chef +1 
	end
	TriggerClientEvent(resource_name..'sv:updateplayerconnect',-1 ,Police, Ambulance, Mechanic, chef, Players)   		
end)

AddEventHandler('esx:playerDropped', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	Players = Players -1
    if xPlayer.job.name == "police" then
		Police = Police -1 
	elseif xPlayer.job.name == "ambulance" then
		Ambulance = Ambulance -1       
	elseif xPlayer.job.name == "mechanic" then
		Mechanic = Mechanic -1    
	elseif xPlayer.job.name == "chef" then
		chef = chef -1       
	end
	TriggerClientEvent(resource_name..'sv:updateplayerconnect',-1 ,Police, Ambulance, Mechanic, chef, Players)  
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		CheckPlayer()
	end
end)
-------------------------------------------------------