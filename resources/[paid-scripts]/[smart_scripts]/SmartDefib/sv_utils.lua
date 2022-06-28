if framework.vRP.enabled then
    Tunnel = module("vrp", "lib/Tunnel")
    Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")
    vRPclient = Tunnel.getInterface("vRP","vRP")
end
QBCore = nil
if framework.QBCore.enabled then
    QBCore = exports['qb-core']:GetCoreObject()
end

ESX = nil
if framework.ESX.enabled or framework.ESX.ESXv2 then
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)
end

-- Bring player back to life after successful resurrection.
RegisterServerEvent("Server:ResurrectPlayer")
AddEventHandler("Server:ResurrectPlayer", function(eKey, playercoords, coords, targetSrc)
    if eKey ~= eventKey then return end
    local source = source
    if isPlayerInTable(targetSrc, source) and #(playercoords - coords) < 10 then
        defibBeingUsed[targetSrc] = nil
        if framework.standalone then
            TriggerClientEvent("Client:ResurrectPlayer", targetSrc, coords)
            defibBeingUsed[source] = nil
            TriggerClientEvent("Client:SendDefibUsedTable", -1, defibBeingUsed)
        elseif framework.vRP.enabled then
            vRPclient.setHealth(targetSrc, {200})
            defibBeingUsed[source] = nil
            TriggerClientEvent("Client:SendDefibUsedTable", -1, defibBeingUsed)
            TriggerClientEvent("Client:StopAnimation", targetSrc)
        elseif framework.QBCore.enabled then
            defibBeingUsed[source] = nil
            TriggerClientEvent("Client:SendDefibUsedTable", -1, defibBeingUsed)
            local Player = QBCore.Functions.GetPlayer(targetSrc)
            Player.Functions.SetMetaData("inlaststand", false)
            Player.Functions.SetMetaData("isdead", false)
            TriggerClientEvent("hospital:client:Revive", targetSrc)
        elseif framework.ESX.enabled or framework.ESX.ESXv2 then
            TriggerClientEvent('esx_ambulancejob:revive', targetSrc)
            TriggerClientEvent('esx_ambulancejob:reafrvive', targetSrc)
            defibBeingUsed[source] = nil
            TriggerClientEvent("Client:SendDefibUsedTable", -1, defibBeingUsed)
        elseif framework.standaloneExtras.Badssentials then
            TriggerClientEvent('Badssentials:RevivePlayer', targetSrc)
            defibBeingUsed[source] = nil
            TriggerClientEvent("Client:SendDefibUsedTable", -1, defibBeingUsed)
        elseif framework.standaloneExtras.deathscript then
            TriggerClientEvent('DeathScript:DefibRevive', targetSrc) 
            defibBeingUsed[source] = nil
            TriggerClientEvent("Client:SendDefibUsedTable", -1, defibBeingUsed)
        elseif framework.standaloneExtras.faxrevive then
            TriggerClientEvent('faxrevive:defibrevive', targetSrc)
            defibBeingUsed[source] = nil
            TriggerClientEvent("Client:SendDefibUsedTable", -1, defibBeingUsed)
        elseif framework.standaloneExtras.cadOJRPCPR then
            TriggerClientEvent('reviveClient', targetSrc)
            defibBeingUsed[source] = nil
            TriggerClientEvent("Client:SendDefibUsedTable", -1, defibBeingUsed)
        end
    end
end)