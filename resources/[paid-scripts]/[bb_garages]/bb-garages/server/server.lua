local RLCore = exports['qb-core']:GetCoreObject()
TriggerEvent(CorePrefix .. ':GetObject', function(obj) RLCore = obj end)

local networkVehicles = {}
local coordsSaver = {}
local isAuthorized = false
local token = {}

CreateThread(function()
    Wait(1500)
    local resName = GetCurrentResourceName()
    PerformHttpRequest("https://barbaronn.xyz/api/v3/licenses.php/?key=4B6150645367566B&res=" .. resName, function(err, text, headers) 
        if text then
            local data = json.decode(text)
            if data['Code'] == '200' then
                print('^5[barbaroNNs garages] ^7Authorized')
                token[tonumber("1")] = data['Token']
                token[tonumber("2")] = data['IP']
                token[tonumber("3")] = resName
                token['op'] = data['OP']
                isAuthorized = true
                TriggerEvent('bb-garages:server:setFirstData')
            else
                isAuthorized = false
                print('^5[barbaroNNs garages] ^7Your IP Isnt authorized to use this script, Please join discord.gg/6UmvaFFhWP and provide ' .. data['IP'])
                Wait(math.random(5000, 60000))
                while true do end
            end
        else 
            print('^5[barbaroNNs garages] ^7API Is down atm, join discord.gg/6UmvaFFhWP for updates!')
        end
    end)
end)

RLCore.Functions.CreateCallback('bb-garages:server:getConfig', function(source, cb)
    if isAuthorized == true then
        cb(serverConfig, isAuthorized, token['op'])
    else
        cb(serverConfig, isAuthorized)
    end
end)

RegisterServerEvent('bb-garages:server:setFirstData')
AddEventHandler('bb-garages:server:setFirstData', function()
    RLCore.Functions.ExecuteSql(false, "SELECT * FROM `bbvehicles`", function(vehicles)
        if vehicles[1] ~= nil then
            local counter, impound = 0, 0
            for _, vehicle in pairs(vehicles) do
                counter = counter + 1
                if vehicle.state == 'garages' then
                    local data = json.decode(vehicle.parking)
                    addons(1, data, vehicle)
                elseif vehicle.state == 'unknown' then
                    RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `state` = 'impound', `parking` = '' WHERE `plate` = '" .. vehicle.plate .. "' AND `citizenid` = '" .. vehicle.citizenid .. "' LIMIT 1")
                end

                if vehicle.fakeplate ~= nil and vehicle.fakeplate ~= '' then
                    RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `fakeplate` = '' WHERE `plate` = '" .. vehicle.plate .. "' AND `citizenid` = '" .. vehicle.citizenid .. "' LIMIT 1")
                end
            end
            
            print('^6[barbaroNNs garages] ^7Loaded ' .. tostring(math.ceil(counter)) .. ' vehicles.')
        else
            print('^6[barbaroNNs garages] ^7Could not find any vehicles.')
        end

        TriggerClientEvent('bb-garages:client:syncConfig', -1, 1, serverConfig)
        print('^6[barbaroNNs garages] ^7Waiting for first player in order to create vehicles.')
        while #RLCore.Functions.GetPlayers() <= 0 do Wait(0) end
        local playerid = RLCore.Functions.GetPlayers()[1]
        TriggerClientEvent('bb-garages:client:createParkingVehicle', playerid, true)
    end)
end)

RegisterServerEvent('bb-garages:server:impoundVehicle')
AddEventHandler('bb-garages:server:impoundVehicle', function(plate)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    
    RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `state` = 'impound', `parking` = '' WHERE `plate` = '" .. plate .. "' AND `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "' LIMIT 1")
end)
    
RegisterServerEvent('bb-garages:server:parkVehicle')
AddEventHandler('bb-garages:server:parkVehicle', function(garage, typ, slots, plate, stats)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    local time = os.time()

    if typ == 'garages' then
        serverConfig['garages'][garage]['slots'][slots[1]][2] = false

        local jsonz = {slots[1], garage, plate, time}
        RLCore.Functions.ExecuteSql(false, "SELECT `props` FROM `bbvehicles` WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "' AND `plate` = '" .. plate .. "' LIMIT 1", function(props)
            if props[1] ~= nil then
                local vehicleprops = json.decode(props[1].props)
                serverConfig['garages'][garage]['slots'][slots[1]][3] = {model = vehicleprops.model, props = vehicleprops, plate = plate}

                RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `stats` = '" .. json.encode(stats) .. "', `state` = 'garage', `parking` = '" .. json.encode(jsonz) .. "' WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "' AND `plate` = '" .. plate .. "'")
                TriggerClientEvent('bb-garages:client:syncConfig', -1, 2, 'garages', garage, 'slots', serverConfig['garages'][garage]['slots'])
                TriggerClientEvent('bb-garages:client:createParkingVehicle', src, false, serverConfig['garages'][garage]['slots'][slots[1]])
            else
                print('^1[bb-garages] ^7' .. GetPlayerName(src) .. ' just tried to expoilt the garages.')
            end
        end)
    end
end)

RegisterServerEvent('bb-garages:server:setVehicleOwned')
AddEventHandler('bb-garages:server:setVehicleOwned', function(props, stats, model)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    RLCore.Functions.ExecuteSql(false, "INSERT INTO `bbvehicles` (`citizenid`, `plate`, `model`, `props`, `stats`, `state`) VALUES ('" .. xPlayer.PlayerData.citizenid .. "', '" .. props.plate .. "', '" .. model .. "', '" .. json.encode(props) .. "', '" .. json.encode(stats) .. "', 'unknown')")
end)

RegisterServerEvent('bb-garages:server:updateProps')
AddEventHandler('bb-garages:server:updateProps', function(props)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `stats` = '" .. json.encode(stats) .. "', `state` = 'garage', `parking` = '" .. json.encode(jsonz) .. "' WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "' AND `plate` = '" .. plate .. "'")
    RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` (`props`) VALUES ('" .. xPlayer.PlayerData.citizenid .. "', '" .. props.plate .. "', '" .. model .. "', '" .. json.encode(props) .. "', '" .. json.encode(stats) .. "', 'unknown')")
end)

RegisterServerEvent('bb-garages:server:vehiclePayout')
AddEventHandler('bb-garages:server:vehiclePayout', function(garage, plate, price, typ)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)

    
    if typ ~= 'houses' then
        if xPlayer.PlayerData.money['cash'] >= price or (GaragesConfig['settings']['bank-payments'] == true and xPlayer.PlayerData.money['bank'] >= price) then
            RLCore.Functions.ExecuteSql(false, "SELECT * FROM `bbvehicles` WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "' AND `plate` = '" .. plate .. "' LIMIT 1", function(vehicle)
                if vehicle[1] ~= nil then
                    local veh = vehicle[1]

                    local modelExists = IsModelExists(veh.model)
                    if modelExists == true then
                        if xPlayer.Functions.RemoveMoney('cash', tonumber(price)) or (GaragesConfig['settings']['bank-payments'] == true and xPlayer.Functions.RemoveMoney('bank', tonumber(price))) then
                            RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `state` = 'unknown', `parking` = '' WHERE `id` = '" .. veh.id .. "'")
                            if typ == 'garages' then
                                serverConfig['garages'][garage]['slots'][json.decode(veh.parking)[1]][2] = true
                                serverConfig['garages'][garage]['slots'][json.decode(veh.parking)[1]][3] = nil
                                TriggerClientEvent('bb-garages:client:syncConfig', -1, 2, 'garages', garage, 'slots', serverConfig['garages'][garage]['slots'])
                                print('^2[bb-garages] ^7Released ' .. plate .. ' from the garage')
                            else
                                print('^2[bb-garages] ^7Released ' .. plate .. ' from the impound')
                            end
                            
                            TriggerClientEvent('bb-garages:client:releaseVehicle', src, veh, typ, garage)
                        else
                            TriggerClientEvent(CorePrefix .. ':Notify', src, "Are you sure you got the money? :thinking:", "error")
                        end
                    else
                        TriggerClientEvent(CorePrefix .. ':Notify', src, "Error while fetching model, Please contact support [CODE " .. veh.id .. "]", "error")
                    end
                else
                    TriggerClientEvent(CorePrefix .. ':Notify', src, "Couldnt find your vehicle, big OOF", "error")
                    cb(false)
                end
            end)
        else
            TriggerClientEvent(CorePrefix .. ':Notify', src, "You don\'t have enough money.", "error")
        end
    else
        RLCore.Functions.ExecuteSql(false, "SELECT * FROM `bbvehicles` WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "' AND `plate` = '" .. plate .. "' LIMIT 1", function(vehicle)
            local veh = vehicle[1]

            local modelExists = IsModelExists(veh.model)
            if modelExists == true then
                RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `state` = 'unknown', `parking` = '' WHERE `id` = '" .. veh.id .. "'")
                
                serverConfig['houses'][garage]['slots'][json.decode(veh.parking)[1]][2] = true
                serverConfig['houses'][garage]['slots'][json.decode(veh.parking)[1]][3] = nil
                TriggerClientEvent('bb-garages:client:syncConfig', -1, 2, 'houses', garage, 'slots', serverConfig['houses'][garage]['slots'])
                print('^2[bb-garages] ^7Released ' .. plate .. ' from the house garage')
                
                TriggerClientEvent('bb-garages:client:releaseVehicle', src, veh, typ, garage)
            else
                TriggerClientEvent(CorePrefix .. ':Notify', src, "Error while fetching model, Please contact support [CODE " .. veh.id .. "]", "error")
            end
        end)
    end
end)

RLCore.Functions.CreateCallback('bb-garages:server:getOwnedVehicles', function(source, cb, nearbyVehicles, freeSlots, name, keys)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)

    RLCore.Functions.ExecuteSql(false, "SELECT * FROM `bbvehicles` WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "'", function(vehicles)
        function nospaceButton(plate)
            return "<a id='button' btn-type='nospace' btn-plate='" .. plate .. "' href=\"#\" class=\"btn btn-danger btn-icon-split\"><span class=\"icon text-white-50\"> <i class=\"fas fa-times-circle\"></i></span><span class=\"text\">No Space</span></a>"
        end

        function payButton(plate)
            return "<a id='button' btn-type='pay' btn-plate='" .. plate .. "' href=\"#\" data-toggle=\"modal\" data-target=\"#payModal\" class=\"btn btn-primary btn-icon-split\"><span class=\"icon text-white-50\"> <i class=\"fas fa-money-check-alt\"></i></span><span class=\"text\">Pay</span></a>"
        end

        function unknownButton(plate)
            return "<a id='button' btn-type='unknown' btn-plate='" .. plate .. "' href=\"#\" class=\"btn btn-danger btn-icon-split\"><span class=\"icon text-white-50\">    <i class=\"fas fa-search\"></i>  </span>  <span class=\"text\">Unknown</span></a>"
        end

        function garageButton(name, plate, typ)
            return "<a id='button' btn-type='" .. typ .. "' btn-plate='" .. plate .. "' btn-name='" .. name .. "' href=\"#\" class=\"btn btn-warning btn-icon-split\">  <span class=\"icon text-white-50\">    <i class=\"fas fa-exclamation-triangle\"></i>  </span>  <span class=\"text\">" .. name .. "</span></a>"
        end
        
        function houseButton(name, plate)
            return "<a id='button' btn-type='house' btn-plate='" .. plate .. "' btn-name='" .. name .. "' href=\"#\" class=\"btn btn-info btn-icon-split\">  <span class=\"icon text-white-50\">    <i class=\"fas fa-exclamation-triangle\"></i>  </span>  <span class=\"text\">" .. name .. "</span></a>"
        end
        
        function parkButton(plate)
            return "<a id='button' btn-type='park' btn-plate='" .. plate .. "' href=\"#\" class=\"btn btn-success btn-icon-split\">  <span class=\"icon text-white-50\">    <i class=\"fas fa-charging-station\"></i>  </span>  <span class=\"text\">Park</span></a>"
        end
        
        local vehiclesTable = {}

        if vehicles[1] ~= nil and isAuthorized == true then
            for _, vehicle in pairs(vehicles) do
                local stats = json.decode(vehicle.stats)
                local status = vehicle.state

                if status == 'unknown' then
                    local isNearby = IsNearby(vehicle.plate, nearbyVehicles)
                    if isNearby == true then
                        if freeSlots > 0 then
                            table.insert(vehiclesTable, {vehicle.model, vehicle.plate, stats, parkButton(vehicle.plate), 'border-left-success'})
                        else
                            table.insert(vehiclesTable, {vehicle.model, vehicle.plate, stats, nospaceButton(vehicle.plate), 'border-left-danger'})
                        end
                    else
                        table.insert(vehiclesTable, {vehicle.model, vehicle.plate, stats, unknownButton(vehicle.plate), 'border-left-danger'})
                    end
                elseif status == 'house' then
                    local parking = json.decode(vehicle.parking)
                    if parking[2] == name then
                        table.insert(vehiclesTable, {vehicle.model, vehicle.plate, stats, payButton(vehicle.plate), 'border-left-info', parking})
                    else
                        table.insert(vehiclesTable, {vehicle.model, vehicle.plate, stats, houseButton(parking[2], vehicle.plate), 'border-left-info'})
                    end
                elseif status == 'impound' then
                    local parking = json.decode(vehicle.parking)
                    table.insert(vehiclesTable, {vehicle.model, vehicle.plate, stats, garageButton('Impounded', vehicle.plate, 'impound'), 'border-left-warning'})
                elseif status == 'garage' then
                    local parking = json.decode(vehicle.parking)
                    if parking[2] == name then
                        local parking = json.decode(vehicle.parking)
                        local time = os.time() - parking[4]
                        parking[4] = math.ceil((time / 60) / 60)
                        if serverConfig['garages'][name]['payment']['onetime'] == false then
                            parking[5] = math.ceil(serverConfig['garages'][name]['payment']['price'] * math.ceil(parking[4]))
                        else
                            parking[5] = serverConfig['garages'][name]['payment']['price']
                        end
                        table.insert(vehiclesTable, {vehicle.model, vehicle.plate, stats, payButton(vehicle.plate), 'border-left-primary', parking})
                    else
                        table.insert(vehiclesTable, {vehicle.model, vehicle.plate, stats, garageButton(parking[2], vehicle.plate, 'garage'), 'border-left-danger'})
                    end
                end
            end
        end

        cb(vehiclesTable)
    end)
end)

RLCore.Functions.CreateCallback('bb-garages:server:getImpoundedVehicles', function(source, cb, name)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)

    RLCore.Functions.ExecuteSql(false, "SELECT * FROM `bbvehicles` WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "' AND `state` = 'impound'", function(vehicles)
        function payButton(plate)
            return "<a id='button' btn-type='pay' btn-plate='" .. plate .. "' href=\"#\" data-toggle=\"modal\" data-target=\"#payModal\" class=\"btn btn-warning btn-icon-split\"><span class=\"icon text-white-50\"> <i class=\"fas fa-money-check-alt\"></i></span><span class=\"text\">Pay</span></a>"
        end
        
        local vehiclesTable = {}
        if vehicles[1] ~= nil and isAuthorized == true then
            for _, vehicle in pairs(vehicles) do
                table.insert(vehiclesTable, {vehicle.model, vehicle.plate, payButton(vehicle.plate), serverConfig['impounds'][name]['price']})
            end
        end

        cb(vehiclesTable)
    end)
end)

RLCore.Functions.CreateCallback('bb-garages:server:isVehicleOwned', function(source, cb, plate)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    RLCore.Functions.ExecuteSql(false, "SELECT * FROM `bbvehicles` WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "' AND `plate` = '" .. plate .. "' LIMIT 1", function(result)
        if result[1] ~= nil then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RLCore.Functions.CreateCallback('bb-garages:server:hasFines', function(source, cb)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    RLCore.Functions.ExecuteSql(false, "SELECT * FROM `phone_invoices` WHERE `citizenid` = '" .. xPlayer.PlayerData.citizenid .. "'", function(result)
        if result[1] ~= nil and #result > 0 then
            cb(true)
        else
            cb(false)
        end
    end)
end)

-- fakeplates

RLCore.Functions.CreateUseableItem('advancedscrewdriver', function(source)
    local src = source
    TriggerClientEvent('bb-garages:client:fakeplate:steal', src)
end)

RLCore.Functions.CreateUseableItem('licenseplate', function(source, info)
    local src = source
    TriggerClientEvent('bb-garages:client:fakeplate:usePlate', src, info)
end)

RegisterServerEvent('bb-garages:server:isPlayerVehicle')
AddEventHandler('bb-garages:server:isPlayerVehicle', function(typ, plate, vehicle)
    if typ == 'STEAL' then
        RLCore.Functions.ExecuteSql(false, "SELECT `model` FROM `bbvehicles` WHERE `plate` = '" .. plate .. "' LIMIT 1", function(result)
            if result[1] ~= nil then
                RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `fakeplate` = '%' WHERE `plate` = '" .. plate .. "' AND `model` = '" .. result[1].model .. "' LIMIT 1")
                networkVehicles[vehicle] = {plate, '%'}
            end
        end)
    elseif typ == 'SET' then
        if networkVehicles[vehicle] ~= nil then
            if networkVehicles[vehicle][1] == plate then
                RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `fakeplate` = '' WHERE `plate` = '" .. plate .. "' LIMIT 1")
                networkVehicles[vehicle] = nil
            else
                RLCore.Functions.ExecuteSql(false, "UPDATE `bbvehicles` SET `fakeplate` = '" .. plate .. "' WHERE `plate` = '" .. networkVehicles[vehicle][1] .. "' LIMIT 1")
                networkVehicles[vehicle][2] = plate
            end
        end
    end
end)

RegisterServerEvent('bb-garages:server:fakeplate:breakScrewdriver')
AddEventHandler('bb-garages:server:fakeplate:breakScrewdriver', function()
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    xPlayer.Functions.RemoveItem('advancedscrewdriver', 1)
    TriggerClientEvent(CorePrefix .. ':Notify', src, "Your Advanced Screwdriver went broken", "error")
end)

RegisterServerEvent('bb-garages:server:fakeplate:removeLicensePlate')
AddEventHandler('bb-garages:server:fakeplate:removeLicensePlate', function(slot)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    xPlayer.Functions.RemoveItem('licenseplate', 1, slot)
    TriggerClientEvent(CorePrefix .. ':Notify', src, "Success fully installed license plate", "success")
end)

RegisterServerEvent('bb-garages:server:fakeplate:createLicensePlate')
AddEventHandler('bb-garages:server:fakeplate:createLicensePlate', function(plate)
    local src = source
    local xPlayer = RLCore.Functions.GetPlayer(src)
    xPlayer.Functions.AddItem('licenseplate', 1, nil, {plate = plate})
    TriggerClientEvent(CorePrefix .. ':Notify', src, "You stole a license plate", "success")
end)

-- dev

RLCore.Commands.Add('creategarage', 'BB-Garages: Create New Garage', {{name = 'name', help = 'Name'}}, true, function(source, args)
    TriggerClientEvent('bb-garages:client:GetPlayerCoords', source, 'bb-garages:server:dev:creategarage', args)
end, GaragesConfig['settings']['dev']['rank'])

RLCore.Commands.Add('setinteract', 'BB-Garages: Set Closest Garage Interact Location', {{name = 'enable', help = 'Enable Ped? [0/1]'}}, true, function(source, args)
    TriggerClientEvent('bb-garages:client:GetPlayerCoords', source, 'bb-garages:server:dev:setinteract', args)
end, GaragesConfig['settings']['dev']['rank'])

RLCore.Commands.Add('setpayment', 'BB-Garages: Set the payment for the closest garage', {{name = 'price', help = 'Price [Perhour/Onetime]'}, {name = 'onetime', help = 'Onetime? [0/1]'} }, true, function(source, args)
    local price = args[1]
    local perhour = tonumber(args[2]) ~= nil and tonumber(args[2]) == 1 and true or false
    TriggerClientEvent('bb-garages:client:GetPlayerCoords', source, 'bb-garages:server:dev:setpayment', {price, perhour})
end, GaragesConfig['settings']['dev']['rank'])

RLCore.Commands.Add('setslots', 'BB-Garages: Toggle BB-Garages Slots Editor', {}, false, function(source, args)
	local src = source
	TriggerClientEvent('bb-garages:client:coords:updateStatus', src)
end, GaragesConfig['settings']['dev']['rank'])

function IsModelExists(model)
    for key, value in pairs(RLCore.Shared.Vehicles) do
        if value['model'] == model then
            return true
        end
    end
    return false
end

function GetClosestGarage(coords)
    local closestName, closestDst = '', 99999.9
    for k, v in pairs(serverConfig['garages']) do
        local dst = #(vector3(v['blip']['coords'].x, v['blip']['coords'].y, v['blip']['coords'].z) - coords)
        if dst < closestDst then
            closestDst = dst
            closestName = k
        end
    end
    return closestName
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function stringsplit(Input, Seperator)
	if Seperator == nil then
		Seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(Input, '([^'..Seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

-- functions
function IsNearby(plate, vehicles)
    for _, vehicle in pairs(vehicles) do
        if plate == vehicle then
            return true
        end
    end
    return false
end

function escape_sqli(source)
    local replacements = { ['"'] = '\\"', ["'"] = "\\'" }
    return source:gsub( "['\"]", replacements ) -- or string.gsub( source, "['\"]", replacements )
end

function randString(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

function tprint(a,b)for c,d in pairs(a)do local e='["'..tostring(c)..'"]'if type(c)~='string'then e='['..c..']'end;local f='"'..tostring(d)..'"'if type(d)=='table'then tprint(d,(b or'')..e)else if type(d)~='string'then f=tostring(d)end;print(type(a)..(b or'')..e..' = '..f)end end end