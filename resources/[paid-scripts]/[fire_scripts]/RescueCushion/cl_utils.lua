TriggerEvent('chat:addSuggestion', '/'..main.commandName, translations.commandSuggestion, {
    { name=translations.setup.."/"..translations.remove, help=translations.commandHelp },
})

local first_spawn = false

AddEventHandler('playerSpawned', function()
    if not first_spawn then
        TriggerServerEvent('Server:receiveCushionsTable')
        first_spawn = true
    end
end)

cushions = {}

RegisterNetEvent('Client:receiveCushionsTable')
AddEventHandler('Client:receiveCushionsTable', function(table)
    cushions = table
end)

RegisterNetEvent('Client:updateCushionsTable')
AddEventHandler('Client:updateCushionsTable', function(key, entry, remove)
    if remove then 
        cushions[key] = nil
        return 
    end
    cushions[key] = entry
end)

function tableLength(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

heightSet = false
mainTimeout = false

Citizen.CreateThread(function()
    while true do
        if not mainTimeout then
            if tableLength(cushions) > 0 then
                local ped = PlayerPedId()
                if not IsPedInAnyVehicle(ped, true) then
                    local coords = GetEntityCoords(ped)
                    local found = false
                    for k, v in pairs(cushions) do
                        local distance = #(coords-vector3(v[2].x, v[2].y, coords.z))
                        local playerId = PlayerId()
                        if distance < 50.0 then
                            found = true
                            if GetEntityHeightAboveGround(ped) >= 2.0 then
                                SetPlayerFallDistance(playerId, 250.0)
                                heightSet = true
                            else
                                SetPlayerFallDistance(playerId, 5.0)
                            end
                        else
                            SetPlayerFallDistance(playerId, 5.0)
                        end
                        if distance < 15.0 then
                            if IsPedFalling(ped) then
                                SetEntityInvincible(ped, true)
                                local timeout = false
                                Citizen.SetTimeout(7000, function()
                                    timeout = true
                                end)
                                while not timeout do
                                    if not IsPedFalling(ped) then
                                        Wait(500)
                                        timeout = true
                                    end
                                    Wait(0)
                                end
                                SetEntityInvincible(ped, false)
                                local distance = #(GetEntityCoords(ped) - v[2])
                                if distance < 4.0 then
                                    SetPedToRagdoll(ped, main.ragdollDuration * 1000, main.ragdollDuration * 1000, 0, 0, 0, 0)
                                end
                                heightSet = false
                                SetPlayerFallDistance(playerId, 5.0)
                                mainTimeout = true
                                Citizen.SetTimeout(main.cooldownDuration * 1000, function()
                                    mainTimeout = false
                                end)
                            end
                        end 
                    end
                    if not found then
                        if heightSet then
                            SetPlayerFallDistance(PlayerId(), 5.0)
                        end
                    end
                end
            end
        end
        
        Wait(0)
    end
end)