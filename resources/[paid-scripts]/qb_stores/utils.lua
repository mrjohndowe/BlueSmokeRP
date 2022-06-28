QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("stores:Notify")
AddEventHandler("stores:Notify", function(type,msg)
	if type == "negado" then
		type = 'error'
	elseif type == "importante" then
		type = 'primary'
	elseif type == "sucesso" then
		type = 'success'
	end
	QBCore.Functions.Notify(msg, type)
end)

function DrawMarker_blip(x,y,z)
	DrawMarker(21,x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
end
function DrawMarker_truck(x,y,z)
	DrawMarker(39,x,y,z-0.6,0,0,0,0.0,0,0,1.0,1.0,1.0,255,0,0,50,0,0,0,1)
end

function DrawText3D2(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = #(vector3(px,py,pz) - vector3(x,y,z))
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.35*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- spawnVehicle
-----------------------------------------------------------------------------------------------------------------------------------------

function spawnVehicle(name,x,y,z,h)
	local mhash = GetHashKey(name)
	while not HasModelLoaded(mhash) do
		RequestModel(mhash)
		Citizen.Wait(10)
	end

	if HasModelLoaded(mhash) then
		vehicle = CreateVehicle(mhash,x,y,z+0.5,h,true,false)
		local networkId = NetworkGetNetworkIdFromEntity(vehicle)

		SetNetworkIdCanMigrate(networkId, true)
		SetEntityAsMissionEntity(vehicle, true, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetVehRadioStation(vehicle, 'OFF')
		SetModelAsNoLongerNeeded(mhash)
		SetVehicleNumberPlateText(vehicle,Lang[Config.lang]['truck_plate'])
		TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))

		SetVehicleFuelLevel(vehicle,100.0)
		DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
	
		blip = AddBlipForEntity(vehicle)
		SetBlipSprite(blip,477)
		SetBlipColour(blip,26)
		SetBlipAsShortRange(blip,false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Lang[Config.lang]['truck_blip'])
		EndTextCommandSetBlipName(blip)
	end
	return vehicle,blip
end