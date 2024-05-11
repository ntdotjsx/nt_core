ESX = exports["es_extended"]:getSharedObject()

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

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            SetUserRadioControlEnabled(false)
            if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(ped),"OFF")
            end
        end
    end
end)

--+ กันขยับที่นั่งบนรถ

local isShuffling = false   
stopPassengerShuffle  = true
allowEntrySlide  = false 
Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        if (stopPassengerShuffle) then
            if (not GetPedConfigFlag(player, 184, 1)) then SetPedConfigFlag(player, 184, true) end
            if (IsPedInAnyVehicle(player, false)) then
                local v = GetVehiclePedIsIn(player, 0)
                if (GetIsTaskActive(player, 165)) then
                    isShuffling = true
                    if (not allowEntrySlide) then
                        if (GetSeatPedIsTryingToEnter(player) == -1) then
                            if (GetPedConfigFlag(player, 184, 1)) then
                                SetPedIntoVehicle(player, v, 0)
                                SetVehicleCloseDoorDeferedAction(v, 0)
                            end
                        end
                    end
                else
                    isShuffling = false
                end
            end
        else
            if (GetPedConfigFlag(player, 184, 1)) then SetPedConfigFlag(player, 184, false) end
        end
        Citizen.Wait(500)
    end
end)

-- ปิดตบปืน (Client)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            DisplayRadar(true)
        else
            DisplayRadar(false)
        end
    end
  end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(vector3(-325.570, -922.418, 31.700))
	
	SetBlipHighDetail(blip, true)

    SetBlipSprite (blip, 439)
    SetBlipScale  (blip, 1.3)
    SetBlipColour (blip, 47)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Land O")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(vector3(313.4227, -239.474, 54.012))
	
	SetBlipHighDetail(blip, true)

    SetBlipSprite (blip, 439)
    SetBlipScale  (blip, 1.3)
    SetBlipColour (blip, 77)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Land Blue")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(vector3(-77.5280, -2007.05, 18.016))
	
	SetBlipHighDetail(blip, true)

    SetBlipSprite (blip, 439)
    SetBlipScale  (blip, 1.3)
    SetBlipColour (blip, 76)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Land Blue")
    EndTextCommandSetBlipName(blip)
end)