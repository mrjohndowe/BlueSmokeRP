if config.framework.useESX then
    ESX = nil
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)
end

if config.framework.usevRP  then
    local Tunnel = module("vrp", "lib/Tunnel")
    local Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")
    vRPclient = Tunnel.getInterface("vRP","vRP")
end

local QBCore = nil
if config.framework.useQBcore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function transaction(source)

    -- Take money out of their account 
    -- Send true if they have money to hire the bike, or false if they do not
    -- We have enabled ESX integration by default

    if config.framework.useESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        local cash = xPlayer.getMoney()
    
        if cash >= config.costToRent then
            xPlayer.removeMoney(config.costToRent)
            return true
        end
    elseif config.framework.usevRP then
        local userid = vRP.getUserId({source})
        return vRP.tryFullPayment({userid, config.costToRent}) 
        
    elseif config.framework.useQBcore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.RemoveMoney('bank', config.costToRent) then
            return true
        elseif Player.Functions.RemoveMoney('cash', config.costToRent) then
            return true
        end
    else
        return true
    end

    return false
end