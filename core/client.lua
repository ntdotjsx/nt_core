Citizen.CreateThread(function() 
	Citizen.Wait(120000)
	while true do
		Citizen.Wait(45000)
		TriggerEvent("nt_core:ClearMemoryCl")
	end
end)

AddEventHandler("nt_core:ClearMemoryCl", function()
	Citizen.CreateThread(function()
		local rdm = math.random(100, 2000)
		Wait(rdm)
		collectgarbage()
	end)
end)

CreateThread(function ()
    while true do 
        Wait(0)
        BlockWeaponWheelThisFrame()
    end
end)

-- TEST SCRIPT
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then
			-- TriggerEvent("Nap_PoliceSystem:alertNet", "cement")
        end
    end
end)
