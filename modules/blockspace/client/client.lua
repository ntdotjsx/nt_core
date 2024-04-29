scriptName = GetCurrentResourceName()

local spacecount = 0
local countspace = 0
local s = {
	["leftclick"] = 0,
	["leftclickcooldown"] = 0,
	["spacecount"] = 5,
	["spacecountcooldown"] = 3,
	["rightclick"] = 0,
	["rightclickcooldown"] = 0,
}

local space = false
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		
		local timerspace = 0
		if not space then
			spacecount = 0
		end
		
		while space do
			
			Citizen.Wait(0)
			if IsPedOnFoot(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
				spacecount = spacecount + 1
				if spacecount >= 200 then
					exports.nt_core:notify('fail', "ห้ามกด SpaceBar ค้าง", 4)
					s["leftclickcooldown"] = GetGameTimer() + 6000
					spacecount = 0
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
		local PlayerPed = PlayerPedId()
		if IsPedArmed(PlayerPed, 1) then
			if IsPedOnFoot(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
				if IsControlPressed(0, 143) then
					countspace = countspace + 1 
					if countspace >= 200 then
						exports.nt_core:notify('fail', "ห้ามกด Melee Dodge ค้าง", 4)
						s["leftclickcooldown"] = GetGameTimer() + 6000
						countspace = 0
					end
					elseif not IsControlPressed(0, 143) then
					countspace = 0
				end
			end
		end
		if IsPedArmed(PlayerPed, 1) then
			if IsPedOnFoot(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
				if IsControlPressed(0, 24) then
					s["leftclick"] = s["leftclick"] + 1 
					if s["leftclick"] >= 200 then
						exports.nt_core:notify('fail', "ห้ามกดคลิ๊กซ้ายค้าง", 4)
						s["leftclickcooldown"] = GetGameTimer() + 6000
						s["leftclick"] = 0
					end
					elseif not IsControlPressed(0, 24) then
					s["leftclick"] = 0
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsPedOnFoot(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
            if IsControlJustReleased(0, 22) or IsControlJustReleased(0, 143) then
				s["spacecount"] = s["spacecount"] + 1 
				if s["spacecount"] >= 5 then
					exports.nt_core:notify('fail', "นาฏศิลป์เกรด SSS+ ปะเนี่ยรำเก่งเกิน", 4)
					s["spacecountcooldown"] = GetGameTimer() + 6000
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7)
		if IsPedOnFoot(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
			if s["spacecount"] > 0 then
				Wait(1000)
				s["spacecount"] = 0
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if s["leftclickcooldown"] > GetGameTimer() then
			DisablePlayerFiring(PlayerId(), true) -- Disable weapon firing
			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(1, 37, true) -- disable weapon select
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 142, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
		end
		if s["spacecountcooldown"] > GetGameTimer() then
			DisablePlayerFiring(PlayerId(), true) -- Disable weapon firing
			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(1, 37, true) -- disable weapon select
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 142, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
		end
	end
end)