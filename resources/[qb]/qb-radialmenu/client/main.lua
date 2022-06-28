QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData() -- Setting this for when you restart the resource in game
local inRadialMenu = false

local jobIndex = nil
local vehicleIndex = nil
local garaIndex = nil
local DynamicMenuItems = {}
local FinalMenuItems = {}
-- Functions


local function SetupGaragesMenu()
    local isingarage, canStoreVehicle = exports["MojiaGarages"]:IsInGarage()
	local isInJobGarage, lastJobVehicle = exports["MojiaGarages"]:isInJobStation(PlayerData.job.name)
	local GaragesMenu = {
        id = 'garages',
        title = 'Garages',
        icon = 'warehouse',
        items = {}
    }
	if isingarage then
		GaragesMenu.items[#GaragesMenu.items+1] = {
			id = 'opengarage',
			title = 'Open Garage',
			icon = 'warehouse',
			type = 'client',
			event = 'MojiaGarages:client:openGarage',
			shouldClose = true,
		}
		local veh = nil
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local vehout, distance = QBCore.Functions.GetClosestVehicle(pos)
		local vehin = IsPedInAnyVehicle(ped, true)
		if vehin then
			veh = GetVehiclePedIsIn(ped)
		else
			if NetworkGetEntityIsLocal(vehout) and distance <= 5 then
				veh = vehout
			end
		end
		if veh ~= nil then
			local plate = QBCore.Functions.GetPlate(veh)
			if exports["qb-vehiclekeys"]:HasKeys(plate) then
				if canStoreVehicle then
					GaragesMenu.items[#GaragesMenu.items+1] = {
						id = 'storeVehicle',
						title = 'Store Vehicle',
						icon = 'parking',
						type = 'client',
						event = 'MojiaGarages:client:storeVehicle',
						shouldClose = true,
					}
				end
			end
		end
	end
	-- if isInJobGarage then
		-- if lastJobVehicle == nil then
			-- GaragesMenu.items[#GaragesMenu.items+1] = {
				-- id = 'openjobgarage',
				-- title = 'Open Job Garage',
				-- icon = 'warehouse',
				-- type = 'client',
				-- event = 'MojiaGarages:client:openJobVehList',
				-- shouldClose = true,
			-- }
		-- else
			-- local veh = nil
			-- local ped = PlayerPedId()
			-- local pos = GetEntityCoords(ped)
			-- local vehout, distance = QBCore.Functions.GetClosestVehicle(pos)
			-- local vehin = IsPedInAnyVehicle(ped, true)
			-- if vehin then
				-- veh = GetVehiclePedIsIn(ped)
			-- else
				-- if NetworkGetEntityIsLocal(vehout) and distance <= 5 then
					-- veh = vehout
				-- end
			-- end
			-- if veh ~= nil and veh == lastJobVehicle then
				-- local plate = QBCore.Functions.GetPlate(veh)
				-- if exports["qb-vehiclekeys"]:HasKeys(plate) then --disable if use MojiaVehicleKeys
			-- --if exports['MojiaVehicleKeys']:CheckHasKey(plate) then --enable if use MojiaVehicleKeys
					-- GaragesMenu.items[#GaragesMenu.items+1] = {
						-- id = 'hidejobvehicle',
						-- title = 'Hide Job Vehicle',
						-- icon = 'parking',
						-- type = 'client',
						-- event = 'MojiaGarages:client:HideJobVeh',
						-- shouldClose = true,
					-- }
				-- end
			-- end
		-- end
	-- end
    -- if #GaragesMenu.items == 0 then
        -- if garaIndex then
            -- RemoveOption(garaIndex)
            -- garaIndex = nil
        -- end
    -- else
        -- garaIndex = AddOption(GaragesMenu, garaIndex)
    -- end
end

local function deepcopy(orig) -- modified the deep copy function from http://lua-users.org/wiki/CopyTable
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if not orig.canOpen or orig.canOpen() then
            local toRemove = {}
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                if type(orig_value) == 'table' then
                    if not orig_value.canOpen or orig_value.canOpen() then
                        copy[deepcopy(orig_key)] = deepcopy(orig_value)
                    else
                        toRemove[orig_key] = true
                    end
                else
                    copy[deepcopy(orig_key)] = deepcopy(orig_value)
                end
            end
            for i=1, #toRemove do table.remove(copy, i) --[[ Using this to make sure all indexes get re-indexed and no empty spaces are in the radialmenu ]] end
            if copy and next(copy) then setmetatable(copy, deepcopy(getmetatable(orig))) end
        end
    elseif orig_type ~= 'function' then
        copy = orig
    end
    return copy
end

local function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

local function AddOption(data, id)
    local menuID = id ~= nil and id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

local function RemoveOption(id)
    DynamicMenuItems[id] = nil
end

local function SetupJobMenu()
    local JobMenu = {
        id = 'jobinteractions',
        title = 'Work',
        icon = 'briefcase',
        items = {}
    }
    if Config.JobInteractions[PlayerData.job.name] and next(Config.JobInteractions[PlayerData.job.name]) then
        JobMenu.items = Config.JobInteractions[PlayerData.job.name]
    end

    if #JobMenu.items == 0 then
        if jobIndex then
            RemoveOption(jobIndex)
            jobIndex = nil
        end
    else
        jobIndex = AddOption(JobMenu, jobIndex)
    end
end

local function SetupVehicleMenu()
    local VehicleMenu = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = 'car',
        items = {}
    }

    local ped = PlayerPedId()
    local Vehicle = GetVehiclePedIsIn(ped) ~= 0 and GetVehiclePedIsIn(ped) or getNearestVeh()
    if Vehicle ~= 0 then
        VehicleMenu.items[#VehicleMenu.items+1] = Config.VehicleDoors
        if Config.EnableExtraMenu then VehicleMenu.items[#VehicleMenu.items+1] = Config.VehicleExtras end

        if IsPedInAnyVehicle(ped) then
            local seatIndex = #VehicleMenu.items+1
            VehicleMenu.items[seatIndex] = deepcopy(Config.VehicleSeats)

            local seatTable = {
                [1] = Lang:t("options.driver_seat"),
                [2] = Lang:t("options.passenger_seat"),
                [3] = Lang:t("options.rear_left_seat"),
                [4] = Lang:t("options.rear_right_seat"),
            }

            local AmountOfSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Vehicle))
            for i = 1, AmountOfSeats do
                local newIndex = #VehicleMenu.items[seatIndex].items+1
                VehicleMenu.items[seatIndex].items[newIndex] = {
                    id = i - 2,
                    title = seatTable[i] or Lang:t("options.other_seats"),
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                }
            end
        end
    end

    if #VehicleMenu.items == 0 then
        if vehicleIndex then
            RemoveOption(vehicleIndex)
            vehicleIndex = nil
        end
    else
        vehicleIndex = AddOption(VehicleMenu, vehicleIndex)
    end
end

local function SetupSubItems()
    SetupJobMenu()
    SetupVehicleMenu()
	SetupGaragesMenu()
end

-- local function SetupSubItems()
    -- SetupJobMenu()
    -- SetupVehicleMenu()
-- end

local function selectOption(t, t2)
    for _, v in pairs(t) do
        if v.items then
            local found, hasAction, val = selectOption(v.items, t2)
            if found then return true, hasAction, val end
        else
            if v.id == t2.id and ((v.event and v.event == t2.event) or v.action) and (not v.canOpen or v.canOpen()) then
                return true, v.action, v
            end
        end
    end
    return false
end

local function IsPoliceOrEMS()
    return (PlayerData.job.name == "police" or PlayerData.job.name == "ambulance")
end

local function IsDowned()
    return (PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"])
end

local function SetupRadialMenu()
    FinalMenuItems = {}
    if (IsDowned() and IsPoliceOrEMS()) then
            FinalMenuItems = {
                [1] = {
                    id = 'emergencybutton2',
                    title = Lang:t("options.emergency_button"),
                    icon = 'exclamation-circle',
                    type = 'client',
                    event = 'police:client:SendPoliceEmergencyAlert',
                    shouldClose = true,
                },
            }
    else
        SetupSubItems()
        FinalMenuItems = deepcopy(Config.MenuItems)
        for _, v in pairs(DynamicMenuItems) do
            FinalMenuItems[#FinalMenuItems+1] = v
        end

    end
end

local function setRadialState(bool, sendMessage, delay)
    -- Menuitems have to be added only once

    if bool then
        TriggerEvent('qb-radialmenu:client:onRadialmenuOpen')
        SetupRadialMenu()
    else
        TriggerEvent('qb-radialmenu:client:onRadialmenuClose')
    end

    SetNuiFocus(bool, bool)
    if sendMessage then
        SendNUIMessage({
            action = "ui",
            radial = bool,
            items = FinalMenuItems
        })
    end
    if delay then Wait(500) end
    inRadialMenu = bool
end
local function CheckHasID(id1, id2)
	local has = false
	if Config.MenuItems[id1].items then
		for k, v in pairs(Config.MenuItems[id1].items) do
			if v.id == id2 then
				has = true
			end
		end
	end
	return has
end

local function CheckHasID2(job, id)
	local has = false
	if Config.JobInteractions[job] then
		for k, v in pairs(Config.JobInteractions[job]) do
			if v.id == id then
				has = true
			end
		end
	end
	return has
end

local function addSubMenu(id1, id2, menu)
	if Config.MenuItems[id1].items and not CheckHasID(id1, id2) then
		Config.MenuItems[id1].items[#Config.MenuItems[id1].items + 1] = menu
	end
end

local function addJobSubMenu(job, id, menu)
	if Config.JobInteractions[job] and not CheckHasID2(job, id) then
		Config.JobInteractions[job][#Config.JobInteractions[job] +1 ] =  menu
	end
end

local function removeSubMenu(id1, id2)
	if Config.MenuItems[id1].items and CheckHasID(id1, id2) then
		for k, v in pairs(Config.MenuItems[id1].items) do
			if v.id == id2 then
        			if k == #Config.MenuItems[id1].items then
					Config.MenuItems[id1].items[k] = nil
        			else
          				Config.MenuItems[id1].items[k] = Config.MenuItems[id1].items[#Config.MenuItems[id1].items]
          				Config.MenuItems[id1].items[#Config.MenuItems[id1].items] = nil
        			end
			end
		end
	end
end

local function removeJobSubMenu(job, id)
	if Config.JobInteractions[job] and CheckHasID2(job, id) then
		for k, v in pairs(Config.JobInteractions[job]) do
			if v.id == id then
        			if k == #Config.JobInteractions[job] then
					Config.JobInteractions[job][k] = nil
        			else
          				Config.JobInteractions[job][k] = Config.JobInteractions[job][#Config.JobInteractions[job]]
          				Config.JobInteractions[job][#Config.JobInteractions[job]] = nil
        			end
			end
		end
	end
end

exports('addSubMenu', addSubMenu)
exports('addJobSubMenu', addJobSubMenu)
exports('removeSubMenu', removeSubMenu)
exports('removeJobSubMenu', removeJobSubMenu)
-- Command

RegisterCommand('radialmenu', function()
    if ((IsDowned() and IsPoliceOrEMS()) or not IsDowned()) and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() and not inRadialMenu then
        setRadialState(true, true)
        SetCursorLocation(0.5, 0.5)
    end
end)

RegisterKeyMapping('radialmenu', Lang:t("general.command_description"), 'keyboard', 'F1')

-- Events

-- Sets the metadata when the player spawns

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
	TriggerEvent('MojiaGarages:client:updateRadialmenu')
end)
-- RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- PlayerData = QBCore.Functions.GetPlayerData()
-- end)

-- Sets the playerdata to an empty table when the player has quit or did /logout

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
	TriggerEvent('MojiaGarages:client:updateRadialmenu')
end)

-- RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    -- PlayerData = {}
-- end)

-- This will update all the PlayerData that doesn't get updated with a specific event other than this like the metadata
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
	TriggerEvent('MojiaGarages:client:updateRadialmenu')
end)
-- RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    -- PlayerData = val
-- end)

RegisterNetEvent('qb-radialmenu:client:noPlayers', function()
    QBCore.Functions.Notify(Lang:t("error.no_people_nearby"), 'error', 2500)
end)

RegisterNetEvent('qb-radialmenu:client:openDoor', function(data)
    local string = data.id
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
    local ped = PlayerPedId()
    local closestVehicle = GetVehiclePedIsIn(ped) ~= 0 and GetVehiclePedIsIn(ped) or getNearestVeh()
    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local plate = QBCore.Functions.GetPlate(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        QBCore.Functions.Notify(Lang:t("error.no_vehicle_found"), 'error', 2500)
    end
end)

RegisterNetEvent('qb-radialmenu:client:setExtra', function(data)
    local string = data.id
    local replace = string:gsub("extra", "")
    local extra = tonumber(replace)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if veh ~= nil then
        if GetPedInVehicleSeat(veh, -1) == ped then
            SetVehicleAutoRepairDisabled(veh, true) -- Forces Auto Repair off when Toggling Extra [GTA 5 Niche Issue]
            if DoesExtraExist(veh, extra) then
                if IsVehicleExtraTurnedOn(veh, extra) then
                    SetVehicleExtra(veh, extra, 1)
                    QBCore.Functions.Notify(Lang:t("error.extra_deactivated", {extra = extra}), 'error', 2500)
                else
                    SetVehicleExtra(veh, extra, 0)
                    QBCore.Functions.Notify(Lang:t("success.extra_activated", {extra = extra}), 'success', 2500)
                end
            else
                QBCore.Functions.Notify(Lang:t("error.extra_not_present", {extra = extra}), 'error', 2500)
            end
        else
            QBCore.Functions.Notify(Lang:t("error.not_driver"), 'error', 2500)
        end
    end
end)

RegisterNetEvent('qb-radialmenu:trunk:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(PlayerPedId())
    if veh ~= 0 then
        local pl = QBCore.Functions.GetPlate(veh)
        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

RegisterNetEvent('qb-radialmenu:client:ChangeSeat', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local IsSeatFree = IsVehicleSeatFree(Veh, data.id)
    local speed = GetEntitySpeed(Veh)
    local HasHarnass = exports['qb-smallresources']:HasHarness()
    if not HasHarnass then
        local kmh = speed * 3.6
        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(PlayerPedId(), Veh, data.id)
                QBCore.Functions.Notify(Lang:t("info.switched_seats", {seat = data.title}))
            else
                QBCore.Functions.Notify(Lang:t("error.vehicle_driving_fast"), 'error')
            end
        else
            QBCore.Functions.Notify(Lang:t("error.seat_occupied"), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t("error.race_harness_on"), 'error')
    end
end)

-- NUI Callbacks

RegisterNUICallback('closeRadial', function(data, cb)
    setRadialState(false, false, data.delay)
    cb('ok')
end)

RegisterNUICallback('selectItem', function(inData, cb)
    local itemData = inData.itemData
    local found, action, data = selectOption(FinalMenuItems, itemData)
    if data and found then
        if action then
            action(data)
        elseif data.type == 'client' then
            TriggerEvent(data.event, data)
        elseif data.type == 'server' then
            TriggerServerEvent(data.event, data)
        elseif data.type == 'command' then
            ExecuteCommand(data.event)
        elseif data.type == 'qbcommand' then
            TriggerServerEvent('QBCore:CallCommand', data.event, data)
        end
    end
    cb('ok')
end)

exports('AddOption', AddOption)
exports('RemoveOption', RemoveOption)
