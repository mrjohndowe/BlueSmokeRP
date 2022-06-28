Citizen.CreateThread(function()
    Wait(10000)
    local value = GetConvar("UsingSmartFires", "false")
    if value == "true" then
        usingSmartFires = true
    end
end)

-- Command registered server side below:
RegisterCommand(main.fanCommand, function(source, args, rawCommand)
    if (source > 0) then
        if args[1] == nil or (tostring(args[1]) ~= translations.setup and tostring(args[1]) ~= translations.remove) then
            TriggerClientEvent("Client:rtcNotification", source, "~r~Error~w~: Use /fan  setup or /fan remove")
            return 
        end
        local setup = false
        if tostring(args[1]) == translations.setup then setup = true end
        if tostring(args[1]) == translations.remove then setup = false end

        -- Add your permission check here, send event if they have permission

        local permission = userHasPermission(source, jobCheck)
        if permission then
            TriggerClientEvent("Client:toggleFan", source, setup)
        end
    end
end, main.acePermissionsEnabled)

-- Command registered server side below:
RegisterCommand(main.stabilisersCommand, function(source, args, rawCommand)
    if (source > 0) then
        if args[1] == nil or (tostring(args[1]) ~= translations.setup and tostring(args[1]) ~= translations.remove) then
            TriggerClientEvent("Client:rtcNotification", source, translations.stabilisersError)
            return 
        end
        local setup = false
        if tostring(args[1]) == translations.setup then setup = true end
        if tostring(args[1]) == translations.remove then setup = false end

        -- Add your permission check here, send event if they have permission

        local permission = userHasPermission(source, jobCheck)
        if permission then
            TriggerClientEvent("Client:toggleStabilisers", source, setup)
        end
    end
end, main.acePermissionsEnabled)

-- Command registered server side below:
RegisterCommand(main.spreadersCommand, function(source, args, rawCommand)
    if (source > 0) then

        -- Add your permission check here, send event if they have permission
        local permission = userHasPermission(source, jobCheck)
        if permission then
            TriggerClientEvent("Client:toggleSpreaders", source)
        end
    end
end, main.acePermissionsEnabled)

if jobCheck.QBCore.enabled then
    QBCore = exports["qb-core"]:GetCoreObject()
end

if jobCheck.vRP.enabled then
    Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")
end

if jobCheck.ESX.enabled then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

function userHasPermission(source, location)
    local permission = false
    local usingPermissions = false
    -- ESX Permissions
    if location.ESX.enabled then
        local xPlayer = ESX.GetPlayerFromId(source)
        if location.ESX.checkJob.enabled then
            usingPermissions = true
            for k, v in pairs(location.ESX.checkJob.jobs) do
                if xPlayer.job.name == v then
                    permission = true
                end
            end
        end
    end

    -- vRP Permission
    if location.vRP.enabled then
        if location.vRP.checkPermission.enabled then
            usingPermissions = true
            for k, v in pairs(location.vRP.checkPermission.permissions) do
                if vRP.hasPermission({vRP.getUserId({source}),v}) then
                    permission = true
                end
            end
        end

        if location.vRP.checkGroup.enabled then
            usingPermissions = true
            for k, v in pairs(location.vRP.checkGroup.groups) do
                if vRP.hasGroup({vRP.getUserId({source}),v}) then
                    permission = true
                end
            end
        end
    end

    -- QBCore Permission
    if location.QBCore.enabled then
        local player = QBCore.Functions.GetPlayer(source)
        if location.QBCore.checkJob.enabled then
            usingPermissions = true
            for k, v in pairs(location.QBCore.checkJob.jobs) do
                if player.PlayerData.job.name == v then
                    permission = true
                end
            end
        end
        if location.QBCore.checkPermission.enabled then
            usingPermissions = true
            for k, v in pairs(location.QBCore.checkPermission.permissions) do
                if QBCore.Functions.HasPermission(source, v) then
                    permission = true
                end
            end
        end
    end

    if not usingPermissions then
        permission = true
    end
    return permission
end


-- We do not recommend editing below:

local stabilisers = {}
local fans = {}

RegisterServerEvent('Server:updateStabilisersTable')
AddEventHandler('Server:updateStabilisersTable', function(key, entry, remove)
    if remove then 
        stabilisers[key] = nil
        TriggerClientEvent("Client:updateStabilisersTable", -1, key, entry, remove)
        return 
    end
    stabilisers[key] = entry
    TriggerClientEvent("Client:updateStabilisersTable", -1, key, entry, remove)
end)

RegisterServerEvent('Server:updateFansTable')
AddEventHandler('Server:updateFansTable', function(key, entry, remove)
    local source = source
    if remove then 
        fans[key] = nil
        TriggerClientEvent("Client:updateFansTable", -1, key, entry, remove)
        return 
    end
    fans[key] = entry
    if usingSmartFires then
        TriggerClientEvent("Client:stopSmokeCommand", source, 15.0, false)
    end
    TriggerClientEvent("Client:updateFansTable", -1, key, entry, remove)
end)


RegisterServerEvent('Server:receiveStabilisersTable')
AddEventHandler('Server:receiveStabilisersTable', function()
    TriggerClientEvent("Client:receiveStabilisersTable", source, stabilisers)
end)

RegisterServerEvent('Server:rtcOpenDoor')
AddEventHandler('Server:rtcOpenDoor', function(vehicleNet, bone, coords, breakDoor)
    TriggerClientEvent("Client:rtcOpenDoor", -1, vehicleNet, bone, coords, breakDoor)
    TriggerClientEvent("Client:spreadersSound", -1, coords)
end)


RegisterServerEvent('Server:receiveFanTable')
AddEventHandler('Server:receiveFanTable', function()
    TriggerClientEvent("Client:receiveFanTable", source, fans)
end)

RegisterServerEvent('Server:stopRtcParticles')
AddEventHandler('Server:stopRtcParticles', function(coords)
    TriggerClientEvent("Client:stopRtcParticles", -1, coords)
end)