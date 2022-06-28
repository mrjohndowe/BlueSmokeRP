local RLCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) RLCore = obj end)

CreateThread(function()
    Wait(1500)
    RLCore.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles`", function(vehicles)
        local counter = 0
        if vehicles[1] ~= nil then
            for _, vehicle in pairs(vehicles) do
                local mods = json.decode(vehicle.mods)
                if mods['color1'] ~= nil then
                    counter = counter + 1
                    RLCore.Functions.ExecuteSql(false, "INSERT INTO `bbvehicles` (`citizenid`, `plate`, `model`, `props`, `stats`, `state`) VALUES ('" .. vehicle.citizenid .. "', '" .. vehicle.plate .. "', '" .. vehicle.vehicle .. "', '" .. vehicle.mods .. "', '{}', 'unknown')")
                end
            end
            print('^2[bb-garages:sql-convert] ^7Successfully converted ' .. tostring(counter) .. ' vehicles to "bbvehicles" table.')
        else
            print('^2[bb-garages:sql-convert] ^7Error while fetching vehicles.')
        end
    end)
end)

