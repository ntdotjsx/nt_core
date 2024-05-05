local weaponlist = {
	{ name = "WEAPON_SWITCHBLADE", damage = 72},
	{ name = "WEAPON_KNUCKLE_LV5", damage = 17},
	{ name = "WEAPON_KNUCKLE_LV4", damage = 15},
	{ name = "WEAPON_KNUCKLE_LV3", damage = 13},
	{ name = "WEAPON_KNUCKLE_LV2", damage = 12},
	{ name = "WEAPON_KNUCKLE", damage = 11},
	{ name = "WEAPON_BATTLEAXELV3", damage = 43},
	{ name = "weapon_battleaxelv2", damage = 33},
	{ name = "WEAPON_BATTLEAXE", damage = 21},
	{ name = "WEAPON_POOLCUE", damage = 26},
	{ name = "WEAPON_DAGGER", damage = 42},
	{ name = "WEAPON_KNIFE", damage = 42},
	{ name = "WEAPON_BOTTLE", damage = 32},
	{ name = "WEAPON_BAT", damage = 18},
	{ name = "weapon_bat_1st", damage = 18},
	{ name = "WEAPON_GOLFCLUB", damage = 18},
	{ name = "WEAPON_MACHETE", damage = 33},
	{ name = "WEAPON_UNARMED", damage = 3},
	{ name = "WEAPON_SPECIALCARBINE", damage = 10},
	{ name = "WEAPON_MICROSMG", damage = 8},
	{ name = "WEAPON_ASSAULTRIFLE", damage = 10},
	{ name = "WEAPON_HAMMER_MC", damage = 17},
	{ name = "WEAPON_BAT_MC", damage = 26},
	{ name = "WEAPON_GOLFCLUB_MC", damage = 26},
	{ name = "WEAPON_SNOWBALL", damage = 0},
	{ name = "WEAPON_NIGHTSTICK", damage = 45},
	{ name = "WEAPON_BAT_BGN", damage = 18},
	{ name = "WEAPON_POOLCUE_BGN", damage = 26},
	{ name = "WEAPON_GOLFCLUB_BGN", damage = 18},
	{ name = "WEAPON_POOLCUE_RED", damage = 26},
	{ name = "WEAPON_POOLCUE_BLUE", damage = 26},
	{ name = "WEAPON_MACHETE_SNOW", damage = 33},
	{ name = "WEAPON_BOTTLE_SNOW", damage = 32},
	{ name = "WEAPON_CROWBAR_SNOWR", damage = 26},
	{ name = "WEAPON_CROWBAR_SNOWB", damage = 1},	
	{ name = "WEAPON_SNIPERRIFLE", damage = 1},	
	{ name = "WEAPON_NAVYREVOLVER", damage = 1},	
	{ name = "WEAPON_GOLFCLUB_NEVIA", damage = 40},	
	{ name = "WEAPON_HIT_BY_WATER_CANNON", damage = 1},
	{ name = "VEHICLE_WEAPON_WATER_CANNON", damage = 1},
	{ name = "WEAPON_GRENADE", damage = 1},
}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

AddEventHandler("nt_core:ClearMemoryCl", function()
	Citizen.CreateThread(function()
		local rdm = math.random(100, 2000)
		Wait(rdm)
		collectgarbage()
	end)
end)

Citizen.CreateThread(function()
	while true do
		Wait(1)
		local ped = PlayerPedId()
		if not IsEntityDead(ped) then
			for n,i in pairs(weaponlist) do
				if  i.name ~= "WEAPON_SNOWBALL" then
					local WeaponHash = GetHashKey(i.name)
					N_0x4757f00bc6323cfe(WeaponHash, 0.0001)
					if HasEntityBeenDamagedByWeapon(ped, WeaponHash, 0) then
						if i.name == 'WEAPON_BATTLEAXELV3' then
							ApplyDamageToPed(PlayerPedId(), i.damage - 1, true)
							poison = true
							isPoison()
							local heathly = GetEntityHealth(ped)
							if (heathly - i.damage) > 0 then
								ClearEntityLastDamageEntity(ped)
							end
						elseif i.name == 'WEAPON_NAVYREVOLVER' then
							ApplyDamageToPed(PlayerPedId(), i.damage - 1, true)
							setNump()
							local heathly = GetEntityHealth(ped)
							if (heathly - i.damage) > 0 then
								ClearEntityLastDamageEntity(ped)
							end
						elseif i.name == 'WEAPON_POOLCUE_BLUE' then
							ApplyDamageToPed(PlayerPedId(), i.damage - 1, true)
							local rdn = math.random(100)
							if rdn <= 20 then
								setNump2()
							end
							local heathly = GetEntityHealth(ped)
							if (heathly - i.damage) > 0 then
								ClearEntityLastDamageEntity(ped)
							end
						else
							ApplyDamageToPed(PlayerPedId(), i.damage - 1, true)
							local heathly = GetEntityHealth(ped)
							if (heathly - i.damage) > 0 then
								ClearEntityLastDamageEntity(ped)
							end
						end
						break
					end
				else 
					if i.name == "WEAPON_SNOWBALL" then
						local WeaponHash = GetHashKey(i.name)
						N_0x4757f00bc6323cfe(WeaponHash, 0.00)
					end
				end
			end
		end
	end
end)

function checkHasItem(item_name)
    local inventory = ESX.GetPlayerData().inventory
    for i = 1, #inventory do
        local item = inventory[i]
        if item_name == item.name and item.count > 0 then return true end
    end
    return false
end

RegisterNetEvent('nt_vest:addarmour')
AddEventHandler('nt_vest:addarmour', function(Armour, EvenName)
    if not busy then
        busy = true
        TriggerEvent(EvenName)
        local playerPed = GetPlayerPed(-1)
        RequestAnimDict("clothingshirt")
        while not HasAnimDictLoaded("clothingshirt") do
            Citizen.Wait(100)
        end
        TaskPlayAnim(GetPlayerPed(PlayerId()), "clothingshirt", "try_shirt_positive_d", 1.0, -1, -1, 50, 0, 0, 0, 0)
        Citizen.Wait(5000)
        SetPedArmour(playerPed, 100) 
        TriggerServerEvent('nt_vest:remove', Armour.itemName)
        StopAnimTask(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 1.0)
        busy = false
    end
end)
