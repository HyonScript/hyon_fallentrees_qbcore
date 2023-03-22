local QBCore = exports['qb-core']:GetCoreObject()

local blip = nil
local zoneblip = nil
local treeblips = {}
local playerPed = PlayerPedId()
local playerPedCoords = GetEntityCoords(playerPed)
local ClientTrees = {}
local Objects = {}
local chopActive = false
local playerLoaded = false

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
		QBCore.Functions.GetPlayerData(function(PlayerData)
		playerLoaded = true
		end)
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        playerLoaded = true
    end)
end)



function DrawText3D(x, y, z, text, font, color, scale)
	local defaultFont = 4
	local defaultColor = {r = 255, g = 255, b = 255}
	local defaultScale = 0.35
	if scale ~= nil then
		defaultScale = scale
	end
	if font ~= nil then
		defaultFont = font
	end
	if color ~= nil then
		defaultColor = color
	end
	SetTextScale(defaultScale, defaultScale)
    SetTextFont(defaultFont)
	SetTextProportional(1)
    SetTextColour(defaultColor.r, defaultColor.g, defaultColor.b, 255)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    ClearDrawOrigin()
end


Citizen.CreateThread(function()

     while true do

     Citizen.Wait(1)
       local ped = PlayerPedId()
	local playerPed = PlayerPedId()
	local pedWeapon = GetSelectedPedWeapon(ped)
       local mycords = GetEntityCoords(PlayerPedId())
      for i, locations in pairs(ClientTrees) do
	  local dist = #(mycords - locations.coords)
	  local mdl = GetHashKey("prop_tree_fallen_01")
--      if dist < 50 then
	  if locations.spawn == 60 then
		if Objects[i] == nil then
		Objects[i] = CreateObject(mdl, locations.coords.x, locations.coords.y, locations.coords.z, true, true, false)
		SetEntityCoords(Objects[i], locations.coords.x, locations.coords.y, locations.coords.z-1.5)
		SetEntityHeading(Objects[i], locations.heading)
		FreezeEntityPosition(Objects[i], true)
		end
	   if dist < 2 and chopActive == false then
	   DrawText3Ds(locations.coords.x, locations.coords.y, locations.coords.z, Config.Locales.treetext)
       if IsControlJustReleased(0,38) then
			local alweapon1 = GetHashKey(Config.axe1)
			local alweapon2 = GetHashKey(Config.axe2)
			if pedWeapon == alweapon1 or pedWeapon == alweapon2 then
				Stonesmining(ClientTrees, i)
				chopActive = true
			else
			Notify(Config.Locales.noaxe)
			end
end
end
elseif locations.spawn < 60 then
      DeleteEntity(Objects[i])
	  Objects[i] = nil
end
--end
end
end
end)

Citizen.CreateThread(function() 
    while true do

				TriggerServerEvent("hyon_fallentree:get_tree")
				Citizen.Wait(1000)
	end
end)

RegisterNetEvent("hyon_fallentree:create_tree")
AddEventHandler("hyon_fallentree:create_tree", function(tree)
	local playerPed  = GetPlayerPed()
	for k,v in pairs(tree) do
	ClientTrees[k] = {}
	ClientTrees[k] = {coords = v.coords, spawn = v.spawn, heading = v.heading}
	end
	Citizen.Wait(1000)
end)


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(22)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370

end

function Stonesmining(ClientTrees, i)
    Citizen.CreateThread(function()
        local impacts = 0
        while impacts < 3 do
            Citizen.Wait(0)
		    local ped = PlayerPedId()
            local plyCoords = GetEntityCoords(ped)
			local animDict = "melee@hatchet@streamed_core"
			local animName = "plyr_rear_takedown_b"
            local FrontStone = GetEntityForwardVector(ped)
            local x, y, z = table.unpack(plyCoords + FrontStone * 1.0)
            if not HasNamedPtfxAssetLoaded("core") then
	           RequestNamedPtfxAsset("core")
	             while not HasNamedPtfxAssetLoaded("core") do
		         Wait(0)
	           end
            end
			FreezeEntityPosition(ped, true)
            LoadDict('melee@hatchet@streamed_core')
			TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Citizen.Wait(3000)
            Citizen.Wait(1500)
            ClearPedTasks(ped)
			FreezeEntityPosition(ped, false)
            impacts = impacts+1
            if impacts == 3 then
               impacts = 0
			   TriggerServerEvent('lootmoney', ClientTrees, i)
               chopActive = false
               break
            end
        end
    end)
end

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end


Citizen.CreateThread(function()
while true do
	Citizen.Wait(500)
	local PlayerData = QBCore.Functions.GetPlayerData(PlayerData)
	if Config.treeblip == true then
		for i, locations in pairs(ClientTrees) do
		if locations.spawn ~= 60 then
            RemoveBlip(treeblips[i])
			RemoveBlip(treeblips[i])
			treeblips[i] = nil
		end
		if locations.spawn == 60 then
			if treeblips[i] == nil then
			treeblips[i] = {}
			treeblips[i] = AddBlipForCoord(locations.coords)
			SetBlipSprite(treeblips[i], 364)
			SetBlipDisplay(treeblips[i], 4)
			SetBlipScale(treeblips[i], 0.75)
			SetBlipColour(treeblips[i], 5)
			SetBlipAsShortRange(treeblips[i], true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Config.Locales.fallentreeblip)
			EndTextCommandSetBlipName(treeblips[i])
			end
		end
		end
	elseif Config.treeblip == "onlyjobs" then
		for i, job in pairs(Config.treeblipjobs) do
			if PlayerData.job.name == Config.treeblipjobs[i] then
				for i, locations in pairs(ClientTrees) do
					if locations.spawn ~= 60 then
						RemoveBlip(treeblips[i])
						RemoveBlip(treeblips[i])
						treeblips[i] = nil
					end
					if locations.spawn == 60 then
						if treeblips[i] == nil then
						treeblips[i] = {}
						treeblips[i] = AddBlipForCoord(locations.coords)
						SetBlipSprite(treeblips[i], 364)
						SetBlipDisplay(treeblips[i], 4)
						SetBlipScale(treeblips[i], 0.75)
						SetBlipColour(treeblips[i], 5)
						SetBlipAsShortRange(treeblips[i], true)
						BeginTextCommandSetBlipName("STRING")
						AddTextComponentString(Config.Locales.fallentreeblip)
						EndTextCommandSetBlipName(treeblips[i])
						end
					end
				end
			end
		end
	end
end	
end)

function Notify(msg, state)
    QBCore.Functions.Notify(msg, state)
end