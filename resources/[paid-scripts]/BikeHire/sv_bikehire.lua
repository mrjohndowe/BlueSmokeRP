local networkedBikes = {}

Citizen.CreateThread(function()
    config.hiredBikeSlots = {}
    for stationId, _ in ipairs(config.locations) do
        if config.hiredBikeSlots[stationId] == nil then
            config.hiredBikeSlots[stationId] = {}
        end
    end

    while true do
        
        Wait(config.replenishAfter * 60000)
        for stationId, _ in ipairs(config.locations) do
            if config.hiredBikeSlots[stationId] == nil then
                config.hiredBikeSlots[stationId] = {}
            end
        end

        TriggerClientEvent("bikehire:updateHiredBikes", -1, config.hiredBikeSlots)
    end

end)



RegisterNetEvent("bikehire:fetchHiredBikes", function()
    local source = source
    TriggerClientEvent("bikehire:receiveHiredBikes", source, config.hiredBikeSlots)
end)


RegisterNetEvent("bikehire:requestRent", function(timespan, bikeNum, stationId)
    local source = source
    local availableBikes = getNumberOfAvailableBikes(stationId)

    if availableBikes > bikeNum then
        if transaction(source) then
            TriggerClientEvent("bikehire:commenceHire", source, stationId, allocateBikeSlots(stationId, bikeNum))
            TriggerClientEvent("bikehire:updateHiredBikes", -1, config.hiredBikeSlots)
        else
            -- Send notification to say lack of funds
            TriggerClientEvent("bikehire:sendClientNotification", source, config.translations.insufficientFunds)
        end
    end

end)

RegisterNetEvent("bikehire:returnRentedBike", function(netId, stationId, dockNumber)
    if config.hiredBikeSlots[stationId][dockNumber] then
        config.hiredBikeSlots[stationId][dockNumber] = nil
        
        -- Delete the networked bike and wait 500 ms before updating the bikes on each client
        deleteNetworkedBike(netId)
        Wait(500)
        
        -- TriggerClientEvent("bikehire:updateHiredBikes", -1, config.hiredBikeSlots, stationId)
        TriggerClientEvent("bikehire:returnSingleBike", -1, stationId, dockNumber)
    end
end)

RegisterNetEvent("bikehire:registerNetworkedBike", function(netId)
    local bike = NetworkGetEntityFromNetworkId(netId)
    local vehModel = GetEntityModel(bike)

    if vehModel == config.models.bike then
        networkedBikes[netId] = true
    end

end)

function deleteNetworkedBike(netId)
    local bike = NetworkGetEntityFromNetworkId(netId)
    local vehModel = GetEntityModel(bike)

    if vehModel == config.models.bike and networkedBikes[netId] then
        DeleteEntity(netId)
        networkedBikes[netId] = nil
    end

end

function allocateBikeSlots(stationId, neededBikes)
    local allocated = {}

    for dockNumber = 1, config.locations[stationId].numberOfDocks do
        if config.hiredBikeSlots[stationId][dockNumber] == nil then
            config.hiredBikeSlots[stationId][dockNumber] = true
            table.insert(allocated, dockNumber)

            if #allocated == neededBikes then
                break
            end
        end
    end

    return allocated
end

function getNumberOfAvailableBikes(stationId)
    local availableBikes = config.locations[stationId].numberOfDocks

    for _, _ in ipairs(config.hiredBikeSlots[stationId]) do
        availableBikes = availableBikes -1 
    end

    return availableBikes

end
