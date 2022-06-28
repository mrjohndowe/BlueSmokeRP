local supplyLine = {}

RegisterCommand(main.commandName, function(source, args, rawCommand)
    if (source > 0) then
        if args[1] == nil or (tostring(args[1]) ~= translations.setup and tostring(args[1]) ~= translations.remove) then
            TriggerClientEvent("Client:supplyLineNotification", source, translations.supplyLineError)
            return 
        end
        local setup = false
        if tostring(args[1]) == translations.setup then setup = true end
        if tostring(args[1]) == translations.remove then setup = false end

        -- Add your permission check here, send event if they have permission

        local permission = userHasPermission(source, jobCheck)
        if permission then
            TriggerClientEvent("Client:toggleSupplyLine", source, setup)
        end    
    end
end, main.enableAcePermissions)

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

-- We do not recommend editing below this point:

RegisterServerEvent('Server:checkUsingDlc')
AddEventHandler('Server:checkUsingDlc', function()
    local source = source
    TriggerClientEvent('Client:ActivateDLC', source, true)
end)

RegisterServerEvent('Server:updateSupplyLineTable')
AddEventHandler('Server:updateSupplyLineTable', function(key, entry, remove)
    if remove then 
        supplyLine[key] = nil
        TriggerClientEvent("Client:updateSupplyLineTable", -1, key, entry, remove)
        return 
    end
    supplyLine[key] = entry
    TriggerClientEvent("Client:updateSupplyLineTable", -1, key, entry, remove)
end)

RegisterServerEvent('Server:receiveSupplyLineTable')
AddEventHandler('Server:receiveSupplyLineTable', function()
    TriggerClientEvent("Client:receiveSupplyLineTable", source, supplyLine)
end)