local washingVehicle = false
local ped, pos, veh = nil

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('qb-carwash:client:CarWashMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Car Wash Options",
            isMenuHeader = true
        },
        {
            header = "Vehicle Cleaning",
            txt = "Get a wash and wax!",
            params = {
                event = "qb-carwash:client:setselection",
                args = {
                    selection = 'exterior',
                }
            }
        },
        {
            header = "Vehicle Detailing",
            txt = "Get a suck and buff!",
            params = {
                event = "qb-carwash:client:setselection",
                args = {
                    selection = 'interior',
                }
            }
        },
        {
            header = "Close (ESC)",
            params = {
                event = exports['qb-menu']:closeMenu(),
            }
        },
    })
end)

RegisterNetEvent('qb-carwash:client:setselection', function(data)
    curselection = data.selection
    TriggerServerEvent('qb-carwash:server:washCar')
end)


RegisterNetEvent('qb-carwash:client:washCar', function()
    washingVehicle = true

    local progtext = 'Keepin\' those machines humming...'
    local progtime = math.random(4000, 8000)

    if curselection == 'interior' then
        progtext = 'Vacuuming out bugershot wrappers...'
        progtime = math.random(12000, 20000)
    end

    QBCore.Functions.Progressbar("search_cabin", progtext, progtime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if curselection == 'exterior' then
            SetVehicleDirtLevel(veh)
            SetVehicleUndriveable(veh, false)
            WashDecalsFromVehicle(veh, 1.0)
        elseif curselection == 'interior' then 
            local plate = QBCore.Functions.GetPlate(veh) 
            TriggerServerEvent('evidence:server:RemoveCarEvidence', plate) 
        end
        washingVehicle = false
    end, function() -- Cancel
        QBCore.Functions.Notify("Washing canceled ..", "error")
        washingVehicle = false
    end)
end)

CreateThread(function()
	while true do
        if LocalPlayer.state.isLoggedIn then
	        ped = PlayerPedId()   
            veh = GetVehiclePedIsIn(ped)
        end
        Wait(1000)
	end
end)

CreateThread(function()
    while true do
        local inRange = false

        if IsPedInAnyVehicle(ped) then
            pos = GetEntityCoords(ped)
            for k, v in pairs(Config.CarWash) do
                local dist = #(pos - vector3(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"]))
                if dist <= 10 then
                    inRange = true
                    if dist <= 7.5 then
                        if GetPedInVehicleSeat(veh, -1) == ped then
                            if not washingVehicle then
                                DrawText3Ds(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"], ('E - Use Carwash ($%s)'):format(Config.DefaultPrice))
                                if IsControlJustPressed(0, 38) then
                                    TriggerEvent('qb-carwash:client:CarWashMenu')
                                end
                            end
                        end
                    end
                end
            end
        end

        if not inRange then
            Wait(5000)
        end
        Wait(0)
    end
end)

CreateThread(function()
    for k in pairs(Config.CarWash) do
        local carWash = AddBlipForCoord(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"])
        SetBlipSprite (carWash, 100)
        SetBlipDisplay(carWash, 4)
        SetBlipScale  (carWash, 0.75)
        SetBlipAsShortRange(carWash, true)
        SetBlipColour(carWash, 37)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.CarWash[k]["label"])
        EndTextCommandSetBlipName(carWash)
    end
end)